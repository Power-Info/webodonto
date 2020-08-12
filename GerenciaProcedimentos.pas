unit GerenciaProcedimentos;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, IWCompListbox, IWCompButton, IWCompEdit,
  Vcl.Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWHTMLControls, Consulta, IWCompLabel, IWCompExtCtrls, Vcl.Imaging.pngimage,
  System.Generics.Collections;

type
  TFRMGERENCIAP = class(TIWAppForm)
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    VOLTAR: TIWButton;
    CBPROCEDIMENTO: TIWComboBox;
    TXTQTD: TIWEdit;
    BTNADDPROCED: TIWButton;
    BTNREMOVPROCED: TIWButton;
    LBTOTAL: TIWLabel;
    txtid: TIWEdit;
    LBPACIENTE: TIWLabel;
    LBMEDICO: TIWLabel;
    BT1: TIWImage;
    BT2: TIWImage;
    BT3: TIWImage;
    BT5: TIWImage;
    BT4: TIWImage;
    BT6: TIWImage;
    BT7: TIWImage;
    BT8: TIWImage;
    BT9: TIWImage;
    BTVER: TIWButton;
    IDP: TIWEdit;

    procedure IWTemplateProcessorHTML1UnknownTag(const AName: string;
      var VValue: string);
    procedure buscarProcedByConsulta();
    procedure buscarDentes();
    procedure carregarComboboxProced();
    procedure associarCamposConProced();
    procedure VOLTARClick(Sender: TObject);
    procedure BTNADDPROCEDClick(Sender: TObject);
    procedure BTNREMOVPROCEDClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure BT6Click(Sender: TObject);
    procedure BT1Click(Sender: TObject);
    procedure BT2Click(Sender: TObject);
    procedure BT3Click(Sender: TObject);
    procedure BT4Click(Sender: TObject);
    procedure BT5Click(Sender: TObject);
    procedure BT7Click(Sender: TObject);
    procedure BT8Click(Sender: TObject);
    procedure BT9Click(Sender: TObject);
    procedure BTVERClick(Sender: TObject);
    procedure CBPROCEDIMENTOChange(Sender: TObject);
  public
  var
    total: Float32;
    click1, click2, click3, click4, click5, click6, click7, click8, click9,
      click10, click11, click12, click13, click14, click15, click16, click17,
      click18, click19, click20, click21, click22, click23: Integer;
    listaDentes: TList<Integer>;
  end;

implementation

{$R *.dfm}

uses ServerController, MENU;

procedure TFRMGERENCIAP.associarCamposConProced;
begin
  IWSCont.FDConsultaProcedimento.FieldByName('quantidade').Value := TXTQTD.Text;
  IWSCont.FDConsultaProcedimento.FieldByName('idProcedimento').Value :=
    Integer(CBPROCEDIMENTO.Items.Objects[CBPROCEDIMENTO.ItemIndex]);
  IWSCont.FDConsultaProcedimento.FieldByName('idConsulta').Value := idCon;
  // IWSCont.FDConsultaTable.FieldByName('id').AsInteger;
end;

procedure TFRMGERENCIAP.IWAppFormCreate(Sender: TObject);
var
  I: Integer;
