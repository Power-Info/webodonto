object APRESENTACAOSIC: TAPRESENTACAOSIC
  Left = 0
  Top = 0
  Width = 785
  Height = 567
  RenderInvisibleControls = True
  AllowPageAccess = True
  ConnectionMode = cmAny
  LinkColor = clHighlight
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
  object LODONTO: TIWLink
    Left = 328
    Top = 88
    Width = 113
    Height = 17
    Css = 'dropdown-item'
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    HasTabOrder = True
    DoSubmitValidation = False
    FriendlyName = 'LODONTO'
    OnAsyncClick = LODONTOAsyncClick
    TabOrder = 0
    RawText = False
    Caption = 'Ir para ODONTO'
  end
  object IWTemplateProcessorHTML1: TIWTemplateProcessorHTML
    TagType = ttIntraWeb
    RenderStyles = False
    Left = 112
    Top = 56
  end
end
