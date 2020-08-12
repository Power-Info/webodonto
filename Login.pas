unit Login;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, Vcl.Controls, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompButton, IWCompEdit;

type
  TFRMLOGIN = class(TIWAppForm)
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    BTNLOGIN: TIWButton;
    TXTUSUARIO: TIWEdit;
    TXTSENHA: TIWEdit;
    procedure BTNLOGINAsyncClick(Sender: TObject; EventParams: TStringList);
  public
  end;

implementation

{$R *.dfm}

uses Menu, UserSessionUnit, ServerController;

procedure TFRMLOGIN.BTNLOGINAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  if Trim(TXTUSUARIO.Text) = '' then

  begin
    WebApplication.ShowMessage('Preencha o campo usuário');
    TXTUSUARIO.SetFocus;
    exit
  end;

  if Trim(TXTSENHA.Text) = '' then

  begin
    WebApplication.ShowMessage('Preencha o campo Senha');
    TXTSENHA.SetFocus;
    exit

  end;

  IWSCont.QryLogin.close;
  IWSCont.QryLogin.SQL.Clear;
  IWSCont.QryLogin.SQL.Add
    ('Select * from usuario where nome = :nome and senha = :senha');
  IWSCont.QryLogin.ParamByName('nome').Value := TXTUSUARIO.Text;
  IWSCont.QryLogin.ParamByName('senha').Value := TXTSENHA.Text;
  IWSCont.QryLogin.Open();

  if not IWSCont.QryLogin.isEmpty then
  begin
    // RECUPERAR DADOS DO USUÁRIO
    nomeUsuario := IWSCont.QryLogin['nome'];
    // nivelUsuario := IWSCont.QryLogin['nivel'] ;

    // ABRIR PAGINA DO MENU APOS LOGIN
    TFRMMENU.Create(WebApplication).Show;

    // WebApplication.ShowMessage('Bem vindo ao WPlay 360º');
  end
  else
  begin
    WebApplication.ShowMessage('Dados incorretos!!');
  End;

end;



end.
