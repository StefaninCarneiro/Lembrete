unit uFrmConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.ExtCtrls, uLembreteDAO, System.Generics.Collections, uLembrete, uDM,
  uFrmInserirLembrete, FireDAC.DApt, uFrmEditarLembrete;

type
  TFormConsulta = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    EdtBuscaTitulo: TEdit;
    BtnBuscar: TSpeedButton;
    ListView1: TListView;
    Panel3: TPanel;
    BtnNovo: TSpeedButton;
    BtnEditar: TSpeedButton;
    BtnExcluir: TSpeedButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnBuscarClick(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    LembreteDAO: TLembreteDAO;
    procedure CarregarColecao;
    procedure PreencherListView(pListaLembrete: TList<TLembrete>);
  public
    { Public declarations }
  end;

var
  FormConsulta: TFormConsulta;

implementation

{$R *.dfm}
{ TForm1 }

procedure TFormConsulta.BtnBuscarClick(Sender: TObject);
begin
  LembreteDAO.ListarPorTitulo(EdtBuscaTitulo.Text);
  CarregarColecao;
end;

procedure TFormConsulta.BtnEditarClick(Sender: TObject);
begin
  try
    FrmEditarLembrete := TFrmEditar.Create(Self,
      TLembrete(ListView1.ItemFocused.Data));
    FrmEditarLembrete.ShowModal;
    CarregarColecao;
  finally
    FreeAndNil(FrmEditarLembrete);
    ListView1.Clear
  end;
end;

procedure TFormConsulta.BtnExcluirClick(Sender: TObject);
begin
  if ListView1.ItemIndex > -1 then
    if LembreteDAO.Deletar(TLembrete(TLembrete(ListView1.ItemFocused.Data)))
    then
    begin
      ShowMessage('Registro Deletado');
      CarregarColecao;
    end;
end;

procedure TFormConsulta.BtnNovoClick(Sender: TObject);
begin
  try
    FrmInserirLembrete := TFrmInserirLembrete.Create(Self);
    FrmInserirLembrete.ShowModal;
    CarregarColecao;
  finally
    FreeAndNil(FrmInserirLembrete);
  end;
end;

procedure TFormConsulta.CarregarColecao;
begin
  Try
    PreencherListView(LembreteDAO.ListarPorTitulo(EdtBuscaTitulo.Text));
  except
    on e: exception do
      raise exception.Create(e.Message);
  End;
end;

procedure TFormConsulta.FormCreate(Sender: TObject);
begin
  DM := TDM.Create(Self);
  LembreteDAO := TLembreteDAO.Create;
  CarregarColecao;
end;

procedure TFormConsulta.FormDestroy(Sender: TObject);
begin
  Try
    if Assigned(LembreteDAO) then
      FreeAndNil(LembreteDAO);
    if Assigned(DM) then
      FreeAndNil(DM);
  Except
    on e: exception do
      raise exception.Create(e.Message);
  End;
end;

procedure TFormConsulta.ListView1DblClick(Sender: TObject);
begin
  try
    FrmEditarLembrete := TFrmEditar.Create(Self,
      TLembrete(ListView1.ItemFocused.Data));
    FrmEditarLembrete.ShowModal;
    CarregarColecao;
  finally
    FreeAndNil(FrmEditarLembrete);
  end;
end;

procedure TFormConsulta.PreencherListView(pListaLembrete: TList<TLembrete>);
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
      tempItem.Caption := IntToStr(TLembrete(pListaLembrete[I]).IDLembrete);
      tempItem.SubItems.Add(TLembrete(pListaLembrete[I]).titulo);
      tempItem.SubItems.Add(FormatDateTime('dd/mm/yyyy HH:mm',
      TLembrete(pListaLembrete[I]).data));
      tempItem.Data := TLembrete(pListaLembrete[I]);
    end;
  end
  else
    ShowMessage('Nada Encontrado');
end;

end.
