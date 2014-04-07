object FormComment: TFormComment
  Left = 1707
  Top = 397
  Width = 535
  Height = 366
  Caption = 'Add Comment'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
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
  end
  object MemoComment: TMemo
    Left = 16
    Top = 8
    Width = 481
    Height = 185
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
    TabOrder = 2
    OnClick = BitBtn1Click
    Kind = bkOK
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
  end
end
