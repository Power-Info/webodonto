unit Paciente;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, IWCompListbox, IWCompButton, IWCompEdit,
  Vcl.Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWHTMLControls, IWCompFileUploader, IWCompExtCtrls, Vcl.Imaging.pngimage;

type
  TFRMPACIENTE = class(TIWAppForm)
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    MENU: TIWLink;
    TXTBUSCAR: TIWEdit;
    BTNBUSCAR: TIWButton;
    BTNSALVAR: TIWButton;
    BTNEDITAR: TIWButton;
    BTNNOVO: TIWButton;
    BTNCANCELAR: TIWButton;
    txtid: TIWEdit;
    TXTCPF: TIWEdit;
    TXTDATA: TIWEdit;
    BTNEXCLUIR: TIWButton;
    BTNIMAGEM: TIWButton;
    TXTTELEFONE: TIWEdit;
    TXTNOME: TIWEdit;
    TXTSEXO: TIWEdit;
    TXTEMAIL: TIWEdit;
    TXTOBS: TIWEdit;
    TXTCELULAR: TIWEdit;
    TXTCEP: TIWEdit;
    TXTENDERECO: TIWEdit;
    TXTNUMERO: TIWEdit;
    TXTCOMPLEMENTO: TIWEdit;
    TXTBAIRRO: TIWEdit;
    TXTCIDADE: TIWEdit;
    TXTPAIS: TIWEdit;
    TXTESTADO: TIWEdit;

    procedure limparCampos;
    procedure associarCampos();
    procedure buscarNome();
    procedure buscarTudo();
    procedure IWTemplateProcessorHTML1UnknownTag(const AName: string;
      var VValue: string);
    procedure MENUClick(Sender: TObject);
    procedure BTNNOVOAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BTNIMAGEMAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure FILEUPLOADERAsyncUploadCompleted(Sender: TObject;
      var DestPath, FileName: string; var SaveFile, Overwrite: Boolean);
    procedure BTNSALVARAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BTNEDITARAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BTNBUSCARClick(Sender: TObject);
    procedure BTNCANCELARClick(Sender: TObject);
    procedure BTNEXCLUIRClick(Sender: TObject);
    Function Formate_Data(Dados_Atual: String): String;
    function Mascara(edt: String; str: String): string;
    procedure TXTDATAAsyncKeyPress(Sender: TObject; EventParams: TStringList);
    procedure TXTTELEFONEAsyncKeyPress(Sender: TObject;
      EventParams: TStringList);
    procedure TXTCPFAsyncKeyPress(Sender: TObject; EventParams: TStringList);
    procedure TXTCELULARAsyncKeyPress(Sender: TObject;
      EventParams: TStringList);
    procedure TXTCEPAsyncKeyPress(Sender: TObject; EventParams: TStringList);

  public
  var
    nomeArquivo: string;

  end;

implementation

{$R *.dfm}

uses ServerController, MENU, MaskUtil, CONSTANTES_WEB;

{ TIWForm1 }

procedure TFRMPACIENTE.associarCampos;
begin

  IWSCont.FDPaciente.FieldByName('Nome').Value := TXTNOME.Text;
  IWSCont.FDPaciente.FieldByName('CPF').Value := TXTCPF.Text;
  IWSCont.FDPaciente.FieldByName('Telefone').Value := TXTTELEFONE.Text;
  IWSCont.FDPaciente.FieldByName('Data').Value := TXTDATA.Text;

  IWSCont.FDPaciente.FieldByName('sexo').Value := TXTSEXO.Text;
  IWSCont.FDPaciente.FieldByName('email').Value := TXTEMAIL.Text;
  IWSCont.FDPaciente.FieldByName('obs').Value := TXTOBS.Text;
  IWSCont.FDPaciente.FieldByName('celular').Value := TXTCELULAR.Text;

  IWSCont.FDPaciente.FieldByName('cep').Value := TXTCEP.Text;
  IWSCont.FDPaciente.FieldByName('endereco').Value := TXTENDERECO.Text;
  IWSCont.FDPaciente.FieldByName('numero').Value := TXTNUMERO.Text;
  IWSCont.FDPaciente.FieldByName('complemento').Value := TXTCOMPLEMENTO.Text;

  IWSCont.FDPaciente.FieldByName('bairro').Value := TXTBAIRRO.Text;
  IWSCont.FDPaciente.FieldByName('estado').Value := TXTESTADO.Text;
  IWSCont.FDPaciente.FieldByName('cidade').Value := TXTCIDADE.Text;
  IWSCont.FDPaciente.FieldByName('pais').Value := TXTPAIS.Text;
end;

