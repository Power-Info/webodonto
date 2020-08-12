unit Procedimento;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, IWCompListbox, IWCompButton, IWCompEdit,
  Vcl.Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWHTMLControls, IWHTMLTag;

type
  TFRMPROCEDIMENTO = class(TIWAppForm)
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    MENU: TIWLink;
    TXTBUSCAR: TIWEdit;
    BTNBUSCAR: TIWButton;
    BTNSALVAR: TIWButton;
    BTNEDITAR: TIWButton;
    BTNNOVO: TIWButton;
    BTNCANCELAR: TIWButton;
    txtid: TIWEdit;
    TXTDESCRICAO: TIWEdit;
    TXTPRECO: TIWEdit;
    BTNEXCLUIR: TIWButton;

    procedure limparCampos;
    procedure buscarTudo();
    procedure associarCampos();
    procedure buscarNome();
    procedure MENUClick(Sender: TObject);
    procedure IWTemplateProcessorHTML1UnknownTag(const AName: string;
      var VValue: string);
    procedure BTNNOVOAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BTNSALVARAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure TXTVALORAsyncChange(Sender: TObject; EventParams: TStringList);
    procedure BTNBUSCARClick(Sender: TObject);
    procedure BTNCANCELARClick(Sender: TObject);
    procedure BTNEDITARAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BTNEXCLUIRClick(Sender: TObject);
    procedure TXTDTINIHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
    procedure TXTDTFIMHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
    procedure TXTPRECOAsyncKeyPress(Sender: TObject; EventParams: TStringList);
    function Mascara(edt: String; str: String): string;
  public

  end;

implementation

{$R *.dfm}

uses ServerController, MENU, UserSessionUnit;

{ TFRMATIVIDADES }

{ TFRMATIVIDADES }

{ TFRMATIVIDADES }

procedure TFRMPROCEDIMENTO.associarCampos;
begin
  IWSCont.FDProcedimento.FieldByName('descricao').Value := TXTDESCRICAO.Text;
  IWSCont.FDProcedimento.FieldByName('preco').Value := TXTPRECO.Text;

end;

procedure TFRMPROCEDIMENTO.BTNBUSCARClick(Sender: TObject);
begin
  buscarNome;
end;

procedure TFRMPROCEDIMENTO.BTNCANCELARClick(Sender: TObject);
begin
  WebApplication.CallBackResponse.AddJavaScriptToExecute
    ('$(''#EditaDados'').modal(''hide'');');
end;

procedure TFRMPROCEDIMENTO.BTNEDITARAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  IWSCont.FDProcedimento.Locate('id', txtid.Text, []);
  IWSCont.FDProcedimento.Edit;

  TXTDESCRICAO.Text := IWSCont.FDProcedimento.FieldByName('descricao').Value;

  TXTPRECO.Text := IWSCont.FDProcedimento.FieldByName('preco').Value;

  WebApplication.CallBackResponse.AddJavaScriptToExecute
    ('$(''#EditaDados'').modal(''show'');');
end;

procedure TFRMPROCEDIMENTO.BTNEXCLUIRClick(Sender: TObject);
begin
  IWSCont.FDProcedimento.Locate('id', txtid.Text, []);
  IWSCont.FDProcedimento.Delete;
  buscarTudo;
end;

procedure TFRMPROCEDIMENTO.BTNNOVOAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  limparCampos;
  IWSCont.FDProcedimento.Insert;
  WebApplication.CallBackResponse.AddJavaScriptToExecute
    ('$(''#EditaDados'').modal(''show'');');
end;

procedure TFRMPROCEDIMENTO.BTNSALVARAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  if Trim(TXTDESCRICAO.Text) = '' then
  begin
    WebApplication.ShowMessage('Preencha o Campo Descrição');
    TXTDESCRICAO.SetFocus;
    exit;
  end;

  if Trim(TXTPRECO.Text) = '' then
  begin
    WebApplication.ShowMessage('Preencha a campo Preço');
    TXTPRECO.SetFocus;
    exit;
  end;

  associarCampos();
  IWSCont.FDProcedimento.Post;
  limparCampos;
  buscarTudo;
  IWSCont.FDProcedimento.Insert;

  WebApplication.CallBackResponse.AddJavaScriptToExecute
    ('$(''#EditaDados'').modal(''hide'');');
  WebApplication.CallBackResponse.AddJavaScriptToExecute('location.reload()');
