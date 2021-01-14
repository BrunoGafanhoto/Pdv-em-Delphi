unit CertificadoDigital;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  Vcl.ExtCtrls;

type
  TFrmCertificado = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    StringGrid1: TStringGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCertificado: TFrmCertificado;

implementation

{$R *.dfm}

end.
                          object Panel1: TPanel
  Left = 0
  Top = 192
  Width = 658
  Height = 45
  Align = alBottom
  TabOrder = 1
  DesignSize = (
    658
    45)
  object BitBtn1: TBitBtn
    Left = 436
    Top = 5
    Width = 88
    Height = 30
    Anchors = [akTop, akRight]
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 0
  end
  object BitBtn2: TBitBtn
    Left = 548
    Top = 5
    Width = 88
    Height = 30
    Anchors = [akTop, akRight]
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
  end
end
object StringGrid1: TStringGrid
  Left = 0
  Top = 0
  Width = 658
  Height = 192
  Align = alClient
  FixedCols = 0
  RowCount = 2
  Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing]
  TabOrder = 0
  ExplicitHeight = 186
end
