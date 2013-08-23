object FormProcess: TFormProcess
  Left = 142
  Top = 8
  Width = 1098
  Height = 708
  Caption = 'Process Record'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label2: TLabel
    Left = 56
    Top = 593
    Width = 291
    Height = 16
    Caption = 'Remarks (Why RIV is Approved or Disapproved)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object MemoRemarks: TMemo
    Left = 53
    Top = 611
    Width = 601
    Height = 47
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 255
    ParentFont = False
    TabOrder = 0
  end
  object Deny: TBitBtn
    Left = 797
    Top = 581
    Width = 75
    Height = 25
    Caption = 'Deny'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = DenyClick
  end
  object BitBtn2: TBitBtn
    Left = 797
    Top = 621
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
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object led_status: TLabeledEdit
    Left = 192
    Top = 564
    Width = 457
    Height = 24
    TabStop = False
    EditLabel.Width = 164
    EditLabel.Height = 16
    EditLabel.Caption = 'Current Status for Approval: '
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clRed
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
    ReadOnly = True
    TabOrder = 3
  end
  object Approve: TBitBtn
    Left = 693
    Top = 583
    Width = 75
    Height = 25
    Caption = 'Approve'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = DenyClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 661
    Width = 1090
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1090
    Height = 553
    Align = alTop
    TabOrder = 6
    object Splitter1: TSplitter
      Left = 344
      Top = 1
      Width = 4
      Height = 551
      Cursor = crHSplit
    end
    object TabControl2: TTabControl
      Left = 1
      Top = 1
      Width = 343
      Height = 551
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Tabs.Strings = (
        'Sample RIV')
      TabIndex = 0
      object lsvRIV: TListView
        Left = 4
        Top = 27
        Width = 335
        Height = 520
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
        Font.Height = -15
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
    object TabControl1: TTabControl
      Left = 348
      Top = 1
      Width = 741
      Height = 551
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Tabs.Strings = (
        'Transactions')
      TabIndex = 0
      object lsvRIVtransactions: TListView
        Left = 4
        Top = 27
        Width = 733
        Height = 520
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
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        GridLines = True
        ParentFont = False
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
  end
  object Receive: TBitBtn
    Left = 693
    Top = 621
    Width = 75
    Height = 25
    Caption = 'Receive'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = DenyClick
  end
  object ApproveAs: TBitBtn
    Left = 901
    Top = 584
    Width = 75
    Height = 24
    Caption = 'Approve As'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = DenyClick
  end
  object DenyAs: TBitBtn
    Left = 901
    Top = 621
    Width = 75
    Height = 25
    Caption = 'Deny As'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = DenyClick
  end
end
