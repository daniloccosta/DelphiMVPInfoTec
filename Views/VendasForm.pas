unit VendasForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.WinXPickers,
  Vcl.StdCtrls;

type
  TFormVendas = class(TForm)
    ListView1: TListView;
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
    Edit1: TEdit;
    Label10: TLabel;
    Edit2: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormVendas: TFormVendas;

implementation

{$R *.dfm}

end.