begin
  listaDentes := TList<Integer>.Create();
  for I := 1 to 25 do
    listaDentes.Add(0);

  click1 := 0;
  carregarComboboxProced;
  buscarProcedByConsulta;
  while not IWSCont.FDConsultaProcedimento.Eof do
  begin
    total := total + (IWSCont.FDConsultaProcedimento.FieldByName('quantidade')
      .AsInteger * IWSCont.FDConsultaProcedimento.FieldByName('preco').AsFloat);
    IWSCont.FDConsultaProcedimento.Next;
  end;
  LBTOTAL.Text := FloatToStr(total);
  buscarProcedByConsulta;

  IWSCont.FDGeral.Active := false;
  IWSCont.FDGeral.Active := true;
  IWSCont.FDGeral.SQL.Clear;
  IWSCont.FDGeral.SQL.Add('select c.id, p.nome as paciente, u.nome as usuario,'
    + ' c.dataConsulta as data, c.idPaciente, c.idFuncionario,' +
    ' p.id as idP, u.id as idU, hora, minuto, c.presenca ' + ' from Consulta c'
    + ' inner join Paciente p on p.id=c.idPaciente' +
    ' inner join Usuario u on u.id=c.idFuncionario' + ' where c.id=' + idCon +
    ' order by paciente asc');
  IWSCont.FDGeral.Open();

  pacienteNome := IWSCont.FDGeral.FieldByName('paciente').AsString;
  drNome := IWSCont.FDGeral.FieldByName('usuario').AsString;

  LBPACIENTE.Text := pacienteNome;
  LBMEDICO.Text := drNome;

  buscarDentes;
  while not IWSCont.FDDenteProced.Eof do
  begin
    if IWSCont.FDDenteProced.FieldByName('posicao').AsString = '1' then
    begin
      BT1.Css := 'wrap2';
      click1 := 1;
    end;
    if IWSCont.FDDenteProced.FieldByName('posicao').AsString = '2' then
    begin
      BT2.Css := 'wrap2';
      click2 := 1;
    end;
    if IWSCont.FDDenteProced.FieldByName('posicao').AsString = '3' then
    begin
      BT3.Css := 'wrap2';
      click3 := 3;
    end;
    if IWSCont.FDDenteProced.FieldByName('posicao').AsString = '4' then
    begin
      BT4.Css := 'wrap2';
      click4 := 1;
    end;
    if IWSCont.FDDenteProced.FieldByName('posicao').AsString = '5' then
    begin
      BT5.Css := 'wrap2';
      click5 := 1;
    end;
    if IWSCont.FDDenteProced.FieldByName('posicao').AsString = '6' then
    begin
      BT6.Css := 'wrap2';
      click6 := 1;
    end;
    if IWSCont.FDDenteProced.FieldByName('posicao').AsString = '7' then
    begin
      BT7.Css := 'wrap2';
      click7 := 1;
    end;
    if IWSCont.FDDenteProced.FieldByName('posicao').AsString = '8' then
    begin
      BT8.Css := 'wrap2';
      click8 := 1;
    end;
    if IWSCont.FDDenteProced.FieldByName('posicao').AsString = '9' then
    begin
      BT9.Css := 'wrap2';
      click9 := 1;
    end;

    IWSCont.FDDenteProced.Next;
  end;

end;

procedure TFRMGERENCIAP.BTVERClick(Sender: TObject);
var
  id: String;
