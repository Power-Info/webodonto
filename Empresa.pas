unit Empresa;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, IWCompListbox, IWCompButton, IWCompEdit,
  Vcl.Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWHTMLControls;

type
  TFRMEMPRESA = class(TIWAppForm)
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
    TXTFANTASIA: TIWEdit;
    TXTFONE: TIWEdit;
    TXTENDERECO: TIWEdit;
    CBTIPOPESSOA: TIWComboBox;
    BTNEXCLUIR: TIWButton;
    TXTCEP: TIWEdit;
    TXTCNPJ: TIWEdit;
    TXTUF: TIWEdit;
    TXTCIDADE: TIWEdit;
    TXTEMAIL: TIWEdit;

    procedure buscarTudo();
    procedure associarCampos();
    procedure limparCampos;
    procedure buscarNome();
    procedure IWTemplateProcessorHTML1UnknownTag(const AName: string;
      var VValue: string);
    procedure MENUClick(Sender: TObject);
    procedure BTNNOVOAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BTNSALVARAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BTNCANCELARClick(Sender: TObject);
    procedure BTNBUSCARClick(Sender: TObject);
    procedure BTNEDITARAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BTNEXCLUIRClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses ServerController, MENU;

procedure TFRMEMPRESA.associarCampos;
begin
  IWSCont.QryEmpresa.FieldByName('nome').Value := TXTNOME.Text;
  IWSCont.QryEmpresa.FieldByName('fantasia').Value := TXTFANTASIA.Text;
  IWSCont.QryEmpresa.FieldByName('tipopessoa').Value := CBTIPOPESSOA.Text;
  IWSCont.QryEmpresa.FieldByName('cnpj').Value := TXTCNPJ.Text;
  IWSCont.QryEmpresa.FieldByName('fone').Value := TXTFONE.Text;
  IWSCont.QryEmpresa.FieldByName('cep').Value := TXTCEP.Text;
  IWSCont.QryEmpresa.FieldByName('endereco').Value := TXTENDERECO.Text;
  IWSCont.QryEmpresa.FieldByName('uf').Value := TXTUF.Text;
  IWSCont.QryEmpresa.FieldByName('cidade').Value := TXTCIDADE.Text;
end;

procedure TFRMEMPRESA.BTNBUSCARClick(Sender: TObject);
begin
  buscarNome;
end;

procedure TFRMEMPRESA.BTNCANCELARClick(Sender: TObject);
begin
  WebApplication.CallBackResponse.AddJavaScriptToExecute
    ('$(''#EditaDados'').modal(''hide'');');
end;

procedure TFRMEMPRESA.BTNEDITARAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  IWSCont.QryEmpresa.Locate('id', txtid.Text, []);
  IWSCont.QryEmpresa.Edit;

  if not IWSCont.QryEmpresa.FieldByName('nome').IsNull then
    TXTNOME.Text := IWSCont.QryEmpresa.FieldByName('nome').Value;

  if not IWSCont.QryEmpresa.FieldByName('fantasia').IsNull then
    TXTFANTASIA.Text := IWSCont.QryEmpresa.FieldByName('fantasia').Value;

  if not IWSCont.QryEmpresa.FieldByName('cep').IsNull then
    TXTCEP.Text := IWSCont.QryEmpresa.FieldByName('cep').Value;

  if not IWSCont.QryEmpresa.FieldByName('cnpj').IsNull then
    TXTCNPJ.Text := IWSCont.QryEmpresa.FieldByName('cnpj').Value;

  if not IWSCont.QryEmpresa.FieldByName('fone').IsNull then
    TXTFONE.Text := IWSCont.QryEmpresa.FieldByName('fone').Value;

  if not IWSCont.QryEmpresa.FieldByName('endereco').IsNull then
    TXTENDERECO.Text := IWSCont.QryEmpresa.FieldByName('endereco').Value;

  if not IWSCont.QryEmpresa.FieldByName('uf').IsNull then
    TXTUF.Text := IWSCont.QryEmpresa.FieldByName('uf').Value;

  if not IWSCont.QryEmpresa.FieldByName('cidade').IsNull then
    TXTCIDADE.Text := IWSCont.QryEmpresa.FieldByName('cidade').Value;

  if not IWSCont.QryEmpresa.FieldByName('tipopessoa').IsNull then
    CBTIPOPESSOA.Items[0] := IWSCont.QryEmpresa.FieldByName('tipopessoa').Value;
  CBTIPOPESSOA.ItemIndex := 0;

  WebApplication.CallBackResponse.AddJavaScriptToExecute
    ('$(''#EditaDados'').modal(''show'');');
end;

procedure TFRMEMPRESA.BTNEXCLUIRClick(Sender: TObject);
begin
  IWSCont.QryEmpresa.Locate('id', txtid.Text, []);
  IWSCont.QryEmpresa.Delete;
  buscarTudo;
end;

procedure TFRMEMPRESA.BTNNOVOAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  limparCampos;
  IWSCont.QryEmpresa.Insert;
  WebApplication.CallBackResponse.AddJavaScriptToExecute
    ('$(''#EditaDados'').modal(''show'');');
