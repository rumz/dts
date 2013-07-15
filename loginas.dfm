object FormLoginAs: TFormLoginAs
  Left = 541
  Top = 256
  Width = 321
  Height = 190
  Caption = 'Login As'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object leduser: TLabeledEdit
    Left = 91
    Top = 35
    Width = 202
    Height = 21
    EditLabel.Width = 66
    EditLabel.Height = 16
    EditLabel.Caption = 'Username '
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -13
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    LabelPosition = lpLeft
    LabelSpacing = 3
    TabOrder = 0
  end
  object ledpass: TLabeledEdit
    Left = 91
    Top = 68
    Width = 202
    Height = 21
    EditLabel.Width = 63
    EditLabel.Height = 16
    EditLabel.Caption = 'Password '
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -13
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    LabelPosition = lpLeft
    LabelSpacing = 3
    PasswordChar = '*'
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 72
    Top = 109
    Width = 75
    Height = 25
    TabOrder = 2
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 176
    Top = 109
    Width = 75
    Height = 25
    TabOrder = 3
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
end