begin
  IWSCont.FDdelete.close;
  IWSCont.FDdelete.SQL.Clear;
  id := IDP.Text;
  IWSCont.FDdelete.SQL.append
    ('select * from DenteConsulta where ProcedimentoId = ' + id +
    ' and ConsultaId = ' + idCon);
  IWSCont.FDdelete.Open;
  // IWSCont.FDdelete.First;

  click1 := 0;
  click2 := 0;
  click3 := 0;
  click4 := 0;
  click5 := 0;
  click6 := 0;
  click7 := 0;
  click8 := 0;
  click9 := 0;

  while not IWSCont.FDdelete.Eof do
  begin
    if IWSCont.FDdelete.FieldByName('posicao').AsString = '1' then
    begin
      BT1.Css := 'wrap2';
      click1 := 1;
    end
    else if click1 = 0 then
    begin
      BT1.Css := 'wrap';
      click1 := 0;
    end;
    if IWSCont.FDdelete.FieldByName('posicao').AsString = '2' then
    begin
      BT2.Css := 'wrap2';
      click2 := 1;
    end
    else if click2 = 0 then
    begin
      BT2.Css := 'wrap';
      click2 := 0;
    end;
    if IWSCont.FDdelete.FieldByName('posicao').AsString = '3' then
    begin
      BT3.Css := 'wrap2';
      click3 := 1;
    end
    else if click3 = 0 then
    begin
      BT3.Css := 'wrap';
      click3 := 0;
    end;
    if IWSCont.FDdelete.FieldByName('posicao').AsString = '4' then
    begin
      BT4.Css := 'wrap2';
      click4 := 1;
    end
    else if click4 = 0 then
    begin
      BT4.Css := 'wrap';
      click4 := 0;
    end;
    if IWSCont.FDdelete.FieldByName('posicao').AsString = '5' then
    begin
      BT5.Css := 'wrap2';
      click5 := 1;
    end
    else if click5 = 0 then
    begin
      BT5.Css := 'wrap';
      click5 := 0;
    end;
    if IWSCont.FDdelete.FieldByName('posicao').AsString = '6' then
    begin
      BT6.Css := 'wrap2';
      click6 := 1;
    end
    else if click6 = 0 then
    begin
      BT6.Css := 'wrap';
      click6 := 0;
    end;
    if IWSCont.FDdelete.FieldByName('posicao').AsString = '7' then
    begin
      BT7.Css := 'wrap2';
      click7 := 1;
    end
    else if click7 = 0 then
    begin
      BT7.Css := 'wrap';
      click7 := 0;
    end;
    if IWSCont.FDdelete.FieldByName('posicao').AsString = '8' then
    begin
      BT8.Css := 'wrap2';
      click8 := 1;
    end
    else if click8 = 0 then
    begin
      BT8.Css := 'wrap';
      click8 := 0;
    end;
    if IWSCont.FDdelete.FieldByName('posicao').AsString = '9' then
    begin
      BT9.Css := 'wrap2';
      click9 := 1;
    end
    else if click9 = 0 then
    begin
      BT9.Css := 'wrap';
      click9 := 0;
    end;

    IWSCont.FDdelete.Next;
  end;
  buscarDentes;
end;

procedure TFRMGERENCIAP.VOLTARClick(Sender: TObject);
begin
  TFRMCONSULTA.Create(WebApplication).Show;
end;

procedure TFRMGERENCIAP.BT1Click(Sender: TObject);
begin
  if click1 = 0 then
  begin
    BT1.Css := 'wrap2';
    click1 := 1;
    listaDentes[1] := 1;
    // IWSCont.FDDenteProced.Insert;
    // IWSCont.FDDenteProced.FieldByName('ConsultaId').Value := idCon;
    // IWSCont.FDDenteProced.FieldByName('posicao').Value := 1;
    // IWSCont.FDDenteProced.FieldByName('ProcedimentoId').Value :=
    // Integer(CBPROCEDIMENTO.Items.Objects[CBPROCEDIMENTO.ItemIndex]);
    // IWSCont.FDDenteProced.Post;
    // IWSCont.FDDenteProced.Insert;
    // buscarDentes;
  end
  else
  begin
    BT1.Css := 'wrap';
    click1 := 0;
    listaDentes[1] := 0;

    IWSCont.FDdelete.close;
    IWSCont.FDdelete.SQL.Clear;
    IWSCont.FDdelete.SQL.append('delete from DenteConsulta where Posicao = ' +
      '1' + ' and ConsultaId = ' + idCon);
    IWSCont.FDdelete.execsql;

    buscarDentes;
  end;
end;

