// =============================================================================
// CGM AUTOMAÇÃO - INTELIGÊNCIA EM SOFTWARE
// http://www.cgmautomacao.com.br
// =============================================================================

// =============================================================================
// Unit de Funções de JavaScript usadas nos artigos de IntraWeb em
// http://www.cgmautomacao.com.br
// Atualizada em 13/04/2011
//
// Desenvolvido por
// Alonso Jr - Desenvolvedor Delphi/Intraweb
// =============================================================================

unit MaskUtil;

interface

uses
    Classes, SysUtils, IWControl, IWAppForm, IWApplication, IWTypes,
    IWHTMLControls, CONSTANTES_WEB;

type
    //CRIE NOVAS MÁSCARAS, CONFORME NECESSIDADE
    TMascara = (maskDATA, maskHORA, maskCNPJ, maskCPF);

    procedure InsereJavaScript(Script: string; aIWForm: TIWAppForm);
    procedure InsereJavaScriptExterno(Arquivo: string; aIWForm: TIWAppForm);

    function JavaScriptTAG(Script: string): string;
    function jQuerySelect(Components: array of TIWCustomControl): string;

    function jQueryMask(Components: array of TIWCustomControl;
      Mascara: TMascara): string; overload;
    function jQueryMask(Components: array of TIWCustomControl;
      Mascara: string; DefinicaoMascara: string = ''): string; overload;

    function jQueryMaskMoney(Components: array of TIWCustomControl;
      Simbolo: string = 'R$'; SeparadorDecimal: Char = ',';
      CasasDecimais: Integer = 2; SeparadorMilhar: Char = '.';
      PermitirZero: Boolean = True;
      PermitirNegativo: Boolean = False;
      ExibirSimbolo: Boolean = True;
      PermanecerSimbolo: Boolean = False;
      ZeroComoPadrao: Boolean = False): string;

implementation

uses IWBaseForm;

procedure InsereJavaScript(Script: string; aIWForm: TIWAppForm);
begin
  aIWForm.ExtraHeader.Add(Script);
end;

procedure InsereJavaScriptExterno(Arquivo: string; aIWForm: TIWAppForm);
begin
  aIWForm.ExtraHeader.Add(
    '<script src='+ QuotedStr(Arquivo) + ' type="text/javascript"></script>');
end;

function JavaScriptTAG(Script: string): string;
begin
  Result :=
    '<script type="text/javascript">' + sLineBreak +
    '   ' + Script + sLineBreak +
    '</script>'
end;

function jQuerySelect(Components: array of TIWCustomControl): string;
var
  i: Integer;
  sel: string;
  comp: string;
begin
  sel := '$("';
  for i := Low(Components) to High(Components) do
  begin
    comp := '#'+UpperCase(Components[i].Name);
    sel := sel + comp;
    if i < High(Components) then
      sel := sel + ',';
  end;
  sel := sel + '")';
  Result := sel;
end;

function jQueryMask(Components: array of TIWCustomControl;
  Mascara: TMascara): string;

  function RetornaDefinicaoMascara: string;
  begin
    //VOCÊ PODE CRIAR NOVAS DEFINIÇÕES DE MÁSCARAS
    //DEFININDO QUAIS VALORES PODEM SER
    //ONDE ["SIMBOLO"]="[VALOR DE ENTRADA PERMITIDO]"
    case Mascara of
      maskDATA:
          Result := '$.mask.definitions["#"]="[0-3]";'+
                    '$.mask.definitions["!"]="[0-1]";'+
                    '$.mask.definitions["@"]="[0-2]";';
      maskHORA:
          Result := '$.mask.definitions["@"]="[0-2]";'+
                    '$.mask.definitions["#"]="[0-3]";'+
                    '$.mask.definitions["%"]="[0-5]";';

      else Result := '';
    end;
  end;

  function RetornaMascara: string;
  begin
    //VOCÊ PODE CRIAR NOVAS MÁSCARAS,
    //USANDO NOVAS DEFINIÇÕES OU AS PADRÃO:
    //a - carácter alfa (A-Z,a-z)
    //9 - carácter numérico (0-9)
    //* - carácter alfanumérico (A-Z,a-z,0-9)
    case Mascara of
      maskDATA: Result := '#9/!9/@999';
      maskHORA: Result := '@#:%9';
      maskCNPJ: Result := '99.999.999/9999-99';
      maskCPF:  Result := '999.999.999-99';
    end;
  end;

begin
  Result := jQueryMask(Components, RetornaMascara, RetornaDefinicaoMascara);
end;

function jQueryMask(Components: array of TIWCustomControl; Mascara: string;
  DefinicaoMascara: string): string;
begin
  Result := JavaScriptTAG(
    'jQuery(function(){'
     + DefinicaoMascara
     + jQuerySelect(Components) + '.mask("' + Mascara + '");})');
end;

function jQueryMaskMoney(Components: array of TIWCustomControl;
  Simbolo: string; SeparadorDecimal: Char;
  CasasDecimais: Integer; SeparadorMilhar: Char;
  PermitirZero, PermitirNegativo, ExibirSimbolo, PermanecerSimbolo,
  ZeroComoPadrao: Boolean): string;
const
  definicoes = 'symbol:"%s", decimal:"%s", thousands:"%s", precision:%d, ' + sLineBreak +
    'allowZero:%s, allowNegative:%s, showSymbol:%s, symbolStay:%s, defaultZero:%s';
begin
  Result := JavaScriptTAG(
    'jQuery(function(){' + sLineBreak +
      jQuerySelect(Components) + '.maskMoney({' + sLineBreak +
        Format(definicoes,
          [Simbolo, SeparadorDecimal, SeparadorMilhar, CasasDecimais,
          LowerCase(BoolToStr(PermitirZero, True)),
          LowerCase(BoolToStr(PermitirNegativo, True)),
          LowerCase(BoolToStr(ExibirSimbolo, True)),
          LowerCase(BoolToStr(PermanecerSimbolo, True)),
          LowerCase(BoolToStr(ZeroComoPadrao, True))]) + sLineBreak +
      '});' + sLineBreak +
    '})');
end;

end.

