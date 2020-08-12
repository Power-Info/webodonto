unit Menu;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, Vcl.Controls, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompLabel, IWDBStdCtrls, IWHTMLControls,
  IWCompButton, IWCompEdit, GerenciaProcedimentos;

type
  TFRMMENU = class(TIWAppForm)
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    USUARIOS: TIWLink;
    SAIR: TIWLink;
    USUARIOSMENU: TIWLink;
    EMPRESAMENU: TIWLink;
    PROCEDIMENTOSMENU: TIWLink;
    PACIENTEMENU: TIWLink;
    CONSULTASMENU: TIWLink;
    NPACIENTES: TIWLabel;
    NPROCEDIMENTOS: TIWLabel;
    NCONSULTAS: TIWLabel;
    TXTBUSCAR: TIWEdit;
    BTNBUSCAR: TIWButton;
    BTNATENDER: TIWButton;
    txtid: TIWEdit;
    BTNCANCELAR: TIWButton;
    MICONSULTA: TIWLink;
    MIPACIENTE: TIWLink;
    MIPROCEDIMENTO: TIWLink;
    procedure SAIRClick(Sender: TObject);
    procedure USUARIOSClick(Sender: TObject);
    procedure EMPRESAMENUClick(Sender: TObject);
    procedure PACIENTEMENUClick(Sender: TObject);
    procedure PROCEDIMENTOSMENUClick(Sender: TObject);
    procedure CONSULTASMENUClick(Sender: TObject);
    procedure associarCampos();
    procedure buscarNome();
    procedure buscarTudo();
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWTemplateProcessorHTML1UnknownTag(const AName: string;
      var VValue: string);
    procedure BTNBUSCARClick(Sender: TObject);
    procedure BTNATENDERClick(Sender: TObject);
    procedure BTNCANCELARClick(Sender: TObject);
    procedure MIPACIENTEClick(Sender: TObject);
    procedure MICONSULTAClick(Sender: TObject);
    procedure MIPROCEDIMENTOClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses Login, ServerController, USUARIOS, Empresa,
  Paciente, Procedimento, Consulta;

procedure TFRMMENU.associarCampos;
begin
  IWSCont.FDGeral.Active := false;
  IWSCont.FDGeral.Active := true;
  IWSCont.FDGeral.SQL.Clear;
  IWSCont.FDGeral.SQL.Add('select count(*) as total from paciente');
  IWSCont.FDGeral.Open();
  IWSCont.FDGeral.First;

  NPACIENTES.Text := IWSCont.FDGeral.FieldByName('total').AsString;

  IWSCont.FDGeral.Active := false;
  IWSCont.FDGeral.Active := true;
  IWSCont.FDGeral.SQL.Clear;
  IWSCont.FDGeral.SQL.Add('select count(*) as total from procedimento');
  IWSCont.FDGeral.Open();
  IWSCont.FDGeral.First;

  NPROCEDIMENTOS.Text := IWSCont.FDGeral.FieldByName('total').AsString;

  IWSCont.FDGeral.Active := false;
  IWSCont.FDGeral.Active := true;
  IWSCont.FDGeral.SQL.Clear;
  IWSCont.FDGeral.SQL.Add('select count(*) as total from consulta');
  IWSCont.FDGeral.Open();
  IWSCont.FDGeral.First;

  NCONSULTAS.Text := IWSCont.FDGeral.FieldByName('total').AsString;

end;

procedure TFRMMENU.PROCEDIMENTOSMENUClick(Sender: TObject);
begin
  TFRMPROCEDIMENTO.Create(WebApplication).Show;
end;

procedure TFRMMENU.CONSULTASMENUClick(Sender: TObject);
begin
  TFRMCONSULTA.Create(WebApplication).Show;
end;

procedure TFRMMENU.EMPRESAMENUClick(Sender: TObject);
begin
  TFRMEMPRESA.Create(WebApplication).Show;
end;

procedure TFRMMENU.IWAppFormCreate(Sender: TObject);
begin
  associarCampos;
end;

procedure TFRMMENU.BTNCANCELARClick(Sender: TObject);
begin
  IWSCont.FDConsultaTable.Locate('id', txtid.Text, []);
  IWSCont.FDConsultaTable.Edit;

  IWSCont.FDConsultaTable.FieldByName('presenca').Value := -1;
  IWSCont.FDConsultaTable.Post;

  buscarTudo;
