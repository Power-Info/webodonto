// =============================================================================
// CGM AUTOMAÇÃO - INTELIGÊNCIA EM SOFTWARE
// http://www.cgmautomacao.com.br
// =============================================================================

// =============================================================================
// Unit de constantes usadas nos artigos de IntraWeb em
// http://www.cgmautomacao.com.br
// Atualizada em 16/07/2012
//
// Desenvolvido por
// Alonso Jr - Desenvolvedor Delphi/Intraweb
// =============================================================================

unit CONSTANTES_WEB;

interface
uses Messages, SysUtils, IWApplication;

  CONST
    {$IFNDEF ISAPI}
    //sJQUERY = '<script src="http://code.jquery.com/jquery-latest.js"></script>';
    sJQUERY = '<script src="../assets/files/scripts/jquery-1.4.4.js"></script>';
    sJFUNCTIONS = '<script src="../assets/files/scripts/jfunctions.js"></script>';
    sJMASK = '<script src="../assets/files/scripts/jquery_mask.js"></script>';
    sJMaskInputMoney = '<script src="../assets/files/scripts/jquery.maskMoney.js"></script>';
    {$ENDIF}

    {$IFDEF ISAPI}
    //PARA ISAPI, O CAMINHO DEVE USAR WebApplication.AppURLBase
    sJQUERY = '<script src="' + WebApplication.AppURLBase + '../assets/files/scripts/jquery-1.4.4.js"></script>';
    sJFUNCTIONS = '<script src="' + WebApplication.AppURLBase + '../assets/files/scripts/jfunctions.js"></script>';
    sJMASK = '<script src="' + WebApplication.AppURLBase + '../assets/files/scripts/jquery_mask.js"></script>';
    sJMaskInputMoney = '<script src="' + WebApplication.AppURLBase + '../assets/files/scripts/jquery.maskMoney.js"></script>';
    {$ENDIF}

implementation

end.

