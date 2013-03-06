object FormItemLibrary: TFormItemLibrary
  Left = 1859
  Top = 411
  BorderStyle = bsDialog
  Caption = 'Item Library'
  ClientHeight = 198
  ClientWidth = 549
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 177
    Top = 29
    Width = 47
    Height = 13
    Caption = 'Item Type'
  end
  object Label2: TLabel
    Left = 28
    Top = 124
    Width = 30
    Height = 13
    Caption = 'Capex'
  end
  object led_IL_id: TLabeledEdit
    Left = 65
    Top = 24
    Width = 91
    Height = 21
    TabStop = False
    Color = clScrollBar
    EditLabel.Width = 23
    EditLabel.Height = 13
    EditLabel.BiDiMode = bdLeftToRight
    EditLabel.Caption = '  ID  '
    EditLabel.ParentBiDiMode = False
    LabelPosition = lpLeft
    LabelSpacing = 3
    ReadOnly = True
    TabOrder = 7
  end
  object cboType: TComboBox
    Left = 232
    Top = 24
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    Items.Strings = (
      'PC'
      'CPU'
      'Monitor'
      'Keyboard'
      'Mouse'
      'AVR'
      'UPS'
      'Printer'
      'Scanner'
      'Switch'
      'Router'
      'Camera'
      'Fax Machine')
  end
  object ledModel: TLabeledEdit
    Left = 67
    Top = 56
    Width = 463
    Height = 21
    EditLabel.Width = 32
    EditLabel.Height = 13
    EditLabel.BiDiMode = bdLeftToRight
    EditLabel.Caption = 'Model '
    EditLabel.ParentBiDiMode = False
    LabelPosition = lpLeft
    LabelSpacing = 3
    TabOrder = 1
  end
  object ledDescription: TLabeledEdit
    Left = 67
    Top = 88
    Width = 463
    Height = 21
    EditLabel.Width = 53
    EditLabel.Height = 13
    EditLabel.BiDiMode = bdLeftToRight
    EditLabel.Caption = 'Description'
    EditLabel.ParentBiDiMode = False
    LabelPosition = lpLeft
    LabelSpacing = 3
    TabOrder = 2
  end
  object cboCapex: TComboBox
    Left = 67
    Top = 119
    Width = 70
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 3
    Text = '1'
    Items.Strings = (
      '1'
      '0')
  end
  object ledCost: TLabeledEdit
    Left = 174
    Top = 117
    Width = 155
    Height = 21
    EditLabel.Width = 27
    EditLabel.Height = 13
    EditLabel.BiDiMode = bdLeftToRight
    EditLabel.Caption = 'Cost  '
    EditLabel.ParentBiDiMode = False
    LabelPosition = lpLeft
    LabelSpacing = 3
    TabOrder = 4
  end
  object Button1: TButton
    Left = 200
    Top = 160
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 5
    OnClick = Button1Click
  end
  object ButtonILCancel: TButton
    Left = 304
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 6
    OnClick = ButtonILCancelClick
  end
end
