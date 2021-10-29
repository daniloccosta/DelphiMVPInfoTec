program DelphiMVPInfoTec;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {Form1},
  Cliente in '..\Teste\Models\Cliente.pas',
  ClienteIntf in '..\Teste\Models\ClienteIntf.pas',
  Item in '..\Teste\Models\Item.pas',
  ItemIntf in '..\Teste\Models\ItemIntf.pas',
  Pedido in '..\Teste\Models\Pedido.pas',
  PedidoIntf in '..\Teste\Models\PedidoIntf.pas',
  Produto in '..\Teste\Models\Produto.pas',
  ProdutoIntf in '..\Teste\Models\ProdutoIntf.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
