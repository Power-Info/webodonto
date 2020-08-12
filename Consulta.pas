unit Consulta;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, IWCompListbox, IWCompButton, IWCompEdit,
  Vcl.Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWHTMLControls, IWCompLabel, uListBox, Data.FMTBcd, Data.DB, Data.SqlExpr,
  IWCompGrids, Empresa;

type
  TFRMCONSULTA = class(TIWAppForm)
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    MENU: TIWLink;
    TXTBUSCAR: TIWEdit;
    BTNBUSCAR: TIWButton;
    BTNSALVAR: TIWButton;
    BTNEDITAR: TIWButton;
    BTNNOVO: TIWButton;
    BTNCANCELAR: TIWButton;
    txtid: TIWEdit;
    TXTDATACONSULTA: TIWEdit;
    CBPACIENTE: TIWComboBox;
    BTNEXCLUIR: TIWButton;
    CBFUNCIONARIO: TIWComboBox;
    TXTHORA: TIWEdit;
    TXTMINUTO: TIWEdit;
    CBPROCEDIMENTO: TIWComboBox;
    TXTQTD: TIWEdit;
    LBTOTAL: TIWLabel;
    BTNADDPROCED: TIWButton;
    BTNREMOVPROCED: TIWButton;
    BTNSALVARPRODCON: TIWButton;
    BTNCANCELARPRODCON: TIWButton;
    BTNPROCEDIMENTO: TIWButton;
    txtid2: TIWEdit;
    BTNVISUALIZARP: TIWButton;
    BTNCANCELARPRODCON2: TIWButton;

    procedure limparCampos;
    procedure carregarCombobox();
    procedure carregarComboboxProced();
    procedure buscarNome();
    procedure buscarTudo();
    procedure buscarTudoProced();
    procedure buscarProcedByConsulta();
    procedure associarCampos();
    procedure associarCamposConProced();

    procedure MENUClick(Sender: TObject);
    procedure IWTemplateProcessorHTML1UnknownTag(const AName: string;
      var VValue: string);
    procedure BTNNOVOAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BTNSALVARAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BTNEDITARAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BTNCANCELARClick(Sender: TObject);
    procedure BTNEXCLUIRClick(Sender: TObject);
    procedure BTNBUSCARClick(Sender: TObject);
    procedure BTNADDPROCEDAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BTNREMOVPROCEDAsyncClick(Sender: TObject;
      EventParams: TStringList);
    procedure TXTDATACONSULTAAsyncKeyPress(Sender: TObject;
      EventParams: TStringList);
    function Mascara(edt: String; str: String): string;
    procedure BTNVISUALIZARPAsyncClick(Sender: TObject;
      EventParams: TStringList);
    procedure BTNPROCEDIMENTOAsyncClick(Sender: TObject;
      EventParams: TStringList);
    procedure BTNCANCELARPRODCON2Click(Sender: TObject);
    procedure BTNCANCELARPRODCONClick(Sender: TObject);
    procedure BTNPROCEDIMENTOClick(Sender: TObject);
  public
  var
    idC: Integer;
    total: Float32;
    lb: TCustomListBox;
    col: Integer;
  end;

implementation

{$R *.dfm}

uses MENU, ServerController, GerenciaProcedimentos;

procedure TFRMCONSULTA.associarCampos;
begin
  IWSCont.FDConsultaTable.FieldByName('hora').Value := TXTHORA.Text;
  IWSCont.FDConsultaTable.FieldByName('minuto').Value := TXTMINUTO.Text;

  IWSCont.FDConsultaTable.FieldByName('dataConsulta').Value := TXTDATACONSULTA.Text;
  IWSCont.FDConsultaTable.FieldByName('idPaciente').Value :=
    Integer(CBPACIENTE.Items.Objects[CBPACIENTE.ItemIndex]);
  IWSCont.FDConsultaTable.FieldByName('idFuncionario').Value :=
    Integer(CBFUNCIONARIO.Items.Objects[CBFUNCIONARIO.ItemIndex]);

end;

