unit ProdutosForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls;

type
  TFormProdutos = class(TForm)
    Label2: TLabel;
    edDescricao: TEdit;
    Label3: TLabel;
    edPreco: TEdit;
    btAdicionar: TBitBtn;
    lvProdutos: TListView;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormProdutos: TFormProdutos;

implementation

{$R *.dfm}

end.
