object FrmEntradasProdutos: TFrmEntradasProdutos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Entrada de Produtos'
  ClientHeight = 698
  ClientWidth = 943
  Color = clInactiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object painelGrid: TPanel
    Left = 0
    Top = 0
    Width = 603
    Height = 698
    Align = alClient
    Caption = 'painelGrid'
    Color = clInactiveCaption
    ParentBackground = False
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 1
      Top = 36
      Width = 601
      Height = 661
      TabStop = False
      Align = alClient
      DataSource = dm.DS_det_entradas
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 601
      Height = 35
      Align = alTop
      Caption = 'ITENS ADICIONADOS'
      Color = clHotLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      ExplicitWidth = 487
    end
  end
  object painelCentral: TPanel
    Left = 603
    Top = 0
    Width = 340
    Height = 698
    Align = alRight
    TabOrder = 1
    ExplicitLeft = 608
    object Label1: TLabel
      Left = 22
      Top = 176
      Width = 57
      Height = 16
      Caption = 'PRODUTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 22
      Top = 273
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
    object Label11: TLabel
      Left = 24
      Top = 235
      Width = 99
      Height = 13
      Caption = 'Buscar por nome: F8'
    end
    object Label10: TLabel
      Left = 14
      Top = 50
      Width = 169
      Height = 18
      Caption = 'F2 - FECHAR ENTRADA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 14
      Top = 74
      Width = 151
      Height = 18
      Caption = 'ESC -  APAGAR ITEM'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCodBarras: TEdit
      Left = 14
      Top = 106
      Width = 297
      Height = 56
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -40
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnChange = edtCodBarrasChange
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 338
      Height = 35
      Align = alTop
      Caption = 'CODIGO DE BARRAS'
      Color = clHotLight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
    end
    object edtProduto: TEdit
      Left = 16
      Top = 198
      Width = 217
      Height = 31
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object edtQuantidade: TEdit
      Left = 20
      Top = 295
      Width = 101
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '1'
      OnChange = EdtQuantidadeChange
    end
  end
  object nfce: TACBrNFe
    Configuracoes.Geral.SSLLib = libCustom
    Configuracoes.Geral.SSLCryptLib = cryWinCrypt
    Configuracoes.Geral.SSLHttpLib = httpWinHttp
    Configuracoes.Geral.SSLXmlSignLib = xsMsXml
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.ModeloDF = moNFCe
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'RJ'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.RespTec.IdCSRT = 0
    Left = 538
    Top = 584
  end
end
