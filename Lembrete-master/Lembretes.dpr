program Lembretes;

uses
  Vcl.Forms,
  uFrmConsulta in 'uFrmConsulta.pas' {FormConsulta} ,
  uFrmInserirLembrete in 'uFrmInserirLembrete.pas' {FrmInserirLembrete} ,
  uFrmEditarLembrete in 'uFrmEditarLembrete.pas' {FrmEditar} ,
  uDM in 'uDM.pas' {DM: TDataModule} ,
  uBaseDAO in 'DAO\uBaseDAO.pas',
  uLembrete in 'MODEL\uLembrete.pas',
  uLembreteDAO in 'DAO\uLembreteDAO.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormConsulta, FormConsulta);
   Application.CreateForm(TFrmInserirLembrete, FrmInserirLembrete);
  Application.CreateForm(TFrmEditar, FrmEditarLembrete);
  Application.CreateForm(TDM, DM);
  Application.Run;

end.
