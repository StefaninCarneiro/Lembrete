unit uFrmCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.ExtCtrls, uLembreteDAO, System.Generics.Collections, uLembrete;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    EdtBuscaTitulo: TEdit;
    BtnBuscar: TSpeedButton;
    ListView1: TListView;
    Panel3: TPanel;
    BtnNovo: TSpeedButton;
    BtnEditar: TSpeedButton;
    BtnExcluir: TSpeedButton;
  private
    { Private declarations }
    LembreteDAO: TLembreteDAO;
    procedure CarregarColecao;
    procedure PreencherListView(pListaLembrete: TList<TLembrete>);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
{ TForm1 }

procedure TForm1.CarregarColecao;
begin

end;

procedure TForm1.PreencherListView(pListaLembrete: TList<TLembrete>);
var
  I: integer;
  tempItem: TListItem;
begin
  if Assigned(pListaLembrete) then
  begin
    ListView1.Clear;

    for I := 0 to pListaLembrete.Count - 1 do
    begin
      tempItem := ListView1.Items.Add;
      tempItem.Caption := IntToStr(TLembrete(pListaLembrete[I].IDLembrete));

      tempItem.SubItems.Add(TLembrete(pListaLembrete[I].titulo));

      tempItem.SubItems.Add(FormatDateTime('dd/mm/yyyy hh:mm',
        TLembrete(pListaLembrete[I].dataHora)));
    end;
  end
  else
    ShowMessage('Nada Encontrado');
end;

end.