procedure TFRMCONSULTA.associarCamposConProced;
begin
  IWSCont.FDConsultaProcedimento.FieldByName('quantidade').Value := TXTQTD.Text;
  IWSCont.FDConsultaProcedimento.FieldByName('idProcedimento').Value :=
    Integer(CBPROCEDIMENTO.Items.Objects[CBPROCEDIMENTO.ItemIndex]);
  IWSCont.FDConsultaProcedimento.FieldByName('idConsulta').Value := idC;
  // IWSCont.FDConsultaTable.FieldByName('id').AsInteger;
end;

procedure TFRMCONSULTA.BTNADDPROCEDAsyncClick(Sender: TObject;
  EventParams: TStringList);
var
  des: String;
begin
  if Trim(TXTQTD.Text) = '' then
  begin
    WebApplication.ShowMessage('Preencha o Campo Quantidade');
    TXTQTD.SetFocus;
    exit;
  end;

  with IWSCont.FDConsultaProcedimento do
  begin
    Active := false;
    Active := true;
    Insert;
  end;

  associarCamposConProced();
  IWSCont.FDConsultaProcedimento.Post;
  // limparCampos;
  buscarTudoProced;
  IWSCont.FDConsultaProcedimento.Insert;

  idC := StrToInt(txtid.Text);
  carregarComboboxProced;
  buscarTudoProced;
  LBTOTAL.Text := FloatToStr(total);
  buscarProcedByConsulta;

end;

procedure TFRMCONSULTA.BTNBUSCARClick(Sender: TObject);
begin
  buscarNome;
end;

procedure TFRMCONSULTA.BTNCANCELARClick(Sender: TObject);
begin
  WebApplication.CallBackResponse.AddJavaScriptToExecute
    ('$(''#EditaDados'').modal(''hide'');');
end;

procedure TFRMCONSULTA.BTNCANCELARPRODCONClick(Sender: TObject);
begin
  WebApplication.CallBackResponse.AddJavaScriptToExecute
    ('$(''#AddProcediementos'').modal(''hide'');');
end;

procedure TFRMCONSULTA.BTNEDITARAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  CBPACIENTE.Items.Clear;
  CBFUNCIONARIO.Items.Clear;
  // IWSCont.FDConsultaTable.Active := false;
  // IWSCont.FDConsultaTable.Active := true;
  // IWSCont.FDConsultaTable.SQL.Clear;
  // IWSCont.FDConsultaTable.SQL.Add
  // ('select c.id, p.nome as paciente, u.nome as usuario, c.dataCOnsulta as data from Consulta c '
  // + ' inner join Paciente p on p.id=c.idPaciente' +
  // ' inner join Usuario u on u.id=c.idFuncionario');

  IWSCont.FDConsultaTable.Locate('id', txtid.Text, []);
  IWSCont.FDConsultaTable.Edit;

  TXTDATACONSULTA.Text := IWSCont.FDConsultaTable.FieldByName('dataConsulta').Value;

  TXTHORA.Text := IWSCont.FDConsultaTable.FieldByName('hora').Value;
  TXTMINUTO.Text := IWSCont.FDConsultaTable.FieldByName('minuto').Value;

  CBPACIENTE.Items.AddObject(IWSCont.FDConsultaTable.FieldByName('paciente')
    .Value, TObject(IWSCont.FDConsultaTable.FieldByName('idPaciente')
    .AsInteger));

  CBFUNCIONARIO.Items.AddObject(IWSCont.FDConsultaTable.FieldByName('usuario')
    .Value, TObject(IWSCont.FDConsultaTable.FieldByName('idFuncionario')
    .AsInteger));

  CBPACIENTE.Items[0] := IWSCont.FDConsultaTable.FieldByName('paciente').Value;

  CBFUNCIONARIO.Items[0] := IWSCont.FDConsultaTable.FieldByName
    ('usuario').Value;

  carregarCombobox;
  WebApplication.CallBackResponse.AddJavaScriptToExecute
    ('$(''#EditaDados'').modal(''show'');');
end;

procedure TFRMCONSULTA.BTNEXCLUIRClick(Sender: TObject);
begin
  IWSCont.FDConsultaTable.Locate('id', txtid.Text, []);
  IWSCont.FDConsultaTable.Delete;
  buscarTudo;
