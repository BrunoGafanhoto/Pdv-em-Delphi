object FrmMovimentacoes: TFrmMovimentacoes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Movimenta'#231#245'es'
  ClientHeight = 401
  ClientWidth = 778
  Color = clInactiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 576
    Top = 40
    Width = 52
    Height = 13
    Caption = 'Data Final:'
  end
  object Label2: TLabel
    Left = 348
    Top = 40
    Width = 57
    Height = 13
    Caption = 'Data Inicial:'
  end
  object Label3: TLabel
    Left = 30
    Top = 35
    Width = 72
    Height = 13
    Caption = 'Entrada/Saida:'
  end
  object Label4: TLabel
    Left = 40
    Top = 364
    Width = 47
    Height = 13
    Caption = 'Entradas:'
  end
  object Label5: TLabel
    Left = 160
    Top = 364
    Width = 35
    Height = 13
    Caption = 'Saidas:'
  end
  object Label6: TLabel
    Left = 648
    Top = 364
    Width = 28
    Height = 13
    Caption = 'Total:'
  end
  object lblVlrEntradas: TLabel
    Left = 93
    Top = 362
    Width = 7
    Height = 16
    Caption = '0'
    Color = clLime
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object lblVlrSaidas: TLabel
    Left = 201
    Top = 362
    Width = 7
    Height = 16
    Caption = '0'
    Color = clLime
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object lblTotal: TLabel
    Left = 682
    Top = 362
    Width = 7
    Height = 16
    Caption = '0'
    Color = clLime
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object gridVendas: TDBGrid
    Left = 24
    Top = 79
    Width = 740
    Height = 263
    Color = clBtnFace
    DataSource = dm.DSMov
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object dataFinal: TDateTimePicker
    Left = 635
    Top = 33
    Width = 129
    Height = 21
    Date = 44076.000000000000000000
    Time = 0.899097685185552100
    TabOrder = 1
    OnChange = dataFinalChange
  end
  object dataInicial: TDateTimePicker
    Left = 411
    Top = 32
    Width = 129
    Height = 21
    Date = 44076.000000000000000000
    Time = 0.899097685185552100
    TabOrder = 2
    OnChange = dataInicialChange
  end
  object cbEntradaSaida: TComboBox
    Left = 108
    Top = 32
    Width = 145
    Height = 21
    TabOrder = 3
    OnChange = cbEntradaSaidaChange
    Items.Strings = (
      'Tudo'
      'Entrada'
      'Saida')
  end
end
