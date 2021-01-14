object FrmBuscarProduto: TFrmBuscarProduto
  Left = 0
  Top = 0
  Caption = 'Buscar Produto'
  ClientHeight = 390
  ClientWidth = 857
  Color = clInactiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 51
    Width = 86
    Height = 16
    Caption = 'Buscar Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtBuscarProduto: TEdit
    Left = 108
    Top = 50
    Width = 330
    Height = 21
    TabOrder = 0
    OnChange = edtBuscarProdutoChange
  end
  object grid_func: TDBGrid
    Left = 8
    Top = 105
    Width = 841
    Height = 225
    Color = clBtnFace
    DataSource = dm.DSProdutos
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = grid_funcDblClick
    OnKeyDown = grid_funcKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'codigo'
        Width = 37
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Width = 306
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Width = 153
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'estoque'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'imagem'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ultima_compra'
        Visible = True
      end>
  end
end
