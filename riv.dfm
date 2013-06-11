object FormRIV: TFormRIV
  Left = 263
  Top = 184
  BorderStyle = bsDialog
  Caption = 'RIV '
  ClientHeight = 290
  ClientWidth = 548
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 72
    Width = 56
    Height = 13
    Caption = 'Description '
  end
  object Label2: TLabel
    Left = 287
    Top = 33
    Width = 55
    Height = 13
    Caption = 'Requestor  '
  end
  object led_ID: TLabeledEdit
    Left = 32
    Top = 32
    Width = 49
    Height = 21
    Color = clScrollBar
    EditLabel.Width = 17
    EditLabel.Height = 13
    EditLabel.Caption = 'ID  '
    LabelPosition = lpLeft
    LabelSpacing = 3
    ReadOnly = True
    TabOrder = 0
  end
  object led_rivno: TLabeledEdit
    Left = 171
    Top = 31
    Width = 98
    Height = 21
    EditLabel.Width = 64
    EditLabel.Height = 13
    EditLabel.Caption = 'RIV Number  '
    EditLabel.Color = clBtnFace
    EditLabel.ParentColor = False
    LabelPosition = lpLeft
    LabelSpacing = 3
    TabOrder = 1
  end
  object Memo_RIV_Description: TMemo
    Left = 16
    Top = 96
    Width = 513
    Height = 129
    TabOrder = 3
  end
  object cbo_Requestor: TComboBox
    Left = 343
    Top = 30
    Width = 186
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 168
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 280
    Top = 248
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 5
    OnClick = BitBtn2Click
  end
end
