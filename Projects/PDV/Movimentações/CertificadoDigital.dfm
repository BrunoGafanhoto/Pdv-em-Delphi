object FrmCertificado: TFrmCertificado
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Certificado Digital'
  ClientHeight = 383
  ClientWidth = 637
  Color = clInactiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 338
    Width = 637
    Height = 45
    Align = alBottom
    TabOrder = 0
    ExplicitLeft = -21
    ExplicitTop = 192
    ExplicitWidth = 658
    DesignSize = (
      637
      45)
    object BitBtn1: TBitBtn
      Left = 415
      Top = 5
      Width = 88
      Height = 30
      Anchors = [akTop, akRight]
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 0
      ExplicitLeft = 436
    end
    object BitBtn2: TBitBtn
      Left = 527
      Top = 5
      Width = 88
      Height = 30
      Anchors = [akTop, akRight]
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 1
      ExplicitLeft = 548
    end
  end
  object StringGrid1: TStringGrid
    Left = 0
    Top = 0
    Width = 637
    Height = 338
    Align = alClient
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing]
    TabOrder = 1
    ExplicitLeft = -21
    ExplicitWidth = 658
    ExplicitHeight = 192
  end
end
