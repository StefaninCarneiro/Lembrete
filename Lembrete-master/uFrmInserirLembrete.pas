unit uFrmInserirLembrete;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, uLembreteDAO, uLembrete;

type
  TFrmInserirLembrete = class(TForm)
    Panel1: TPanel;
    EdtTitulo: TEdit;
    Label1: TLabel;
    MDescricao: TMemo;
    Label2: TLabel;
    Label3: TLabel;
    DTData: TDateTimePicker;
    BtnSalvar: TSpeedButton;
    DTHora: TDateTimePicker;
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PreencherLembrete;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmInserirLembrete: TFrmInserirLembrete;
  LembreteDAO: TLembreteDAO;
  Lembrete: Tlembrete;

implementation

{$R *.dfm}

procedure TFrmInserirLembrete.BtnSalvarClick(Sender: TObject);
begin
  PreencherLembrete;
  if LembreteDAO.Inserir(Lembrete) then
  begin
    ShowMessage('Registro Inserido');
  end;
  Close;
end;

procedure TFrmInserirLembrete.FormCreate(Sender: TObject);
begin
  LembreteDAO := TLembreteDAO.Create;
  Lembrete := Tlembrete.Create;
  DTData.Date := Now;
  DTHora.Time := Now;
end;

procedure TFrmInserirLembrete.FormDestroy(Sender: TObject);
begin
  Try
    if Assigned(LembreteDAO) then
      FreeAndNil(LembreteDAO);
    if Assigned(Lembrete) then
      FreeAndNil(Lembrete);
  except
    on e: exception do
      raise exception.Create(e.Message);
  End;
end;

procedure TFrmInserirLembrete.PreencherLembrete;
begin
  Lembrete.titulo := EdtTitulo.Text;
  Lembrete.descricao := MDescricao.Text;
  Lembrete.data := DTData.Datetime;
  Lembrete.hora := DTHora.Datetime;
end;

end.
