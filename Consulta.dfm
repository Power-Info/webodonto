object FRMCONSULTA: TFRMCONSULTA
  Left = 0
  Top = 0
  Width = 751
  Height = 431
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
    Left = 649
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
    Top = 16
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
    Hint = 'EDITAR CONSULTA'
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
  object TXTDATACONSULTA: TIWEdit
    Left = 336
    Top = 150
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTDATACONSULTA'
    SubmitOnAsyncEvent = True
    TabOrder = 8
    OnAsyncKeyPress = TXTDATACONSULTAAsyncKeyPress
  end
  object CBPACIENTE: TIWComboBox
    Left = 336
    Top = 236
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    TabOrder = 9
    ItemIndex = -1
    FriendlyName = 'CBPACIENTE'
    NoSelectionText = '-- No Selection --'
  end
  object BTNEXCLUIR: TIWButton
    Left = 568
    Top = 247
    Width = 75
    Height = 25
    Hint = 'EXCLUIR CONSULTA'
    Css = 'btn btn-outline-danger'
    Caption = 'Excluir'
    Confirmation = 'Deseja realmente Excluir?'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'BTNEXCLUIR'
    TabOrder = 10
    OnClick = BTNEXCLUIRClick
  end
  object CBFUNCIONARIO: TIWComboBox
    Left = 336
    Top = 263
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    TabOrder = 11
    ItemIndex = -1
    FriendlyName = 'CBFUNCIONARIO'
    NoSelectionText = '-- No Selection --'
  end
  object TXTHORA: TIWEdit
    Left = 336
    Top = 177
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTHORA'
    SubmitOnAsyncEvent = True
    TabOrder = 12
  end
  object TXTMINUTO: TIWEdit
    Left = 336
    Top = 204
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTMINUTO'
    SubmitOnAsyncEvent = True
    TabOrder = 13
  end
  object CBPROCEDIMENTO: TIWComboBox
    Left = 336
    Top = 290
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    TabOrder = 14
    ItemIndex = -1
    FriendlyName = 'CBPROCEDIMENTO'
    NoSelectionText = '-- No Selection --'
  end
  object TXTQTD: TIWEdit
    Left = 336
    Top = 317
    Width = 121
    Height = 21
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'TXTQTD'
    SubmitOnAsyncEvent = True
    TabOrder = 15
  end
  object LBTOTAL: TIWLabel
    Left = 336
    Top = 352
    Width = 60
    Height = 16
    BGColor = clWebLIMEGREEN
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsBold]
    HasTabOrder = False
    FriendlyName = 'LBTOTAL'
    Caption = 'LBTOTAL'
  end
  object BTNADDPROCED: TIWButton
    Left = 568
    Top = 317
    Width = 75
    Height = 25
    Css = 'btn btn-primary'
    Caption = 'Adicionar'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'BTNADDPROCED'
    TabOrder = 16
    OnAsyncClick = BTNADDPROCEDAsyncClick
  end
  object BTNREMOVPROCED: TIWButton
    Left = 568
    Top = 348
    Width = 75
    Height = 25
    Css = 'btn btn-primary'
    Caption = 'Remover'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'BTNREMOVPROCED'
    TabOrder = 17
    OnAsyncClick = BTNREMOVPROCEDAsyncClick
  end
  object BTNSALVARPRODCON: TIWButton
    Left = 568
    Top = 379
    Width = 75
    Height = 25
    Css = 'btn btn-primary'
    Caption = 'Salvar'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'BTNSALVARPRODCON'
    TabOrder = 18
    OnAsyncClick = BTNSALVARAsyncClick
  end
  object BTNCANCELARPRODCON: TIWButton
    Left = 568
    Top = 403
    Width = 75
    Height = 25
    Css = 'btn btn-secondary'
    Caption = 'Cancelar'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'BTNCANCELARPRODCON'
    TabOrder = 19
    OnClick = BTNCANCELARPRODCONClick
  end
  object BTNPROCEDIMENTO: TIWButton
    Left = 568
    Top = 278
    Width = 75
    Height = 25
    Hint = 'ADICIONAR PROCEDIMENTOO'
    Caption = 'Procedimentos'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'BTNPROCEDIMENTO'
    TabOrder = 20
    OnClick = BTNPROCEDIMENTOClick
    OnAsyncClick = BTNPROCEDIMENTOAsyncClick
  end
  object txtid2: TIWEdit
    Left = 336
    Top = 96
    Width = 121
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'txtid2'
    SubmitOnAsyncEvent = True
    TabOrder = 21
    Text = 'txtid2'
  end
  object BTNVISUALIZARP: TIWButton
    Left = 336
    Top = 374
    Width = 121
    Height = 25
    Hint = 'ADICIONAR PROCEDIMENTOO'
    Caption = 'viewProced'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'BTNVISUALIZARP'
    TabOrder = 22
    OnAsyncClick = BTNVISUALIZARPAsyncClick
  end
  object BTNCANCELARPRODCON2: TIWButton
    Left = 336
    Top = 403
    Width = 75
    Height = 25
    Css = 'btn btn-secondary'
    Caption = 'Cancelar'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'BTNCANCELARPRODCON'
    TabOrder = 23
    OnClick = BTNCANCELARPRODCON2Click
  end
  object IWTemplateProcessorHTML1: TIWTemplateProcessorHTML
    TagType = ttIntraWeb
    OnUnknownTag = IWTemplateProcessorHTML1UnknownTag
    RenderStyles = False
    Left = 88
    Top = 16
  end
end
