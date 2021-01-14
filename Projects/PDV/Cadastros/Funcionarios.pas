unit Funcionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Data.DB,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids;

type
  TFrmFuncionarios = class(TForm)
    EdtBuscarNome: TEdit;
    rbNome: TRadioButton;
    rbCPF: TRadioButton;
    EdtBuscarCPF: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    EdtNome: TEdit;
    Label3: TLabel;
    EdtCPF: TMaskEdit;
    Label4: TLabel;
    EdtEnd: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    EdtTelefone: TMaskEdit;
    cbCargo: TComboBox;
    grid_func: TDBGrid;
    BtnNovo: TSpeedButton;
    BtnSalvar: TSpeedButton;
    BtnExcluir: TSpeedButton;
    BtnEditar: TSpeedButton;
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure grid_funcCellClick(Column: TColumn);
    procedure BtnExcluirClick(Sender: TObject);
    procedure EdtBuscarNomeChange(Sender: TObject);
    procedure EdtBuscarCPFChange(Sender: TObject);
    procedure rbNomeClick(Sender: TObject);
    procedure rbCPFClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grid_funcDblClick(Sender: TObject);
  private
    { Private declarations }

     procedure limpar;
     procedure habilitarCampos;
     procedure desabilitarCampos;


     procedure associarCampos;
    procedure listar;

    procedure carregarComboBox;
    procedure buscarNome;
    procedure buscarCPF;



  public
    { Public declarations }
  end;

var
  FrmFuncionarios: TFrmFuncionarios;
  id : string;
  cpfAntigo : string;
implementation

{$R *.dfm}

uses Modulo;

procedure TFrmFuncionarios.associarCampos;
begin
dm.tb_func.FieldByName('nome').Value := EdtNome.Text;
dm.tb_func.FieldByName('cpf').Value := EdtCPF.Text;
dm.tb_func.FieldByName('telefone').Value := EdtTelefone.Text;
dm.tb_func.FieldByName('endereco').Value := EdtEnd.Text;
dm.tb_func.FieldByName('cargo').Value := cbCargo.Text;
dm.tb_func.FieldByName('data').Value := DateToStr(Date);/////////   /////////////

end;

procedure TFrmFuncionarios.BtnEditarClick(Sender: TObject);
  var
  cpf : string;
begin
  if Trim(EdtNome.Text) = '' then
  begin
  MessageDlg('Preencha o campo nome!', mtInformation , mbOKCancel  ,0);
  EdtNome.SetFocus;
  exit;
  end;

   if Trim(cbCargo.Text) = '' then
  begin
  MessageDlg('Escolha um Cargo!', mtInformation , mbOKCancel  ,0);
  cbCargo.SetFocus;
  exit;
  end;

   if cpfAntigo <> EdtCPF.Text then
   begin


      //VERIFICAÇÃO DE CPF
      dm.query_func.Close;
      dm.query_func.SQL.Clear;
      dm.query_func.SQL.Add('SELECT * FROM funcionarios where cpf = ' + QuotedStr(trim(EdtCPF.Text)));
      dm.query_func.open;


     if not dm.query_func.IsEmpty then
      begin
      cpf := dm.query_func['cpf'];
      messageDlg('O CPF ' + cpf + ' já está cadastrado!' , mtInformation , mbOKCANCEL , 0);
      EdtCPF.SetFocus;
      listar;
      Exit;
      end;

    end;



  if MessageDlg('Deseja editar esse registro?', mtConfirmation, mbYesNo, 0) = mrYes then
    begin
      associarCampos;
      dm.query_func.Close;
      dm.query_func.SQL.Clear;
      dm.query_func.SQL.Add('UPDATE funcionarios set nome = :nome, cpf = :cpf, telefone = :telefone, endereco = :endereco, cargo = :cargo where id = :id');// ('UPDATE funcionarios set cpf = :cpf');
      dm.query_func.ParamByName('nome').value := EdtNome.Text;
      dm.query_func.ParamByName('cpf').value := EdtCPF.Text;
      dm.query_func.ParamByName('telefone').value := EdtTelefone.Text;
      dm.query_func.ParamByName('endereco').Value := EdtEnd.Text;
      dm.query_func.ParamByName('cargo').Value := cbCargo.Text;
      dm.query_func.ParamByName('id').Value := id;
      dm.query_func.ExecSQL;

      //MUDAR CARGO DOS USUARIOS ASSOCIADO A ELE
      dm.query_usuarios.Close;
      dm.query_usuarios.SQL.Clear;
      DM.query_usuarios.SQL.Add('UPDATE usuarios set cargo = :cargo where id_funcionario = :id');
      dm.query_usuarios.ParamByName('cargo').Value := cbCargo.Text;
      dm.query_usuarios.ParamByName('id').Value := id;
      dm.query_usuarios.ExecSQL;


      listar;
      MessageDlg('Editado com Sucesso', mtInformation, mbOKCancel, 0);
      desabilitarCampos;
      BtnSalvar.Enabled := false;
      BtnEditar.Enabled := false;
      BtnExcluir.Enabled := false;
      limpar;
    end;



