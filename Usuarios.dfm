object FRMUSUARIOS: TFRMUSUARIOS
  Left = 0
  Top = 0
  Width = 825
  Height = 468
  RenderInvisibleControls = True
  AllowPageAccess = True
  ConnectionMode = cmAny
  OnCreate = IWAppFormCreate
  BGColor = clWebWHITESMOKE
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
  object MENU: TIWLink
    Left = 712
    Top = 16
    Width = 97
    Height = 17
    Css = 'navbar-brand'
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'MENU'
    OnClick = MENUClick
    TabOrder = 0
    RawText = False
    Caption = 'Menu Principal'
  end
  object TXTBUSCAR: TIWEdit
    Left = 360
    Top = 16
    Width = 161
    Height = 21
    Hint = 'DIGITE AQUI PARA PESQUISAR!'
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTBUSCAR'
    SubmitOnAsyncEvent = True
    TabOrder = 1
  end
  object BTNBUSCAR: TIWButton
    Left = 568
    Top = 12
    Width = 75
    Height = 25
    Hint = 'PESQUISAR'
    Css = 'btn btn-outline-light'
    Caption = 'Buscar'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'BTNBUSCAR'
    TabOrder = 2
    OnClick = BTNBUSCARClick
  end
  object BTNSALVAR: TIWButton
    Left = 568
    Top = 123
    Width = 75
    Height = 25
    Css = 'btn btn-primary'
    Caption = 'Salvar'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'BTNSALVAR'
    TabOrder = 3
    OnAsyncClick = BTNSALVARAsyncClick
  end
  object BTNEDITAR: TIWButton
    Left = 568
    Top = 154
    Width = 75
    Height = 25
    Caption = 'Editar'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'IWButton1'
    TabOrder = 4
    OnAsyncClick = BTNEDITARAsyncClick
  end
  object BTNNOVO: TIWButton
    Left = 568
    Top = 185
    Width = 75
    Height = 25
    Css = 'btn btn-outline-success'
    Caption = 'Novo'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'IWButton1'
    TabOrder = 5
    OnAsyncClick = BTNNOVOAsyncClick
  end
  object BTNCANCELAR: TIWButton
    Left = 568
    Top = 216
    Width = 75
    Height = 25
    Css = 'btn btn-secondary'
    Caption = 'Cancelar'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'IWButton1'
    TabOrder = 6
    OnClick = BTNCANCELARClick
  end
  object txtid: TIWEdit
    Left = 336
    Top = 123
    Width = 121
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'txtid'
    SubmitOnAsyncEvent = True
    TabOrder = 7
    Text = 'txtid'
  end
  object TXTNOME: TIWEdit
    Left = 336
    Top = 150
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTNOME'
    SubmitOnAsyncEvent = True
    TabOrder = 8
  end
  object TXTEMAIL: TIWEdit
    Left = 336
    Top = 177
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTEMAIL'
    SubmitOnAsyncEvent = True
    TabOrder = 9
  end
  object TXTNASCIMENTO: TIWEdit
    Left = 336
    Top = 219
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTNASCIMENTO'
    SubmitOnAsyncEvent = True
    TabOrder = 10
    OnAsyncKeyPress = TXTNASCIMENTOAsyncKeyPress
  end
  object TXTDEPARTAMENTO: TIWEdit
    Left = 336
    Top = 286
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTDEPARTAMENTO'
    SubmitOnAsyncEvent = True
    TabOrder = 12
  end
  object CBNIVEL: TIWComboBox
    Left = 336
    Top = 344
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    OnAsyncEnter = CBNIVELAsyncEnter
    TabOrder = 13
    ItemIndex = -1
    Items.Strings = (
      'Usu'#225'rios'
      'Admin'
      'Gerente')
    FriendlyName = 'CBNIVEL'
    NoSelectionText = '-- No Selection --'
  end
  object BTNEXCLUIR: TIWButton
    Left = 568
    Top = 247
    Width = 75
    Height = 25
    Css = 'btn btn-outline-danger'
    Caption = 'Excluir'
    Confirmation = 'Deseja realmente Excluir?'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'BTNEXCLUIR'
    TabOrder = 14
    OnClick = BTNEXCLUIRClick
  end
  object TXTSENHA: TIWEdit
    Left = 336
    Top = 246
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTDEPARTAMENTO'
    SubmitOnAsyncEvent = True
    TabOrder = 11
  end
  object IWTemplateProcessorHTML1: TIWTemplateProcessorHTML
    TagType = ttIntraWeb
    OnUnknownTag = IWTemplateProcessorHTML1UnknownTag
    RenderStyles = False
    Left = 40
    Top = 16
  end
end