procedure TFRMGERENCIAP.BT2Click(Sender: TObject);
begin
  if click2 = 0 then
  begin
    BT2.Css := 'wrap2';
    click2 := 1;
    listaDentes[2] := 2;
    // IWSCont.FDDenteProced.Insert;
    // IWSCont.FDDenteProced.FieldByName('ConsultaId').Value := idCon;
    // IWSCont.FDDenteProced.FieldByName('posicao').Value := 2;
    // IWSCont.FDDenteProced.FieldByName('ProcedimentoId').Value :=
    // Integer(CBPROCEDIMENTO.Items.Objects[CBPROCEDIMENTO.ItemIndex]);
    // IWSCont.FDDenteProced.Post;
    // IWSCont.FDDenteProced.Insert;
    // buscarDentes;
  end
  else
  begin
    BT2.Css := 'wrap';
    click2 := 0;
    listaDentes[2] := 0;

    IWSCont.FDdelete.close;
    IWSCont.FDdelete.SQL.Clear;
    IWSCont.FDdelete.SQL.append('delete from DenteConsulta where Posicao = ' +
      '2' + ' and ConsultaId = ' + idCon);
    IWSCont.FDdelete.execsql;

    buscarDentes;
  end;
end;

procedure TFRMGERENCIAP.BT3Click(Sender: TObject);
begin
  if click3 = 0 then
  begin
    BT3.Css := 'wrap2';
    click3 := 1;
    listaDentes[3] := 3;
    // IWSCont.FDDenteProced.Insert;
    // IWSCont.FDDenteProced.FieldByName('ConsultaId').Value := idCon;
    // IWSCont.FDDenteProced.FieldByName('posicao').Value := 3;
    // IWSCont.FDDenteProced.FieldByName('ProcedimentoId').Value :=
    // Integer(CBPROCEDIMENTO.Items.Objects[CBPROCEDIMENTO.ItemIndex]);
    // IWSCont.FDDenteProced.Post;
    // IWSCont.FDDenteProced.Insert;
    // buscarDentes;
  end
  else
  begin
    BT3.Css := 'wrap';
    click3 := 0;
    listaDentes[3] := 0;

    IWSCont.FDdelete.close;
    IWSCont.FDdelete.SQL.Clear;
    IWSCont.FDdelete.SQL.append('delete from DenteConsulta where Posicao = ' +
      '3' + ' and ConsultaId = ' + idCon);
    IWSCont.FDdelete.execsql;

    buscarDentes;
  end;
end;

procedure TFRMGERENCIAP.BT4Click(Sender: TObject);
begin
  if click4 = 0 then
  begin
    BT4.Css := 'wrap2';
    click4 := 1;
    listaDentes[4] := 4;
    // IWSCont.FDDenteProced.Insert;
    // IWSCont.FDDenteProced.FieldByName('ConsultaId').Value := idCon;
    // IWSCont.FDDenteProced.FieldByName('posicao').Value := 4;
    // IWSCont.FDDenteProced.FieldByName('ProcedimentoId').Value :=
    // Integer(CBPROCEDIMENTO.Items.Objects[CBPROCEDIMENTO.ItemIndex]);
    // IWSCont.FDDenteProced.Post;
    // IWSCont.FDDenteProced.Insert;
    // buscarDentes;
  end
  else
  begin
    BT4.Css := 'wrap';
    click4 := 0;
    listaDentes[4] := 0;

    IWSCont.FDdelete.close;
    IWSCont.FDdelete.SQL.Clear;
    IWSCont.FDdelete.SQL.append('delete from DenteConsulta where Posicao = ' +
      '4' + ' and ConsultaId = ' + idCon);
    IWSCont.FDdelete.execsql;

    buscarDentes;
  end;
end;

procedure TFRMGERENCIAP.BT5Click(Sender: TObject);
begin
  if click5 = 0 then
  begin
    BT5.Css := 'wrap2';
    click5 := 1;
    listaDentes[5] := 5;

    // IWSCont.FDDenteProced.Insert;
    // IWSCont.FDDenteProced.FieldByName('ConsultaId').Value := idCon;
    // IWSCont.FDDenteProced.FieldByName('posicao').Value := 5;
    // IWSCont.FDDenteProced.FieldByName('ProcedimentoId').Value :=
    // Integer(CBPROCEDIMENTO.Items.Objects[CBPROCEDIMENTO.ItemIndex]);
    // IWSCont.FDDenteProced.Post;
    // IWSCont.FDDenteProced.Insert;
    // buscarDentes;
  end
  else
  begin
    BT5.Css := 'wrap';
    click5 := 0;
    listaDentes[5] := 0;

    IWSCont.FDdelete.close;
    IWSCont.FDdelete.SQL.Clear;
    IWSCont.FDdelete.SQL.append('delete from DenteConsulta where Posicao = ' +
      '5' + ' and ConsultaId = ' + idCon);
    IWSCont.FDdelete.execsql;

    buscarDentes;
  end;
