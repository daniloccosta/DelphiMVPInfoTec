unit PedidoForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,
  PedidoMVPIntf, Pedido;

type
  TFormPedido = class(TForm, IPedidoView)
    Label1: TLabel;
    edNumPedido: TEdit;
    edCliente: TEdit;
    Label2: TLabel;
    edDataPedido: TEdit;
    Label3: TLabel;
    edDataEntrega: TEdit;
    Label4: TLabel;
    edTotal: TEdit;
    Label5: TLabel;
    lvItens: TListView;
    btFechar: TBitBtn;
    procedure edNumPedidoKeyPress(Sender: TObject; var Key: Char);
    procedure lvItensData(Sender: TObject; Item: TListItem);
  private
    { Private declarations }
    FPedido: TPedido;
    FPresenter: Pointer;
    function GetPedido: TPedido;
    procedure SetPedido(Value: TPedido);
    function GetPresenter: IPedidoPresenter;
    procedure SetPresenter(const Value: IPedidoPresenter);
  public
    { Public declarations }
    function ShowView: TModalResult;
    property Pedido: TPedido read GetPedido write SetPedido;
    property Presenter: IPedidoPresenter read GetPresenter write SetPresenter;
    //****//
    procedure AbrirPedido;
  end;

var
  FormPedido: TFormPedido;

implementation

{$R *.dfm}

uses Utils, Item;

procedure TFormPedido.AbrirPedido;
begin
  if (Trim(edNumPedido.Text) <> '') then
  begin
    Pedido.Id := StrToInt(edNumPedido.Text);
    Pedido := Presenter.Get;

    if (Pedido.Cliente <> nil) and (Pedido.ValorTotal > 0) then
    begin
      edDataPedido.Text := FormatDateTime('dd/m/yyyy', Pedido.DataPedido);
      edDataEntrega.Text := FormatDateTime('dd/m/yyyy', Pedido.DataEntrega);
      edCliente.Text := Pedido.Cliente.Nome;
      edTotal.Text := FormatFloat('#,##0.00', Pedido.ValorTotal);

      lvItens.Items.Count := Pedido.Items.Count;
    end;
  end;
end;

procedure TFormPedido.edNumPedidoKeyPress(Sender: TObject; var Key: Char);
begin
  SomenteNumeros(Sender, Key, False);
end;

function TFormPedido.GetPedido: TPedido;
begin
  Result := FPedido;
end;

function TFormPedido.GetPresenter: IPedidoPresenter;
begin
  Result := IPedidoPresenter(FPresenter);
end;

procedure TFormPedido.lvItensData(Sender: TObject; Item: TListItem);
var
  ItemPed: TItem;
begin
  ItemPed := Pedido.Items[Item.Index];
  Item.Caption := ItemPed.Produto.Id.ToString;
  Item.SubItems.Add(ItemPed.Produto.Descricao);
  Item.SubItems.Add(FormatFloat('0.00', ItemPed.Quantidade));
  Item.SubItems.Add(FormatFloat('#,##0.00', ItemPed.Produto.Preco));
  Item.SubItems.Add(FormatFloat('#,##0.00', ItemPed.Produto.Preco * ItemPed.Quantidade));
end;

procedure TFormPedido.SetPedido(Value: TPedido);
begin
  FPedido := Value;
end;

procedure TFormPedido.SetPresenter(const Value: IPedidoPresenter);
begin
  FPresenter := Pointer(Value);
end;

function TFormPedido.ShowView: TModalResult;
begin
  Result := Self.ShowModal;
end;

end.
