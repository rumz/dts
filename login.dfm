object FormLogin: TFormLogin
  Left = 459
  Top = 262
  Width = 353
  Height = 196
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
  object Label1: TLabel
    Left = 13
    Top = 10
    Width = 60
    Height = 16
    Caption = 'Database'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object leduser: TLabeledEdit
    Left = 81
    Top = 39
    Width = 246
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
    Left = 81
    Top = 72
    Width = 246
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
    Top = 116
    Width = 75
    Height = 25
    TabOrder = 2
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 184
    Top = 116
    Width = 75
    Height = 25
    TabOrder = 3
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
  object cboDB: TComboBox
    Left = 82
    Top = 6
    Width = 247
    Height = 21
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    ItemIndex = 0
    ParentFont = False
    TabOrder = 4
    Text = '172.22.16.6:h:\databases\pipers ii\dts.gdb'
    Items.Strings = (
      '172.22.16.6:h:\databases\pipers ii\dts.gdb'
      '172.22.16.6:h:\databases\pipers ii\dtstest.gdb')
  end
end
