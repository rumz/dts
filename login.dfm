object FormLogin: TFormLogin
  Left = 1893
  Top = 376
  Width = 321
  Height = 232
  Caption = 'Login - Philhealth Document Tracker'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LabeledEdit1: TLabeledEdit
    Left = 91
    Top = 91
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
    Text = '10323412'
  end
  object LabeledEdit2: TLabeledEdit
    Left = 91
    Top = 124
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
    Text = 'xxx123'
  end
  object BitBtn1: TBitBtn
    Left = 64
    Top = 162
    Width = 75
    Height = 25
    TabOrder = 2
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 184
    Top = 162
    Width = 75
    Height = 25
    TabOrder = 3
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
  object ledServer: TLabeledEdit
    Left = 91
    Top = 22
    Width = 202
    Height = 21
    EditLabel.Width = 58
    EditLabel.Height = 16
    EditLabel.Caption = 'Server IP '
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -13
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    LabelPosition = lpLeft
    LabelSpacing = 3
    TabOrder = 4
    Text = '172.22.16.72'
  end
  object ledPath: TLabeledEdit
    Left = 91
    Top = 54
    Width = 202
    Height = 21
    EditLabel.Width = 49
    EditLabel.Height = 16
    EditLabel.Caption = 'DB Path'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -13
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    LabelPosition = lpLeft
    LabelSpacing = 3
    TabOrder = 5
    Text = 'd:\db\DTS.GDB'
  end
end
