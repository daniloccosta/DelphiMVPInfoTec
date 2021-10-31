unit ClientePresenter;

interface

uses ClienteIntf, ClienteMVPIntf, Cliente, Generics.Collections;

type
  TClientePresenter = class(TInterfacedObject, IClientePresenter)
  private
    FModel: ICliente;
    FView: IClienteView;
//    FCliente: TCliente;
  protected
    function GetModel: ICliente;
    procedure SetModel(const Value: ICliente);
    function GetView: IClienteView;
    procedure SetView(const Value: IClienteView);
//    function GetCliente: TCliente;
//    procedure SetCliente(Value: TCliente);
  public
    constructor Create;
    property Model: ICliente read GetModel write SetModel;
    property View: IClienteView read GetView write SetView;
//    property Cliente: TCliente read GetCliente write SetCliente;

    procedure Add;
    function Get: TCliente;
    procedure Update;
    procedure Delete;
    function ListAll: TList<TCliente>;
  end;

implementation

{ TClientePresenter }

procedure TClientePresenter.Add;
begin
  Model.Cliente := View.Cliente;
  Model.Add;
end;

constructor TClientePresenter.Create;
begin
//  FCliente := TCliente.Create;
end;

procedure TClientePresenter.Delete;
begin
  Model.Cliente := View.Cliente;
  Model.Delete;
end;

function TClientePresenter.Get: TCliente;
begin
  Model.Cliente := View.Cliente;
  Result := Model.Get;
end;

//function TClientePresenter.GetCliente: TCliente;
//begin
//  Result := FCliente;
//end;

function TClientePresenter.GetModel: ICliente;
begin
  Result := FModel;
end;

function TClientePresenter.GetView: IClienteView;
begin
  Result := FView;
end;

function TClientePresenter.ListAll: TList<TCliente>;
begin
  Result := Model.ListAll;
end;

//procedure TClientePresenter.SetCliente(Value: TCliente);
//begin
//  FCliente := Value;
//end;

procedure TClientePresenter.SetModel(const Value: ICliente);
begin
  FModel := Value;
end;

procedure TClientePresenter.SetView(const Value: IClienteView);
begin
  FView := Value;
end;

procedure TClientePresenter.Update;
begin
  Model.Cliente := View.Cliente;
  Model.Update;
end;

end.
