unit ProcurarForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Generics.Collections;

type
  TFormProcurar = class(TForm)
    lbProcurarPor: TLabel;
    edProcurarPor: TEdit;
    lvProcurar: TListView;
    btOk: TBitBtn;
    btCancel: TBitBtn;
    procedure lvProcurarDblClick(Sender: TObject);
    procedure lvProcurarKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormProcurar: TFormProcurar;

implementation

{$R *.dfm}

{ TFormProcurar }


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