end;

procedure TFRMGERENCIAP.BT6Click(Sender: TObject);
begin
  if click6 = 0 then
  begin
    BT6.Css := 'wrap2';
    click6 := 1;
    listaDentes[6] := 6;

//    IWSCont.FDDenteProced.Insert;
//    IWSCont.FDDenteProced.FieldByName('ConsultaId').Value := idCon;
//    IWSCont.FDDenteProced.FieldByName('posicao').Value := 6;
//    IWSCont.FDDenteProced.FieldByName('ProcedimentoId').Value :=
//      Integer(CBPROCEDIMENTO.Items.Objects[CBPROCEDIMENTO.ItemIndex]);
//    IWSCont.FDDenteProced.Post;
//    IWSCont.FDDenteProced.Insert;
//    buscarDentes;
  end
  else
  begin
    BT6.Css := 'wrap';
    click6 := 0;
    listaDentes[6] := 0;

    IWSCont.FDdelete.close;
    IWSCont.FDdelete.SQL.Clear;
    IWSCont.FDdelete.SQL.append('delete from DenteConsulta where Posicao = ' +
      '6' + ' and ConsultaId = ' + idCon);
    IWSCont.FDdelete.execsql;

    buscarDentes;
  end;
end;

procedure TFRMGERENCIAP.BT7Click(Sender: TObject);
begin
  if click7 = 0 then
  begin
    BT7.Css := 'wrap2';
    click7 := 1;
    listaDentes[7] := 7;

//    IWSCont.FDDenteProced.Insert;
//    IWSCont.FDDenteProced.FieldByName('ConsultaId').Value := idCon;
//    IWSCont.FDDenteProced.FieldByName('posicao').Value := 7;
//    IWSCont.FDDenteProced.FieldByName('ProcedimentoId').Value :=
//      Integer(CBPROCEDIMENTO.Items.Objects[CBPROCEDIMENTO.ItemIndex]);
//    IWSCont.FDDenteProced.Post;
//    IWSCont.FDDenteProced.Insert;
//    buscarDentes;
  end
  else
  begin
    BT7.Css := 'wrap';
    click7 := 0;
    listaDentes[7] := 0;

    IWSCont.FDdelete.close;
    IWSCont.FDdelete.SQL.Clear;
    IWSCont.FDdelete.SQL.append('delete from DenteConsulta where Posicao = ' +
      '7' + ' and ConsultaId = ' + idCon);
    IWSCont.FDdelete.execsql;

    buscarDentes;
  end;
end;

procedure TFRMGERENCIAP.BT8Click(Sender: TObject);
begin
  if click8 = 0 then
  begin
    BT8.Css := 'wrap2';
    click8 := 1;
    listaDentes[8] := 8;

//    IWSCont.FDDenteProced.Insert;
//    IWSCont.FDDenteProced.FieldByName('ConsultaId').Value := idCon;
//    IWSCont.FDDenteProced.FieldByName('posicao').Value := 8;
//    IWSCont.FDDenteProced.FieldByName('ProcedimentoId').Value :=
//      Integer(CBPROCEDIMENTO.Items.Objects[CBPROCEDIMENTO.ItemIndex]);
//    IWSCont.FDDenteProced.Post;
//    IWSCont.FDDenteProced.Insert;
//    buscarDentes;
  end
  else
  begin
    BT8.Css := 'wrap';
    click8 := 0;
    listaDentes[8] := 0;

    IWSCont.FDdelete.close;
    IWSCont.FDdelete.SQL.Clear;
    IWSCont.FDdelete.SQL.append('delete from DenteConsulta where Posicao = ' +
      '8' + ' and ConsultaId = ' + idCon);
    IWSCont.FDdelete.execsql;

    buscarDentes;
  end;
