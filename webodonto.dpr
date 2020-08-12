library webodonto;

uses
  FastMM4,
  IWRtlFix,
  IWJclStackTrace,
  IWJclDebug,
  IWInitISAPI,
  Login in 'Login.pas' {FRMLOGIN: TIWAppForm},
  CONSTANTES_WEB in 'CONSTANTES_WEB.pas',
  Consulta in 'Consulta.pas' {FRMCONSULTA: TIWAppForm},
  Empresa in 'Empresa.pas' {FRMEMPRESA: TIWAppForm},
  GerenciaProcedimentos in 'GerenciaProcedimentos.pas' {FRMGERENCIAP: TIWAppForm},
  MaskUtil in 'MaskUtil.pas',
  Menu in 'Menu.pas' {FRMMENU: TIWAppForm},
  Paciente in 'Paciente.pas' {FRMPACIENTE: TIWAppForm},
  Procedimento in 'Procedimento.pas' {FRMPROCEDIMENTO: TIWAppForm},
  ServerController in 'ServerController.pas' {IWServerController: TIWServerControllerBase},
  uListBox in 'uListBox.pas',
  Unit1 in 'Unit1.pas' {IWForm1: TIWAppForm},
  UserSessionUnit in 'UserSessionUnit.pas' {IWUserSession: TIWUserSessionBase},
  Usuarios in 'Usuarios.pas' {FRMUSUARIOS: TIWAppForm},
  Apresentacao in 'Apresentacao.pas' {APRESENTACAOSIC: TIWAppForm},
  Odonto_Espec in 'Odonto_Espec.pas' {FRMODONTOESPEC: TIWAppForm};

{$R *.RES}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  IWRun;
end.
