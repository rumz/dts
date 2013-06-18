object FormProcess: TFormProcess
  Left = 1701
  Top = 334
  Width = 657
  Height = 469
  Caption = 'Approve Form'
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
    Left = 24
    Top = 272
    Width = 49
    Height = 13
    Caption = 'Approve? '
  end
  object Label2: TLabel
    Left = 24
    Top = 304
    Width = 228
    Height = 13
    Caption = 'Remarks (Why RIV is Approved or Disapproved)'
  end
  object cbo_approve: TComboBox
    Left = 83
    Top = 268
    Width = 86
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    Items.Strings = (
      'Yes'
      'No')
  end
  object TabControl1: TTabControl
    Left = 0
    Top = 0
    Width = 649
    Height = 244
    Align = alTop
    TabOrder = 1
    Tabs.Strings = (
      'Transactions')
    TabIndex = 0
    object lsvRIVtransactions: TListView
      Left = 4
      Top = 24
      Width = 641
      Height = 216
      Align = alClient
      Columns = <
        item
          Caption = 'ID'
        end
        item
          Caption = 'RIV No'
          Width = 75
        end
        item
          Caption = 'Date'
          Width = 75
        end
        item
          Caption = 'Approved?'
          Width = 70
        end
        item
          Caption = 'Remarks'
          Width = 400
        end>
      GridLines = True
      TabOrder = 0
      ViewStyle = vsReport
    end
  end
  object MemoRemarks: TMemo
    Left = 16
    Top = 328
    Width = 601
    Height = 49
    MaxLength = 255
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 232
    Top = 392
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 3
  end
  object BitBtn2: TBitBtn
    Left = 320
    Top = 392
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 4
    OnClick = BitBtn2Click
  end
end