end;

procedure TFRMGERENCIAP.BT9Click(Sender: TObject);
begin
  if click9 = 0 then
  begin
    BT9.Css := 'wrap2';
    click9 := 1;
    listaDentes[9] := 9;

//    IWSCont.FDDenteProced.Insert;
//    IWSCont.FDDenteProced.FieldByName('ConsultaId').Value := idCon;
//    IWSCont.FDDenteProced.FieldByName('posicao').Value := 9;
//    IWSCont.FDDenteProced.FieldByName('ProcedimentoId').Value :=
//      Integer(CBPROCEDIMENTO.Items.Objects[CBPROCEDIMENTO.ItemIndex]);
//    IWSCont.FDDenteProced.Post;
//    IWSCont.FDDenteProced.Insert;
//    buscarDentes;
  end
  else
  begin
    BT9.Css := 'wrap';
    click9 := 0;
    listaDentes[9] := 0;

    IWSCont.FDdelete.close;
    IWSCont.FDdelete.SQL.Clear;
    IWSCont.FDdelete.SQL.append('delete from DenteConsulta where Posicao = ' +
      '9' + ' and ConsultaId = ' + idCon);
    IWSCont.FDdelete.execsql;

    buscarDentes;
  end;
end;

procedure TFRMGERENCIAP.BTNADDPROCEDClick(Sender: TObject);
var
  I: Integer;
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

  IWSCont.FDDenteProced.Insert;
  for I := 1 to 24 do
  begin

    if listaDentes[I] = I then
    begin
      IWSCont.FDDenteProced.FieldByName('ConsultaId').Value := idCon;
      IWSCont.FDDenteProced.FieldByName('posicao').Value := listaDentes[I];
      IWSCont.FDDenteProced.FieldByName('ProcedimentoId').Value :=
        Integer(CBPROCEDIMENTO.Items.Objects[CBPROCEDIMENTO.ItemIndex]);
      IWSCont.FDDenteProced.Post;
      IWSCont.FDDenteProced.Insert;
    end;
  end;
  buscarDentes;

  associarCamposConProced();
  IWSCont.FDConsultaProcedimento.Post;
  IWSCont.FDConsultaProcedimento.Insert;
  buscarProcedByConsulta;

  total := 0;
  while not IWSCont.FDConsultaProcedimento.Eof do
  begin
    total := total + (IWSCont.FDConsultaProcedimento.FieldByName('quantidade')
      .AsInteger * IWSCont.FDConsultaProcedimento.FieldByName('preco').AsFloat);
    IWSCont.FDConsultaProcedimento.Next;
  end;
  LBTOTAL.Text := FloatToStr(total);
  buscarProcedByConsulta;
end;

procedure TFRMGERENCIAP.BTNREMOVPROCEDClick(Sender: TObject);
var
  id: String;
begin
  id := txtid.Text;
  IWSCont.FDConsultaProcedimento.Locate('id', id, []);
  IWSCont.FDConsultaProcedimento.Delete;
  buscarProcedByConsulta;

  total := 0;
  while not IWSCont.FDConsultaProcedimento.Eof do
  begin
    total := total + (IWSCont.FDConsultaProcedimento.FieldByName('quantidade')
      .AsInteger * IWSCont.FDConsultaProcedimento.FieldByName('preco').AsFloat);
    IWSCont.FDConsultaProcedimento.Next;
  end;
  LBTOTAL.Text := FloatToStr(total);
  buscarProcedByConsulta;
  LBTOTAL.Text := FloatToStr(total);
