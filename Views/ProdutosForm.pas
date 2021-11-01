unit ProdutosForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  ProdutoMVPIntf, Produto, Utils, Generics.Collections, System.UITypes;

type
  TFormProdutos = class(TForm, IProdutoView)
    Label2: TLabel;
    edDescricao: TEdit;
    Label3: TLabel;
    edPreco: TEdit;
    btAdicionar: TBitBtn;
    lvProdutos: TListView;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure btAdicionarClick(Sender: TObject);
    procedure lvProdutosDblClick(Sender: TObject);
    procedure lvProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure edPrecoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FProduto: TProduto;
    FPresenter: Pointer;
    Estado: TEstados;
    procedure ListarProdutos;
    procedure AtualizaBtn;
    function CamposPreenchido: Boolean;
    procedure LimparCampos;
    procedure FormatarComoMoeda(Componente: TObject; var Key: Char);
    function MoedaToDouble(Val: String): Double;
  protected
    function GetProduto: TProduto;
    procedure SetProduto(Value: TProduto);
    function GetPresenter: IProdutoPresenter;
    procedure SetPresenter(const Value: IProdutoPresenter);
  public
    { Public declarations }
    property Produto: TProduto read GetProduto write SetProduto;
    property Presenter: IProdutoPresenter read GetPresenter write SetPresenter;
    function ShowView: TModalResult;
  end;

var
  FormProdutos: TFormProdutos;

implementation

{$R *.dfm}

{ TFormProdutos }

procedure TFormProdutos.AtualizaBtn;
begin
  if (Inserindo in Estado) then
    btAdicionar.Caption := 'Adicionar'
  else
    btAdicionar.Caption := 'Atualizar';
end;

procedure TFormProdutos.btAdicionarClick(Sender: TObject);
begin
  if CamposPreenchido then
  begin
    if (Inserindo in Estado) then
    begin
      FProduto := TProduto.Create;
      Produto.Descricao := Trim(edDescricao.Text);
      Produto.Preco := MoedaToDouble(Trim(edPreco.Text));
      Presenter.Add;
    end
    else begin
      Produto.Descricao := Trim(edDescricao.Text);
      Produto.Preco := MoedaToDouble(Trim(edPreco.Text));
      Presenter.Update;
    end;
    LimparCampos;
    ListarProdutos;
    Estado := [Inserindo];
  end;
  edDescricao.SetFocus;
  AtualizaBtn;
end;

function TFormProdutos.CamposPreenchido: Boolean;
begin
  Result := False;
  if Length(Trim(edDescricao.Text)) < 3 then
  begin
    MessageDlg('O Nome precisa ter mais de 3 caracteres.', mtWarning, [mbOk], 0);
    Exit;
  end;
  if MoedaToDouble(Trim(edPreco.Text)) <= 0 then
  begin
    MessageDlg('O Preço precisa ser maior que zero.', mtWarning, [mbOk], 0);
    Exit;
  end;
  Result := True;
end;

procedure TFormProdutos.edPrecoKeyPress(Sender: TObject; var Key: Char);
begin
  FormatarComoMoeda(edPreco, Key);
end;

procedure TFormProdutos.FormatarComoMoeda(Componente: TObject; var Key: Char);
var
   str_valor: String;
   dbl_valor: double;
