unit uListBox;

interface

uses FMX.Layouts, FMX.Objects, FMX.Types, FMX.Graphics, System.UITypes,
  System.Classes, System.Types, System.SysUtils, FMX.Forms, FMX.StdCtrls,
  FMX.Ani, System.Actions, FMX.ActnList, System.JSON, System.Net.HttpClient,
  FMX.Dialogs, IdHTTP, FMX.ListBox,
  IWColor, IWTypes, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, IWCompListbox, IWCompButton, IWCompEdit,
  Vcl.Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWHTMLControls, IWCompLabel;

type
  TCustomListBox = class
  private
    FColumns: integer;
    FHeight: integer;

    img: TImage;
    lbl: TIWLabel;
    painel: TRectangle;
    ContDownload: integer;
  protected

  public
    FListBox: TIWListbox;
    Item: TListBoxItem;
    constructor Create(Owner: TComponent);
    procedure Setup();
    procedure Limpa();

    procedure AddItem(porc: string = ''; qtd: string = ''; valor: string = '';
      col: integer = 0);

    procedure DeleteAll();
    procedure DeleteItem(index: integer);
  published
    property QtdColumns: integer read FColumns write FColumns;
    property ItemHeight: integer read FHeight write FHeight;
  end;

implementation

function LoadStreamFromURL(url: string): TMemoryStream;
var
  http: THTTPClient;
begin

  Result := TMemoryStream.Create;
  http := THTTPClient.Create;

  try

    try
      // Evitar cache...
      url := url + '?id=' + floattostr(Random);

      http.Get(url, Result);

    except
    end;

    Result.Position := 0;
  finally
    http.DisposeOf;
  end;
end;

constructor TCustomListBox.Create(Owner: TComponent);
begin
  FListBox := Owner as TIWListbox;
end;

procedure TCustomListBox.Setup();
begin
  // FListBox.Columns := FColumns;
  // FListBox.ShowScrollBars := false;
end;

procedure TCustomListBox.Limpa();
begin
  FListBox.Clear;
end;

procedure TCustomListBox.AddItem(porc: string = ''; qtd: string = '';
  valor: string = ''; col: integer = 0);
var
  stream: TMemoryStream;
  bmp: TBitmap;
  spQ: String;
  spQtd: String;
  I: integer;
  tam: Integer;
begin
  spQ := '';
  spQtd := '';

  // for I := 0 to col do
  // spQ := spQ + ' ';
  tam := porc.Length;
  for I := 0 to (col - tam) do
  begin
     spQ := spQ + '-';
  end;


  FListBox.Items.Add(porc + spQ + ' QTD: ' + qtd + '        R$: ' + valor);

end;

procedure TCustomListBox.DeleteAll();
begin
  try
    FListBox.Items.Clear;
  finally
  end;
end;

procedure TCustomListBox.DeleteItem(index: integer);
var
  I: integer;
  layout: TLayout;
begin
  try
    FListBox.Items.Delete(index);
  finally
  end;
end;

end.
