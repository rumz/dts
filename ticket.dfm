object FormTicket: TFormTicket
  Left = 1796
  Top = 295
  Width = 459
  Height = 354
  Caption = 'Ticket Details'
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
  object Label1: TLabel
    Left = 16
    Top = 48
    Width = 71
    Height = 16
    Caption = 'Description '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 15
    Top = 16
    Width = 45
    Height = 16
    Caption = 'Subject'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 24
    Top = 188
    Width = 42
    Height = 13
    Caption = 'Category'
  end
  object Label4: TLabel
    Left = 28
    Top = 215
    Width = 22
    Height = 13
    Caption = 'User'
  end
  object Memo_RIV_Description: TMemo
    Left = 14
    Top = 67
    Width = 419
    Height = 105
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 255
    ParentFont = False
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 128
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Save'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object BitBtn2: TBitBtn
    Left = 232
    Top = 256
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object Edit1: TEdit
    Left = 72
    Top = 14
    Width = 361
    Height = 21
    MaxLength = 200
    TabOrder = 0
  end
  object cboCategory: TComboBox
    Left = 80
    Top = 184
    Width = 185
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
  end
  object cboUser: TComboBox
    Left = 80
    Top = 210
    Width = 185
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 3
  end
end