end;

procedure TFrmFuncionarios.BtnExcluirClick(Sender: TObject);
begin
 if MessageDlg('Deseja excluir esse registro?', mtConfirmation,[mbYes,mbNo],0) = mrYes then
 begin
 dm.query_func.Close;
 dm.query_func.SQL.Clear;
 dm.query_func.sql.Add('DELETE FROM funcionarios where id = :id');
 dm.query_func.ParamByName('id').Value := id;
 dm.query_func.Execute;
 Messagedlg('Excluido com Sucesso!', mtInformation, mbOKCancel ,0);
 limpar;
 // DELETAR TAMBÉM O USUÁRIO ASSOCIADO A ELE

 dm.query_func.Close;
 dm.query_func.SQL.Clear;
 dm.query_func.sql.Add('DELETE FROM usuarios where id_funcionario = :id');
 dm.query_func.ParamByName('id').Value := id;
 dm.query_func.Execute;

  //---------------//-------//-----------------------//
 desabilitarCampos;
 listar;
 BtnEditar.Enabled := false;
 BtnSalvar.Enabled := false;
 BtnExcluir.Enabled := false;
 end;





end;

procedure TFrmFuncionarios.BtnNovoClick(Sender: TObject);
begin

limpar;
habilitarCampos;

dm.tb_func.Insert;
BtnEditar.Enabled := false;
BtnExcluir.Enabled := false;
BtnSalvar.Enabled := true;

end;

procedure TFrmFuncionarios.BtnSalvarClick(Sender: TObject);
  var
cpf : string;


begin
    if trim(EdtNome.text) = '' then
    begin
      MessageDlg('Preencha o Campo' , mtInformation, mbOKCancel,0);
      EdtNome.SetFocus;
      exit;
    end;

    if trim(cbCargo.Text) = '' then
    begin
    MessageDlg('Preencha um Cargo', mtInformation, mbOKCancel ,0);
    cbCargo.SetFocus;
    exit;
    end;

   //if trim(EdtCPF.Text) = '' then
   // MessageDlg('Preencha o campo CPF', mtInformation, mbOKCancel,0);
   // EdtCPF.Text := '';
   // EdtCPF.SetFocus;
   // exit;

    //VERIFICAR SE O CARGO JA ESTÁ CADASTRADO
    dm.query_func.Close;
    dm.query_func.SQL.clear;
    dm.query_func.SQL.Add('SELECT * FROM funcionarios where cpf = ' + QuotedStr(trim(EdtCPF.text))); //QUOTEDSTR É PRO BANCO ACEITAR O CAMANDO TRIM DE IGNORAR ESPARÇOS
    dm.query_func.Open; // inicia a query /abrir

    if not dm.query_func.IsEmpty then  // empty sem o not é pra verificar se o campo está vazio e com o not é pra verificar se tem valor
    begin
        cpf := dm.query_func['cpf'];
      MessageDlg('O CPF ' + cpf + ' já existe no banco de Dados!', mtInformation, MbOKCancel,0);
      EdtCPF.Text := '';
      EdtCPF.SetFocus;
      exit;
    end;
      //
     if MessageDlg('Deseja salvar?', mtConfirmation, mbYesNo, 0) = mrYes then
        begin

          associarCampos;
          dm.tb_func.Post;
          MessageDlg('Salvo com Sucesso', mtInformation, mbOKCancel,0);
          limpar;
          desabilitarCampos;
          BtnSalvar.Enabled := false;
          listar;
        end;


end;



procedure TFrmFuncionarios.buscarCPF;
begin

   dm.query_func.Close;
   dm.query_func.SQL.Clear;
   dm.query_func.SQL.Add('Select * from funcionarios where cpf = :cpf');
   dm.query_func.ParamByName('cpf').Value := EdtBuscarCPF.Text;
   dm.query_func.Open;
   
end;

