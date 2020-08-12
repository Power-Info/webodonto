object FRMODONTOESPEC: TFRMODONTOESPEC
  Left = 0
  Top = 0
  Width = 693
  Height = 432
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
  object MENU: TIWLink
    Left = 596
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
    TabOrder = 0
    RawText = False
    Caption = 'Menu Principal'
  end
  object TXTBUSCAR: TIWEdit
    Left = 304
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
    Left = 503
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
  object txtid: TIWEdit
    Left = 304
    Top = 83
    Width = 121
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'txtid'
    SubmitOnAsyncEvent = True
    TabOrder = 3
    Text = 'txtid'
  end
  object TXTNOME: TIWEdit
    Left = 304
    Top = 128
    Width = 121
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTNOME'
    SubmitOnAsyncEvent = True
    TabOrder = 4
  end
  object TXTCRO: TIWEdit
    Left = 304
    Top = 176
    Width = 121
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTCRO'
    SubmitOnAsyncEvent = True
    TabOrder = 5
  end
  object TXTFONE: TIWEdit
    Left = 304
    Top = 259
    Width = 121
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTFONE'
    SubmitOnAsyncEvent = True
    TabOrder = 6
  end
  object TXTUF: TIWComboBox
    Left = 304
    Top = 216
    Width = 121
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    TabOrder = 7
    ItemIndex = -1
    Items.Strings = (
      'AC'
      'AL'
      'AP'
      'AM'
      'BA'
      'CE'
      'DF'
      'ES'
      'GO'
      'MA'
      'MT'
      'MS'
      'MG'
      'PR'
      'PB'
      'PA'
      'PE'
      'PI'
      'RJ'
      'RN'
      'RS'
      'RO'
      'RR'
      'SC'
      'SE'
      'SP'
      'TO')
    FriendlyName = 'TXTUF'
    NoSelectionText = '-- No Selection --'
  end
  object TXTESPEC: TIWComboBox
    Left = 304
    Top = 312
    Width = 121
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    TabOrder = 8
    ItemIndex = -1
    Items.Strings = (
      'Cirurgia e Traumatologia Buco-Maxilo-Facial'
      'Dent'#237'stica'
      'Disfun'#231#227'o Temporomandibular e Dor Orofacial'
      'Endodontia'
      'Estomatologia'
      'Radiologia Odontol'#243'gica e Imaginologia'
      'Implantodontia'
      'Odontogeriatria'
      'Odontopediatria'
      'Odontologia Legal'
      'Odontologia para Pacientes com Necessidades Especiais'
      'Odontologia do Trabalho '
      'Ortodontia'
      'Ortopedia Funcional dos Maxilares'
      'Patologia Bucal'
      'Periodontia'
      'Pr'#243'tese Bucomaxilofacial'
      'Pr'#243'tese Dent'#225'ria'
      'Sa'#250'de Coletiva')
    FriendlyName = 'TXTESPEC'
    NoSelectionText = '-- No Selection --'
  end
  object BTNSALVAR: TIWButton
    Left = 503
    Top = 83
    Width = 75
    Height = 25
    Css = 'btn btn-primary'
    Caption = 'Salvar'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'BTNSALVAR'
    TabOrder = 9
    OnAsyncClick = BTNSALVARAsyncClick
  end
  object BTNEDITAR: TIWButton
    Left = 503
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Editar'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'IWButton1'
    TabOrder = 10
    OnAsyncClick = BTNEDITARAsyncClick
  end
  object IWTemplateProcessorHTML1: TIWTemplateProcessorHTML
    TagType = ttIntraWeb
    Left = 80
    Top = 40
  end
end