end;

procedure TFRMMENU.IWTemplateProcessorHTML1UnknownTag(const AName: string;
  var VValue: string);
var
  tr: String;
  botao: String;
  botaoCancel: String;
begin
  // buscarTudo;
  VValue := '';
  if AName = 'gridAgendaDoDia' then
  begin
    botao := '<td>' +
      '<button type="button" class="btn btn-success mr-2" onclick="return pegarPosicao('
      + IWSCont.FDConsultaTable.FieldByName('id').AsString +
      ', ''confirmar'')">Confirmar</button>' + '</td>';
    botaoCancel := '<td>' +
      '<button type="button" class="fa fa-times btn btn-danger" onclick="return pegarPosicao('
      + IWSCont.FDConsultaTable.FieldByName('id').AsString +
      ', ''cancelar'')">Confirmar</button>' + '</td>';
    buscarNome;

    while not IWSCont.FDConsultaTable.Eof do
    begin
      if IWSCont.FDConsultaTable.FieldByName('presenca').AsString = '1' then
      begin
        tr := '<tr style="background-color:#a0ffa9">';
        botao := '<td>' +
          '<button disabled="disabled" type="button" class="btn btn-success mr-2" onclick="return pegarPosicao('
          + IWSCont.FDConsultaTable.FieldByName('id').AsString +
          ', ''confirmar'')">Confirmar</button>' + '</td>';

        botaoCancel := '<td>' +
          '<button type="button" disabled="disabled" class="btn btn-danger" onclick="return pegarPosicao('
          + IWSCont.FDConsultaTable.FieldByName('id').AsString +
          ', ''cancelar'')">Cancelar</button>' + '</td>';
      end;
      if IWSCont.FDConsultaTable.FieldByName('presenca').AsString = '-1' then
      begin
        tr := '<tr style="background-color:#ff2929">';
        botao := '<td>' +
          '<button disabled="disabled" type="button" class="btn btn-success mr-2" onclick="return pegarPosicao('
          + IWSCont.FDConsultaTable.FieldByName('id').AsString +
          ', ''confirmar'')">Confirmar</button>' + '</td>';

        botaoCancel := '<td>' +
          '<button type="button" disabled="disabled" class="btn btn-danger" onclick="return pegarPosicao('
          + IWSCont.FDConsultaTable.FieldByName('id').AsString +
          ', ''cancelar'')">Cancelar</button>' + '</td>';
      end;
      if IWSCont.FDConsultaTable.FieldByName('presenca').AsString = '0' then
      begin;
        tr := '<tr ">';
        botao := '<td>' +
          '<button type="button" class="btn btn-success mr-2" onclick="return pegarPosicao('
          + IWSCont.FDConsultaTable.FieldByName('id').AsString +
          ', ''confirmar'')">Confirmar</button>' + '</td>';

        botaoCancel := '<td>' +
          '<button type="button" class="btn btn-danger" onclick="return pegarPosicao('
          + IWSCont.FDConsultaTable.FieldByName('id').AsString +
          ', ''cancelar'')">Cancelar</button>' + '</td>';
      end;
      VValue := VValue +

        tr + '<td>' + IWSCont.FDConsultaTable.FieldByName('id').AsString +
        '</td>' + sLineBreak + '<td>' + IWSCont.FDConsultaTable.FieldByName
        ('paciente').AsString + '</td>' + sLineBreak + '<td>' +
        IWSCont.FDConsultaTable.FieldByName('usuario').AsString + '</td>' +
        sLineBreak + '<td>' + (IWSCont.FDConsultaTable.FieldByName('hora')
        .AsString + ':' + IWSCont.FDConsultaTable.FieldByName('minuto')
        .AsString) + '</td>' + sLineBreak +

        botao + botaoCancel + '</td>'+sLineBreak;
      IWSCont.FDConsultaTable.Next;
    end;
  end;
end;

procedure TFRMMENU.MICONSULTAClick(Sender: TObject);
begin
  TFRMCONSULTA.Create(WebApplication).Show;
end;

procedure TFRMMENU.MIPACIENTEClick(Sender: TObject);
begin
  TFRMPACIENTE.Create(WebApplication).Show;
end;

