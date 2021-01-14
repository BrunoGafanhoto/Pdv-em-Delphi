object FrmPossuidor: TFrmPossuidor
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Nome do Possuidor do Software'
  ClientHeight = 114
  ClientWidth = 306
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object edtNomePossuior: TEdit
    Left = 40
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 167
    Top = 54
    Width = 75
    Height = 25
    Caption = 'Enviar'
    TabOrder = 1
    OnClick = Button1Click
  end
end
