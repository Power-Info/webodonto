unit Apresentacao;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, Vcl.Controls,
  IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl, IWCompExtCtrls,
  IWHTMLControls, System.ImageList, Vcl.ImgList, IWImageList,
  IWBS4CustomControl, IWBS4Image, Vcl.Forms, IWVCLBaseContainer, IWContainer,
  IWHTMLContainer, IWHTML40Container, IWRegion, IWBS4Carousel, IWLayoutMgrHTML;

type
  TAPRESENTACAOSIC = class(TIWAppForm)
    LODONTO: TIWLink;
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    procedure LBLOGINAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure LODONTOAsyncClick(Sender: TObject; EventParams: TStringList);
  public
  end;

implementation

{$R *.dfm}

uses Login;

procedure TAPRESENTACAOSIC.LBLOGINAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
    TFRMLOGIN.Create(WebApplication).Show;
end;

procedure TAPRESENTACAOSIC.LODONTOAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
TFRMLOGIN.Create(WebApplication).Show;
end;

initialization

TAPRESENTACAOSIC.SetAsMainForm;
end.