end;

procedure TFRMGERENCIAP.buscarProcedByConsulta;
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
  IWSCont.FDConsultaProcedimento.ParamByName('idCon').Value := idCon;

  IWSCont.FDConsultaProcedimento.Open();
  IWSCont.FDConsultaProcedimento.First;
end;

procedure TFRMGERENCIAP.buscarDentes;
var
  SQL: String;
begin
  SQL := 'select * from DenteConsulta cp' + ' where cp.ConsultaId = :idCon' +
    ' and ProcedimentoId= ' +
    IntToStr(Integer(CBPROCEDIMENTO.Items.Objects[CBPROCEDIMENTO.ItemIndex]));

  IWSCont.FDDenteProced.Active := false;
  IWSCont.FDDenteProced.Active := true;
  IWSCont.FDDenteProced.SQL.Clear;
  IWSCont.FDDenteProced.SQL.Add(SQL);
  IWSCont.FDDenteProced.ParamByName('idCon').Value := idCon;

  IWSCont.FDDenteProced.Open();
  IWSCont.FDDenteProced.First;
end;

procedure TFRMGERENCIAP.carregarComboboxProced;
begin
  CBPROCEDIMENTO.Items.Clear;
  IWSCont.FDProcedimento.close;
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

procedure TFRMGERENCIAP.CBPROCEDIMENTOChange(Sender: TObject);
var
  I: Integer;
begin
  listaDentes := TList<Integer>.Create();
  listaDentes.Clear;
  for I := 1 to 25 do
    listaDentes.Add(0);

  BT1.Css := 'wrap';
  click1 := 0;
  BT2.Css := 'wrap';
  click2 := 0;
  BT3.Css := 'wrap';
  click3 := 0;
  BT4.Css := 'wrap';
  click4 := 0;
  BT5.Css := 'wrap';
  click5 := 0;
  BT6.Css := 'wrap';
  click6 := 0;
  BT7.Css := 'wrap';
  click7 := 0;
  BT8.Css := 'wrap';
  click8 := 0;
  BT9.Css := 'wrap';
  click9 := 0;
end;

procedure TFRMGERENCIAP.IWTemplateProcessorHTML1UnknownTag(const AName: string;
  var VValue: string);
begin

  if AName = 'gridGerenciaProcedimentosCon' then
  begin
    VValue := '';
    total := 0;
    buscarProcedByConsulta;
    while not IWSCont.FDConsultaProcedimento.Eof do
    begin
      VValue := VValue +

        '<tr><td>' + IWSCont.FDConsultaProcedimento.FieldByName('Descricao')
        .AsString + '</td>' + sLineBreak + '<td>' +
        IWSCont.FDConsultaProcedimento.FieldByName('quantidade').AsString +
        '</td>' + sLineBreak + '<td>' + IWSCont.FDConsultaProcedimento.
        FieldByName('preco').AsString + '</td>' + '</td>' + sLineBreak +

        '<td>' + '<button type="button" title="Excuir Procedimento da Consulta" class="btn btn-info" onclick="return pegarPosicao('
        + IWSCont.FDConsultaProcedimento.FieldByName('idProcedimento').AsString
        + ', ''ver'')">Visualizar Dentes</button>' + '</td>' + '<td>' +
        '<button type="button" title="Excuir Procedimento da Consulta" class="btn btn-danger" onclick="return pegarPosicao('
        + IWSCont.FDConsultaProcedimento.FieldByName('id').AsString +
        ', ''remove'')">Excluir</button>';

      total := total + (IWSCont.FDConsultaProcedimento.FieldByName('quantidade')
        .AsInteger * IWSCont.FDConsultaProcedimento.FieldByName
        ('preco').AsFloat);
      IWSCont.FDConsultaProcedimento.Next;
    end;
  end;

end;

end.