procedure TFRMPACIENTE.BTNBUSCARClick(Sender: TObject);
begin
  buscarNome;
end;

procedure TFRMPACIENTE.BTNCANCELARClick(Sender: TObject);
begin
  WebApplication.CallBackResponse.AddJavaScriptToExecute
    ('$(''#EditaDados'').modal(''hide'');');
end;

procedure TFRMPACIENTE.BTNEDITARAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
//  ExtraHeader.Add(sJQUERY);
//  ExtraHeader.Add(sJFUNCTIONS);
//  ExtraHeader.Add(sJMASK);
//  ExtraHeader.Add(sJMaskInputMoney);
//  InsereJavaScript(jQueryMask([TXTDATA], maskDATA), Self);
//  InsereJavaScript(jQueryMask([TXTCPF], maskCPF), Self);

  IWSCont.FDPaciente.Locate('Id', txtid.Text, []);
  IWSCont.FDPaciente.Edit;

  TXTNOME.Text := IWSCont.FDPaciente.FieldByName('Nome').Value;
  TXTCPF.Text := IWSCont.FDPaciente.FieldByName('CPF').Value;
  TXTTELEFONE.Text := IWSCont.FDPaciente.FieldByName('Telefone').Value;

  TXTDATA.Text := IWSCont.FDPaciente.FieldByName('Data').Value;

  TXTSEXO.Text := IWSCont.FDPaciente.FieldByName('sexo').Value;
  TXTEMAIL.Text := IWSCont.FDPaciente.FieldByName('email').Value;
  TXTOBS.Text := IWSCont.FDPaciente.FieldByName('obs').Value;
  TXTCELULAR.Text := IWSCont.FDPaciente.FieldByName('celular').Value;

  TXTCEP.Text := IWSCont.FDPaciente.FieldByName('cep').Value;
  TXTENDERECO.Text := IWSCont.FDPaciente.FieldByName('endereco').Value;
  TXTNUMERO.Text := IWSCont.FDPaciente.FieldByName('numero').Value;
  TXTCOMPLEMENTO.Text := IWSCont.FDPaciente.FieldByName('complemento').Value;

  TXTBAIRRO.Text := IWSCont.FDPaciente.FieldByName('bairro').Value;
  TXTESTADO.Text := IWSCont.FDPaciente.FieldByName('estado').Value;
  TXTCIDADE.Text := IWSCont.FDPaciente.FieldByName('cidade').Value;
  TXTPAIS.Text := IWSCont.FDPaciente.FieldByName('pais').Value;

  WebApplication.CallBackResponse.AddJavaScriptToExecute
    ('$(''#EditaDados'').modal(''show'');');
end;

procedure TFRMPACIENTE.BTNEXCLUIRClick(Sender: TObject);
begin
  IWSCont.FDPaciente.Locate('Id', txtid.Text, []);
  IWSCont.FDPaciente.Delete;
  buscarTudo;
end;

procedure TFRMPACIENTE.BTNIMAGEMAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  // IMG.Picture.LoadFromFile(GetCurrentDir + '\wwwroot\assets\img\' +
  // nomeArquivo);
end;

procedure TFRMPACIENTE.BTNNOVOAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  limparCampos;
  IWSCont.FDPaciente.Insert;
  WebApplication.CallBackResponse.AddJavaScriptToExecute
    ('$(''#EditaDados'').modal(''show'');');
  nomeArquivo := 'sem-foto.jpg';

end;

procedure TFRMPACIENTE.BTNSALVARAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  if Trim(TXTNOME.Text) = '' then
  begin
    WebApplication.ShowMessage('Preencha o Campo Nome');
    TXTNOME.SetFocus;
    exit;
  end;

  if Trim(TXTCPF.Text) = '' then
  begin
    WebApplication.ShowMessage('Preencha o Campo CPF');
    TXTCPF.SetFocus;
    exit;
  end;

  associarCampos();
  IWSCont.FDPaciente.Post;
  limparCampos;
  buscarTudo;
  IWSCont.FDPaciente.Insert;

  WebApplication.CallBackResponse.AddJavaScriptToExecute
    ('$(''#EditaDados'').modal(''hide'');');
  WebApplication.CallBackResponse.AddJavaScriptToExecute('location.reload()');

end;

procedure TFRMPACIENTE.buscarNome;
begin
  IWSCont.FDPaciente.Close;
  IWSCont.FDPaciente.SQL.Clear;
  IWSCont.FDPaciente.SQL.Add
    ('SELECT * from Paciente where Nome LIKE :nome order by nome asc');
  IWSCont.FDPaciente.ParamByName('nome').Value := TXTBUSCAR.Text + '%';
  IWSCont.FDPaciente.Open();
