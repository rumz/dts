object FormLogin: TFormLogin
  Left = 503
  Top = 245
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object leduser: TLabeledEdit
    Left = 91
    Top = 91
    Width = 202
    Height = 24
    EditLabel.Width = 66
    EditLabel.Height = 16
    EditLabel.Caption = 'Username '
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -15
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    LabelPosition = lpLeft
    LabelSpacing = 3
    ParentFont = False
    TabOrder = 0
    Text = '10323412'
  end
  object ledpass: TLabeledEdit
    Left = 91
    Top = 124
    Width = 202
    Height = 24
    EditLabel.Width = 63
    EditLabel.Height = 16
    EditLabel.Caption = 'Password '
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -15
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    LabelPosition = lpLeft
    LabelSpacing = 3
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
    Text = '1'
  end
  object BitBtn1: TBitBtn
    Left = 64
    Top = 164
    Width = 75
    Height = 25
    TabOrder = 2
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 184
    Top = 164
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
    Height = 24
    EditLabel.Width = 58
    EditLabel.Height = 16
    EditLabel.Caption = 'Server IP '
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -15
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    LabelPosition = lpLeft
    LabelSpacing = 3
    ParentFont = False
    TabOrder = 4
    Text = '172.22.16.72'
  end
  object ledPath: TLabeledEdit
    Left = 91
    Top = 54
    Width = 202
    Height = 24
    EditLabel.Width = 49
    EditLabel.Height = 16
    EditLabel.Caption = 'DB Path'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -15
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    LabelPosition = lpLeft
    LabelSpacing = 3
    ParentFont = False
    TabOrder = 5
    Text = 'd:\db\DTS.GDB'
  end
end
