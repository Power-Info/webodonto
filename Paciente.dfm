object FRMPACIENTE: TFRMPACIENTE
  Left = 0
  Top = 0
  Width = 748
  Height = 596
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
    Left = 648
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
    Left = 567
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
    Left = 567
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
    Left = 567
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
    Left = 567
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
  object TXTCPF: TIWEdit
    Left = 336
    Top = 150
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTCPF'
    SubmitOnAsyncEvent = True
    TabOrder = 8
    OnAsyncKeyPress = TXTCPFAsyncKeyPress
  end
  object TXTDATA: TIWEdit
    Left = 336
    Top = 226
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTDATA'
    SubmitOnAsyncEvent = True
    TabOrder = 10
    OnAsyncKeyPress = TXTDATAAsyncKeyPress
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
    TabOrder = 11
    OnClick = BTNEXCLUIRClick
  end
  object BTNIMAGEM: TIWButton
    Left = 568
    Top = 304
    Width = 89
    Height = 25
    Css = 'btn btn-outline-light'
    Caption = 'Ver Imagem'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'BTNIMAGEM'
    TabOrder = 12
    OnAsyncClick = BTNIMAGEMAsyncClick
  end
  object TXTTELEFONE: TIWEdit
    Left = 336
    Top = 189
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTTELEFONE'
    SubmitOnAsyncEvent = True
    TabOrder = 9
    OnAsyncKeyPress = TXTTELEFONEAsyncKeyPress
  end
  object TXTNOME: TIWEdit
    Left = 336
    Top = 253
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTNOME'
    SubmitOnAsyncEvent = True
    TabOrder = 13
  end
  object TXTSEXO: TIWEdit
    Left = 336
    Top = 280
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTSEXO'
    SubmitOnAsyncEvent = True
    TabOrder = 14
  end
  object TXTEMAIL: TIWEdit
    Left = 336
    Top = 304
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTEMAIL'
    SubmitOnAsyncEvent = True
    TabOrder = 15
  end
  object TXTOBS: TIWEdit
    Left = 336
    Top = 331
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTOBS'
    SubmitOnAsyncEvent = True
    TabOrder = 16
  end
  object TXTCELULAR: TIWEdit
    Left = 336
    Top = 358
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTCELULAR'
    SubmitOnAsyncEvent = True
    TabOrder = 17
    OnAsyncKeyPress = TXTCELULARAsyncKeyPress
  end
  object TXTCEP: TIWEdit
    Left = 336
    Top = 385
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTCEP'
    SubmitOnAsyncEvent = True
    TabOrder = 18
    OnAsyncKeyPress = TXTCEPAsyncKeyPress
  end
  object TXTENDERECO: TIWEdit
    Left = 336
    Top = 412
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTENDERECO'
    SubmitOnAsyncEvent = True
    TabOrder = 19
  end
  object TXTNUMERO: TIWEdit
    Left = 336
    Top = 452
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTNUMERO'
    SubmitOnAsyncEvent = True
    TabOrder = 20
  end
  object TXTCOMPLEMENTO: TIWEdit
    Left = 336
    Top = 479
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTCOMPLEMENTO'
    SubmitOnAsyncEvent = True
    TabOrder = 21
  end
  object TXTBAIRRO: TIWEdit
    Left = 336
    Top = 501
    Width = 121
    Height = 20
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTBAIRRO'
    SubmitOnAsyncEvent = True
    TabOrder = 22
  end
  object TXTCIDADE: TIWEdit
    Left = 336
    Top = 527
    Width = 121
    Height = 20
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTCIDADE'
    SubmitOnAsyncEvent = True
    TabOrder = 23
  end
  object TXTPAIS: TIWEdit
    Left = 336
    Top = 552
    Width = 121
    Height = 20
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTPAIS'
    SubmitOnAsyncEvent = True
    TabOrder = 24
  end
  object TXTESTADO: TIWEdit
    Left = 336
    Top = 573
    Width = 121
    Height = 20
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTESTADO'
    SubmitOnAsyncEvent = True
    TabOrder = 25
  end
  object IWTemplateProcessorHTML1: TIWTemplateProcessorHTML
    TagType = ttIntraWeb
    OnUnknownTag = IWTemplateProcessorHTML1UnknownTag
    RenderStyles = False
    Left = 96
    Top = 40
  end
end