end;

procedure TFRMCONSULTA.BTNNOVOAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  CBPACIENTE.Items.Clear;
  CBFUNCIONARIO.Items.Clear;

  carregarCombobox;
  limparCampos;
  IWSCont.FDConsultaTable.Insert;
  WebApplication.CallBackResponse.AddJavaScriptToExecute
    ('$(''#EditaDados'').modal(''show'');');
end;

procedure TFRMCONSULTA.BTNPROCEDIMENTOAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  IWSCont.FDConsultaProcedimento.Open();
  IWSCont.FDConsultaProcedimento.Locate('idConsulta', txtid.Text, []);
  idCon := txtid.Text;

  TFRMGERENCIAP.Create(WebApplication).Show;
end;

procedure TFRMCONSULTA.BTNPROCEDIMENTOClick(Sender: TObject);
begin
  IWSCont.FDConsultaProcedimento.Open();
  IWSCont.FDConsultaProcedimento.Locate('idConsulta', txtid.Text, []);
  idCon := txtid.Text;

  TFRMGERENCIAP.Create(WebApplication).Show;
end;

procedure TFRMCONSULTA.BTNREMOVPROCEDAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  IWSCont.FDConsultaProcedimento.Locate('id', txtid2.Text, []);
  IWSCont.FDConsultaProcedimento.Delete;
  buscarProcedByConsulta;
end;

procedure TFRMCONSULTA.BTNSALVARAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  if Trim(TXTDATACONSULTA.Text) = '' then
  begin
    WebApplication.ShowMessage('Preencha o Campo DATA');
    TXTDATACONSULTA.SetFocus;
    exit;
  end;

  associarCampos();
  IWSCont.FDConsultaTable.Post;
  limparCampos;
  buscarTudo;
  IWSCont.FDConsultaTable.Insert;

  WebApplication.CallBackResponse.AddJavaScriptToExecute
    ('$(''#EditaDados'').modal(''hide'');');
  WebApplication.CallBackResponse.AddJavaScriptToExecute('location.reload()');
end;

procedure TFRMCONSULTA.BTNVISUALIZARPAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  IWSCont.FDConsultaProcedimento.Open();
  IWSCont.FDConsultaProcedimento.Locate('idConsulta', txtid.Text, []);
  idC := StrToInt(txtid.Text);
  buscarProcedByConsulta;

  WebApplication.CallBackResponse.AddJavaScriptToExecute
    ('$(''#AddProcediementos'').modal(''show'');');
end;

procedure TFRMCONSULTA.buscarNome;
begin
  IWSCont.FDConsultaTable.Active := false;
  IWSCont.FDConsultaTable.Active := true;
  IWSCont.FDConsultaTable.SQL.Clear;
  IWSCont.FDConsultaTable.SQL.Add
    ('select c.id, p.nome as paciente, u.nome as usuario,' +
    'c.idPaciente, c.idFuncionario, p.id as idP, u.id as idU, hora, minuto, ' +
    ' c.dataConsulta, c.presenca from Consulta c ' +
    ' INNER JOIN paciente as p on c.idPaciente = p.id' +
    ' INNER JOIN usuario as u on c.idFuncionario = u.id' +
    ' where p.nome LIKE :nome order by paciente asc');
  IWSCont.FDConsultaTable.ParamByName('nome').Value := TXTBUSCAR.Text + '%';
  IWSCont.FDConsultaTable.Open();
  IWSCont.FDConsultaTable.First;
end;

procedure TFRMCONSULTA.buscarTudo;
begin
  IWSCont.FDConsultaTable.Active := false;
  IWSCont.FDConsultaTable.Active := true;
  IWSCont.FDConsultaTable.SQL.Clear;
  IWSCont.FDConsultaTable.SQL.Add
    ('select c.id, p.nome as paciente, u.nome as usuario,' +
    'c.idPaciente, c.idFuncionario, p.id as idP, u.id as idU, hora, minuto, ' +
    ' c.dataConsulta, c.presenca from Consulta c ' +
    ' INNER JOIN paciente as p on c.idPaciente = p.id' +
    ' INNER JOIN usuario as u on c.idFuncionario = u.id' +
    ' order by paciente asc');
  IWSCont.FDConsultaTable.Open();
  IWSCont.FDConsultaTable.First;
