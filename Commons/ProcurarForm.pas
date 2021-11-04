unit ProcurarForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  System.Contnrs, Utils;

type
  TFormProcurar = class(TForm)
    lbProcurarPor: TLabel;
    edProcurarPor: TEdit;
    lvProcurar: TListView;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    procedure lvProcurarDblClick(Sender: TObject);
    procedure lvProcurarKeyPress(Sender: TObject; var Key: Char);
    procedure edProcurarPorChange(Sender: TObject);
    procedure edProcurarPorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lvProcurarData(Sender: TObject; Item: TListItem);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure AplicarFiltro(Const Filtro: String);
  public
    { Public declarations }
    Lista: TObjectList;
    ItensListados: TList;
  end;

var
  FormProcurar: TFormProcurar;

implementation

{$R *.dfm}

uses Produto, Cliente;

{ TFormProcurar }


procedure TFormProcurar.AplicarFiltro(const Filtro: String);
var
  i: Integer;
  PodeAddItem: Boolean;
begin
  lvProcurar.Items.BeginUpdate;
  try
    lvProcurar.Clear;
    ItensListados.Clear;
    for i := 0 to Lista.Count - 1 do
    begin
      PodeAddItem := False;
      if (Lista[i].ClassType = TProduto) then
        PodeAddItem := (Filtro = '') or (Pos(UpperCase(Filtro), UpperCase(TProduto(Lista[i]).Descricao)) <> 0)
      else
        PodeAddItem := (Filtro = '') or (Pos(UpperCase(Filtro), UpperCase(TCliente(Lista[i]).Nome)) <> 0);
//      if (Filtro = '') or (Pos(UpperCase(Filtro), UpperCase(TProduto(Lista[i]).Descricao)) <> 0) then
      if PodeAddItem then
        ItensListados.Add(Lista[i]);
    end;
    lvProcurar.Items.Count := ItensListados.Count;

  finally
    lvProcurar.Items.EndUpdate;
  end;
end;

procedure TFormProcurar.edProcurarPorChange(Sender: TObject);
begin
  AplicarFiltro(TEdit(Sender).Text);
end;

procedure TFormProcurar.edProcurarPorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DOWN)  then
  begin
    Key := 0;
    SelectNext(ActiveControl, True, True);
  end;
end;

procedure TFormProcurar.FormCreate(Sender: TObject);
begin
  Lista := TObjectList.Create;
  ItensListados := TList.Create;
end;

procedure TFormProcurar.FormDestroy(Sender: TObject);
begin
  //Lista.Free;
  ItensListados.Free;
end;

procedure TFormProcurar.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    SelectNext(ActiveControl, True, True);
  end
  else if (Key = #27) then
    Close;
end;

procedure TFormProcurar.lvProcurarData(Sender: TObject; Item: TListItem);
var
  Produto: TProduto;
  Cliente: TCliente;
begin
  if (Lista.Items[Item.Index] is TProduto) then
  begin
    Produto := TProduto.Create;
    Produto := TProduto(ItensListados.Items[Item.Index]);
    Item.Caption := Produto.Id.ToString;
    Item.SubItems.Add(Produto.Descricao);
    Item.SubItems.Add(FormatFloat('#,##0.00', Produto.Preco));
  end
  else if (Lista.Items[Item.Index] is TCliente) then
  begin
    Cliente := TCliente.Create;
    Cliente := TCliente(ItensListados.Items[Item.Index]);
    Item.Caption := Cliente.Id.ToString;
    Item.SubItems.Add(Cliente.Nome);
  end;
end;

procedure TFormProcurar.lvProcurarDblClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormProcurar.lvProcurarKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (lvProcurar.Selected.Selected) then
    Self.Close;
end;

end.
