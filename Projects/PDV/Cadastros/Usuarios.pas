unit Usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls;

type
  TFrmUsuarios = class(TForm)
    EdtNome: TEdit;
    Label2: TLabel;
    grid_usu: TDBGrid;
    BtnNovo: TSpeedButton;
    BtnSalvar: TSpeedButton;
    BtnExcluir: TSpeedButton;
    BtnEditar: TSpeedButton;
    EdtBuscarNome: TEdit;
    Label1: TLabel;
    BtnBuscarFunc: TSpeedButton;
    EdtUsuario: TEdit;
    EdtSenha: TEdit;
    procedure BtnBuscarFuncClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure EdtBuscarNomeChange(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure grid_usuCellClick(Column: TColumn);
    procedure BtnExcluirClick(Sender: TObject);
  private
    { Private declarations }

    procedure limpar;
     procedure habilitarCampos;
     procedure desabilitarCampos;
     procedure associarCampos;
     procedure buscarNome;
     procedure listar;
  public
    { Public declarations }
  end;

var
  FrmUsuarios: TFrmUsuarios;
  id : string;
  usuarioAntigo : string;

implementation

{$R *.dfm}

uses Modulo, Funcionarios;

procedure TFrmUsuarios.associarCampos;
begin
dm.tb_usuarios.FieldByName('nome').Value := EdtNome.Text;
dm.tb_usuarios.FieldByName('usuario').Value := EdtUsuario.Text;
dm.tb_usuarios.FieldByName('senha').Value := EdtSenha.Text;
dm.tb_usuarios.FieldByName('cargo').Value := cargoFunc;
dm.tb_usuarios.FieldByName('id_funcionario').Value := idFunc;
end;

procedure TFrmUsuarios.BtnBuscarFuncClick(Sender: TObject);

begin
chamada := 'Func';
limpar;
EdtUsuario.SetFocus;

FrmFuncionarios := TFrmFuncionarios.create(self);
FrmFuncionarios.Show;

end;
      // BOTAO EDITAR
      // BOTAO EDITAR
      // BOTAO EDITAR
      // BOTAO EDITAR
procedure TFrmUsuarios.BtnEditarClick(Sender: TObject);
var
usuario : string;

begin
   if EdtUsuario.Text = '' then
    BEGIN
    MessageDlg('Preencha o campo Usu�rio!', MtInformation, mbOKCancel ,0);
    EdtUsuario.SetFocus;
    exit;
    END;

    if EdtSenha.Text = '' then
    BEGIN
    MessageDlg('Preencha o campo Senha!', MtInformation, mbOKCancel ,0);
    EdtSenha.SetFocus;
    exit;
    END;



    //Verifica�ao de Usu�rio existente
    if usuarioAntigo <> EdtUsuario.Text then
       begin
       dm.query_usuarios.Close;
       dm.query_usuarios.SQL.Clear;
       dm.query_usuarios.SQL.Add('Select * FROM usuarios where usuario = ' + QuotedStr(trim(EdtUsuario.Text)));
       dm.query_usuarios.open;


     if not dm.query_usuarios.IsEmpty then
        begin
          usuario := dm.query_usuarios['usuario'];
          MessageDlg('O Usu�rio ' + usuario + 'j� existe no banco de dados!', mtInformation, mbOKCancel,0);
          EdtUsuario.Text := '';
          EdtUsuario.SetFocus;
          exit;
        end;

    end;


   // associarCampos;
    dm.query_usuarios.close;
    dm.query_usuarios.SQL.Clear;
    dm.query_usuarios.SQL.Add('UPDATE usuarios set nome = :nome, usuario = :usuario, senha = :senha where id = :id') ;
    dm.query_usuarios.ParamByName('nome').Value := EdtNome.Text;
    dm.query_usuarios.ParamByName('usuario').Value := EdtUsuario.Text;
    dm.query_usuarios.ParamByName('senha').Value := EdtSenha.Text;
    dm.query_usuarios.ParamByName('id').Value := id;
    dm.query_usuarios.ExecSQL;

    listar;
     MessageDlg('Usu�rio Editado com Sucesso!', mtInformation, mbOKCancel,0);
    desabilitarCampos;
    BtnSalvar.Enabled := false;
    BtnExcluir.Enabled := false;
    limpar;

end;

procedure TFrmUsuarios.BtnExcluirClick(Sender: TObject);
begin
 if MessageDlg('Deseja excluir esse registro?', mtConfirmation,[mbYes,mbNo],0) = mrYes then
 begin
    dm.query_usuarios.close;
    dm.query_usuarios.SQL.Clear;
    dm.query_usuarios.SQL.Add('Delete from usuarios where id = :id');
    dm.query_usuarios.ParamByName('id').Value := id;
    dm.query_usuarios.ExecSQL;
 Messagedlg('Excluido com Sucesso!', mtInformation, mbOKCancel ,0);
 limpar;
 desabilitarCampos;
 listar;
 BtnEditar.Enabled := false;
 BtnSalvar.Enabled := false;
 BtnExcluir.Enabled := false;
 end;

end;

procedure TFrmUsuarios.BtnNovoClick(Sender: TObject);
begin
BtnBuscarFunc.Enabled := true;
BtnSalvar.Enabled := true;
BtnExcluir.Enabled := false;
BtnEditar.Enabled := false;
limpar;
habilitarCampos;
dm.tb_usuarios.Insert; //N�O ADIANTA MONTAR O CODIGO SE NAO POR ISSOEdtNome.Enabled := false;
end;

procedure TFrmUsuarios.BtnSalvarClick(Sender: TObject);
var
usuario : string;

begin
    if Trim(EdtNome.text) = '' then
    begin
    MessageDlg('Preencha o campo nome!', mtInformation , mbOKCancel ,0);
    EdtNome.SetFocus;
    EXIT;
    end;

    if Trim(EdtUsuario.Text) = '' then
    begin
      MessageDlg('Preencha o campo usu�rio!', mtInformation , mbOKCancel ,0);
      EdtUsuario.SetFocus;
      exit;
    end;

    if Trim(EdtSenha.Text) = '' then
    begin
      MessageDlg('Preencha o campo senha!', mtInformation, mbOKCancel ,0);
      EdtSenha.SetFocus;
      exit;
    end;

    //VERIFICA��O DE NOME
    dm.query_usuarios.Close;
    dm.query_usuarios.SQL.Clear;
    dm.query_usuarios.SQL.Add('SELECT * FROM usuarios where usuario = ' + QuotedStr(trim(EdtUsuario.Text)));
    dm.query_usuarios.open;

    if not dm.query_usuarios.IsEmpty then
    begin
    usuario := dm.query_usuarios['usuario'];
    MessageDlg('O Usu�rio ' + usuario + ' j� est� cadastrado!', mtInformation , mbOKCancel ,0);
    EdtUsuario.Text := '';
    EdtSenha.Text := '';
    EdtUsuario.SetFocus;
    exit;
    end;

     if MessageDlg('Deseja salvar?', mtConfirmation, mbYesNo, 0) = mrYes then
        begin
          associarCampos;
          dm.tb_usuarios.Post;
          MessageDlg('O Usu�rio foi cadastrado com sucesso!!', mtInformation, mbOKCancel,0);
          limpar;
          desabilitarCampos;
          BtnSalvar.enabled := false;
          listar;
        end;



end;

procedure TFrmUsuarios.buscarNome;
begin
   dm.query_usuarios.Close;
   dm.query_usuarios.SQL.Clear;
   dm.query_usuarios.SQL.Add('Select * from usuarios where nome LIKE :nome and cargo <> :cargo order by nome asc'); //LIKE PRA BUSCAR FE FORMA APROXIMADA
   dm.query_usuarios.ParamByName('nome').Value := EdtBuscarNome.Text + '%';  // PORCENTAGEM PQ TO USANDO LIKE
    dm.query_usuarios.ParamByName('cargo').Value := 'Admin';
   dm.query_usuarios.Open;
end;

procedure TFrmUsuarios.desabilitarCampos;
begin
    EdtNome.Enabled := false;
    EdtUsuario.Enabled := false;
    EdtSenha.Enabled := false;
    BtnBuscarFunc.Enabled := false;
 
end;

procedure TFrmUsuarios.EdtBuscarNomeChange(Sender: TObject);
begin
    if EdtBuscarNome.text <> '' then
    begin
      buscarNome;
    end
    else
    begin
      listar;
    end;
end;

procedure TFrmUsuarios.FormActivate(Sender: TObject);
begin
EdtNome.Text := nomeFunc;

end;

procedure TFrmUsuarios.FormShow(Sender: TObject);
begin
desabilitarCampos;
dm.tb_usuarios.Active := true;
listar;
end;

procedure TFrmUsuarios.grid_usuCellClick(Column: TColumn);
begin
    habilitarCampos;
    BtnSalvar.Enabled := false;
    BtnEditar.Enabled := true;
    BtnExcluir.Enabled := true;

    dm.tb_usuarios.Edit; // N�O ADIANTA CONSTRUIR O COD SEM ISSO

    if dm.query_usuarios.FieldByName('nome').value <> null then
    EdtNome.Text := dm.query_usuarios.fieldbyname('nome').Value;
    EdtUsuario.Text := dm.query_usuarios.FieldByName('usuario').Value;
    EdtSenha.Text := dm.query_usuarios.FieldByName('senha').Value;

     id := dm.query_usuarios.FieldByName('id').Value;
     //IdFunc := dm.query_usuarios.FieldByName('id_funcionario').Value;
     cargoFunc := dm.query_usuarios.FieldByName('cargo').Value;
    usuarioAntigo := dm.query_usuarios.FieldByName('usuario').Value;
end;


procedure TFrmUsuarios.habilitarCampos;
begin

    EdtUsuario.Enabled := true;
    EdtSenha.Enabled := true;
    BtnBuscarFunc.Enabled := true;

end;

procedure TFrmUsuarios.limpar;
begin
    EdtNome.Text := '';
    EdtUsuario.Text := '';
    EdtSenha.Text := '';
end;

procedure TFrmUsuarios.listar;
begin
dm.query_func.Close;
   dm.query_usuarios.SQL.Clear;
   dm.query_usuarios.SQL.Add('Select * from usuarios where cargo <> :cargo order by nome asc');
   dm.query_usuarios.ParamByName('cargo').Value := 'Admin';
   dm.query_usuarios.Open;

end;

end.
