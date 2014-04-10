object FormComment: TFormComment
  Left = 401
  Top = 199
  Width = 527
  Height = 360
  Caption = 'Add Comment'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 64
    Top = 248
    Width = 60
    Height = 13
    Caption = 'Defect User '
  end
  object Label2: TLabel
    Left = 14
    Top = 218
    Width = 114
    Height = 13
    Caption = 'Change Assigned User  '
    Visible = False
  end
  object MemoComment: TMemo
    Left = 8
    Top = 8
    Width = 497
    Height = 225
    Lines.Strings = (
      'RIV 212-14'
      'Requesting User: BEROWA, PASAYOD'
      'Labor Fee blah blah'
      ''
      ''
      'Date:  2014-04-12  13:51:00'
      'User: Rhodz'
      'Received RIV from IT (Mojeb) '
      ''
      ''
      'Date: 2014-04-12 14:00:00'
      'User: Sania'
      'Received RIV from Rhodz'
      ''
      ''
      'Date: 2014-04-12  15:00:00'
      'User: Sania'
      'RIV has incomplete signatures, returning to Rhodz'
      'User Sania changed Assigned User to Rhodz')
    MaxLength = 1000
    TabOrder = 0
  end
  object cboDefectUser: TComboBox
    Left = 135
    Top = 244
    Width = 322
    Height = 21
    ItemHeight = 13
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 160
    Top = 284
    Width = 75
    Height = 25
    Caption = 'Save'
    Default = True
    TabOrder = 2
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 256
    Top = 284
    Width = 75
    Height = 25
    TabOrder = 3
    Kind = bkCancel
  end
  object cboAssignedUser: TComboBox
    Left = 135
    Top = 212
    Width = 322
    Height = 21
    ItemHeight = 13
    TabOrder = 4
    Visible = False
  end
end
