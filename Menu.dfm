object FRMMENU: TFRMMENU
  Left = 0
  Top = 0
  Width = 822
  Height = 453
  RenderInvisibleControls = True
  AllowPageAccess = True
  ConnectionMode = cmAny
  OnCreate = IWAppFormCreate
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
  object USUARIOS: TIWLink
    Left = 720
    Top = 32
    Width = 65
    Height = 17
    Css = 'dropdown-item'
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'USUARIOS'
    OnClick = USUARIOSClick
    TabOrder = 0
    RawText = False
    Caption = 'Usu'#225'rios'
  end
  object SAIR: TIWLink
    Left = 720
    Top = 72
    Width = 65
    Height = 17
    Css = 'dropdown-item'
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'SAIR'
    OnClick = SAIRClick
    TabOrder = 1
    RawText = False
    Caption = 'Sair'
  end
  object USUARIOSMENU: TIWLink
    Left = 720
    Top = 95
    Width = 65
    Height = 17
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'USUARIOS'
    OnClick = USUARIOSClick
    TabOrder = 2
    RawText = False
    Caption = 'USU'#193'RIOS'
  end
  object EMPRESAMENU: TIWLink
    Left = 720
    Top = 143
    Width = 65
    Height = 17
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'USUARIOS'
    OnClick = EMPRESAMENUClick
    TabOrder = 3
    RawText = False
    Caption = 'EMPRESA'
  end
  object PROCEDIMENTOSMENU: TIWLink
    Left = 696
    Top = 182
    Width = 105
    Height = 17
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'PROCEDIMENTOS'
    OnClick = PROCEDIMENTOSMENUClick
    TabOrder = 4
    RawText = False
    Caption = 'PROCEDIMENTOS'
  end
  object PACIENTEMENU: TIWLink
    Left = 712
    Top = 214
    Width = 65
    Height = 17
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'PACIENTES'
    OnClick = PACIENTEMENUClick
    TabOrder = 5
    RawText = False
    Caption = 'PACIENTES'
  end
  object CONSULTASMENU: TIWLink
    Left = 680
    Top = 262
    Width = 97
    Height = 17
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'CONSULTAS'
    OnClick = CONSULTASMENUClick
    TabOrder = 6
    RawText = False
    Caption = 'CONSULTAS'
  end
  object NPACIENTES: TIWLabel
    Left = 480
    Top = 192
    Width = 80
    Height = 16
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'NPACIENTES'
    Caption = 'NPACIENTES'
  end
  object NPROCEDIMENTOS: TIWLabel
    Left = 480
    Top = 214
    Width = 119
    Height = 16
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'NPROCEDIMENTOS'
    Caption = 'NPROCEDIMENTOS'
  end
  object NCONSULTAS: TIWLabel
    Left = 480
    Top = 236
    Width = 86
    Height = 16
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    HasTabOrder = False
    FriendlyName = 'NCONSULTAS'
    Caption = 'NCONSULTAS'
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
    TabOrder = 7
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
    TabOrder = 8
    OnClick = BTNBUSCARClick
  end
  object BTNATENDER: TIWButton
    Left = 485
    Top = 322
    Width = 75
    Height = 25
    Caption = 'Atender'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'BTNATENDER'
    TabOrder = 9
    OnClick = BTNATENDERClick
  end
  object txtid: TIWEdit
    Left = 478
    Top = 295
    Width = 121
    Height = 21
    StyleRenderOptions.RenderBorder = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'txtid'
    SubmitOnAsyncEvent = True
    TabOrder = 10
    Text = 'txtid'
  end
  object BTNCANCELAR: TIWButton
    Left = 485
    Top = 361
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    Color = clBtnFace
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'BTNCANCELAR'
    TabOrder = 11
    OnClick = BTNCANCELARClick
  end
  object MICONSULTA: TIWLink
    Left = 56
    Top = 128
    Width = 65
    Height = 17
    Css = 'dropdown-item'
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clHighlight
    Font.Size = 10
    Font.Style = [fsBold, fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'SAIR'
    OnClick = MICONSULTAClick
    TabOrder = 12
    RawText = False
    Caption = 'Consulta'
  end
  object MIPACIENTE: TIWLink
    Left = 56
    Top = 105
    Width = 65
    Height = 17
    Css = 'dropdown-item'
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clHighlight
    Font.Size = 10
    Font.Style = [fsBold, fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'SAIR'
    OnClick = MIPACIENTEClick
    TabOrder = 13
    RawText = False
    Caption = 'Paciente'
  end
  object MIPROCEDIMENTO: TIWLink
    Left = 56
    Top = 167
    Width = 105
    Height = 17
    Css = 'dropdown-item'
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clHighlight
    Font.Size = 10
    Font.Style = [fsBold, fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'PROCEDIMENTO'
    OnClick = MIPROCEDIMENTOClick
    TabOrder = 14
    RawText = False
    Caption = 'Procedimento'
  end
  object IWTemplateProcessorHTML1: TIWTemplateProcessorHTML
    TagType = ttIntraWeb
    OnUnknownTag = IWTemplateProcessorHTML1UnknownTag
    RenderStyles = False
    Left = 72
    Top = 24
  end
end