end;

procedure TFRMCONSULTA.buscarProcedByConsulta;
var
  SQL: String;
begin
  SQL := 'select * from ConsultaProcedimento cp' +
    ' inner join Consulta c on c.Id=cp.idConsulta' +
    ' inner join Procedimento p on p.Id=cp.idProcedimento' +
    ' where cp.idConsulta = :idCon order by Descricao asc';

  IWSCont.FDConsultaProcedimento.Active := false;
  IWSCont.FDConsultaProcedimento.Active := true;
  IWSCont.FDConsultaProcedimento.SQL.Clear;
  IWSCont.FDConsultaProcedimento.SQL.Add(SQL);
  IWSCont.FDConsultaProcedimento.ParamByName('idCon').Value := idC;

  IWSCont.FDConsultaProcedimento.Open();
  IWSCont.FDConsultaProcedimento.First;
end;

procedure TFRMCONSULTA.buscarTudoProced;
var
  SQL: String;
begin
  SQL := 'select * from ConsultaProcedimento cp' +
    ' inner join Consulta c on c.Id=cp.idConsulta' +
    ' inner join Procedimento p on p.Id=cp.idProcedimento' +
    ' order by Descricao asc';

  IWSCont.FDConsultaProcedimento.Active := false;
  IWSCont.FDConsultaProcedimento.Active := true;
  IWSCont.FDConsultaProcedimento.SQL.Clear;
  IWSCont.FDConsultaProcedimento.SQL.Add(SQL);

  IWSCont.FDConsultaProcedimento.Open();
  IWSCont.FDConsultaProcedimento.First;
end;

procedure TFRMCONSULTA.carregarCombobox;
begin

  IWSCont.FDPaciente.Close;
  IWSCont.FDPaciente.Active := true;
  IWSCont.FDPaciente.SQL.Clear;
  IWSCont.FDPaciente.SQL.Add('select * from Paciente');
  IWSCont.FDPaciente.Open;
  while not IWSCont.FDPaciente.Eof do
  begin
    CBPACIENTE.Items.AddObject(IWSCont.FDPaciente.FieldByName('nome').AsString,
      TObject(IWSCont.FDPaciente.FieldByName('id').AsInteger));

    IWSCont.FDPaciente.Next;
  end;
  CBPACIENTE.ItemIndex := 0;

  IWSCont.QryUsuario.Close;
  IWSCont.QryUsuario.Active := true;
  IWSCont.QryUsuario.SQL.Clear;
  IWSCont.QryUsuario.SQL.Add('select * from usuario');
  IWSCont.QryUsuario.Open;
  while not IWSCont.QryUsuario.Eof do
  begin
    CBFUNCIONARIO.Items.AddObject(IWSCont.QryUsuario.FieldByName('nome')
      .AsString, TObject(IWSCont.QryUsuario.FieldByName('id').AsInteger));

    IWSCont.QryUsuario.Next;
  end;
  CBFUNCIONARIO.ItemIndex := 0;
end;

procedure TFRMCONSULTA.carregarComboboxProced;
begin
  CBPROCEDIMENTO.Items.Clear;
  IWSCont.FDProcedimento.Close;
  IWSCont.FDProcedimento.Active := true;

  while not IWSCont.FDProcedimento.Eof do
  begin
    CBPROCEDIMENTO.Items.AddObject(IWSCont.FDProcedimento.FieldByName
      ('descricao').AsString, TObject(IWSCont.FDProcedimento.FieldByName('id')
      .AsInteger));

    IWSCont.FDProcedimento.Next;
  end;
  CBPROCEDIMENTO.ItemIndex := 0;
end;

procedure TFRMCONSULTA.BTNCANCELARPRODCON2Click(Sender: TObject);
begin
  WebApplication.CallBackResponse.AddJavaScriptToExecute
    ('$(''#AddProcediementos2'').modal(''hide'');');
end;

procedure TFRMCONSULTA.IWTemplateProcessorHTML1UnknownTag(const AName: string;
  var VValue: string);
