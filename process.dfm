object FormProcess: TFormProcess
  Left = 1482
  Top = 179
  Width = 1032
  Height = 713
  Caption = 'Approve RIV'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 24
    Top = 563
    Width = 228
    Height = 13
    Caption = 'Remarks (Why RIV is Approved or Disapproved)'
  end
  object Label1: TLabel
    Left = 664
    Top = 563
    Width = 48
    Height = 13
    Caption = 'user rights'
  end
  object Label3: TLabel
    Left = 664
    Top = 587
    Width = 100
    Height = 13
    Caption = 'current rights needed'
  end
  object TabControl1: TTabControl
    Left = 0
    Top = 1
    Width = 671
    Height = 510
    TabOrder = 0
    Tabs.Strings = (
      'Transactions')
    TabIndex = 0
    object lsvRIVtransactions: TListView
      Left = 4
      Top = 24
      Width = 663
      Height = 482
      Align = alClient
      Checkboxes = True
      Columns = <
        item
          Caption = 'Status'
          Width = 200
        end
        item
          Caption = 'ID'
          Width = 0
        end
        item
          Caption = 'Approved by'
          Width = 75
        end
        item
          Caption = 'Date'
          Width = 120
        end
        item
          Caption = 'Remarks'
          Width = 300
        end>
      GridLines = True
      TabOrder = 0
      ViewStyle = vsReport
    end
  end
  object MemoRemarks: TMemo
    Left = 16
    Top = 587
    Width = 601
    Height = 49
    MaxLength = 255
    TabOrder = 1
  end
  object Deny: TBitBtn
    Left = 264
    Top = 651
    Width = 75
    Height = 25
    Caption = 'Deny'
    TabOrder = 2
    OnClick = DenyClick
  end
  object BitBtn2: TBitBtn
    Left = 368
    Top = 651
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object TabControl2: TTabControl
    Left = 671
    Top = 0
    Width = 292
    Height = 511
    TabOrder = 4
    Tabs.Strings = (
      'Sample RIV')
    TabIndex = 0
    object lsvRIV: TListView
      Left = 4
      Top = 24
      Width = 284
      Height = 483
      Align = alClient
      Columns = <
        item
          Caption = 'Rights'
          Width = 45
        end
        item
          Caption = 'Approved?'
          Width = 276
        end>
      GridLines = True
      Items.Data = {
        B10200000E00000000000000FFFFFFFFFFFFFFFF000000000000000032455520
        2D204372656174652052495620262047657420436C656172616E63652066726F
        6D204469766973696F6E204865616400000000FFFFFFFFFFFFFFFF0000000000
        00000026475355202D20436865636B2041505020262041737369676E20536572
        696573204E756D62657200000000FFFFFFFFFFFFFFFF00000000000000001C46
        4D53202D20436865636B2042756467657420616E6420436C65617200000000FF
        FFFFFFFFFFFFFF0000000000000000124F525650202D20417070726F76652052
        495600000000FFFFFFFFFFFFFFFF00000000000000001C475355202D20507265
        706172652043512C2043412C20616E6420504F00000000FFFFFFFFFFFFFFFF00
        0000000000000017464D53202D20417070726F766520414320616E6420504F00
        000000FFFFFFFFFFFFFFFF0000000000000000114F525650202D20417070726F
        766520504F00000000FFFFFFFFFFFFFFFF000000000000000014464D53202D20
        466F727761726420746F2047535500000000FFFFFFFFFFFFFFFF000000000000
        000010475355202D205072657061726520445600000000FFFFFFFFFFFFFFFF00
        0000000000000017475355202D20496E7370656374696F6E205265706F727400
        000000FFFFFFFFFFFFFFFF000000000000000018464D53202D20466F72776172
        6420746F204361736869657200000000FFFFFFFFFFFFFFFF0000000000000000
        1843617368696572202D20497373756520436865636B28732900000000FFFFFF
        FFFFFFFFFF000000000000000025475355202D205365727665205061796D656E
        7420616E642041637175697265204974656D7300000000FFFFFFFFFFFFFFFF00
        00000000000000294555202D205265636569766520537570706C696573207669
        61205769746864726177616C20536C6970}
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
    end
  end
  object led_status: TLabeledEdit
    Left = 160
    Top = 526
    Width = 457
    Height = 24
    TabStop = False
    EditLabel.Width = 133
    EditLabel.Height = 13
    EditLabel.Caption = 'Current Status for Approval: '
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clRed
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    LabelPosition = lpLeft
    LabelSpacing = 3
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
  end
  object Approve: TBitBtn
    Left = 160
    Top = 651
    Width = 75
    Height = 25
    Caption = 'Approve'
    TabOrder = 6
    OnClick = DenyClick
  end
end