begin
   { verificando se estamos recebendo o TEdit realmente }
   if (Componente is TEdit) then
   begin
      { se tecla pressionada e' um numero, backspace ou del deixa passar }
      if CharInSet(Key, ['0'..'9', #8, #9]) then
      begin
         { guarda valor do TEdit com que vamos trabalhar }
         str_valor := TEdit( Componente ).Text ;
         { verificando se nao esta vazio }
         if str_valor = EmptyStr then str_valor := '0,00' ;
         { se valor numerico ja insere na string temporaria }
         if CharInSet(Key, ['0'..'9']) then str_valor := Concat( str_valor, Key ) ;
         { retira pontos e virgulas se tiver! }
         str_valor := Trim( StringReplace( str_valor, '.', '', [rfReplaceAll, rfIgnoreCase] ) ) ;
         str_valor := Trim( StringReplace( str_valor, ',', '', [rfReplaceAll, rfIgnoreCase] ) ) ;
         {inserindo 2 casas decimais}
         dbl_valor := StrToFloat( str_valor ) ;
         dbl_valor := ( dbl_valor / 100 ) ;

         {reseta posicao do tedit}
         TEdit( Componente ).SelStart := Length( TEdit( Componente ).Text );
         {retornando valor tratado ao TEdit}
         TEdit( Componente ).Text := FormatFloat( '###,##0.00', dbl_valor ) ;
      end;
      {se nao e' key relevante entao reseta}
      if not CharInSet(Key, [#8, #9]) then key := #0;
   end;
end;

procedure TFormProdutos.FormCreate(Sender: TObject);
begin
  Estado := [Inserindo];
  FProduto := TProduto.Create;
end;

function TFormProdutos.GetPresenter: IProdutoPresenter;
begin
  Result := IProdutoPresenter(FPresenter);
end;

function TFormProdutos.GetProduto: TProduto;
begin
  Result := FProduto;
end;

procedure TFormProdutos.LimparCampos;
begin
  edDescricao.Text := '';
  edPreco.Text := '0';
end;

procedure TFormProdutos.ListarProdutos;
var
  Produtos: TList<TProduto>;
  Produto: TProduto;
  I: Integer;
  Item: TListItem;
begin
  lvProdutos.Clear;
  Produtos := Presenter.ListAll;
  for I := 0 to Produtos.Count - 1 do
  begin
    Item := lvProdutos.Items.Add;
    Produto := Produtos.Items[I];
    Item.Caption := Produto.Id.ToString;
    Item.SubItems.Add(Produto.Descricao);
    Item.SubItems.Add(formatfloat('R$ #,##0.00', Produto.Preco));
  end;
end;

procedure TFormProdutos.lvProdutosDblClick(Sender: TObject);
var
  Prod: TProduto;
begin
  if (lvProdutos.Items.Count = 0) then Exit;

  Prod := TProduto.Create;
  Prod.Id := StrToInt(lvProdutos.Items[lvProdutos.ItemIndex].Caption);
  Prod.Descricao := lvProdutos.Items[lvProdutos.ItemIndex].SubItems[0];
  Prod.Preco := MoedaToDouble(lvProdutos.Items[lvProdutos.ItemIndex].SubItems[1]);
  Produto := Prod;
  Presenter.Get;

  edDescricao.Text := Produto.Descricao;
  edPreco.Text := FloatToStr(Produto.Preco);

  Estado := [Editando];
  AtualizaBtn;
end;

procedure TFormProdutos.lvProdutosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Prod: TProduto;
begin
  if ((ssCtrl in Shift) and (Key = VK_DELETE)) then
  begin
    Prod := TProduto.Create;
    Prod.Id := StrToInt(lvProdutos.Items[lvProdutos.ItemIndex].Caption);
    Produto := Prod;
    Presenter.Delete;
    ListarProdutos;
  end;
end;

function TFormProdutos.MoedaToDouble(Val: String): Double;
var
  aux: String;
begin
  aux := StringReplace(Val, '.', '', [rfReplaceAll]);
  aux := StringReplace(aux, 'R$', '', [rfReplaceAll]);
  //aux := StringReplace(aux, ',', '.', [rfReplaceAll]);
  Result := StrToFloat(aux);
end;

procedure TFormProdutos.SetPresenter(const Value: IProdutoPresenter);
begin
  FPresenter := Pointer(Value);
end;

procedure TFormProdutos.SetProduto(Value: TProduto);
begin
  FProduto := Value;
end;

function TFormProdutos.ShowView: TModalResult;
begin
  Result := Self.ShowModal;
end;

end.
