object FormTicket: TFormTicket
  Left = 1372
  Top = 167
  Width = 1183
  Height = 744
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
    Height = 488
    Align = alClient
    Caption = 'Comments'
    TabOrder = 0
    object lsvComments: TListView
      Left = 2
      Top = 15
      Width = 1163
      Height = 471
      Align = alClient
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
      Left = 280
      Top = 184
      Width = 75
      Height = 25
      Caption = 'Save'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = btnSaveClick
      Kind = bkOK
    end
    object btnCancel: TBitBtn
      Left = 392
      Top = 184
      Width = 75
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = btnCancelClick
      Kind = bkCancel
    end
    object btnComment: TBitBtn
      Left = 507
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
      TabOrder = 7
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
      TabOrder = 4
    end
  end
end
