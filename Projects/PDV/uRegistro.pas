unit uRegistro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrmRegistro = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtCodigo: TEdit;
    edtcodLiberacao: TEdit;
    Button1: TButton;
    procedure edtcodLiberacaoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRegistro: TFrmRegistro;

implementation

{$R *.dfm}

uses Modulo, onguard, ogutil;
const
  EncryptionKey : TKey = ($E5, $1A, $84, $D6, $92, $C9, $DF, $D8,
                          $1A, $FC, $6F, $84, $AB, $FC, $DF, $B4);
procedure TFrmRegistro.Button1Click(Sender: TObject);
var
  Key : TKey;
  Code : TCode;
  Modifier : Longint;
  D,  dVCTO  : TDateTime;
  cStatus : string;


begin

    Key := EncryptionKey;
    Modifier := StringHashELF(edtCodigo.Text);
    ApplyModifierToKeyPrim(Modifier, Key, SizeOf(Key));
    HexToBuffer(edtcodLiberacao.Text, Code, SizeOf(Code));
    dVCTO := GetExpirationDate(Key,Code);
    if IsRegCodeValid(Key, Code) then begin
      if IsRegCodeExpired(Key, Code) then
        cStatus := 'Registro Expirado'
      else
        cStatus := 'Registro Valido';
    end else
      cStatus := 'Registro Invalido';

      if cStatus <> 'Registro Valido' then
        begin
          showMessage('Registro inv�lido, favor entrar em contato com o suporte');
          Application.Terminate;
        end
         else
            begin
            dm.tb_registro.First;
            if dm.tb_registro.RecordCount > 0 then
            dm.tb_registro.Edit
            else
            dm.tb_registro.Insert;
            dm.tb_registrocod_liberacao.Value := edtcodliberacao.text;
            dm.tb_registrocodigo.Value := edtcodigo.text;
            dm.tb_registrodata_vencimento.Value := dVCTO;
            dm.tb_registroultimo_acesso.Value := date;
            dm.tb_registro.post;
            dm.tb_registro.ApplyUpdates;
            showMessage('O sistema ser� encerrado para validar a chave');
            application.Terminate;

            end;



end;

procedure TFrmRegistro.edtcodLiberacaoChange(Sender: TObject);
(*var
  Key : TKey;
  Code : TCode;
  Modifier : Longint;
  D,  dVCTO  : TDateTime;
  cStatus : string;
   *)

begin

   (* Key := EncryptionKey;
    Modifier := StringHashELF(edtCodigo.Text);
    ApplyModifierToKeyPrim(Modifier, Key, SizeOf(Key));
    HexToBuffer(edtcodLiberacao.Text, Code, SizeOf(Code));
    dVCTO := GetExpirationDate(Key,Code);
    if IsRegCodeValid(Key, Code) then begin
      if IsRegCodeExpired(Key, Code) then
        cStatus := 'Registro Expirado'
      else
        cStatus := 'Registro Valido';
    end else
      cStatus := 'Registro Invalido';

      if cStatus <> 'Registro Valido' then
        begin
          showMessage('Registro inv�lido, favor entrar em contato com o suporte');
          Application.Terminate;
        end
         else
            begin
            dm.tb_registro.First;
            if dm.tb_registro.RecordCount > 0 then
            dm.tb_registro.Edit
            else
            dm.tb_registro.Insert;
            dm.tb_registrocod_liberacao.Value := edtcodliberacao.text;
            dm.tb_registrocodigo.Value := edtcodigo.text;
            dm.tb_registrodata_vencimento.Value := dVCTO;
            dm.tb_registroultimo_acesso.Value := date;
            dm.tb_registro.post;
            dm.tb_registro.ApplyUpdates;
            showMessage('O sistema ser� encerrado para validar a chave');
            application.Terminate;

            end;

           *)

end;

procedure TFrmRegistro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

procedure TFrmRegistro.FormShow(Sender: TObject);
begin
edtCodigo.Text := hd;
end;

end.
