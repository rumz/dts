object FormTicket: TFormTicket
  Left = 145
  Top = 34
  Width = 1175
  Height = 711
  Align = alClient
  Caption = 'Ticket Details'
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
  object Label6: TLabel
    Left = 44
    Top = 223
    Width = 37
    Height = 16
    Caption = 'Status'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 218
    Width = 1167
    Height = 466
    Align = alClient
    Caption = 'Comments'
    TabOrder = 0
    object lsvComments: TListView
      Left = 304
      Top = 96
      Width = 845
      Height = 344
      Columns = <
        item
          Caption = 'ID'
          Width = 0
        end
        item
          Caption = 'User'
          Width = 165
        end
        item
          Caption = 'Comment'
          Width = 500
        end
        item
          Caption = 'Defect User'
          Width = 200
        end
        item
          Caption = 'Date'
          Width = 200
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
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      ViewStyle = vsReport
      Visible = False
    end
    object MemoComments: TMemo
      Left = 2
      Top = 15
      Width = 1163
      Height = 449
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1167
    Height = 218
    Align = alTop
    TabOrder = 1
    object Label2: TLabel
      Left = 31
      Top = 24
      Width = 45
      Height = 16
      Caption = 'Subject'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 32
      Top = 56
      Width = 71
      Height = 16
      Caption = 'Description '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 49
      Top = 148
      Width = 55
      Height = 16
      Caption = 'Category'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 353
      Top = 147
      Width = 89
      Height = 16
      Caption = 'Assigned User'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 41
      Top = 187
      Width = 63
      Height = 16
      Caption = 'Requester'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edtSubject: TEdit
      Left = 88
      Top = 22
      Width = 809
      Height = 21
      MaxLength = 200
      TabOrder = 0
    end
    object Memo_Description: TMemo
      Left = 32
      Top = 79
      Width = 864
      Height = 58
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Lines.Strings = (
        
          'Sometimes when the sky is blue, there are birds and insects flyi' +
          'ng around.  We do not know whether they are attracted to each ot' +
          'her, but it does '
        
          'seem like they are always together.  The land based animals, on ' +
          'the other hand, are not visible during light.')
      MaxLength = 255
      ParentFont = False
      TabOrder = 1
    end
    object cboCategory: TComboBox
      Left = 124
      Top = 144
      Width = 213
      Height = 24
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 2
    end
    object cboUser: TComboBox
      Left = 454
      Top = 143
      Width = 287
      Height = 24
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 3
    end
    object btnSave: TBitBtn
      Left = 456
      Top = 184
      Width = 75
      Height = 25
      Caption = 'Save'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = btnSaveClick
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
    object btnCancel: TBitBtn
      Left = 552
      Top = 184
      Width = 75
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnClick = btnCancelClick
      Kind = bkCancel
    end
    object btnComment: TBitBtn
      Left = 643
      Top = 184
      Width = 83
      Height = 25
      Caption = 'Add Comment'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnClick = btnCommentClick
    end
    object chkbox_isOpen: TCheckBox
      Left = 768
      Top = 148
      Width = 129
      Height = 17
      Caption = 'Close Ticket'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object cboRequester: TComboBox
      Left = 124
      Top = 183
      Width = 287
      Height = 24
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 4
    end
    object chkboxDonotcloseonSave: TCheckBox
      Left = 768
      Top = 172
      Width = 161
      Height = 17
      Caption = 'Do not close on Save'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
    end
  end
end
