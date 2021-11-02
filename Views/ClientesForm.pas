unit ClientesForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  ClienteIntf, ClienteMVPIntf, Cliente, ClientePresenter, Generics.Collections,
  ClienteM, System.UITypes, Utils;

type
  TFormClientes = class(TForm, IClienteView)
    Label1: TLabel;
    edNome: TEdit;
    btAdicionar: TBitBtn;
    Label2: TLabel;
    lvClientes: TListView;
    Label3: TLabel;
    Label4: TLabel;
    procedure btAdicionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lvClientesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lvClientesDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FCliente: TCliente;
    FPresenter: Pointer;
    Estado: TEstados;
    procedure ListarClientes;
    procedure AtualizaBtn;
    function NomePreenchido: Boolean;
  protected
    function GetCliente: TCliente;
    procedure SetCliente(Value: TCliente);
    function GetPresenter: IClientePresenter;
    procedure SetPresenter(const Value: IClientePresenter);
  public
    { Public declarations }
    property Cliente: TCliente read GetCliente write SetCliente;
    property Presenter: IClientePresenter read GetPresenter write SetPresenter;
    function ShowView: TModalResult;
  end;

var
  FormClientes: TFormClientes;

implementation

{$R *.dfm}

{ TfrmClientes }

procedure TFormClientes.AtualizaBtn;
begin
  if (Inserindo in Estado) then
    btAdicionar.Caption := 'Adicionar'
  else
    btAdicionar.Caption := 'Atualizar';
end;

procedure TFormClientes.btAdicionarClick(Sender: TObject);
begin
  if NomePreenchido then
  begin
    if (Inserindo in Estado) then
    begin
      FCliente := TCliente.Create;
      Cliente.Nome := Trim(edNome.Text);
      Presenter.Add;
    end
    else begin
      Cliente.Nome := Trim(edNome.Text);
      Presenter.Update;
    end;
    ListarClientes;
    Estado := [Inserindo];
  end;

  edNome.Text := '';
  edNome.SetFocus;
  AtualizaBtn;
end;

procedure TFormClientes.FormCreate(Sender: TObject);
begin
  Estado := [Inserindo];
  FCliente := TCliente.Create;
end;

procedure TFormClientes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    Key := 0;
    SelectNext(ActiveControl, True, True);
  end;
end;

function TFormClientes.GetCliente: TCliente;
begin
  Result := FCliente;
end;

function TFormClientes.GetPresenter: IClientePresenter;
begin
  Result := IClientePresenter(FPresenter);
end;

procedure TFormClientes.ListarClientes;
var
  Clientes: TList<TCliente>;
  Cliente: TCliente;
  I: Integer;
  Item: TListItem;
begin
  lvClientes.Clear;
  Clientes := Presenter.ListAll;
  for I := 0 to Clientes.Count - 1 do
  begin
    Item := lvClientes.Items.Add;
    Cliente := Clientes.Items[I];
    Item.Caption := Cliente.Id.ToString;
    Item.SubItems.Add(Cliente.Nome);
  end;
end;

procedure TFormClientes.SetCliente(Value: TCliente);
begin
  FCliente := Value;
end;

procedure TFormClientes.SetPresenter(const Value: IClientePresenter);
begin
  FPresenter := Pointer(Value);
end;

function TFormClientes.ShowView: TModalResult;
begin
  Result := Self.ShowModal;
end;

procedure TFormClientes.lvClientesDblClick(Sender: TObject);
var
  Cli: TCliente;
begin
  if (lvClientes.Items.Count = 0) then Exit;

  Cli := TCliente.Create;
  Cli.Id := StrToInt(lvClientes.Items[lvClientes.ItemIndex].Caption);
  Cli.Nome := lvClientes.Items[lvClientes.ItemIndex].SubItems[0];
  Cliente := Cli;
  Presenter.Get;

  edNome.Text := Cliente.Nome;

  Estado := [Editando];
  AtualizaBtn;
end;

procedure TFormClientes.lvClientesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Cli: TCliente;
begin
  if ((ssCtrl in Shift) and (Key = VK_DELETE)) then
  begin
    Cli := TCliente.Create;
    Cli.Id := StrToInt(lvClientes.Items[lvClientes.ItemIndex].Caption);
    Cliente := Cli;
    Presenter.Delete;
    ListarClientes;
  end;
end;

function TFormClientes.NomePreenchido: Boolean;
begin
  Result := False;
  if Length(Trim(edNome.Text)) < 3 then
  begin
    MessageDlg('O Nome precisa ter mais de 3 caracteres.', mtWarning, [mbOk], 0);
    Exit;
  end;
  Result := True;
end;

end.
