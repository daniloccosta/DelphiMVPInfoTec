unit Utils;

interface

uses Vcl.StdCtrls, Vcl.Controls, System.SysUtils, System.Contnrs, Classes,
  Generics.Collections, Vcl.ComCtrls;

const
  Inserindo = 0;
  Editando  = 1;

  procedure FormatarComoMoeda(Componente: TObject; var Key: Char);
  procedure SomenteNumeros(Componente: TObject; var Key: Char; isDecimal: Boolean = False);
  function MoedaToDouble(Val: String): Double;
  function Procurar(Lista: TObjectList; Colunas: TListColumns; Titulo, Rotulo: String): TObject;
  function AddDiasUteis(DataInicial: TDate; Dias: Integer): TDate;

type
  TEstados = Set of Inserindo..Editando;
  TEstadoViewPedidos = (evDigitandoPedido, evEsperandoPedido, evVisualizandoPedido);

implementation

uses ProcurarForm;

function AddDiasUteis(DataInicial: TDate; Dias: Integer): TDate;
var
  contador: Integer;
begin
  if (Dias <= 0) then
  begin
    result := DataInicial;
    exit
  end;

  Result := DataInicial;
  contador := 0;

  while (contador < Dias) do
  begin
    Result := Result + 1;
    if Not(DayOfWeek(Result) in [1, 7]) then
      Inc(contador);
  end;
end;

function Procurar(Lista: TObjectList; Colunas: TListColumns; Titulo,
  Rotulo: String): TObject;
var
  i: Integer;
begin
  FormProcurar := TFormProcurar.Create(Nil);
  FormProcurar.Lista := Lista;
  FormProcurar.Caption := Titulo;
  FormProcurar.lbProcurarPor.Caption := Rotulo;
  FormProcurar.lvProcurar.Columns := Colunas;
  FormProcurar.ShowModal;

  if (FormProcurar.lvProcurar.Selected = Nil) or (Lista.Count = 0) then
    Result := nil
  else begin
    i := FormProcurar.lvProcurar.Selected.Index;
    Result := FormProcurar.ItensListados[i];
  end;

  FreeAndNil(FormProcurar);
end;

function MoedaToDouble(Val: String): Double;
var
  aux: String;
begin
  aux := StringReplace(Val, '.', '', [rfReplaceAll]);
  aux := StringReplace(aux, 'R$', '', [rfReplaceAll]);
  //aux := StringReplace(aux, ',', '.', [rfReplaceAll]);
  Result := StrToFloat(aux);
end;

procedure SomenteNumeros(Componente: TObject; var Key: Char; isDecimal: Boolean = False);
begin
  if not isDecimal then
  begin
    if not (CharInSet(Key, ['0'..'9', Chr(8), Char(13)])) then
      Key := #0
  end
  else
  begin
    if (Key = #46) then
      Key := FormatSettings.DecimalSeparator;

    if not (CharInSet(Key, ['0'..'9', Chr(8), FormatSettings.DecimalSeparator])) then
      Key := #0
    else
      if (Key = FormatSettings.DecimalSeparator) and (Pos(Key, TEdit(Componente).Text) > 0) then
        Key := #0;
  end;
end;

procedure FormatarComoMoeda(Componente: TObject; var Key: Char);
var
   str_valor: String;
   dbl_valor: double;
begin
   if (Componente is TEdit) then
   begin
      if CharInSet(Key, ['0'..'9', #8, #9]) then
      begin
         str_valor := TEdit( Componente ).Text ;

         if str_valor = EmptyStr then str_valor := '0,00' ;

         if CharInSet(Key, ['0'..'9']) then str_valor := Concat( str_valor, Key ) ;

         str_valor := Trim( StringReplace( str_valor, '.', '', [rfReplaceAll, rfIgnoreCase] ) ) ;
         str_valor := Trim( StringReplace( str_valor, ',', '', [rfReplaceAll, rfIgnoreCase] ) ) ;

         dbl_valor := StrToFloat( str_valor ) ;
         dbl_valor := ( dbl_valor / 100 ) ;

         TEdit( Componente ).SelStart := Length( TEdit( Componente ).Text );
         TEdit( Componente ).Text := FormatFloat( '###,##0.00', dbl_valor ) ;
      end;

      if not CharInSet(Key, [#8, #9]) then key := #0;
   end;
end;

end.