end;

procedure TFRMPROCEDIMENTO.buscarTudo;
begin
  IWSCont.FDProcedimento.Active := false;
  IWSCont.FDProcedimento.Active := true;
  IWSCont.FDProcedimento.SQL.Clear;
  IWSCont.FDProcedimento.SQL.Add
    ('SELECT * FROM Procedimento order by Descricao asc');
  // IWSCont.FDProcedimento.ParamByName('nome').Value := txtBuscar.Text + '%';
  IWSCont.FDProcedimento.Open();
  IWSCont.FDProcedimento.First;
end;

procedure TFRMPROCEDIMENTO.buscarNome;
begin
  IWSCont.FDProcedimento.Active := false;
  IWSCont.FDProcedimento.Active := true;
  IWSCont.FDProcedimento.SQL.Clear;
  IWSCont.FDProcedimento.SQL.Add
    ('SELECT * FROM Procedimento where Descricao LIKE :Descricao order by Descricao asc');
  IWSCont.FDProcedimento.ParamByName('Descricao').Value := TXTBUSCAR.Text + '%';
  IWSCont.FDProcedimento.Open();
  IWSCont.FDProcedimento.First;
end;

procedure TFRMPROCEDIMENTO.IWTemplateProcessorHTML1UnknownTag
  (const AName: string; var VValue: string);
begin
  if AName = 'gridAtividade' then
  begin

    buscarNome;

    while not IWSCont.FDProcedimento.Eof do
    begin
      VValue := VValue +

        '<tr><td>' + IWSCont.FDProcedimento.FieldByName('id').AsString + '</td>'
        + sLineBreak + '<td>' + IWSCont.FDProcedimento.FieldByName('descricao')
        .AsString + '</td>' + sLineBreak + '<td>' +
        IWSCont.FDProcedimento.FieldByName('preco').AsString + '</td>' + '</td>'
        + sLineBreak +

        '<td>' + '<button type="button" title="Editar Procedimento" class="fa fa-pencil-square-o btn btn-info" onclick="return pegarPosicao('
        + IWSCont.FDProcedimento.FieldByName('id').AsString +
        ', ''alterar'')"></button>' +   '<td>' +
        '<button type="button" title="Excluir Procedimento" class="fa fa-times btn btn-danger" onclick="return pegarPosicao('
        + IWSCont.FDProcedimento.FieldByName('id').AsString +
        ', ''excluir'')"></button>' + '</td>' + sLineBreak + '</tr>';

      IWSCont.FDProcedimento.Next;
    end;
  end;
end;

procedure TFRMPROCEDIMENTO.limparCampos;
begin
  TXTDESCRICAO.Text := '';
  TXTPRECO.Text := '';
end;

procedure TFRMPROCEDIMENTO.MENUClick(Sender: TObject);
begin
  TFRMMENU.Create(WebApplication).Show;
end;

procedure TFRMPROCEDIMENTO.TXTDTFIMHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
begin
  ATag.AddStringParam('type', 'date');
end;

procedure TFRMPROCEDIMENTO.TXTDTINIHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
begin
  ATag.AddStringParam('type', 'date');
end;

procedure TFRMPROCEDIMENTO.TXTPRECOAsyncKeyPress(Sender: TObject;
  EventParams: TStringList);
begin
  if Length(TXTPRECO.Text) <= 3 then
  begin
    TXTPRECO.Text := Mascara(TXTPRECO.Text, '999');
  end
  else
  begin
    TXTPRECO.Text := Mascara(TXTPRECO.Text, '9.999,99');
  end;

end;

procedure TFRMPROCEDIMENTO.TXTVALORAsyncChange(Sender: TObject;
  EventParams: TStringList);
var
  numero: Integer;
begin

  if not TryStrToInt(TXTPRECO.Text, numero) then
  begin
    WebApplication.ShowMessage('Digite Apenas Números!');
    TXTPRECO.Text := '';
    TXTPRECO.SetFocus;
  end;

end;

function TFRMPROCEDIMENTO.Mascara(edt: String; str: String): string;
var
  i: Integer;
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
