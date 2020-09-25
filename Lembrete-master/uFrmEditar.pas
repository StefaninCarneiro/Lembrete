unit uFrmEditar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TFrmEditar = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    EdtTitulo: TEdit;
    MDescricao: TMemo;
    Label2: TLabel;
    Label3: TLabel;
    DTDataHora: TDateTimePicker;
    BtnSalvar: TSpeedButton;
    BtnExcluir: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEditar: TFrmEditar;

implementation

{$R *.dfm}

end.