procedure TFRMMENU.MIPROCEDIMENTOClick(Sender: TObject);
begin
  TFRMPROCEDIMENTO.Create(WebApplication).Show;
end;

procedure TFRMMENU.BTNATENDERClick(Sender: TObject);
begin
  IWSCont.FDConsultaTable.Locate('id', txtid.Text, []);
  IWSCont.FDConsultaTable.Edit;

  IWSCont.FDConsultaTable.FieldByName('presenca').Value := 1;
  IWSCont.FDConsultaTable.Post;

  // WebApplication.CallBackResponse.AddJavaScriptToExecute('location.reload()');
  buscarTudo;
end;

procedure TFRMMENU.BTNBUSCARClick(Sender: TObject);
begin
  buscarNome;
end;

procedure TFRMMENU.buscarTudo;
var
  today: TDateTime;
  dt: String;
  SQL: String;
begin
  today := Now;
  dt := DateToStr(today);

  SQL := 'select c.id, p.nome as paciente, u.nome as usuario,' +
    'c.idPaciente, c.idFuncionario, p.id as idP, u.id as idU, hora, minuto, ' +
    ' c.dataConsulta, c.presenca from Consulta c ' +
    ' INNER JOIN paciente as p on c.idPaciente = p.id' +
    ' INNER JOIN usuario as u on c.idFuncionario = u.id' +
    ' where c.dataConsulta = ' + dt + ' order by hora, minuto asc';

  IWSCont.FDConsultaTable.Active := false;
  IWSCont.FDConsultaTable.Active := true;
  IWSCont.FDConsultaTable.SQL.Clear;
  IWSCont.FDConsultaTable.SQL.Add(SQL);

  IWSCont.FDConsultaTable.Open();
  IWSCont.FDConsultaTable.First;
end;

procedure TFRMMENU.buscarNome;
var
  today: TDateTime;
  dt: String;
  SQL: String;
begin
  today := Now;
  dt := DateToStr(today);

  if Trim(TXTBUSCAR.Text) = '' then
  begin
    SQL := 'select c.id, p.nome as paciente, u.nome as usuario,' +
      'c.idPaciente, c.idFuncionario, p.id as idP, u.id as idU, hora, minuto, '
      + ' c.dataConsulta, c.presenca from Consulta c ' +
      ' INNER JOIN paciente as p on c.idPaciente = p.id' +
      ' INNER JOIN usuario as u on c.idFuncionario = u.id' +
      ' where c.dataConsulta = ''' + dt + ''' order by hora, minuto asc';

    IWSCont.FDConsultaTable.Active := false;
    IWSCont.FDConsultaTable.Active := true;
    IWSCont.FDConsultaTable.SQL.Clear;
    IWSCont.FDConsultaTable.SQL.Add(SQL);

    IWSCont.FDConsultaTable.Open();
    IWSCont.FDConsultaTable.First;
  end
  else
  begin
    SQL := 'select c.id, p.nome as paciente, u.nome as usuario,' +
      'c.idPaciente, c.idFuncionario, p.id as idP, u.id as idU, hora, minuto, '
      + ' c.dataConsulta, c.presenca from Consulta c ' +
      ' INNER JOIN paciente as p on c.idPaciente = p.id' +
      ' INNER JOIN usuario as u on c.idFuncionario = u.id' +
      ' where p.nome LIKE :nome and c.dataConsulta = ''' + dt +
      ''' order by hora, minuto asc';

    IWSCont.FDConsultaTable.Active := false;
    IWSCont.FDConsultaTable.Active := true;
    IWSCont.FDConsultaTable.SQL.Clear;
    IWSCont.FDConsultaTable.SQL.Add(SQL);
    IWSCont.FDConsultaTable.ParamByName('nome').Value := TXTBUSCAR.Text + '%';
    IWSCont.FDConsultaTable.Open();
    IWSCont.FDConsultaTable.First;
  end;

end;

procedure TFRMMENU.PACIENTEMENUClick(Sender: TObject);
begin
  TFRMPACIENTE.Create(WebApplication).Show;
end;

procedure TFRMMENU.SAIRClick(Sender: TObject);
begin
  TFRMLOGIN.Create(WebApplication).Show;
end;

procedure TFRMMENU.USUARIOSClick(Sender: TObject);
begin
  TFRMUSUARIOS.Create(WebApplication).Show;
end;

end.
