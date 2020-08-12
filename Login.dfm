object FRMLOGIN: TFRMLOGIN
  Left = 0
  Top = 0
  Width = 694
  Height = 491
  RenderInvisibleControls = True
  AllowPageAccess = True
  ConnectionMode = cmAny
  Background.Fixed = False
  LayoutMgr = IWTemplateProcessorHTML1
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = True
  LockOnSubmit = True
  ShowHint = True
  XPTheme = True
  DesignLeft = 2
  DesignTop = 2
  object BTNLOGIN: TIWButton
    Left = 560
    Top = 56
    Width = 75
    Height = 25
    Css = 'btn btn-lg btn-primary btn-block btn-signin'
    Caption = 'ENTRAR'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'BTNLOGIN'
    TabOrder = 0
    OnAsyncClick = BTNLOGINAsyncClick
  end
  object TXTUSUARIO: TIWEdit
    Left = 408
    Top = 60
    Width = 121
    Height = 21
    Hint = 'Digite o Usu'#225'rio'
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTUSUARIO'
    SubmitOnAsyncEvent = True
    TabOrder = 1
  end
  object TXTSENHA: TIWEdit
    Left = 408
    Top = 100
    Width = 121
    Height = 21
    Hint = 'Digite sua Senha'
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTUSUARIO'
    SubmitOnAsyncEvent = True
    TabOrder = 2
    PasswordPrompt = True
  end
  object IWTemplateProcessorHTML1: TIWTemplateProcessorHTML
    TagType = ttIntraWeb
    RenderStyles = False
    Left = 88
    Top = 48
  end
end
