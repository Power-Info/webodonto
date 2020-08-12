unit Usuarios;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, Vcl.Controls, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWHTMLControls, IWCompEdit, IWCompButton,
  IWCompListbox;

type
  TFRMUSUARIOS = class(TIWAppForm)
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    MENU: TIWLink;
    TXTBUSCAR: TIWEdit;
    BTNBUSCAR: TIWButton;
    BTNSALVAR: TIWButton;
    BTNEDITAR: TIWButton;
    BTNNOVO: TIWButton;
    BTNCANCELAR: TIWButton;
    txtid: TIWEdit;
    TXTNOME: TIWEdit;
    TXTEMAIL: TIWEdit;
    TXTNASCIMENTO: TIWEdit;
    TXTDEPARTAMENTO: TIWEdit;
    CBNIVEL: TIWComboBox;
    BTNEXCLUIR: TIWButton;
    TXTSENHA: TIWEdit;
    procedure MENUClick(Sender: TObject);
    procedure IWTemplateProcessorHTML1UnknownTag(const AName: string;
      var VValue: string);

    procedure limparCampos;
    procedure BTNNOVOAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure IWAppFormCreate(Sender: TObject);

    procedure carregarCombobox();
    procedure buscarTudo();
    procedure associarCampos();
    procedure buscarNome();
    procedure CBNIVELAsyncEnter(Sender: TObject; EventParams: TStringList);
    procedure BTNSALVARAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BTNBUSCARClick(Sender: TObject);
    procedure BTNEXCLUIRClick(Sender: TObject);
    procedure BTNEDITARAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BTNCANCELARClick(Sender: TObject);
    procedure TXTNASCIMENTOAsyncKeyPress(Sender: TObject;
      EventParams: TStringList);
    function Mascara(edt: String; str: String): string;
  public
  end;

implementation

{$R *.dfm}

uses MENU, ServerController;

procedure TFRMUSUARIOS.associarCampos;
begin
  IWSCont.QryLogin.FieldByName('nome').Value := TXTNOME.Text;
  IWSCont.QryLogin.FieldByName('senha').Value := TXTSENHA.Text;
  IWSCont.QryLogin.FieldByName('email').Value := TXTEMAIL.Text;
  IWSCont.QryLogin.FieldByName('nascimento').Value := TXTNASCIMENTO.Text;
  IWSCont.QryLogin.FieldByName('departamento').Value := TXTDEPARTAMENTO.Text;
  IWSCont.QryLogin.FieldByName('nivel').Value := CBNIVEL.Text;
end;

procedure TFRMUSUARIOS.BTNBUSCARClick(Sender: TObject);
begin
  buscarNome;
end;

procedure TFRMUSUARIOS.BTNCANCELARClick(Sender: TObject);
begin
  WebApplication.CallBackResponse.AddJavaScriptToExecute
    ('$(''#EditaDados'').modal(''hide'');');
end;

procedure TFRMUSUARIOS.BTNEDITARAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  IWSCont.QryLogin.Locate('id', txtid.Text, []);
  IWSCont.QryLogin.Edit;

  if not IWSCont.QryLogin.FieldByName('nome').IsNull then
    TXTNOME.Text := IWSCont.QryLogin.FieldByName('nome').Value;

  if not IWSCont.QryLogin.FieldByName('email').IsNull then
    TXTEMAIL.Text := IWSCont.QryLogin.FieldByName('email').Value;

  if not IWSCont.QryLogin.FieldByName('senha').IsNull then
    TXTSENHA.Text := IWSCont.QryLogin.FieldByName('senha').Value;

  if not IWSCont.QryLogin.FieldByName('Nascimento').IsNull then
    TXTNASCIMENTO.Text := IWSCont.QryLogin.FieldByName('Nascimento').Value;

  if not IWSCont.QryLogin.FieldByName('departamento').IsNull then
    TXTDEPARTAMENTO.Text := IWSCont.QryLogin.FieldByName('departamento').Value;

  if not IWSCont.QryLogin.FieldByName('nivel').IsNull then
    CBNIVEL.Items[0] := IWSCont.QryLogin.FieldByName('nivel').Value;
  CBNIVEL.ItemIndex := 0;

  WebApplication.CallBackResponse.AddJavaScriptToExecute
    ('$(''#EditaDados'').modal(''show'');');
end;

procedure TFRMUSUARIOS.BTNEXCLUIRClick(Sender: TObject);
begin
  IWSCont.QryLogin.Locate('id', txtid.Text, []);
  IWSCont.QryLogin.Delete;
  buscarTudo;
end;

procedure TFRMUSUARIOS.BTNNOVOAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  limparCampos;
  IWSCont.QryLogin.Insert;
  WebApplication.CallBackResponse.AddJavaScriptToExecute
    ('$(''#EditaDados'').modal(''show'');');
end;

procedure TFRMUSUARIOS.BTNSALVARAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  if Trim(TXTNOME.Text) = '' then
  begin
    WebApplication.ShowMessage('Preencha o Campo Nome');
    TXTNOME.SetFocus;
    exit;
  end;

  if Trim(TXTEMAIL.Text) = '' then
  begin
    WebApplication.ShowMessage('Preencha o Campo E-mail');
    TXTEMAIL.SetFocus;
    exit;
  end;

  if Trim(TXTDEPARTAMENTO.Text) = '' then
  begin
    WebApplication.ShowMessage('Preencha o Campo Departamento');
    TXTDEPARTAMENTO.SetFocus;
    exit;
  end;

  if Trim(TXTSENHA.Text) = '' then
  begin
    WebApplication.ShowMessage('Preencha o Campo Senha');
    TXTSENHA.SetFocus;
    exit;
  end;

  associarCampos();
  IWSCont.QryLogin.Post;
  limparCampos;
  buscarTudo;
  IWSCont.QryLogin.Insert;

  WebApplication.CallBackResponse.AddJavaScriptToExecute
    ('$(''#EditaDados'').modal(''hide'');');
  WebApplication.CallBackResponse.AddJavaScriptToExecute('location.reload()');

