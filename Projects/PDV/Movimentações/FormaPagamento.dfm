object FrmPagamento: TFrmPagamento
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Forma de Pagamento'
  ClientHeight = 108
  ClientWidth = 255
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 50
    Top = 24
    Width = 158
    Height = 21
    Caption = 'Forma de Pagamento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object pagarDinheiro: TButton
    Left = 43
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Dinheiro'
    TabOrder = 0
    OnClick = pagarDinheiroClick
  end
  object pagarCartao: TButton
    Left = 139
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Cart'#227'o'
    TabOrder = 1
    OnClick = pagarCartaoClick
  end
end