begin
  VValue := '';
  if AName = 'gridDepartamento' then
  begin

    buscarNome;

    while not IWSCont.FDConsultaTable.Eof do
    begin
      VValue := VValue +

        '<tr><td>' + IWSCont.FDConsultaTable.FieldByName('id').AsString +
        '</td>' + sLineBreak + '<td>' + IWSCont.FDConsultaTable.FieldByName
        ('paciente').AsString + '</td>' + sLineBreak + '<td>' +
        IWSCont.FDConsultaTable.FieldByName('usuario').AsString + '</td>' +
        sLineBreak + '<td>' + IWSCont.FDConsultaTable.FieldByName('dataConsulta')
        .AsString + '</td>' + sLineBreak + '<td>' +
        (IWSCont.FDConsultaTable.FieldByName('hora').AsString + ':' +
        IWSCont.FDConsultaTable.FieldByName('minuto').AsString)

        + '</td>' + sLineBreak +

        '<td>' + '<button type="button" title="Editar Consulta" class="fa fa-pencil-square-o btn btn-info" onclick="return pegarPosicao('
        + IWSCont.FDConsultaTable.FieldByName('id').AsString +
        ', ''alterar'')"></button>' + '<td>' +
        '<button type="button" title="Excluir Consulta" class="fa fa-times btn btn-danger" onclick="return pegarPosicao('
        + IWSCont.FDConsultaTable.FieldByName('id').AsString +
        ', ''excluir'')"></button>' +

        '<td>' + '<button title="Adicionar Procedimento" type="button" class="fa fa-plus btn btn-success mr-2" onclick="return pegarPosicao('
        + IWSCont.FDConsultaTable.FieldByName('id').AsString +
        ', ''add'')"></button>';

      // '<td>' + '<button title="Visualizar Procedimento" type="button" class="fa fa-eye btn btn-success mr-2" onclick="return pegarPosicao('
      // + IWSCont.FDConsultaTable.FieldByName('id').AsString +
      // ', ''view'')"></button>';
      IWSCont.FDConsultaTable.Next;
    end;
  end;

  if AName = 'gridProcedimentosCon' then
  begin
    VValue := '';
    total := 0;
    // buscarProcedByConsulta;
    while not IWSCont.FDConsultaProcedimento.Eof do
    begin
      VValue := VValue +

        '<tr><td>' + IWSCont.FDConsultaProcedimento.FieldByName('Descricao')
        .AsString + '</td>' + sLineBreak + '<td>' +
        IWSCont.FDConsultaProcedimento.FieldByName('quantidade').AsString +
        '</td>' + sLineBreak + '<td>' + IWSCont.FDConsultaProcedimento.
        FieldByName('preco').AsString + '</td>'

        + '</td>' + sLineBreak +

        '<td>' + '<button type="button" class="btn btn-danger" onclick="return pegarPosicao2('
        + IWSCont.FDConsultaProcedimento.FieldByName('id').AsString +
        ', ''remove'')">Excluir</button>' + '</td>' + sLineBreak + '</tr>';

      total := total + (IWSCont.FDConsultaProcedimento.FieldByName('quantidade')
        .AsInteger * IWSCont.FDConsultaProcedimento.FieldByName
        ('preco').AsFloat);
      IWSCont.FDConsultaProcedimento.Next;
    end;
  end;
end;

procedure TFRMCONSULTA.limparCampos;
begin
  TXTHORA.Text := '';
  TXTMINUTO.Text := '';
  TXTDATACONSULTA.Text := '';
  CBPACIENTE.ItemIndex := 0;
  CBFUNCIONARIO.ItemIndex := 0;
end;

procedure TFRMCONSULTA.MENUClick(Sender: TObject);
begin
  TFRMMENU.Create(WebApplication).Show;
end;

procedure TFRMCONSULTA.TXTDATACONSULTAAsyncKeyPress(Sender: TObject;
  EventParams: TStringList);
begin
  TXTDATACONSULTA.Text := Mascara(TXTDATACONSULTA.Text, '99/99/9999');
end;

function TFRMCONSULTA.Mascara(edt: String; str: String): string;
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
