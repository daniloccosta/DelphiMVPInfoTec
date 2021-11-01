unit VendasForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.WinXPickers,
  Vcl.StdCtrls, PedidoMVPIntf, Pedido;

type
  TFormVendas = class(TForm, IPedidoView)
    lvCupom: TListView;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DateTimePicker1: TDateTimePicker;
    cbFormaPagtos: TComboBox;
    dtDataVenda: TDateTimePicker;
    dtDataEntrega: TDateTimePicker;
    edTotal: TEdit;
    Label10: TLabel;
    Edit2: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edCodigo: TEdit;
    edDescricao: TEdit;
    edQuant: TEdit;
    edValorUnit: TEdit;
    edValorTotal: TEdit;
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
    property Pedido: TPedido read GetPedido write SetPedido;
    property Presenter: IPedidoPresenter read GetPresenter write SetPresenter;

    function ShowView: TModalResult;
  end;

var
  FormVendas: TFormVendas;

implementation

{$R *.dfm}

{ TFormVendas }

function TFormVendas.GetPedido: TPedido;
begin
  Result := FPedido;
end;

function TFormVendas.GetPresenter: IPedidoPresenter;
begin
  Result := IPedidoPresenter(FPresenter);
end;

procedure TFormVendas.SetPedido(Value: TPedido);
begin
  FPedido := Value;
end;

procedure TFormVendas.SetPresenter(const Value: IPedidoPresenter);
begin
  FPresenter := Pointer(Value);
end;

function TFormVendas.ShowView: TModalResult;
begin
  Result := Self.ShowModal;
end;

end.
