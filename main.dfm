object FormMain: TFormMain
  Left = 162
  Top = 150
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
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 498
    Width = 991
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
  object lsvRIV2: TListView
    Left = 0
    Top = 30
    Width = 991
    Height = 468
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
  object ControlBar1: TControlBar
    Left = 0
    Top = 0
    Width = 991
    Height = 30
    Align = alTop
    TabOrder = 2
    object Label2: TLabel
      Left = 11
      Top = 2
      Width = 61
      Height = 22
      Caption = 'RIV Search: '
      Layout = tlCenter
    end
    object SpeedButton1: TSpeedButton
      Left = 662
      Top = 2
      Width = 60
      Height = 22
      Caption = 'Go!'
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 600
      Top = 2
      Width = 42
      Height = 22
      Hint = 'Add RIV'
      Caption = '&Add '
      ParentShowHint = False
      ShowHint = True
      OnClick = AddRecord1Click
    end
    object SpeedButton3: TSpeedButton
      Left = 243
      Top = 2
      Width = 23
      Height = 22
      Glyph.Data = {
        62070000424D62070000000000003600000028000000160000001B0000000100
        1800000000002C070000C40E0000C40E00000000000000000000C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        0000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D40000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D40000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D40000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4808080000000808080C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4808080000000000000808080C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000000000808080C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        0000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4808080000000808080C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D40000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000000000C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D40000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D400000000
        0000C8D0D4C8D0D4C8D0D4000000000000000000000000000000C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D40000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        000000000000808080C8D0D4C8D0D4C8D0D4808080000000000000000000C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4808080000000000000808080C8D0D480808000000000000000000000
        0000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4000000000000000000000000000000000000000000
        808080000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D48080800000000000000000008080
        80C8D0D4C8D0D4000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        0000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D40000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D40000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D40000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000C8D0
        D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
        D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        0000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
        C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
        D4C8D0D40000}
      OnClick = SpeedButton3Click
    end
    object EditRIVSearch: TEdit
      Left = 279
      Top = 2
      Width = 212
      Height = 22
      TabOrder = 0
      OnKeyDown = EditRIVSearchKeyDown
    end
    object myRights: TCheckBox
      Left = 504
      Top = 2
      Width = 83
      Height = 22
      Caption = 'My Rights'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object cboType: TComboBox
      Left = 85
      Top = 2
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      OnChange = Refresh1Click
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
        OnClick = About2Click
      end
    end
  end
  object popItemLib: TPopupMenu
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
