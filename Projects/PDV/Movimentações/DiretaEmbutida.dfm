object FrmVendaEmbutida: TFrmVendaEmbutida
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Venda Direta Embutida'
  ClientHeight = 402
  ClientWidth = 373
  Color = clInactiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 80
    Top = 16
    Width = 238
    Height = 24
    Caption = 'VENDA DIRETA EMBUTIDA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 29
    Top = 459
    Width = 76
    Height = 16
    Caption = 'QUANTIDADE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 29
    Top = 474
    Width = 100
    Height = 16
    Caption = 'PRE'#199'O UNIT'#193'RIO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 144
    Top = 165
    Width = 76
    Height = 16
    Caption = 'QUANTIDADE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 145
    Top = 250
    Width = 82
    Height = 16
    Caption = 'VALOR TOTAL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 145
    Top = 325
    Width = 56
    Height = 16
    Caption = 'ESTOQUE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel
    Left = 81
    Top = 309
    Width = 220
    Height = 18
    Cursor = crHandPoint
    Caption = 'PRODUTO N'#195'O CADASTRADO'
    Color = clBtnText
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lblEstoque: TLabel
    Left = 81
    Top = 309
    Width = 151
    Height = 18
    Cursor = crHandPoint
    Caption = 'PRODUTO EM FALTA'
    Color = clBtnText
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object edtCodBarras: TEdit
    Left = 16
    Top = 87
    Width = 345
    Height = 56
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnChange = edtCodBarrasChange
  end
  object Panel2: TPanel
    Left = 16
    Top = 46
    Width = 345
    Height = 35
    Caption = 'CODIGO DE BARRAS'
    Color = clHotLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlightText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 3
  end
  object EdtQuantidade: TEdit
    Left = 144
    Top = 187
    Width = 101
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = '1'
    OnExit = EdtQuantidadeExit
  end
  object EdtPreco: TEdit
    Left = 144
    Top = 272
    Width = 99
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = EdtPrecoChange
  end
  object edtEstoque: TEdit
    Left = 145
    Top = 347
    Width = 100
    Height = 31
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object MediaPlayer1: TMediaPlayer
    Left = 96
    Top = 214
    Width = 253
    Height = 30
    DoubleBuffered = True
    Visible = False
    ParentDoubleBuffered = False
    TabOrder = 5
  end
  object pnlEstoque: TPanel
    Left = 16
    Top = 272
    Width = 59
    Height = 54
    Cursor = crHandPoint
    Color = clCream
    ParentBackground = False
    TabOrder = 6
  end
end
