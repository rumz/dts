object FormMain: TFormMain
  Left = 1498
  Top = 261
  Width = 999
  Height = 565
  Caption = 'DTS'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgc: TPageControl
    Left = 0
    Top = 0
    Width = 991
    Height = 519
    ActivePage = TabRiv2
    Align = alClient
    Style = tsButtons
    TabIndex = 0
    TabOrder = 0
    object TabRiv2: TTabSheet
      Caption = 'RIV Status'
      ImageIndex = 4
      object StatusBar1: TStatusBar
        Left = 0
        Top = 469
        Width = 983
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
      object ControlBar1: TControlBar
        Left = 0
        Top = 0
        Width = 983
        Height = 31
        Align = alTop
        TabOrder = 2
        object Label2: TLabel
          Left = 11
          Top = 2
          Width = 61
          Height = 22
          Caption = 'RIV Search: '
        end
        object SpeedButton1: TSpeedButton
          Left = 597
          Top = 2
          Width = 60
          Height = 22
          Caption = 'Go!'
          OnClick = SpeedButton1Click
        end
        object SpeedButton2: TSpeedButton
          Left = 542
          Top = 2
          Width = 42
          Height = 22
          Hint = 'Add RIV'
          Caption = '&Add '
          ParentShowHint = False
          ShowHint = True
          OnClick = AddRecord1Click
        end
        object EditRIVSearch: TEdit
          Left = 85
          Top = 2
          Width = 292
          Height = 22
          TabOrder = 0
          OnKeyDown = EditRIVSearchKeyDown
        end
        object myRights: TCheckBox
          Left = 398
          Top = 2
          Width = 83
          Height = 22
          Caption = 'My Rights'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
      end
      object lsvRIV2: TListView
        Left = 0
        Top = 31
        Width = 983
        Height = 438
        Align = alClient
        Columns = <
          item
            Caption = 'ID'
            Width = 0
          end
          item
            Caption = 'RIV No'
            Width = 75
          end
          item
            Caption = 'R_ID'
            Width = 1
          end
          item
            Caption = 'Requestor '
            Width = 150
          end
          item
            Caption = 'Description'
            Width = 300
          end
          item
            Caption = 'Create Date'
            Width = 130
          end
          item
            Caption = 'Status'
            Width = 300
          end
          item
            Caption = 'Remarks'
            Width = 100
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        GridLines = True
        ReadOnly = True
        RowSelect = True
        ParentFont = False
        PopupMenu = popItemLib
        TabOrder = 1
        ViewStyle = vsReport
        OnChange = lsvRIV2Change
        OnColumnClick = lsvRIV2ColumnClick
        OnDblClick = lsvRIV2DblClick
      end
    end
    object tabItems: TTabSheet
      Caption = 'Items'
      ImageIndex = 1
      TabVisible = False
    end
    object tabItemLib: TTabSheet
      Caption = 'Item Library'
      TabVisible = False
      object lsvItemLib: TListView
        Left = 0
        Top = 0
        Width = 983
        Height = 488
        Align = alClient
        Columns = <
          item
            Caption = 'ID'
            Width = 0
          end
          item
            Caption = 'Item Type'
            Width = 75
          end
          item
            Caption = 'Model'
            Width = 200
          end
          item
            Caption = 'Capex'
          end
          item
            Caption = 'Cost'
            Width = 100
          end
          item
            Caption = 'Description'
            Width = 500
          end>
        GridLines = True
        ReadOnly = True
        RowSelect = True
        PopupMenu = popItemLib
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 680
    Top = 264
    object N1: TMenuItem
      Caption = '&'
      object Logout: TMenuItem
        Caption = '&Logout'
        ShortCut = 112
        OnClick = LogoutClick
      end
    end
    object File1: TMenuItem
      Caption = '&File'
    end
    object About1: TMenuItem
      Caption = '&Help'
      object About2: TMenuItem
        Caption = '&About'
      end
    end
  end
  object popItemLib: TPopupMenu
    OnPopup = popItemLibPopup
    Left = 632
    Top = 264
    object Refresh1: TMenuItem
      Caption = '&Refresh'
      OnClick = Refresh1Click
    end
    object AddRecord1: TMenuItem
      Caption = 'Add Record'
      OnClick = AddRecord1Click
    end
    object UpdateRecord1: TMenuItem
      Caption = 'Update Record'
      OnClick = UpdateRecord1Click
    end
    object ProcessRecord1: TMenuItem
      Caption = '&Process Record'
      OnClick = ProcessRecord1Click
    end
    object N2: TMenuItem
      Caption = ' '
    end
    object DeleteRecord1: TMenuItem
      Caption = 'Delete Record'
      OnClick = DeleteRecord1Click
    end
  end
end
