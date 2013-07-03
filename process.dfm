object FormProcess: TFormProcess
  Left = 1440
  Top = 117
  Width = 1145
  Height = 760
  Caption = 'Process RIV'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
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
  object TabControl1: TTabControl
    Left = 0
    Top = 1
    Width = 1017
    Height = 510
    TabOrder = 0
    Tabs.Strings = (
      'Transactions')
    TabIndex = 0
    object lsvRIVtransactions: TListView
      Left = 4
      Top = 24
      Width = 1009
      Height = 482
      Align = alClient
      Checkboxes = True
      Columns = <
        item
          Caption = 'Status'
          Width = 350
        end
        item
          Caption = 'ID'
          Width = 0
        end
        item
          Caption = 'Approved by'
          Width = 140
        end
        item
          Caption = 'Date'
          Width = 130
        end
        item
          Caption = 'Remarks'
          Width = 350
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      GridLines = True
      ParentFont = False
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
    Left = 1020
    Top = 0
    Width = 343
    Height = 511
    TabOrder = 4
    Tabs.Strings = (
      'Sample RIV')
    TabIndex = 0
    object lsvRIV: TListView
      Left = 4
      Top = 24
      Width = 335
      Height = 483
      Align = alClient
      Checkboxes = True
      Columns = <
        item
          Caption = 'Rights'
          Width = 55
        end
        item
          Caption = 'Approved?'
          Width = 276
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      GridLines = True
      ReadOnly = True
      RowSelect = True
      ParentFont = False
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 698
    Width = 1363
    Height = 19
    Panels = <
      item
        Width = 75
      end
      item
        Width = 150
      end
      item
        Width = 200
      end>
    SimplePanel = False
  end
end
