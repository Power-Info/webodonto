unit ServerController;

interface

uses
  SysUtils, Classes, IWServerControllerBase, IWBaseForm, HTTPApp,
  // For OnNewSession Event
  UserSessionUnit, IWApplication, IWAppForm, IW.Browser.Browser,
  IW.HTTP.Request, IW.HTTP.Reply, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.UI, frxClass, frxDBSet;

type
  TIWServerController = class(TIWServerControllerBase)
    FDConn: TFDConnection;
    FDdelete: TFDQuery;
    QryLogin: TFDQuery;
    QryUsuario: TFDQuery;
    FDPaciente: TFDQuery;
    FDGeral: TFDQuery;
    QryAtividade: TFDQuery;
    FDDenteProced: TFDQuery;
    QryEmpresa: TFDQuery;
    FDProcedimento: TFDQuery;
    QryPremio: TFDQuery;
    QryPremioID: TFDAutoIncField;
    QryPremioNome: TStringField;
    QryPremioDescricao: TStringField;
    QryPremioPonto: TIntegerField;
    QryPremioPeso: TLargeintField;
    QryPremioImagem: TStringField;
    QryDepartamento: TFDQuery;
    QryDepartamentoID: TFDAutoIncField;
    QryDepartamentoNome: TWideMemoField;
    QryDepartamentoSigla: TWideMemoField;
    QryDepartamentoIdEmpresa: TIntegerField;
    QryDepartamentonome_emp: TStringField;
    FDConsultaTable: TFDQuery;
    FDConsultaProcedimento: TFDQuery;
    FDConsulta: TFDQuery;
    QryUsuarioID: TShortintField;
    QryUsuarioNome: TStringField;
    QryUsuarioEmail: TStringField;
    QryUsuarioNascimento: TStringField;
    QryUsuarioSenha: TStringField;
    QryUsuarioAtividade: TStringField;
    QryUsuarioDepartamento: TStringField;
    QryUsuarioNivel: TStringField;
    FDPacienteId: TShortintField;
    FDPacienteNome: TStringField;
    FDPacienteCPF: TStringField;
    FDPacienteTelefone: TStringField;
    FDPacienteData: TStringField;
    FDPacientesexo: TStringField;
    FDPacienteemail: TStringField;
    FDPacienteobs: TStringField;
    FDPacientereconhecimento: TStringField;
    FDPacientecelular: TStringField;
    FDPacientecep: TStringField;
    FDPacienteendereco: TStringField;
    FDPacientenumero: TStringField;
    FDPacientecomplemento: TStringField;
    FDPacientebairro: TStringField;
    FDPacienteestado: TStringField;
    FDPacientepais: TStringField;
    FDPacientecidade: TStringField;
    QryAtividadeid: TShortintField;
    QryAtividadeassunto: TStringField;
    QryAtividadedescricao: TStringField;
    QryAtividadeStatus: TStringField;
    QryAtividadeinicio: TStringField;
    QryAtividadefim: TStringField;
    QryAtividadeponto: TSmallintField;
    QryAtividadeidUsuario: TShortintField;
    QryAtividadenome_usu: TStringField;
    QryEmpresaId: TShortintField;
    QryEmpresaNome: TStringField;
    QryEmpresaFantasia: TStringField;
    QryEmpresaTipoPessoa: TStringField;
    QryEmpresaCNPJ: TLargeintField;
    QryEmpresaFone: TStringField;
    QryEmpresaCEP: TIntegerField;
    QryEmpresaEndereco: TStringField;
    QryEmpresaUF: TStringField;
    QryEmpresaCidade: TStringField;
    FDProcedimentoId: TShortintField;
    FDProcedimentoDescricao: TStringField;
    FDProcedimentoPreco: TSmallintField;
    FDConsultaProcedimentoId: TSmallintField;
    FDConsultaProcedimentoidConsulta: TShortintField;
    FDConsultaProcedimentoidProcedimento: TShortintField;
    FDConsultaProcedimentoquantidade: TShortintField;
    FDConsultaProcedimentoId_1: TShortintField;
    FDConsultaProcedimentoidPaciente: TShortintField;
    FDConsultaProcedimentoidFuncionario: TShortintField;
    FDConsultaProcedimentodataConsulta: TStringField;
    FDConsultaProcedimentohora: TShortintField;
    FDConsultaProcedimentominuto: TShortintField;
    FDConsultaProcedimentopresenca: TShortintField;
    FDConsultaProcedimentoId_2: TShortintField;
    FDConsultaProcedimentoDescricao: TStringField;
    FDConsultaProcedimentoPreco: TSmallintField;
    QryLoginID: TShortintField;
    QryLoginNome: TStringField;
    QryLoginEmail: TStringField;
    QryLoginNascimento: TStringField;
    QryLoginSenha: TStringField;
    QryLoginAtividade: TStringField;
    QryLoginDepartamento: TStringField;
    QryLoginNivel: TStringField;
    FDConsultaid: TShortintField;
    FDConsultapaciente: TStringField;
    FDConsultausuario: TStringField;
    FDConsultadataConsulta: TStringField;
    FDConsultaidPaciente: TShortintField;
    FDConsultaidFuncionario: TShortintField;
    FDConsultaidP: TShortintField;
    FDConsultaidU: TShortintField;
    FDConsultahora: TShortintField;
    FDConsultaminuto: TShortintField;
    FDConsultapresenca: TShortintField;
    FDConsultaTableid: TShortintField;
    FDConsultaTablepaciente: TStringField;
    FDConsultaTableusuario: TStringField;
    FDConsultaTabledataConsulta: TStringField;
    FDConsultaTableidPaciente: TShortintField;
    FDConsultaTableidFuncionario: TShortintField;
    FDConsultaTableidP: TShortintField;
    FDConsultaTableidU: TShortintField;
    FDConsultaTablehora: TShortintField;
    FDConsultaTableminuto: TShortintField;
    FDConsultaTablepresenca: TShortintField;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    Rel_Receita: TfrxReport;
    DSRelReceituario: TfrxDBDataset;
    QryOdontoEspec: TFDQuery;
    QryOdontoEspecid: TFDAutoIncField;
    QryOdontoEspecNome: TStringField;
    QryOdontoEspecCRO: TIntegerField;
    QryOdontoEspecFone: TStringField;
    QryOdontoEspecUF: TStringField;
    QryOdontoEspecEspecialidade: TStringField;
    procedure IWServerControllerBaseNewSession(ASession: TIWApplication);

  private
    { Private declarations }

  public
    { Public declarations }
  end;

function UserSession: TIWUserSession;
function IWSCont: TIWServerController;

var
  // VARIAVEIS GLOBAIS...
  nomeUsuario: String;
  nivelUsuario: String;
  idCon: String;
  pacienteNome: String;
  drNome: String;

implementation

{$R *.dfm}

uses
  IWInit, IWGlobal;

function IWSCont: TIWServerController;
begin
  Result := TIWServerController(GServerController);
end;

function UserSession: TIWUserSession;
begin
  Result := TIWUserSession(WebApplication.Data);
end;

{ TIWServerController }

procedure TIWServerController.IWServerControllerBaseNewSession
  (ASession: TIWApplication);
begin
  ASession.Data := TIWUserSession.Create(nil, ASession);
end;

initialization

TIWServerController.SetServerControllerClass;

end.
