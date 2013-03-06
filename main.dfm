object FormMain: TFormMain
  Left = 1650
  Top = 282
  Width = 928
  Height = 480
  Caption = 'Philhealth Inventory System Software '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pgc: TPageControl
    Left = 0
    Top = 0
    Width = 920
    Height = 434
    ActivePage = tabItemLib
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    object tabItemLib: TTabSheet
      Caption = 'Item Library'
      object lsvItemLib: TListView
        Left = 0
        Top = 0
        Width = 912
        Height = 406
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