end;

procedure TFRMEMPRESA.BTNSALVARAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  if Trim(TXTNOME.Text) = '' then
  begin
    WebApplication.ShowMessage('Preencha o Campo Nome');
    TXTNOME.SetFocus;
    exit;
  end;

  if Trim(TXTCNPJ.Text) = '' then
  begin
    WebApplication.ShowMessage('Preencha o Campo CNPJ');
    TXTEMAIL.SetFocus;
    exit;
  end;

  if Trim(TXTFONE.Text) = '' then
  begin
    WebApplication.ShowMessage('Preencha o Campo Fone');
    TXTFONE.SetFocus;
    exit;
  end;

  if Trim(TXTENDERECO.Text) = '' then
  begin
    WebApplication.ShowMessage('Preencha o Campo Endereço');
    TXTENDERECO.SetFocus;
    exit;
  end;

  associarCampos();
  IWSCont.QryEmpresa.Post;
  limparCampos;
  buscarTudo;
  IWSCont.QryEmpresa.Insert;

  WebApplication.CallBackResponse.AddJavaScriptToExecute
    ('$(''#EditaDados'').modal(''hide'');');
  WebApplication.CallBackResponse.AddJavaScriptToExecute('location.reload()');
end;

procedure TFRMEMPRESA.buscarNome;
begin
  IWSCont.QryEmpresa.Close;
  IWSCont.QryEmpresa.SQL.Clear;
  IWSCont.QryEmpresa.SQL.Add
    ('SELECT * from empresa where nome LIKE :nome order by nome asc');
  IWSCont.QryEmpresa.ParamByName('nome').Value := TXTBUSCAR.Text + '%';
  // query_login.ParamByName('senha').Value := txtSenha.Text;
  IWSCont.QryEmpresa.Open();
end;

procedure TFRMEMPRESA.buscarTudo;
begin
  IWSCont.QryEmpresa.Close;
  IWSCont.QryEmpresa.SQL.Clear;
  IWSCont.QryEmpresa.SQL.Add('SELECT * from empresa order by nome asc');
  // query_login.ParamByName('usuario').Value := txtUsuario.Text;
  // query_login.ParamByName('senha').Value := txtSenha.Text;
  IWSCont.QryEmpresa.Open();
end;

procedure TFRMEMPRESA.IWTemplateProcessorHTML1UnknownTag(const AName: string;
  var VValue: string);
begin
  if AName = 'gridEmpresa' then
  begin

    buscarNome;

    while not IWSCont.QryEmpresa.Eof do
    begin
      VValue := VValue +

        '<tr><td>' + IWSCont.QryEmpresa.FieldByName('id').AsString + '</td>' +
        sLineBreak + '<td>' + IWSCont.QryEmpresa.FieldByName('nome').AsString +
        '</td>' + sLineBreak + '<td>' + IWSCont.QryEmpresa.FieldByName
        ('fantasia').AsString + '</td>' + sLineBreak + '<td>' +
        IWSCont.QryEmpresa.FieldByName('tipopessoa').AsString + '</td>' +
        sLineBreak + '<td>' + IWSCont.QryEmpresa.FieldByName('CNPJ').AsString +
        '</td>' + sLineBreak + '<td>' + IWSCont.QryEmpresa.FieldByName('fone')
        .AsString + '</td>' + sLineBreak + '<td>' +
        IWSCont.QryEmpresa.FieldByName('cep').AsString + '</td>' + sLineBreak +
        '<td>' + IWSCont.QryEmpresa.FieldByName('endereco').AsString + '</td>' +
        sLineBreak + '<td>' + IWSCont.QryEmpresa.FieldByName('UF').AsString +
        '</td>' + sLineBreak + '<td>' + IWSCont.QryEmpresa.FieldByName('cidade')
        .AsString + '</td>' + sLineBreak +

        '<td>' + '<button type="button" class="btn btn-info mr-2" onclick="return pegarPosicao('
        + IWSCont.QryEmpresa.FieldByName('id').AsString +
        ', ''alterar'')">Editar</button>' +
        '<button type="button" class="btn btn-danger" onclick="return pegarPosicao('
        + IWSCont.QryEmpresa.FieldByName('id').AsString +
        ', ''excluir'')">Excluir</button>' + '</td>' + sLineBreak + '</tr>';

      IWSCont.QryEmpresa.Next;
    end;
  end;
end;

procedure TFRMEMPRESA.limparCampos;
begin
  TXTNOME.Text := '';
  TXTFANTASIA.Text := '';
  TXTFONE.Text := '';
  TXTCEP.Text := '';
  TXTENDERECO.Text := '';
  TXTUF.Text := '';
  TXTCIDADE.Text := '';
  TXTEMAIL.Text := '';
  TXTCNPJ.Text := '';
  CBTIPOPESSOA.ItemIndex := 0;
end;

procedure TFRMEMPRESA.MENUClick(Sender: TObject);
begin
  TFRMMENU.Create(WebApplication).Show;
end;

end.