end;

procedure TFRMUSUARIOS.buscarNome;
begin
  IWSCont.QryLogin.Close;
  IWSCont.QryLogin.SQL.Clear;
  IWSCont.QryLogin.SQL.Add
    ('SELECT * from usuario where nome LIKE :nome order by nome asc');
  IWSCont.QryLogin.ParamByName('nome').Value := TXTBUSCAR.Text + '%';
  // query_login.ParamByName('senha').Value := txtSenha.Text;
  IWSCont.QryLogin.Open();
end;

procedure TFRMUSUARIOS.buscarTudo;
begin
  IWSCont.QryLogin.Close;
  IWSCont.QryLogin.SQL.Clear;
  IWSCont.QryLogin.SQL.Add('SELECT * from usuario order by nome asc');
  // query_login.ParamByName('usuario').Value := txtUsuario.Text;
  // query_login.ParamByName('senha').Value := txtSenha.Text;
  IWSCont.QryLogin.Open();
end;

procedure TFRMUSUARIOS.carregarCombobox;
begin
  CBNIVEL.Items.Clear;
  CBNIVEL.Items.Add('Admin');
  CBNIVEL.Items.Add('Gerente');
  CBNIVEL.Items.Add('Usuário');
end;

procedure TFRMUSUARIOS.CBNIVELAsyncEnter(Sender: TObject;
  EventParams: TStringList);
begin
  carregarCombobox;
end;

procedure TFRMUSUARIOS.IWAppFormCreate(Sender: TObject);
begin
  // ExtraHeader.Add(sJQUERY);
  // ExtraHeader.Add(sJFUNCTIONS);
  // ExtraHeader.Add(sJMASK);

  // InsereJavaScript(jQueryMask([TXTNASCIMENTO], maskDATA), Self);
end;

procedure TFRMUSUARIOS.IWTemplateProcessorHTML1UnknownTag(const AName: string;
  var VValue: string);
begin

  if AName = 'gridUsuarios' then
  begin

    buscarNome;
    // IWSCont.QryLogin.close;
    // IWSCont.QryLogin.SQL.Clear;
    // IWSCont.QryLogin.SQL.Add('Select * from usuario order by id asc')    ;
    // IWSCont.QryLogin.ParamByName('nome').Value := TXTUSUARIO.Text;
    // IWSCont.QryLogin.ParamByName('senha').Value := TXTSENHA.Text;
    // IWSCont.QryLogin.Open();

    while not IWSCont.QryLogin.Eof do
    begin
      VValue := VValue +

        '<tr><td>' + IWSCont.QryLogin.FieldByName('id').AsString + '</td>' +
        sLineBreak + '<td>' + IWSCont.QryLogin.FieldByName('nome').AsString +
        '</td>' + sLineBreak + '<td>' + IWSCont.QryLogin.FieldByName('senha')
        .AsString + '</td>' + sLineBreak + '<td>' + IWSCont.QryLogin.FieldByName
        ('email').AsString + '</td>' + sLineBreak + '<td>' +
        IWSCont.QryLogin.FieldByName('nascimento').AsString + '</td>' +
        sLineBreak + '<td>' + IWSCont.QryLogin.FieldByName('departamento')
        .AsString + '</td>' + sLineBreak + '<td>' + IWSCont.QryLogin.FieldByName
        ('nivel').AsString + '</td>' + sLineBreak +

        '<td>' + '<button type="button" class="btn btn-info mr-2" onclick="return pegarPosicao('
        + IWSCont.QryLogin.FieldByName('id').AsString +
        ', ''alterar'')">Editar</button>' +
        '<button type="button" class="btn btn-danger" onclick="return pegarPosicao('
        + IWSCont.QryLogin.FieldByName('id').AsString +
        ', ''excluir'')">Excluir</button>' + '</td>' + sLineBreak + '</tr>';

      IWSCont.QryLogin.Next;

    end;

  end;

end;

procedure TFRMUSUARIOS.limparCampos;
begin
  TXTNOME.Text := '';
  TXTEMAIL.Text := '';
  TXTNASCIMENTO.Text := '';
  TXTSENHA.Text := '';
  TXTDEPARTAMENTO.Text := '';
  CBNIVEL.ItemIndex := 0;
end;

procedure TFRMUSUARIOS.MENUClick(Sender: TObject);
begin
  TFRMMENU.Create(WebApplication).Show;
end;

procedure TFRMUSUARIOS.TXTNASCIMENTOAsyncKeyPress(Sender: TObject;
  EventParams: TStringList);
begin
    TXTNASCIMENTO.Text := Mascara(TXTNASCIMENTO.Text, '99/99/9999');
end;

function TFRMUSUARIOS.Mascara(edt: String; str: String): string;
var
  i: integer;
begin
  for i := 1 to Length(edt) do
  begin
    if (str[i] = '9') and not(edt[i] in ['0' .. '9']) and
      (Length(edt) = Length(str) + 1) then
      Delete(edt, i, 1);
    if (str[i] <> '9') and (edt[i] in ['0' .. '9']) then
      Insert(str[i], edt, i);
  end;
  Result := edt;
end;

end.
