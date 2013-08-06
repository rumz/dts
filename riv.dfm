object FormRIV: TFormRIV
  Left = 1724
  Top = 247
  BorderStyle = bsDialog
  Caption = 'RIV '
  ClientHeight = 368
  ClientWidth = 457
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
    Top = 48
    Width = 56
    Height = 13
    Caption = 'Description '
  end
  object Label2: TLabel
    Left = 196
    Top = 20
    Width = 55
    Height = 13
    Caption = 'Requestor  '
  end
  object Label3: TLabel
    Left = 18
    Top = 184
    Width = 107
    Height = 13
    Caption = 'Remarks (PO/DV, etc)'
  end
  object led_ID: TLabeledEdit
    Left = 55
    Top = 275
    Width = 49
    Height = 21
    Color = clScrollBar
    EditLabel.Width = 17
    EditLabel.Height = 13
    EditLabel.Caption = 'ID  '
    LabelPosition = lpLeft
    LabelSpacing = 3
    ReadOnly = True
    TabOrder = 6
    Visible = False
  end
  object led_rivno: TLabeledEdit
    Left = 85
    Top = 15
    Width = 98
    Height = 21
    EditLabel.Width = 64
    EditLabel.Height = 13
    EditLabel.Caption = 'RIV Number  '
    EditLabel.Color = clBtnFace
    EditLabel.ParentColor = False
    LabelPosition = lpLeft
    LabelSpacing = 3
    TabOrder = 0
  end
  object Memo_RIV_Description: TMemo
    Left = 14
    Top = 67
    Width = 419
    Height = 105
    MaxLength = 255
    TabOrder = 2
  end
  object cbo_Requestor: TComboBox
    Left = 255
    Top = 15
    Width = 188
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 160
    Top = 320
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 248
    Top = 320
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 5
    OnClick = BitBtn2Click
  end
  object Memo_Remarks: TMemo
    Left = 16
    Top = 203
    Width = 419
    Height = 105
    MaxLength = 255
    TabOrder = 3
  end
end