procedure TFrmFuncionarios.buscarNome;
begin
    dm.query_func.Close;
   dm.query_func.SQL.Clear;
   dm.query_func.SQL.Add('Select * from funcionarios where nome LIKE :nome order by nome asc'); //LIKE PRA BUSCAR FE FORMA APROXIMADA
   dm.query_func.ParamByName('nome').Value := EdtBuscarNome.Text + '%';  // PORCENTAGEM PQ TO USANDO LIKE
   dm.query_func.Open;
end;

procedure TFrmFuncionarios.carregarComboBox;
begin
 dm.query_cargos.close;
 dm.query_cargos.open;

   if not dm.query_cargos.IsEmpty then
   begin
     while not dm.query_cargos.Eof do
       begin
         cbCargo.Items.Add(dm.query_cargos.FieldByName('cargo').AsString);
         dm.query_cargos.Next;
       end;
   end;
   
end;

procedure TFrmFuncionarios.desabilitarCampos;
begin
   EdtNome.Enabled := false;
    EdtCPF.Enabled := false;
    EdtTelefone.Enabled := false;
    EdtEnd.Enabled := false;
    cbCargo.Enabled := false;
end;
      procedure TFrmFuncionarios.EdtBuscarCPFChange(Sender: TObject);
begin
    buscarCPF;






end;

procedure TFrmFuncionarios.EdtBuscarNomeChange(Sender: TObject);
begin
if EdtBuscarNome.Text <> '' then
  begin
  buscarNome;
  end
    else
    begin
    listar;
    end;
end;

//FORM CREATE
      //FORM CREATE
procedure TFrmFuncionarios.FormCreate(Sender: TObject);
begin
desabilitarCampos;     //procedimento
dm.tb_func.Active := true;      //ativando tabela

carregarComboBox; //chamando combobox
cbCargo.ItemIndex := 0; // Chamando o 1º valor da combobox ao abrir o form
EdtBuscarCPF.Visible := false;

listar;

end;



procedure TFrmFuncionarios.FormShow(Sender: TObject);
begin
rbNome.Checked := true;
end;

procedure TFrmFuncionarios.grid_funcCellClick(Column: TColumn);
begin
  habilitarCampos;

  BtnEditar.enabled := true;
  BtnExcluir.enabled := true;

  dm.tb_func.Edit; // Abrir edição


  if  dm.query_func.FieldByName('cpf').Value <> null then  // qualquer campo q n seja nulo

  EdtNome.Text := dm.query_func.FieldByName('nome').Value;
  EdtCPF.Text := dm.query_func.FieldByName('cpf').Value;
  cbCargo.Text := dm.query_func.FieldByName('cargo').Value;

  if  dm.query_func.FieldByName('telefone').Value <> null then
  EdtTelefone.Text := dm.query_func.FieldByName('telefone').Value;

  if  dm.query_func.FieldByName('endereco').Value <> null then
  EdtEnd.Text := dm.query_func.FieldByName('endereco').Value;


  id := dm.query_func.FieldByName('id').Value;

   cpfAntigo := dm.query_func.FieldByName('cpf').Value;


end;

procedure TFrmFuncionarios.grid_funcDblClick(Sender: TObject);
begin
if chamada = 'Func' then
begin
  idFunc := dm.query_func.FieldByName('id').Value;
  nomeFunc := dm.query_func.FieldByName('nome').Value;
  cargoFunc := dm.query_func.FieldByName('cargo').Value;
  Close;
  chamada := '';
end;


end;

procedure TFrmFuncionarios.habilitarCampos;
begin
  EdtNome.Enabled := true;
    EdtCPF.Enabled := true;
    EdtTelefone.Enabled := true;
    EdtEnd.Enabled := true;
    cbCargo.Enabled := true;
end;

procedure TFrmFuncionarios.limpar;
begin
    EdtNome.text := '';
    EdtCPF.Text := '';
    EdtTelefone.Text := '';
    EdtEnd.Text := '';
end;

procedure TFrmFuncionarios.listar;
begin
   dm.query_func.Close;
   dm.query_func.SQL.Clear;
   dm.query_func.SQL.Add('Select * from funcionarios order by nome asc');
   dm.query_func.Open;
end;

procedure TFrmFuncionarios.rbCPFClick(Sender: TObject);
begin
listar;
EdtBuscarNome.Visible := false;
EdtBuscarCPF.Visible := true;
EdtBuscarCPF.SetFocus;
end;

procedure TFrmFuncionarios.rbNomeClick(Sender: TObject);
begin
listar;
EdtBuscarCPF.Visible := false;
EdtBuscarNome.Visible := true;
EdtBuscarNome.SetFocus;
end;

end.
