object FormMain: TFormMain
  Left = 102
  Top = 93
  Width = 1158
  Height = 504
  Caption = 'Philhealth Inventory System Software '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pgc: TPageControl
    Left = 0
    Top = 0
    Width = 1150
    Height = 458
    ActivePage = tabRIV
    Align = alClient
    Style = tsButtons
    TabIndex = 0
    TabOrder = 0
    object tabRIV: TTabSheet
      Caption = 'RIV'
      ImageIndex = 2
      object Label1: TLabel
        Left = 256
        Top = 11
        Width = 52
        Height = 13
        Caption = 'Requestor:'
      end
      object lsvRIV: TListView
        Left = 0
        Top = 168
        Width = 1142
        Height = 259
        Align = alBottom
        Checkboxes = True
        Columns = <
          item
            Caption = 'Approved?'
            Width = 300
          end
          item
            Caption = 'Received'
            Width = 125
          end
          item
            Caption = 'Date Received'
            Width = 150
          end
          item
            Caption = 'Approved?'
            Width = 100
          end
          item
            Caption = 'Date'
            Width = 150
          end
          item
            Caption = 'Remarks'
            Width = 450
          end>
        GridLines = True
        Items.Data = {
          2F0200000B00000000000000FFFFFFFFFFFFFFFF000000000000000032455520
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
          766520504F00000000FFFFFFFFFFFFFFFF000000000000000010475355202D20
          5072657061726520445600000000FFFFFFFFFFFFFFFF00000000000000001843
          617368696572202D20497373756520436865636B28732900000000FFFFFFFFFF
          FFFFFF000000000000000025475355202D205365727665205061796D656E7420
          616E642041637175697265204974656D7300000000FFFFFFFFFFFFFFFF000000
          0000000000294555202D205265636569766520537570706C6965732076696120
          5769746864726177616C20536C6970}
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
      object LabeledEdit2: TLabeledEdit
        Left = 80
        Top = 8
        Width = 153
        Height = 21
        EditLabel.Width = 58
        EditLabel.Height = 13
        EditLabel.Caption = 'RIV Number'
        LabelPosition = lpLeft
        LabelSpacing = 3
        TabOrder = 1
        Text = '234-12'
      end
      object StaticText1: TStaticText
        Left = 16
        Top = 40
        Width = 57
        Height = 17
        Caption = 'Description'
        TabOrder = 2
      end
      object Memo1: TMemo
        Left = 80
        Top = 40
        Width = 377
        Height = 113
        Lines.Strings = (
          'Request for IC Recorder 4GB')
        TabOrder = 3
      end
      object cboRequestor: TComboBox
        Left = 312
        Top = 8
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 4
      end
    end
    object tabItemLib: TTabSheet
      Caption = 'Item Library'
      object lsvItemLib: TListView
        Left = 0
        Top = 0
        Width = 1142
        Height = 427
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
        OnSelectItem = lsvItemLibSelectItem
      end
    end
    object tabItems: TTabSheet
      Caption = 'Items'
      ImageIndex = 1
    end
    object TabSheet1: TTabSheet
      Caption = 'User Management'
      ImageIndex = 3
      object lsvUsers: TListView
        Left = 0
        Top = 0
        Width = 1142
        Height = 427
        Align = alClient
        Columns = <
          item
            Caption = 'ID'
            Width = 0
          end
          item
            Caption = 'Name'
            Width = 200
          end
          item
            Caption = 'Department'
            Width = 200
          end
          item
            Caption = 'Rights'
            Width = 200
          end>
        GridLines = True
        ReadOnly = True
        RowSelect = True
        PopupMenu = popItemLib
        TabOrder = 0
        ViewStyle = vsReport
        OnSelectItem = lsvItemLibSelectItem
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 680
    Top = 264
    object N1: TMenuItem
      Caption = '&'
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
    object DeleteRecord1: TMenuItem
      Caption = 'Delete Record'
      OnClick = DeleteRecord1Click
    end
  end
end
