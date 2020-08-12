object FRMEMPRESA: TFRMEMPRESA
  Left = 0
  Top = 0
  Width = 810
  Height = 503
  RenderInvisibleControls = True
  AllowPageAccess = True
  ConnectionMode = cmAny
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
    Left = 104
    Top = 91
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
    Left = 104
    Top = 118
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
  object TXTFANTASIA: TIWEdit
    Left = 104
    Top = 154
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTFANTASIA'
    SubmitOnAsyncEvent = True
    TabOrder = 9
  end
  object TXTFONE: TIWEdit
    Left = 104
    Top = 181
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTFONE'
    SubmitOnAsyncEvent = True
    TabOrder = 10
  end
  object TXTENDERECO: TIWEdit
    Left = 104
    Top = 247
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTENDERECO'
    SubmitOnAsyncEvent = True
    TabOrder = 11
  end
  object CBTIPOPESSOA: TIWComboBox
    Left = 104
    Top = 408
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    TabOrder = 12
    ItemIndex = -1
    Items.Strings = (
      'P'#250'blica'
      'Privada')
    FriendlyName = 'CBTIPOPESSOA'
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
    TabOrder = 13
    OnClick = BTNEXCLUIRClick
  end
  object TXTCEP: TIWEdit
    Left = 104
    Top = 208
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTCEP'
    SubmitOnAsyncEvent = True
    TabOrder = 14
  end
  object TXTCNPJ: TIWEdit
    Left = 104
    Top = 451
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTCNPJ'
    SubmitOnAsyncEvent = True
    TabOrder = 15
  end
  object TXTUF: TIWEdit
    Left = 104
    Top = 289
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTUF'
    SubmitOnAsyncEvent = True
    TabOrder = 16
  end
  object TXTCIDADE: TIWEdit
    Left = 104
    Top = 316
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTCIDADE'
    SubmitOnAsyncEvent = True
    TabOrder = 17
  end
  object TXTEMAIL: TIWEdit
    Left = 104
    Top = 356
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTEMAIL'
    SubmitOnAsyncEvent = True
    TabOrder = 18
  end
  object IWTemplateProcessorHTML1: TIWTemplateProcessorHTML
    TagType = ttIntraWeb
    OnUnknownTag = IWTemplateProcessorHTML1UnknownTag
    RenderStyles = False
    Left = 64
    Top = 24
  end
end
