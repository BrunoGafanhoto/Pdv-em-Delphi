unit FormaPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrmPagamento = class(TForm)
    pagarDinheiro: TButton;
    pagarCartao: TButton;
    Label1: TLabel;
    procedure pagarDinheiroClick(Sender: TObject);
    procedure pagarCartaoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPagamento: TFrmPagamento;

implementation

{$R *.dfm}

uses Modulo, Vendas;

procedure TFrmPagamento.FormDestroy(Sender: TObject);
begin
pagamentoo:= '';
pagamentodirr := '';
frmPagamento.Close;
end;

procedure TFrmPagamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
pagamentoo:= '';
pagamentodirr := '';
frmPagamento.Close;
end;

procedure TFrmPagamento.pagarCartaoClick(Sender: TObject);
begin

    if chamadaPagamento = 'Forma' then
       begin
         pagamentoo:= 'Cart�o';

         close;
         chamadaPagamento := '';
       end;


    if chamadaPagamento = 'FormaDireta' then
       begin
         pagamentodirr := 'Cart�o';
         close;
         chamadaPagamento := '';
       end;


end;


procedure TFrmPagamento.pagarDinheiroClick(Sender: TObject);
begin
     if chamadaPagamento = 'Forma' then
         begin
           pagamentoo := 'Dinheiro';
           close;
           chamadaPagamento := '';
         end;

     if chamadaPagamento = 'FormaDireta' then
         begin
           pagamentodirr := 'Dinheiro';
           close;
           chamadaPagamento := '';
         end;


end;

end.
