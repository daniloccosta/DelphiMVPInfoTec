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
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edProcurarPorChange(Sender: TObject);
    procedure edProcurarPorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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


procedure TFormProcurar.edProcurarPorChange(Sender: TObject);
begin
  //lvProcurar.Items.Add.SubItems.
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

procedure TFormProcurar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    Key := 0;
    SelectNext(ActiveControl, True, True);
  end
  else if (Key = VK_ESCAPE) then
    Close;
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
