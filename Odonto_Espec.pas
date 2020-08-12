unit Odonto_Espec;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, IWCompButton, IWCompEdit, Vcl.Controls,
  IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl, IWHTMLControls,
  IWCompListbox;

type
  TFRMODONTOESPEC = class(TIWAppForm)
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    MENU: TIWLink;
    TXTBUSCAR: TIWEdit;
    BTNBUSCAR: TIWButton;
    txtid: TIWEdit;
    TXTNOME: TIWEdit;
    TXTCRO: TIWEdit;
    TXTFONE: TIWEdit;
    TXTUF: TIWComboBox;
    TXTESPEC: TIWComboBox;
    BTNSALVAR: TIWButton;
    BTNEDITAR: TIWButton;
    procedure BTNBUSCARClick(Sender: TObject);
    procedure buscarNome();
    procedure buscarTudo();
    procedure associarCampos();
    procedure limparCampos;
    procedure BTNSALVARAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BTNEDITARAsyncClick(Sender: TObject; EventParams: TStringList);
  public
  end;

implementation

{$R *.dfm}

uses ServerController;


procedure TFRMODONTOESPEC.associarCampos;
begin
  IWSCont.QryOdontoEspec.FieldByName('Nome').Value := TXTNOME.Text;
  IWSCont.QryOdontoEspec.FieldByName('CPF').Value := TXTCRO.Text;
end;

procedure TFRMODONTOESPEC.BTNBUSCARClick(Sender: TObject);
begin
buscarNome;
end;

procedure TFRMODONTOESPEC.BTNEDITARAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
IWSCont.FDPaciente.Locate('Id', txtid.Text, []);
  IWSCont.FDPaciente.Edit;

  TXTNOME.Text := IWSCont.QryOdontoEspec.FieldByName('Nome').Value;
  TXTCRO.Text := IWSCont.QryOdontoEspec.FieldByName('CRO').Value;
  TXTUF.Text := IWSCont.QryOdontoEspec.FieldByName('UF').Value;

  TXTFONE.Text := IWSCont.QryOdontoEspec.FieldByName('FONE').Value;

  TXTESPEC.Text := IWSCont.QryOdontoEspec.FieldByName('especialidade').Value;


  WebApplication.CallBackResponse.AddJavaScriptToExecute
    ('$(''#EditaDados'').modal(''show'');');
end;

procedure TFRMODONTOESPEC.BTNSALVARAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
if Trim(TXTNOME.Text) = '' then
  begin
    WebApplication.ShowMessage('Preencha o Campo Nome');
    TXTNOME.SetFocus;
    exit;
  end;

  if Trim(TXTCRO.Text) = '' then
  begin
    WebApplication.ShowMessage('Preencha o Campo CPF');
    TXTCRO.SetFocus;
    exit;
  end;

  associarCampos();
  IWSCont.FDPaciente.Post;
  limparCampos;
  buscarTudo;
  IWSCont.QryOdontoEspec.Insert;

  WebApplication.CallBackResponse.AddJavaScriptToExecute
    ('$(''#EditaDados'').modal(''hide'');');
  WebApplication.CallBackResponse.AddJavaScriptToExecute('location.reload()');
end;

procedure TFRMODONTOESPEC.buscarNome;
begin
  IWSCont.QryOdontoEspec.Close;
  IWSCont.QryOdontoEspec.SQL.Clear;
  IWSCont.QryOdontoEspec.SQL.Add
    ('SELECT * from odonto_espec where Nome LIKE :nome order by nome asc');
  IWSCont.QryOdontoEspec.ParamByName('nome').Value := TXTBUSCAR.Text + '%';
  IWSCont.QryOdontoEspec.Open();
end;

procedure TFRMODONTOESPEC.buscarTudo;
begin
  IWSCont.QryOdontoEspec.Close;
  IWSCont.QryOdontoEspec.SQL.Clear;
  IWSCont.QryOdontoEspec.SQL.Add('SELECT * from odonto_espec order by nome asc');
  IWSCont.QryOdontoEspec.Open();
end;

procedure TFRMODONTOESPEC.limparCampos;
begin
  TXTNOME.Text := '';
  TXTCRO.Text := '';
end;

end.