end;

procedure TFRMPACIENTE.buscarTudo;
begin
  IWSCont.FDPaciente.Close;
  IWSCont.FDPaciente.SQL.Clear;
  IWSCont.FDPaciente.SQL.Add('SELECT * from Paciente order by nome asc');
  IWSCont.FDPaciente.Open();
end;

procedure TFRMPACIENTE.FILEUPLOADERAsyncUploadCompleted(Sender: TObject;
  var DestPath, FileName: string; var SaveFile, Overwrite: Boolean);
begin
  // FILEUPLOADER.SaveAll(GetCurrentDir + '\wwwroot\assets\img\', True);
  // SaveFile := false;
  // nomeArquivo := FileName;
end;

procedure TFRMPACIENTE.IWTemplateProcessorHTML1UnknownTag(const AName: string;
  var VValue: string);
begin
  if AName = 'gridPremio' then
  begin

    buscarNome;

    while not IWSCont.FDPaciente.Eof do
    begin
      VValue := VValue +

        '<tr><td>' + IWSCont.FDPaciente.FieldByName('id').AsString + '</td>' +
        sLineBreak + '<td>' + IWSCont.FDPaciente.FieldByName('nome').AsString +
        '</td>' + sLineBreak + '<td>' + IWSCont.FDPaciente.FieldByName('CPF')
        .AsString + '</td>' + sLineBreak + '<td>' +
        IWSCont.FDPaciente.FieldByName('Telefone').AsString + '</td>' +
        sLineBreak + '<td>' + IWSCont.FDPaciente.FieldByName('Data').AsString +
        '</td>' + sLineBreak +

        '<td>' + '<button type="button" title="Editar Pacinete" class="fa fa-pencil-square-o btn btn-info" onclick="return pegarPosicao('
        + IWSCont.FDPaciente.FieldByName('id').AsString +
        ', ''alterar'')"></button>' + '<td>' +
        '<button type="button" title="Excluir Paciente" class="fa fa-times btn btn-danger" onclick="return pegarPosicao('
        + IWSCont.FDPaciente.FieldByName('id').AsString +
        ', ''excluir'')"></button>' + '</td>' + sLineBreak + '</tr>';

      IWSCont.FDPaciente.Next;

    end;
  end;
end;

procedure TFRMPACIENTE.limparCampos;
begin
  TXTNOME.Text := '';
  TXTCPF.Text := '';
  TXTTELEFONE.Text := '';
  TXTDATA.Text := '';

  TXTSEXO.Text := '';
  TXTEMAIL.Text := '';
  TXTOBS.Text := '';
  TXTCELULAR.Text := '';

  TXTCEP.Text := '';
  TXTENDERECO.Text := '';
  TXTNUMERO.Text := '';
  TXTCOMPLEMENTO.Text := '';

  TXTBAIRRO.Text := '';
  TXTESTADO.Text := '';
  TXTCIDADE.Text := '';
  TXTPAIS.Text := '';

end;

procedure TFRMPACIENTE.MENUClick(Sender: TObject);
begin
  TFRMMENU.Create(WebApplication).Show;
end;

procedure TFRMPACIENTE.TXTCELULARAsyncKeyPress(Sender: TObject;
  EventParams: TStringList);
begin
  TXTCELULAR.Text := Mascara(TXTCELULAR.Text, '(99)99999-9999');
end;

procedure TFRMPACIENTE.TXTCEPAsyncKeyPress(Sender: TObject;
  EventParams: TStringList);
begin
  TXTCEP.Text := Mascara(TXTCEP.Text, '99999-999');
end;

procedure TFRMPACIENTE.TXTCPFAsyncKeyPress(Sender: TObject;
  EventParams: TStringList);
begin
  TXTCPF.Text := Mascara(TXTCPF.Text, '999.999.999-99');
end;

procedure TFRMPACIENTE.TXTDATAAsyncKeyPress(Sender: TObject;
  EventParams: TStringList);
begin
  TXTDATA.Text := Mascara(TXTDATA.Text, '99/99/9999');
end;

procedure TFRMPACIENTE.TXTTELEFONEAsyncKeyPress(Sender: TObject;
  EventParams: TStringList);
begin
  TXTTELEFONE.Text := Mascara(TXTTELEFONE.Text, '(99)99999-9999');
end;

Function TFRMPACIENTE.Formate_Data(Dados_Atual: String): String;
begin
  Result := Copy(Dados_Atual, 2, 2) + '/' + Copy(Dados_Atual, 5, 2) + '/' +
    Copy(Dados_Atual, 7, 4);
end;

function TFRMPACIENTE.Mascara(edt: String; str: String): string;
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
