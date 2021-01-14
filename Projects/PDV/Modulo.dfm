object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 963
  Width = 791
  object fd: TFDConnection
    Params.Strings = (
      'Database=pdv'
      'User_Name=root'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    AfterConnect = fdAfterConnect
    BeforeConnect = fdBeforeConnect
    Left = 24
    Top = 48
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    OnDriverCreated = FDPhysMySQLDriverLink1DriverCreated
    OnDriverDestroying = FDPhysMySQLDriverLink1DriverDestroying
    Left = 112
    Top = 72
  end
  object tb_Cargos: TFDTable
    IndexFieldNames = 'id'
    Connection = fd
    UpdateOptions.UpdateTableName = 'pdv.cargos'
    TableName = 'pdv.cargos'
    Left = 16
    Top = 128
  end
  object query_cargos: TFDQuery
    Connection = fd
    SQL.Strings = (
      'select * from cargos order by cargo asc')
    Left = 80
    Top = 120
    object query_cargosid: TFDAutoIncField
      DisplayLabel = 'ID'
      DisplayWidth = 4
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object query_cargoscargo: TStringField
      DisplayLabel = 'Cargo'
      DisplayWidth = 25
      FieldName = 'cargo'
      Origin = 'cargo'
      Required = True
      Size = 25
    end
  end
  object DSCargos: TDataSource
    DataSet = query_cargos
    Left = 152
    Top = 120
  end
  object tb_func: TFDTable
    IndexFieldNames = 'id'
    Connection = fd
    UpdateOptions.UpdateTableName = 'pdv.funcionarios'
    TableName = 'pdv.funcionarios'
    Left = 24
    Top = 312
  end
  object query_func: TFDQuery
    Connection = fd
    SQL.Strings = (
      'select * from funcionarios')
    Left = 96
    Top = 320
    object query_funcid: TFDAutoIncField
      DisplayWidth = 5
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object query_funcnome: TStringField
      DisplayWidth = 12
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 30
    end
    object query_funccpf: TStringField
      DisplayWidth = 15
      FieldName = 'cpf'
      Origin = 'cpf'
      Required = True
    end
    object query_functelefone: TStringField
      DisplayWidth = 15
      FieldName = 'telefone'
      Origin = 'telefone'
      Size = 15
    end
    object query_funcendereco: TStringField
      DisplayWidth = 43
      FieldName = 'endereco'
      Origin = 'endereco'
      Size = 50
    end
    object query_funccargo: TStringField
      DisplayWidth = 10
      FieldName = 'cargo'
      Origin = 'cargo'
      Required = True
      Size = 25
    end
    object query_funcdata: TDateField
      FieldName = 'data'
      Origin = 'data'
      Required = True
    end
  end
  object DSFunc: TDataSource
    DataSet = query_func
    Left = 160
    Top = 312
  end
  object tb_usuarios: TFDTable
    Connection = fd
    UpdateOptions.UpdateTableName = 'pdv.usuarios'
    TableName = 'pdv.usuarios'
    Left = 240
    Top = 328
  end
  object query_usuarios: TFDQuery
    Connection = fd
    SQL.Strings = (
      'select * from usuarios ')
    Left = 304
    Top = 312
    object query_usuariosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      Visible = False
    end
    object query_usuariosnome: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 15
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 30
    end
    object query_usuariosusuario: TStringField
      DisplayLabel = 'Usuario'
      DisplayWidth = 15
      FieldName = 'usuario'
      Origin = 'usuario'
      Required = True
      Size = 25
    end
    object query_usuariossenha: TStringField
      DisplayLabel = 'Senha'
      DisplayWidth = 10
      FieldName = 'senha'
      Origin = 'senha'
      Required = True
      Size = 25
    end
    object query_usuarioscargo: TStringField
      DisplayLabel = 'Cargo'
      DisplayWidth = 15
      FieldName = 'cargo'
      Origin = 'cargo'
      Required = True
      Size = 25
    end
    object query_usuariosid_funcionario: TIntegerField
      FieldName = 'id_funcionario'
      Origin = 'id_funcionario'
      Required = True
      Visible = False
    end
  end
  object DSUsuarios: TDataSource
    DataSet = query_usuarios
    Left = 376
    Top = 336
  end
  object tb_forn: TFDTable
    Connection = fd
    UpdateOptions.UpdateTableName = 'pdv.fornecedores'
    TableName = 'pdv.fornecedores'
    Left = 24
    Top = 232
  end
  object query_forn: TFDQuery
    Connection = fd
    SQL.Strings = (
      'select * from fornecedores ')
    Left = 80
    Top = 224
    object query_fornid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      Visible = False
    end
    object query_fornnome: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 15
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 25
    end
    object query_fornproduto: TStringField
      DisplayLabel = 'Produto'
      DisplayWidth = 18
      FieldName = 'produto'
      Origin = 'produto'
      Required = True
      Size = 25
    end
    object query_fornendereco: TStringField
      DisplayWidth = 20
      FieldName = 'endereco'
      Origin = 'endereco'
      Required = True
      Size = 50
    end
    object query_forntelefone: TStringField
      DisplayWidth = 12
      FieldName = 'telefone'
      Origin = 'telefone'
      Required = True
      Size = 15
    end
    object query_forndata: TDateField
      DisplayWidth = 10
      FieldName = 'data'
      Origin = 'data'
      Required = True
    end
  end
  object DSForn: TDataSource
    DataSet = query_forn
    Left = 136
    Top = 232
  end
  object tb_produtos: TFDTable
    IndexFieldNames = 'id'
    Connection = fd
    UpdateOptions.UpdateTableName = 'pdv.produtos'
    TableName = 'pdv.produtos'
    Left = 432
    Top = 320
  end
  object query_produtos: TFDQuery
    Active = True
    Connection = fd
    SQL.Strings = (
      'select * from produtos')
    Left = 496
    Top = 344
    object query_produtosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      Visible = False
    end
    object query_produtoscodigo: TStringField
      DisplayLabel = 'Codigo'
      DisplayWidth = 15
      FieldName = 'codigo'
      Origin = 'codigo'
      Required = True
      Size = 50
    end
    object query_produtosnome: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 15
      FieldName = 'nome'
      Origin = 'Nome'
      Required = True
      Size = 25
    end
    object query_produtosdescricao: TStringField
      DisplayLabel = 'Descricao'
      DisplayWidth = 18
      FieldName = 'descricao'
      Origin = 'descricao'
      Required = True
      Size = 35
    end
    object query_produtosvalor: TBCDField
      DisplayLabel = 'Valor'
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
      currency = True
      Precision = 10
      Size = 2
    end
    object query_produtoscusto: TBCDField
      FieldName = 'custo'
      Origin = 'custo'
      Required = True
      Visible = False
      Precision = 10
      Size = 2
    end
    object query_produtosmargem_lucro: TBCDField
      FieldName = 'margem_lucro'
      Origin = 'margem_lucro'
      Required = True
      Visible = False
      Precision = 10
      Size = 2
    end
    object query_produtosquantidade: TFloatField
      FieldName = 'quantidade'
      Origin = 'quantidade'
      Required = True
      Visible = False
    end
    object query_produtosestoque: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Estoque'
      FieldName = 'estoque'
      Origin = 'estoque'
    end
    object query_produtosestoque_min: TIntegerField
      FieldName = 'estoque_min'
      Origin = 'estoque_min'
      Required = True
    end
    object query_produtosdata: TDateField
      DisplayLabel = 'Data'
      FieldName = 'data'
      Origin = 'data'
      Required = True
    end
    object query_produtosimagem: TBlobField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Imagem'
      FieldName = 'imagem'
      Origin = 'imagem'
      Visible = False
    end
    object query_produtosultima_compra: TDateField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Ultima-Compra:'
      FieldName = 'ultima_compra'
      Origin = 'ultima_compra'
    end
  end
  object DSProdutos: TDataSource
    DataSet = query_produtos
    Left = 576
    Top = 328
  end
  object DSEntradaProdutos: TDataSource
    DataSet = query_entrada_pro
    Left = 400
    Top = 240
  end
  object tb_entrada_pro: TFDTable
    IndexFieldNames = 'id'
    Connection = fd
    UpdateOptions.UpdateTableName = 'pdv.entrada_produtos'
    TableName = 'pdv.entrada_produtos'
    Left = 208
    Top = 232
  end
  object query_entrada_pro: TFDQuery
    Active = True
    Connection = fd
    SQL.Strings = (
      'select * from entrada_produtos ')
    Left = 304
    Top = 232
    object query_entrada_proid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object query_entrada_prodata: TDateField
      DisplayLabel = 'Data:'
      FieldName = 'data'
      Origin = 'data'
      Required = True
    end
    object query_entrada_profuncionario: TStringField
      FieldName = 'funcionario'
      Origin = 'funcionario'
      Required = True
      Size = 50
    end
    object query_entrada_prohora: TTimeField
      FieldName = 'hora'
      Origin = 'hora'
      Required = True
    end
  end
  object tb_saida_pro: TFDTable
    Connection = fd
    UpdateOptions.UpdateTableName = 'pdv.saida_produtos'
    TableName = 'pdv.saida_produtos'
    Left = 240
    Top = 416
  end
  object DSSaidaProdutos: TDataSource
    DataSet = query_saida_pro
    Left = 344
    Top = 424
  end
  object query_saida_pro: TFDQuery
    Connection = fd
    SQL.Strings = (
      'select * from saida_produtos')
    Left = 288
    Top = 464
    object query_saida_proid: TFDAutoIncField
      DisplayLabel = 'ID'
      DisplayWidth = 6
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      Visible = False
    end
    object query_saida_proproduto: TStringField
      DisplayLabel = 'Produto:'
      DisplayWidth = 18
      FieldName = 'produto'
      Origin = 'produto'
      Required = True
      Size = 30
    end
    object query_saida_proquantidade: TIntegerField
      DisplayLabel = 'Quantidade:'
      DisplayWidth = 12
      FieldName = 'quantidade'
      Origin = 'quantidade'
      Required = True
    end
    object query_saida_promotivo: TStringField
      DisplayLabel = 'Motivo:'
      DisplayWidth = 20
      FieldName = 'motivo'
      Origin = 'motivo'
      Required = True
      Size = 45
    end
    object query_saida_prodata: TDateField
      FieldName = 'data'
      Origin = 'data'
      Required = True
    end
    object query_saida_proid_produto: TIntegerField
      DisplayWidth = 10
      FieldName = 'id_produto'
      Origin = 'id_produto'
      Required = True
      Visible = False
    end
  end
  object tb_vendas: TFDTable
    Connection = fd
    UpdateOptions.UpdateTableName = 'pdv.vendas'
    TableName = 'pdv.vendas'
    Left = 432
    Top = 424
  end
  object query_vendas: TFDQuery
    Connection = fd
    SQL.Strings = (
      'select * from vendas')
    Left = 488
    Top = 472
    object query_vendasid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      Visible = False
    end
    object query_vendasdesconto: TBCDField
      FieldName = 'desconto'
      Origin = 'desconto'
      Required = True
      currency = True
      Precision = 10
      Size = 2
    end
    object query_vendasvalor: TBCDField
      DisplayLabel = 'Valor:'
      DisplayWidth = 9
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
      currency = True
      Precision = 10
      Size = 2
    end
    object query_vendasmetodo: TStringField
      FieldName = 'metodo'
      Origin = 'metodo'
      Required = True
      Size = 15
    end
    object query_vendasdata: TDateTimeField
      DisplayLabel = 'Data:'
      DisplayWidth = 10
      FieldName = 'data'
      Origin = 'data'
      Required = True
    end
    object query_vendasfuncionario: TStringField
      DisplayLabel = 'Funcion'#225'rio:'
      DisplayWidth = 10
      FieldName = 'funcionario'
      Origin = 'funcionario'
      Required = True
      Size = 25
    end
    object query_vendasvalorcomdesc: TBCDField
      FieldName = 'valorcomdesc'
      Origin = 'valorcomdesc'
      Required = True
      currency = True
      Precision = 10
      Size = 2
    end
    object query_vendasvalor_entregue: TBCDField
      FieldName = 'valor_entregue'
      Origin = 'valor_entregue'
      Required = True
      currency = True
      Precision = 10
      Size = 2
    end
    object query_vendastroco: TBCDField
      FieldName = 'troco'
      Origin = 'troco'
      Required = True
      currency = True
      Precision = 10
      Size = 2
    end
    object query_vendashora: TTimeField
      FieldName = 'hora'
      Origin = 'hora'
      Required = True
    end
  end
  object DSVendas: TDataSource
    DataSet = query_vendas
    Left = 544
    Top = 432
  end
  object tb_detalhes_vendas: TFDTable
    IndexFieldNames = 'id'
    Connection = fd
    UpdateOptions.UpdateTableName = 'pdv.detalhes_vendas'
    TableName = 'pdv.detalhes_vendas'
    Left = 16
    Top = 400
  end
  object DSDetVendas: TDataSource
    DataSet = query_det_vendas
    Left = 96
    Top = 424
  end
  object query_det_vendas: TFDQuery
    Connection = fd
    SQL.Strings = (
      'select * from detalhes_vendas')
    Left = 152
    Top = 400
    object query_det_vendasid: TFDAutoIncField
      DisplayLabel = 'Cod Item'
      DisplayWidth = 7
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      Visible = False
    end
    object query_det_vendasid_venda: TIntegerField
      FieldName = 'id_venda'
      Origin = 'id_venda'
      Required = True
      Visible = False
    end
    object query_det_vendascod_exc: TIntegerField
      DisplayLabel = 'Cod'
      DisplayWidth = 4
      FieldName = 'cod_exc'
      Origin = 'cod_exc'
      Required = True
    end
    object query_det_vendasproduto: TStringField
      DisplayWidth = 32
      FieldName = 'produto'
      Origin = 'produto'
      Required = True
      Size = 100
    end
    object query_det_vendasvalor: TBCDField
      DisplayLabel = 'Valor Unit'#225'rio:'
      DisplayWidth = 10
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
      currency = True
      Precision = 10
      Size = 2
    end
    object query_det_vendasquantidade: TIntegerField
      DisplayLabel = 'Qtd:'
      DisplayWidth = 4
      FieldName = 'quantidade'
      Origin = 'quantidade'
      Required = True
    end
    object query_det_vendastotal: TBCDField
      DisplayLabel = 'Valor Total:'
      DisplayWidth = 10
      FieldName = 'total'
      Origin = 'total'
      Required = True
      currency = True
      Precision = 10
      Size = 2
    end
    object query_det_vendasid_produto: TIntegerField
      FieldName = 'id_produto'
      Origin = 'id_produto'
      Required = True
      Visible = False
    end
    object query_det_vendasfuncionario: TStringField
      FieldName = 'funcionario'
      Origin = 'funcionario'
      Required = True
      Visible = False
      Size = 25
    end
    object query_det_vendasdata: TDateField
      FieldName = 'data'
      Origin = 'data'
      Required = True
      Visible = False
    end
    object query_det_vendasmov: TStringField
      DisplayWidth = 30
      FieldName = 'mov'
      Origin = 'mov'
      Required = True
      Visible = False
      Size = 30
    end
  end
  object query_coringa: TFDQuery
    Connection = fd
    Left = 168
    Top = 24
  end
  object tb_mov: TFDTable
    Connection = fd
    UpdateOptions.UpdateTableName = 'pdv.movimentacoes'
    TableName = 'pdv.movimentacoes'
    Left = 488
    Top = 232
  end
  object DSMov: TDataSource
    DataSet = query_mov
    Left = 592
    Top = 240
  end
  object query_mov: TFDQuery
    Connection = fd
    SQL.Strings = (
      'select * from  movimentacoes')
    Left = 536
    Top = 256
  end
  object tb_venda_dir: TFDTable
    Connection = fd
    UpdateOptions.UpdateTableName = 'vendas_direta'
    TableName = 'vendas_direta'
    Left = 216
    Top = 144
  end
  object query_venda_dir: TFDQuery
    Connection = fd
    SQL.Strings = (
      'select * from vendas_direta')
    Left = 312
    Top = 136
    object query_venda_dirid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object query_venda_dirvalor: TBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
      currency = True
      Precision = 10
      Size = 2
    end
    object query_venda_dirmetodo: TStringField
      FieldName = 'metodo'
      Origin = 'metodo'
      Required = True
    end
    object query_venda_dirdata: TDateField
      FieldName = 'data'
      Origin = 'data'
      Required = True
    end
    object query_venda_dirfuncionario: TStringField
      FieldName = 'funcionario'
      Origin = 'funcionario'
      Required = True
    end
    object query_venda_dirhora: TTimeField
      FieldName = 'hora'
      Origin = 'hora'
      Required = True
    end
  end
  object DSVendaDir: TDataSource
    DataSet = query_venda_dir
    Left = 392
    Top = 136
  end
  object tb_det_vendas_dir: TFDTable
    IndexFieldNames = 'id'
    Connection = fd
    UpdateOptions.UpdateTableName = 'pdv.detalhes_vendas_direta'
    TableName = 'pdv.detalhes_vendas_direta'
    Left = 464
    Top = 160
  end
  object query_det_vendas_dir: TFDQuery
    Connection = fd
    SQL.Strings = (
      'select * from detalhes_vendas_direta')
    Left = 520
    Top = 136
    object query_det_vendas_dirid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object query_det_vendas_dirid_venda: TIntegerField
      FieldName = 'id_venda'
      Origin = 'id_venda'
      Required = True
    end
    object query_det_vendas_dirproduto: TStringField
      FieldName = 'produto'
      Origin = 'produto'
      Required = True
      Size = 100
    end
    object query_det_vendas_dirvalor: TBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
      Precision = 10
      Size = 2
    end
    object query_det_vendas_dirquantidade: TIntegerField
      FieldName = 'quantidade'
      Origin = 'quantidade'
      Required = True
    end
    object query_det_vendas_dirtotal: TBCDField
      FieldName = 'total'
      Origin = 'total'
      Required = True
      Precision = 10
      Size = 2
    end
    object query_det_vendas_dirid_produto: TIntegerField
      FieldName = 'id_produto'
      Origin = 'id_produto'
      Required = True
    end
    object query_det_vendas_dirfuncionario: TStringField
      FieldName = 'funcionario'
      Origin = 'funcionario'
      Required = True
    end
    object query_det_vendas_dirdata: TDateField
      FieldName = 'data'
      Origin = 'data'
      Required = True
    end
  end
  object DSDetVenDir: TDataSource
    DataSet = query_det_vendas_dir
    Left = 584
    Top = 128
  end
  object tb_gastos: TFDTable
    Connection = fd
    UpdateOptions.UpdateTableName = 'pdv.gastos'
    TableName = 'pdv.gastos'
    Left = 16
    Top = 512
  end
  object query_gastos: TFDQuery
    Connection = fd
    SQL.Strings = (
      'select * from gastos')
    Left = 72
    Top = 544
    object query_gastosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      Visible = False
    end
    object query_gastosmotivo: TStringField
      DisplayWidth = 17
      FieldName = 'motivo'
      Origin = 'motivo'
      Required = True
      Size = 50
    end
    object query_gastosvalor: TBCDField
      DisplayWidth = 10
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
      Precision = 10
      Size = 2
    end
    object query_gastosfuncionario: TStringField
      DisplayWidth = 17
      FieldName = 'funcionario'
      Origin = 'funcionario'
      Required = True
      Size = 25
    end
    object query_gastosdata: TDateField
      FieldName = 'data'
      Origin = 'data'
      Required = True
    end
  end
  object DSGastos: TDataSource
    DataSet = query_gastos
    Left = 128
    Top = 520
  end
  object DSDadosEmitentes: TDataSource
    DataSet = query_dados_emitente
    Left = 312
    Top = 536
  end
  object query_dados_emitente: TFDQuery
    Connection = fd
    SQL.Strings = (
      'select * from dados_emitente')
    Left = 256
    Top = 584
    object query_dados_emitenteid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object query_dados_emitentecnpj: TIntegerField
      FieldName = 'cnpj'
      Origin = 'cnpj'
      Required = True
    end
    object query_dados_emitenteie: TIntegerField
      FieldName = 'ie'
      Origin = 'ie'
      Required = True
    end
    object query_dados_emitenterazao_social: TStringField
      FieldName = 'razao_social'
      Origin = 'razao_social'
      Required = True
      Size = 60
    end
    object query_dados_emitentetelefone: TIntegerField
      FieldName = 'telefone'
      Origin = 'telefone'
      Required = True
    end
    object query_dados_emitentefantasia: TStringField
      FieldName = 'fantasia'
      Origin = 'fantasia'
      Required = True
      Size = 60
    end
    object query_dados_emitentecep: TIntegerField
      FieldName = 'cep'
      Origin = 'cep'
      Required = True
    end
    object query_dados_emitentelogradouro: TStringField
      FieldName = 'logradouro'
      Origin = 'logradouro'
      Required = True
      Size = 80
    end
    object query_dados_emitentenum: TIntegerField
      FieldName = 'num'
      Origin = 'num'
      Required = True
    end
    object query_dados_emitentecomplemento: TStringField
      FieldName = 'complemento'
      Origin = 'complemento'
      Required = True
      Size = 80
    end
    object query_dados_emitentebairro: TStringField
      FieldName = 'bairro'
      Origin = 'bairro'
      Required = True
      Size = 50
    end
    object query_dados_emitentecod_cidade: TIntegerField
      FieldName = 'cod_cidade'
      Origin = 'cod_cidade'
      Required = True
    end
    object query_dados_emitentecidade: TStringField
      FieldName = 'cidade'
      Origin = 'cidade'
      Required = True
      Size = 40
    end
    object query_dados_emitenteuf: TStringField
      FieldName = 'uf'
      Origin = 'uf'
      Required = True
      Size = 5
    end
    object query_dados_emitentetipo_empresa: TStringField
      FieldName = 'tipo_empresa'
      Origin = 'tipo_empresa'
      Required = True
      Size = 30
    end
  end
  object tb_dados_emitente: TFDTable
    Connection = fd
    UpdateOptions.UpdateTableName = 'pdv.dados_emitente'
    TableName = 'pdv.dados_emitente'
    Left = 208
    Top = 544
  end
  object rel_DS_Vendas: TfrxDBDataset
    UserName = 'DSVendas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=id'
      'desconto=desconto'
      'valor=valor'
      'metodo=metodo'
      'data=data'
      'funcionario=funcionario'
      'valorcomdesc=valorcomdesc'
      'valor_entregue=valor_entregue'
      'troco=troco')
    DataSet = query_vendas
    BCDToCurrency = False
    Left = 288
    Top = 656
  end
  object rel_Det_Vendas: TfrxDBDataset
    UserName = 'DS_Det_Vendas'
    CloseDataSource = False
    DataSet = query_det_vendas
    BCDToCurrency = False
    Left = 208
    Top = 656
  end
  object rel_DS_DetVendasDir: TfrxDBDataset
    UserName = 'DS_Det_VendasDir'
    CloseDataSource = False
    DataSet = query_det_vendas_dir
    BCDToCurrency = False
    Left = 472
    Top = 656
  end
  object rel_DS_VendasDir: TfrxDBDataset
    UserName = 'DSVendasDir'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=id'
      'valor=valor'
      'metodo=metodo'
      'data=data'
      'funcionario=funcionario')
    DataSet = query_venda_dir
    BCDToCurrency = False
    Left = 376
    Top = 656
  end
  object rel_comprovante: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44135.929094351800000000
    ReportOptions.LastChange = 44137.030333877320000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 120
    Top = 656
    Datasets = <
      item
        DataSet = DS_Rel_Canc
        DataSetName = 'CANC'
      end
      item
        DataSet = rel_Det_Vendas
        DataSetName = 'DS_Det_Vendas'
      end
      item
        DataSet = rel_DS_DetVendasDir
        DataSetName = 'DS_Det_VendasDir'
      end
      item
        DataSet = rel_DS_Prod
        DataSetName = 'DS_Produtos'
      end
      item
        DataSet = rel_DS_Caixa
        DataSetName = 'DSCaixa'
      end
      item
        DataSet = rel_ds_mov
        DataSetName = 'DSMov'
      end
      item
        DataSet = rel_DS_Vendas
        DataSetName = 'DSVendas'
      end
      item
        DataSet = rel_DS_VendasDir
        DataSetName = 'DSVendasDir'
      end
      item
        DataSet = Rel_Dados_Comprovante
        DataSetName = 'Rel_Dados_Comprovante'
      end
      item
        DataSet = rel_retirada
        DataSetName = 'rel_retirada'
      end
      item
        DataSet = rel_DS_Mov_Vendas
        DataSetName = 'RelMovVendas'
      end>
    Variables = <
      item
        Name = ' totais'
        Value = Null
      end
      item
        Name = 'totDinheiro'
        Value = Null
      end
      item
        Name = 'totCartao'
        Value = Null
      end
      item
        Name = 'tot'
        Value = Null
      end
      item
        Name = 'retirada'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 100.000000000000000000
      PaperHeight = 90.000000000000000000
      PaperSize = 256
      BackPicture.Data = {
        0A544A504547496D61676592220000FFD8FFE104C44578696600004D4D002A00
        0000080007011200030000000100010000011A00050000000100000062011B00
        05000000010000006A0128000300000001000200000131000200000022000000
        720132000200000014000000948769000400000001000000A8000000D4000AFC
        8000002710000AFC800000271041646F62652050686F746F73686F7020434320
        32303137202857696E646F77732900323031393A30333A31332032313A30313A
        3237000003A001000300000001FFFF0000A0020004000000010000011BA00300
        0400000001000001710000000000000006010300030000000100060000011A00
        050000000100000122011B0005000000010000012A0128000300000001000200
        0002010004000000010000013202020004000000010000038A00000000000000
        48000000010000004800000001FFD8FFED000C41646F62655F434D0002FFEE00
        0E41646F626500648000000001FFDB0084000C08080809080C09090C110B0A0B
        11150F0C0C0F1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E
        0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC000110800A0007B03012200
        021101031101FFDD00040008FFC4013F00000105010101010101000000000000
        00030001020405060708090A0B01000105010101010101000000000000000100
        02030405060708090A0B1000010401030204020507060805030C330100021103
        04211231054151611322718132061491A1B14223241552C16233347282D14307
        259253F0E1F163733516A2B283264493546445C2A3743617D255E265F2B384C3
        D375E3F3462794A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F6
        37475767778797A7B7C7D7E7F711000202010204040304050607070605350100
        021103213112044151617122130532819114A1B14223C152D1F0332462E17282
        92435315637334F1250616A2B283072635C2D2449354A317644555367465E2F2
        B384C3D375E3F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6
        E6F62737475767778797A7B7C7FFDA000C03010002110311003F00F504924950
        4A92492494A4924925292492494A4924925292492494A4924925292492494FFF
        D0F5049249504A92492494A4924925292492494A4924925292492494A4924925
        292492494FFFD1F5049249504A92492494A4924925292492494A492492529249
        2494A4924925292492494FFFD2F5049249504A92492494A4924925292492494A
        4924925292492494A4924925292492494FFFD3F5049249504A92492494A49249
        25292492494A4924925292492494A4924925292492494FFFD4F5049249504A92
        492494A4924925292492494A4924925292492494A4924925292492494FFFD5F5
        049249504A92492494A4924925292492494A4924925292492494A49249252924
        92494FFFD6F5049249504A92492494A4924925292492494A4924925292492494
        A4924925292492494FFFD7F5049249504A92492494A4924925292492494A4924
        925292492494A4924925292492494FFFD0F5049249504A92492494A492492529
        2492494A4924925292492494A4924925292492494FFFD9FFED0CD650686F746F
        73686F7020332E30003842494D04250000000000100000000000000000000000
        00000000003842494D043A000000000125000000100000000100000000000B70
        72696E744F7574707574000000050000000050737453626F6F6C010000000049
        6E7465656E756D00000000496E746500000000436C726D0000000F7072696E74
        5369787465656E426974626F6F6C000000000B7072696E7465724E616D655445
        585400000017004800500020004400650073006B006A00650074002000330035
        00310030002000730065007200690065007300000000000F7072696E7450726F
        6F6653657475704F626A63000000160043006F006E0066006900670075007200
        6100E700E3006F002000640065002000500072006F0076006100000000000A70
        726F6F6653657475700000000100000000426C746E656E756D0000000C627569
        6C74696E50726F6F660000000970726F6F66434D594B003842494D043B000000
        00022D00000010000000010000000000127072696E744F75747075744F707469
        6F6E7300000017000000004370746E626F6F6C0000000000436C6272626F6F6C
        00000000005267734D626F6F6C000000000043726E43626F6F6C000000000043
        6E7443626F6F6C00000000004C626C73626F6F6C00000000004E677476626F6F
        6C0000000000456D6C44626F6F6C0000000000496E7472626F6F6C0000000000
        42636B674F626A63000000010000000000005247424300000003000000005264
        2020646F7562406FE000000000000000000047726E20646F7562406FE0000000
        000000000000426C2020646F7562406FE000000000000000000042726454556E
        744623526C74000000000000000000000000426C6420556E744623526C740000
        0000000000000000000052736C74556E74462350786C40520000000000000000
        000A766563746F7244617461626F6F6C010000000050675073656E756D000000
        00506750730000000050675043000000004C656674556E744623526C74000000
        000000000000000000546F7020556E744623526C740000000000000000000000
        0053636C20556E74462350726340590000000000000000001063726F70576865
        6E5072696E74696E67626F6F6C000000000E63726F7052656374426F74746F6D
        6C6F6E67000000000000000C63726F70526563744C6566746C6F6E6700000000
        0000000D63726F705265637452696768746C6F6E67000000000000000B63726F
        7052656374546F706C6F6E6700000000003842494D03ED000000000010004800
        000001000200480000000100023842494D042600000000000E00000000000000
        0000003F8000003842494D040D0000000000040000005A3842494D0419000000
        0000040000001E3842494D03F300000000000900000000000000000100384249
        4D271000000000000A000100000000000000023842494D03F500000000004800
        2F66660001006C66660006000000000001002F6666000100A1999A0006000000
        000001003200000001005A00000006000000000001003500000001002D000000
        060000000000013842494D03F80000000000700000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03
        E800003842494D04080000000000100000000100000240000002400000000038
        42494D041E000000000004000000003842494D041A00000000034D0000000600
        00000000000000000001710000011B0000000C00530065006D0020005400ED00
        740075006C006F002D0031000000010000000000000000000000000000000000
        00000100000000000000000000011B0000017100000000000000000000000000
        0000000100000000000000000000000000000000000000100000000100000000
        00006E756C6C0000000200000006626F756E64734F626A630000000100000000
        0000526374310000000400000000546F70206C6F6E6700000000000000004C65
        66746C6F6E67000000000000000042746F6D6C6F6E6700000171000000005267
        68746C6F6E670000011B00000006736C69636573566C4C73000000014F626A63
        00000001000000000005736C6963650000001200000007736C69636549446C6F
        6E67000000000000000767726F757049446C6F6E6700000000000000066F7269
        67696E656E756D0000000C45536C6963654F726967696E0000000D6175746F47
        656E6572617465640000000054797065656E756D0000000A45536C6963655479
        706500000000496D672000000006626F756E64734F626A630000000100000000
        0000526374310000000400000000546F70206C6F6E6700000000000000004C65
        66746C6F6E67000000000000000042746F6D6C6F6E6700000171000000005267
        68746C6F6E670000011B0000000375726C54455854000000010000000000006E
        756C6C54455854000000010000000000004D7367655445585400000001000000
        000006616C74546167544558540000000100000000000E63656C6C5465787449
        7348544D4C626F6F6C010000000863656C6C5465787454455854000000010000
        00000009686F727A416C69676E656E756D0000000F45536C696365486F727A41
        6C69676E0000000764656661756C740000000976657274416C69676E656E756D
        0000000F45536C69636556657274416C69676E0000000764656661756C740000
        000B6267436F6C6F7254797065656E756D0000001145536C6963654247436F6C
        6F7254797065000000004E6F6E6500000009746F704F75747365746C6F6E6700
        0000000000000A6C6566744F75747365746C6F6E67000000000000000C626F74
        746F6D4F75747365746C6F6E67000000000000000B72696768744F7574736574
        6C6F6E6700000000003842494D042800000000000C000000023FF00000000000
        003842494D041100000000000101003842494D04140000000000040000000138
        42494D040C0000000003A6000000010000007B000000A0000001740000E88000
        00038A00180001FFD8FFED000C41646F62655F434D0002FFEE000E41646F6265
        00648000000001FFDB0084000C08080809080C09090C110B0A0B11150F0C0C0F
        1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E
        0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0CFFC000110800A0007B03012200021101031101
        FFDD00040008FFC4013F00000105010101010101000000000000000300010204
        05060708090A0B01000105010101010101000000000000000100020304050607
        08090A0B1000010401030204020507060805030C330100021103042112310541
        51611322718132061491A1B14223241552C16233347282D14307259253F0E1F1
        63733516A2B283264493546445C2A3743617D255E265F2B384C3D375E3F34627
        94A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F6374757677787
        97A7B7C7D7E7F711000202010204040304050607070605350100021103213112
        044151617122130532819114A1B14223C152D1F0332462E17282924353156373
        34F1250616A2B283072635C2D2449354A317644555367465E2F2B384C3D375E3
        F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F627374757
        67778797A7B7C7FFDA000C03010002110311003F00F5049249504A92492494A4
        924925292492494A4924925292492494A4924925292492494FFFD0F504924950
        4A92492494A4924925292492494A4924925292492494A4924925292492494FFF
        D1F5049249504A92492494A4924925292492494A4924925292492494A4924925
        292492494FFFD2F5049249504A92492494A4924925292492494A492492529249
        2494A4924925292492494FFFD3F5049249504A92492494A4924925292492494A
        4924925292492494A4924925292492494FFFD4F5049249504A92492494A49249
        25292492494A4924925292492494A4924925292492494FFFD5F5049249504A92
        492494A4924925292492494A4924925292492494A4924925292492494FFFD6F5
        049249504A92492494A4924925292492494A4924925292492494A49249252924
        92494FFFD7F5049249504A92492494A4924925292492494A4924925292492494
        A4924925292492494FFFD0F5049249504A92492494A4924925292492494A4924
        925292492494A4924925292492494FFFD93842494D042100000000005D000000
        01010000000F00410064006F00620065002000500068006F0074006F00730068
        006F00700000001700410064006F00620065002000500068006F0074006F0073
        0068006F00700020004300430020003200300031003700000001003842494D04
        060000000000070007010100010100FFE10CFD687474703A2F2F6E732E61646F
        62652E636F6D2F7861702F312E302F003C3F787061636B657420626567696E3D
        22EFBBBF222069643D2257354D304D7043656869487A7265537A4E54637A6B63
        3964223F3E203C783A786D706D65746120786D6C6E733A783D2261646F62653A
        6E733A6D6574612F2220783A786D70746B3D2241646F626520584D5020436F72
        6520352E362D633133382037392E3135393832342C20323031362F30392F3134
        2D30313A30393A30312020202020202020223E203C7264663A52444620786D6C
        6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F30
        322F32322D7264662D73796E7461782D6E7323223E203C7264663A4465736372
        697074696F6E207264663A61626F75743D222220786D6C6E733A786D703D2268
        7474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F2220786D6C
        6E733A64633D22687474703A2F2F7075726C2E6F72672F64632F656C656D656E
        74732F312E312F2220786D6C6E733A786D704D4D3D22687474703A2F2F6E732E
        61646F62652E636F6D2F7861702F312E302F6D6D2F2220786D6C6E733A737445
        76743D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F
        73547970652F5265736F757263654576656E74232220786D6C6E733A70686F74
        6F73686F703D22687474703A2F2F6E732E61646F62652E636F6D2F70686F746F
        73686F702F312E302F2220786D703A43726561746F72546F6F6C3D2241646F62
        652050686F746F73686F702043432032303137202857696E646F777329222078
        6D703A437265617465446174653D22323031392D30332D31335432313A30313A
        32372D30333A30302220786D703A4D65746164617461446174653D2232303139
        2D30332D31335432313A30313A32372D30333A30302220786D703A4D6F646966
        79446174653D22323031392D30332D31335432313A30313A32372D30333A3030
        222064633A666F726D61743D22696D6167652F6A7065672220786D704D4D3A49
        6E7374616E636549443D22786D702E6969643A62316535623364622D65343935
        2D393234302D386134312D6466356163313930646432362220786D704D4D3A44
        6F63756D656E7449443D22786D702E6469643A62316535623364622D65343935
        2D393234302D386134312D6466356163313930646432362220786D704D4D3A4F
        726967696E616C446F63756D656E7449443D22786D702E6469643A6231653562
        3364622D653439352D393234302D386134312D64663561633139306464323622
        2070686F746F73686F703A436F6C6F724D6F64653D2233223E203C786D704D4D
        3A486973746F72793E203C7264663A5365713E203C7264663A6C692073744576
        743A616374696F6E3D2263726561746564222073744576743A696E7374616E63
        6549443D22786D702E6969643A62316535623364622D653439352D393234302D
        386134312D646635616331393064643236222073744576743A7768656E3D2232
        3031392D30332D31335432313A30313A32372D30333A3030222073744576743A
        736F6674776172654167656E743D2241646F62652050686F746F73686F702043
        432032303137202857696E646F777329222F3E203C2F7264663A5365713E203C
        2F786D704D4D3A486973746F72793E203C2F7264663A4465736372697074696F
        6E3E203C2F7264663A5244463E203C2F783A786D706D6574613E202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020203C3F787061
        636B657420656E643D2277223F3EFFEE002141646F6265006440000000010300
        1003020306000000000000000000000000FFDB00840001010101010101010101
        0201010102020101010102020202020202020302030303030203030404040404
        0305050505050507070707070808080808080808080801010101020202040303
        0407050405070808080808080808080808080808080808080808080808080808
        0808080808080808080808080808080808080808080808FFC20011080171011B
        03011100021101031101FFC4005F000101000000000000000000000000000000
        0A01010101000000000000000000000000000005081001000000000000000000
        000000000000A01101000000000000000000000000000000A012010000000000
        00000000000000000000A0FFDA000C03010102110311000000BC2C8140000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000001FFDA00080102000105
        00539FFFDA0008010300010500539FFFDA0008010100010500539FFFDA000801
        0202063F00539FFFDA0008010302063F00539FFFDA0008010101063F00539FFF
        D9}
      Frame.Typ = []
      object Memo47: TfrxMemoView
        AllowVectorExport = True
        Left = 51.653576670000000000
        Top = 3.779530000000000000
        Width = 265.826943330000000000
        Height = 20.157493330000000000
        DisplayFormat.Kind = fkDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          'RELAT'#211'RIO DO DIA [Date]')
        ParentFont = False
      end
      object Memo48: TfrxMemoView
        AllowVectorExport = True
        Left = -3.779530000000000000
        Top = 12.598433330000000000
        Width = 379.212843330000000000
        Height = 17.637806670000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          
            '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ' +
            '- - - - - - - - - - - - - - - - -')
        ParentFont = False
      end
      object Memo49: TfrxMemoView
        AllowVectorExport = True
        Left = 50.393733340000000000
        Top = 88.189033330000000000
        Width = 262.047413330000000000
        Height = 25.196866670000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          
            'CNPJ:  [Rel_Dados_Comprovante."cnpj"]    IE: [Rel_Dados_Comprova' +
            'nte."ie"]')
        ParentFont = False
      end
      object Memo50: TfrxMemoView
        AllowVectorExport = True
        Left = 64.252010000000000000
        Top = 114.645743330000000000
        Width = 59.212636670000000000
        Height = 12.598433330000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          '[Date]')
        ParentFont = False
      end
      object Memo51: TfrxMemoView
        AllowVectorExport = True
        Left = 129.763863340000000000
        Top = 114.519716770000000000
        Width = 34.015770000000000000
        Height = 11.338590000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          '[Time]')
        ParentFont = False
      end
      object Memo52: TfrxMemoView
        AllowVectorExport = True
        Left = 202.834776670000000000
        Top = 114.645743330000000000
        Width = 110.866213330000000000
        Height = 12.598433330000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          'Tel: [Rel_Dados_Comprovante."tel"]')
        ParentFont = False
      end
      object Memo53: TfrxMemoView
        AllowVectorExport = True
        Left = -3.779530000000000000
        Top = 120.944960000000000000
        Width = 386.771903330000000000
        Height = 17.637806670000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          
            '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ' +
            '- - - - - - - - - - - - - - - - - - - - ')
        ParentFont = False
      end
      object Memo54: TfrxMemoView
        AllowVectorExport = True
        Left = 51.653576670000000000
        Top = 52.913420000000000000
        Width = 260.787570000000000000
        Height = 39.055143330000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          
            '[<Rel_Dados_Comprovante."endereco">] - [Rel_Dados_Comprovante."n' +
            'um"] - [Rel_Dados_Comprovante."bairro"]')
        ParentFont = False
        Formats = <
          item
          end
          item
          end>
      end
      object Memo55: TfrxMemoView
        AllowVectorExport = True
        Left = 52.913420000000000000
        Top = 36.535456670000000000
        Width = 262.047413330000000000
        Height = 16.377963330000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          'LOJA')
        ParentFont = False
      end
      object Memo32: TfrxMemoView
        AllowVectorExport = True
        Left = 56.692950000000000000
        Top = 188.976500000000000000
        Width = 98.267780000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
        Memo.UTF8W = (
          'TOTAL DINHEIRO:')
        ParentFont = False
      end
      object totDinheiro: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 158.740260000000000000
        Top = 188.976500000000000000
        Width = 105.826840000000000000
        Height = 18.897650000000000000
        DisplayFormat.FormatStr = '%2.2m'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = []
        Memo.UTF8W = (
          '[totDinheiro]')
      end
      object Memo41: TfrxMemoView
        AllowVectorExport = True
        Left = 56.692950000000000000
        Top = 234.870792860000000000
        Width = 102.587242860000000000
        Height = 16.197985710000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = []
        Memo.UTF8W = (
          'VALOR TOTAL:')
        ParentFont = False
      end
      object Memo45: TfrxMemoView
        AllowVectorExport = True
        Left = 147.401670000000000000
        Top = 257.008040000000000000
        Width = 90.708720000000000000
        Height = 11.338590000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          'LOJA')
        ParentFont = False
      end
      object Memo43: TfrxMemoView
        AllowVectorExport = True
        Left = 52.913420000000000000
        Top = 268.346630000000000000
        Width = 275.905690000000000000
        Height = 35.275613330000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          
            '[<Rel_Dados_Comprovante."endereco">] - [Rel_Dados_Comprovante."n' +
            'um"] - [Rel_Dados_Comprovante."bairro"]')
        ParentFont = False
        Formats = <
          item
          end
          item
          end>
      end
      object Memo33: TfrxMemoView
        AllowVectorExport = True
        Left = 56.692950000000000000
        Top = 211.653680000000000000
        Width = 94.488250000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
        Memo.UTF8W = (
          'TOTAL CART'#195'O:')
        ParentFont = False
      end
      object Memo27: TfrxMemoView
        AllowVectorExport = True
        Left = 151.181200000000000000
        Top = 207.874150000000000000
        Width = 113.385900000000000000
        Height = 18.897650000000000000
        DisplayFormat.FormatStr = '%2.2m'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = []
        Memo.UTF8W = (
          '[totCartao]')
      end
      object tot: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 158.740260000000000000
        Top = 234.330860000000000000
        Width = 120.944960000000000000
        Height = 18.897650000000000000
        DisplayFormat.FormatStr = '%2.2m'
        DisplayFormat.Kind = fkNumeric
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
        Memo.UTF8W = (
          '[tot]')
        ParentFont = False
      end
      object Memo44: TfrxMemoView
        AllowVectorExport = True
        Left = 71.811070000000000000
        Top = 306.141930000000000000
        Width = 238.110390000000000000
        Height = 11.338590000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          'AT'#201' AQUI NOS AJUDOU O SENHOR.  1 Samuel 7:12')
        ParentFont = False
      end
      object Memo40: TfrxMemoView
        AllowVectorExport = True
        Left = 71.811070000000000000
        Top = 325.039580000000000000
        Width = 238.110390000000000000
        Height = 15.118120000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          'Desenvolvido por Bruno dos Santos - (21) 97021-7483')
        ParentFont = False
      end
      object Memo1: TfrxMemoView
        AllowVectorExport = True
        Left = 56.692950000000000000
        Top = 154.960730000000000000
        Width = 136.063080000000000000
        Height = 15.118120000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
        Memo.UTF8W = (
          'TOTAL RETIRADO DO CAIXA:')
        ParentFont = False
      end
      object Memo2: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 192.756030000000000000
        Top = 151.181200000000000000
        Width = 113.385900000000000000
        Height = 18.897650000000000000
        DisplayFormat.FormatStr = '%2.2m'
        DisplayFormat.Kind = fkNumeric
        Frame.Typ = []
        Memo.UTF8W = (
          '[retirada]')
      end
      object Memo3: TfrxMemoView
        AllowVectorExport = True
        Left = 177.637910000000000000
        Top = 132.283550000000000000
        Width = 41.574830000000000000
        Height = 18.897650000000000000
        Frame.Typ = []
        Memo.UTF8W = (
          'Sa'#237'da')
      end
      object Memo4: TfrxMemoView
        AllowVectorExport = True
        Left = 170.078850000000000000
        Top = 170.078850000000000000
        Width = 56.692950000000000000
        Height = 18.897650000000000000
        Frame.Typ = []
        Memo.UTF8W = (
          'Entradas')
      end
    end
  end
  object rel_comprovantedir: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44103.037628206000000000
    ReportOptions.LastChange = 44103.767712118100000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 40
    Top = 664
    Datasets = <
      item
        DataSet = rel_DS_DetVendasDir
        DataSetName = 'DS_Det_VendasDir'
      end
      item
        DataSet = rel_DS_VendasDir
        DataSetName = 'DSVendasDir'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 100.000000000000000000
      PaperHeight = 130.000000000000000000
      PaperSize = 256
      BackPicture.Data = {
        0A544A504547496D61676592220000FFD8FFE104C44578696600004D4D002A00
        0000080007011200030000000100010000011A00050000000100000062011B00
        05000000010000006A0128000300000001000200000131000200000022000000
        720132000200000014000000948769000400000001000000A8000000D4000AFC
        8000002710000AFC800000271041646F62652050686F746F73686F7020434320
        32303137202857696E646F77732900323031393A30333A31332032313A30313A
        3237000003A001000300000001FFFF0000A0020004000000010000011BA00300
        0400000001000001710000000000000006010300030000000100060000011A00
        050000000100000122011B0005000000010000012A0128000300000001000200
        0002010004000000010000013202020004000000010000038A00000000000000
        48000000010000004800000001FFD8FFED000C41646F62655F434D0002FFEE00
        0E41646F626500648000000001FFDB0084000C08080809080C09090C110B0A0B
        11150F0C0C0F1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E
        0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC000110800A0007B03012200
        021101031101FFDD00040008FFC4013F00000105010101010101000000000000
        00030001020405060708090A0B01000105010101010101000000000000000100
        02030405060708090A0B1000010401030204020507060805030C330100021103
        04211231054151611322718132061491A1B14223241552C16233347282D14307
        259253F0E1F163733516A2B283264493546445C2A3743617D255E265F2B384C3
        D375E3F3462794A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F6
        37475767778797A7B7C7D7E7F711000202010204040304050607070605350100
        021103213112044151617122130532819114A1B14223C152D1F0332462E17282
        92435315637334F1250616A2B283072635C2D2449354A317644555367465E2F2
        B384C3D375E3F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6
        E6F62737475767778797A7B7C7FFDA000C03010002110311003F00F504924950
        4A92492494A4924925292492494A4924925292492494A4924925292492494FFF
        D0F5049249504A92492494A4924925292492494A4924925292492494A4924925
        292492494FFFD1F5049249504A92492494A4924925292492494A492492529249
        2494A4924925292492494FFFD2F5049249504A92492494A4924925292492494A
        4924925292492494A4924925292492494FFFD3F5049249504A92492494A49249
        25292492494A4924925292492494A4924925292492494FFFD4F5049249504A92
        492494A4924925292492494A4924925292492494A4924925292492494FFFD5F5
        049249504A92492494A4924925292492494A4924925292492494A49249252924
        92494FFFD6F5049249504A92492494A4924925292492494A4924925292492494
        A4924925292492494FFFD7F5049249504A92492494A4924925292492494A4924
        925292492494A4924925292492494FFFD0F5049249504A92492494A492492529
        2492494A4924925292492494A4924925292492494FFFD9FFED0CD650686F746F
        73686F7020332E30003842494D04250000000000100000000000000000000000
        00000000003842494D043A000000000125000000100000000100000000000B70
        72696E744F7574707574000000050000000050737453626F6F6C010000000049
        6E7465656E756D00000000496E746500000000436C726D0000000F7072696E74
        5369787465656E426974626F6F6C000000000B7072696E7465724E616D655445
        585400000017004800500020004400650073006B006A00650074002000330035
        00310030002000730065007200690065007300000000000F7072696E7450726F
        6F6653657475704F626A63000000160043006F006E0066006900670075007200
        6100E700E3006F002000640065002000500072006F0076006100000000000A70
        726F6F6653657475700000000100000000426C746E656E756D0000000C627569
        6C74696E50726F6F660000000970726F6F66434D594B003842494D043B000000
        00022D00000010000000010000000000127072696E744F75747075744F707469
        6F6E7300000017000000004370746E626F6F6C0000000000436C6272626F6F6C
        00000000005267734D626F6F6C000000000043726E43626F6F6C000000000043
        6E7443626F6F6C00000000004C626C73626F6F6C00000000004E677476626F6F
        6C0000000000456D6C44626F6F6C0000000000496E7472626F6F6C0000000000
        42636B674F626A63000000010000000000005247424300000003000000005264
        2020646F7562406FE000000000000000000047726E20646F7562406FE0000000
        000000000000426C2020646F7562406FE000000000000000000042726454556E
        744623526C74000000000000000000000000426C6420556E744623526C740000
        0000000000000000000052736C74556E74462350786C40520000000000000000
        000A766563746F7244617461626F6F6C010000000050675073656E756D000000
        00506750730000000050675043000000004C656674556E744623526C74000000
        000000000000000000546F7020556E744623526C740000000000000000000000
        0053636C20556E74462350726340590000000000000000001063726F70576865
        6E5072696E74696E67626F6F6C000000000E63726F7052656374426F74746F6D
        6C6F6E67000000000000000C63726F70526563744C6566746C6F6E6700000000
        0000000D63726F705265637452696768746C6F6E67000000000000000B63726F
        7052656374546F706C6F6E6700000000003842494D03ED000000000010004800
        000001000200480000000100023842494D042600000000000E00000000000000
        0000003F8000003842494D040D0000000000040000005A3842494D0419000000
        0000040000001E3842494D03F300000000000900000000000000000100384249
        4D271000000000000A000100000000000000023842494D03F500000000004800
        2F66660001006C66660006000000000001002F6666000100A1999A0006000000
        000001003200000001005A00000006000000000001003500000001002D000000
        060000000000013842494D03F80000000000700000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03
        E800003842494D04080000000000100000000100000240000002400000000038
        42494D041E000000000004000000003842494D041A00000000034D0000000600
        00000000000000000001710000011B0000000C00530065006D0020005400ED00
        740075006C006F002D0031000000010000000000000000000000000000000000
        00000100000000000000000000011B0000017100000000000000000000000000
        0000000100000000000000000000000000000000000000100000000100000000
        00006E756C6C0000000200000006626F756E64734F626A630000000100000000
        0000526374310000000400000000546F70206C6F6E6700000000000000004C65
        66746C6F6E67000000000000000042746F6D6C6F6E6700000171000000005267
        68746C6F6E670000011B00000006736C69636573566C4C73000000014F626A63
        00000001000000000005736C6963650000001200000007736C69636549446C6F
        6E67000000000000000767726F757049446C6F6E6700000000000000066F7269
        67696E656E756D0000000C45536C6963654F726967696E0000000D6175746F47
        656E6572617465640000000054797065656E756D0000000A45536C6963655479
        706500000000496D672000000006626F756E64734F626A630000000100000000
        0000526374310000000400000000546F70206C6F6E6700000000000000004C65
        66746C6F6E67000000000000000042746F6D6C6F6E6700000171000000005267
        68746C6F6E670000011B0000000375726C54455854000000010000000000006E
        756C6C54455854000000010000000000004D7367655445585400000001000000
        000006616C74546167544558540000000100000000000E63656C6C5465787449
        7348544D4C626F6F6C010000000863656C6C5465787454455854000000010000
        00000009686F727A416C69676E656E756D0000000F45536C696365486F727A41
        6C69676E0000000764656661756C740000000976657274416C69676E656E756D
        0000000F45536C69636556657274416C69676E0000000764656661756C740000
        000B6267436F6C6F7254797065656E756D0000001145536C6963654247436F6C
        6F7254797065000000004E6F6E6500000009746F704F75747365746C6F6E6700
        0000000000000A6C6566744F75747365746C6F6E67000000000000000C626F74
        746F6D4F75747365746C6F6E67000000000000000B72696768744F7574736574
        6C6F6E6700000000003842494D042800000000000C000000023FF00000000000
        003842494D041100000000000101003842494D04140000000000040000000138
        42494D040C0000000003A6000000010000007B000000A0000001740000E88000
        00038A00180001FFD8FFED000C41646F62655F434D0002FFEE000E41646F6265
        00648000000001FFDB0084000C08080809080C09090C110B0A0B11150F0C0C0F
        1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E
        0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0CFFC000110800A0007B03012200021101031101
        FFDD00040008FFC4013F00000105010101010101000000000000000300010204
        05060708090A0B01000105010101010101000000000000000100020304050607
        08090A0B1000010401030204020507060805030C330100021103042112310541
        51611322718132061491A1B14223241552C16233347282D14307259253F0E1F1
        63733516A2B283264493546445C2A3743617D255E265F2B384C3D375E3F34627
        94A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F6374757677787
        97A7B7C7D7E7F711000202010204040304050607070605350100021103213112
        044151617122130532819114A1B14223C152D1F0332462E17282924353156373
        34F1250616A2B283072635C2D2449354A317644555367465E2F2B384C3D375E3
        F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F627374757
        67778797A7B7C7FFDA000C03010002110311003F00F5049249504A92492494A4
        924925292492494A4924925292492494A4924925292492494FFFD0F504924950
        4A92492494A4924925292492494A4924925292492494A4924925292492494FFF
        D1F5049249504A92492494A4924925292492494A4924925292492494A4924925
        292492494FFFD2F5049249504A92492494A4924925292492494A492492529249
        2494A4924925292492494FFFD3F5049249504A92492494A4924925292492494A
        4924925292492494A4924925292492494FFFD4F5049249504A92492494A49249
        25292492494A4924925292492494A4924925292492494FFFD5F5049249504A92
        492494A4924925292492494A4924925292492494A4924925292492494FFFD6F5
        049249504A92492494A4924925292492494A4924925292492494A49249252924
        92494FFFD7F5049249504A92492494A4924925292492494A4924925292492494
        A4924925292492494FFFD0F5049249504A92492494A4924925292492494A4924
        925292492494A4924925292492494FFFD93842494D042100000000005D000000
        01010000000F00410064006F00620065002000500068006F0074006F00730068
        006F00700000001700410064006F00620065002000500068006F0074006F0073
        0068006F00700020004300430020003200300031003700000001003842494D04
        060000000000070007010100010100FFE10CFD687474703A2F2F6E732E61646F
        62652E636F6D2F7861702F312E302F003C3F787061636B657420626567696E3D
        22EFBBBF222069643D2257354D304D7043656869487A7265537A4E54637A6B63
        3964223F3E203C783A786D706D65746120786D6C6E733A783D2261646F62653A
        6E733A6D6574612F2220783A786D70746B3D2241646F626520584D5020436F72
        6520352E362D633133382037392E3135393832342C20323031362F30392F3134
        2D30313A30393A30312020202020202020223E203C7264663A52444620786D6C
        6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F30
        322F32322D7264662D73796E7461782D6E7323223E203C7264663A4465736372
        697074696F6E207264663A61626F75743D222220786D6C6E733A786D703D2268
        7474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F2220786D6C
        6E733A64633D22687474703A2F2F7075726C2E6F72672F64632F656C656D656E
        74732F312E312F2220786D6C6E733A786D704D4D3D22687474703A2F2F6E732E
        61646F62652E636F6D2F7861702F312E302F6D6D2F2220786D6C6E733A737445
        76743D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F
        73547970652F5265736F757263654576656E74232220786D6C6E733A70686F74
        6F73686F703D22687474703A2F2F6E732E61646F62652E636F6D2F70686F746F
        73686F702F312E302F2220786D703A43726561746F72546F6F6C3D2241646F62
        652050686F746F73686F702043432032303137202857696E646F777329222078
        6D703A437265617465446174653D22323031392D30332D31335432313A30313A
        32372D30333A30302220786D703A4D65746164617461446174653D2232303139
        2D30332D31335432313A30313A32372D30333A30302220786D703A4D6F646966
        79446174653D22323031392D30332D31335432313A30313A32372D30333A3030
        222064633A666F726D61743D22696D6167652F6A7065672220786D704D4D3A49
        6E7374616E636549443D22786D702E6969643A62316535623364622D65343935
        2D393234302D386134312D6466356163313930646432362220786D704D4D3A44
        6F63756D656E7449443D22786D702E6469643A62316535623364622D65343935
        2D393234302D386134312D6466356163313930646432362220786D704D4D3A4F
        726967696E616C446F63756D656E7449443D22786D702E6469643A6231653562
        3364622D653439352D393234302D386134312D64663561633139306464323622
        2070686F746F73686F703A436F6C6F724D6F64653D2233223E203C786D704D4D
        3A486973746F72793E203C7264663A5365713E203C7264663A6C692073744576
        743A616374696F6E3D2263726561746564222073744576743A696E7374616E63
        6549443D22786D702E6969643A62316535623364622D653439352D393234302D
        386134312D646635616331393064643236222073744576743A7768656E3D2232
        3031392D30332D31335432313A30313A32372D30333A3030222073744576743A
        736F6674776172654167656E743D2241646F62652050686F746F73686F702043
        432032303137202857696E646F777329222F3E203C2F7264663A5365713E203C
        2F786D704D4D3A486973746F72793E203C2F7264663A4465736372697074696F
        6E3E203C2F7264663A5244463E203C2F783A786D706D6574613E202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020203C3F787061
        636B657420656E643D2277223F3EFFEE002141646F6265006440000000010300
        1003020306000000000000000000000000FFDB00840001010101010101010101
        0201010102020101010102020202020202020302030303030203030404040404
        0305050505050507070707070808080808080808080801010101020202040303
        0407050405070808080808080808080808080808080808080808080808080808
        0808080808080808080808080808080808080808080808FFC20011080171011B
        03011100021101031101FFC4005F000101000000000000000000000000000000
        0A01010101000000000000000000000000000005081001000000000000000000
        000000000000A01101000000000000000000000000000000A012010000000000
        00000000000000000000A0FFDA000C03010102110311000000BC2C8140000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000001FFDA00080102000105
        00539FFFDA0008010300010500539FFFDA0008010100010500539FFFDA000801
        0202063F00539FFFDA0008010302063F00539FFFDA0008010101063F00539FFF
        D9}
      Frame.Typ = []
      object Header1: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 268.346630000000000000
        Top = 18.897650000000000000
        Width = 377.953000000000000000
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 97.007936670000000000
          Top = 7.559060000000000000
          Width = 182.677283330000000000
          Height = 20.157493330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'LOJ'#195'O DO 1 REAL')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 23.937023330000000000
          Width = 341.417543330000000000
          Height = 17.637806670000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ' +
              '- - - - - - - - - -')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 85.669346670000000000
          Top = 108.346526670000000000
          Width = 204.094620000000000000
          Height = 12.598433330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Rua Fernandes Rodrigues S/N - '#201'den ')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 71.811070000000000000
          Top = 125.984333330000000000
          Width = 36.535456670000000000
          Height = 12.598433330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 148.661513340000000000
          Top = 125.858306770000000000
          Width = 37.795300000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Time]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 217.952896670000000000
          Top = 125.984333330000000000
          Width = 122.204803330000000000
          Height = 12.598433330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Tel: (21)00000-0000')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 44.094516670000000000
          Top = 139.842610000000000000
          Width = 303.622243330000000000
          Height = 17.637806670000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ' +
              '- - - - - - - ')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 89.448876670000000000
          Top = 154.960730000000000000
          Width = 205.354463330000000000
          Height = 16.377963330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'RELAT'#211'RIO DE COMPRA')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 115.905586670000000000
          Top = 172.598536670000000000
          Width = 148.661513330000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'COMPROVANTE DE PAGAMENTO')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 26.456710000000000000
          Top = 200.315090000000000000
          Width = 112.126056670000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'C'#243'digo da Venda')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 25.196866670000000000
          Top = 226.771800000000000000
          Width = 255.748196670000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor Total a Pagar  -  - - - - - - - - - - - -')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 134.803236670000000000
          Top = 245.669450000000000000
          Width = 110.866213330000000000
          Height = 12.598433330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'ITENS DA VENDA')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 78.110286670000000000
          Top = 79.370130000000000000
          Width = 222.992270000000000000
          Height = 27.716553330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Rua Manoel C'#226'ndido Oliveira 491 Parque'
            ' Jos'#233' Bonif'#225'cio - S'#227'o Jo'#227'o de Meriti ')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 124.724490000000000000
          Top = 62.992166670000000000
          Width = 125.984333330000000000
          Height = 16.377963330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'LOJAS')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 141.102453330000000000
          Top = 41.574830000000000000
          Width = 102.047310000000000000
          Height = 16.377963330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'VENDA DIRETA')
          ParentFont = False
        end
        object DSVendasDirvalor: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 283.464750000000000000
          Top = 222.992270000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataField = 'valor'
          DataSet = rel_DS_VendasDir
          DataSetName = 'DSVendasDir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[DSVendasDir."valor"]')
          ParentFont = False
        end
        object DSVendasDirid: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 264.567100000000000000
          Top = 200.315090000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataField = 'id'
          DataSet = rel_DS_VendasDir
          DataSetName = 'DSVendasDir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[DSVendasDir."id"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 71.811070000000000000
        Top = 385.512060000000000000
        Width = 377.953000000000000000
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Left = 18.897650000000000000
          Top = 48.593957140000000000
          Width = 336.378170000000000000
          Height = 12.598433330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Desenvolvido por Bruno dos Santos - (21) 97021-7483')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Left = 178.897753330000000000
          Top = 18.897650000000000000
          Width = 95.028182860000000000
          Height = 19.977515710000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'VALOR TOTAL:')
          ParentFont = False
        end
        object DSVendasDirvalor1: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 279.685220000000000000
          Top = 18.897650000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataField = 'valor'
          DataSet = rel_DS_VendasDir
          DataSetName = 'DSVendasDir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[DSVendasDir."valor"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 52.913420000000000000
        Top = 309.921460000000000000
        Width = 377.953000000000000000
        DataSet = rel_DS_DetVendasDir
        DataSetName = 'DS_Det_VendasDir'
        RowCount = 0
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 26.456710000000000000
          Top = 7.559060000000000000
          Width = 51.653576670000000000
          Height = 13.858276670000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Produto')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 103.307153330000000000
          Top = 7.559064880000000000
          Width = 59.212636670000000000
          Height = 13.858276670000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor Unit'#225'rio')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 186.456813330000000000
          Top = 7.559064880000000000
          Width = 74.330756670000000000
          Height = 13.858276670000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Quantidade')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Left = 269.606473330000000000
          Top = 7.559064880000000000
          Width = 70.551226670000000000
          Height = 13.858276670000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor Total')
          ParentFont = False
        end
        object DS_Det_VendasDirproduto: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 34.015770000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataField = 'produto'
          DataSet = rel_DS_DetVendasDir
          DataSetName = 'DS_Det_VendasDir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[DS_Det_VendasDir."produto"]')
          ParentFont = False
        end
        object DS_Det_VendasDirvalor: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 102.047310000000000000
          Top = 34.015770000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'valor'
          DataSet = rel_DS_DetVendasDir
          DataSetName = 'DS_Det_VendasDir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[DS_Det_VendasDir."valor"]')
          ParentFont = False
        end
        object DS_Det_VendasDirquantidade: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 185.196970000000000000
          Top = 34.015770000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataField = 'quantidade'
          DataSet = rel_DS_DetVendasDir
          DataSetName = 'DS_Det_VendasDir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[DS_Det_VendasDir."quantidade"]')
          ParentFont = False
        end
        object DS_Det_VendasDirtotal: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 268.346630000000000000
          Top = 34.015770000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'total'
          DataSet = rel_DS_DetVendasDir
          DataSetName = 'DS_Det_VendasDir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[DS_Det_VendasDir."total"]')
          ParentFont = False
        end
      end
    end
  end
  object tb_caixa: TFDTable
    IndexFieldNames = 'id'
    Connection = fd
    UpdateOptions.UpdateTableName = 'pdv.caixa'
    TableName = 'pdv.caixa'
    Left = 456
    Top = 584
  end
  object query_caixa: TFDQuery
    Connection = fd
    SQL.Strings = (
      'select * from caixa')
    Left = 520
    Top = 584
    object query_caixaid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      Visible = False
    end
    object query_caixadata_abertura: TDateField
      DisplayLabel = 'Data Abertura'
      DisplayWidth = 9
      FieldName = 'data_abertura'
      Origin = 'data_abertura'
      Required = True
    end
    object query_caixahora_abertura: TTimeField
      DisplayLabel = 'Hora Abertura'
      DisplayWidth = 9
      FieldName = 'hora_abertura'
      Origin = 'hora_abertura'
      Required = True
    end
    object query_caixavalor_abertura: TBCDField
      DisplayLabel = 'Valor Abertura'
      DisplayWidth = 10
      FieldName = 'valor_abertura'
      Origin = 'valor_abertura'
      Required = True
      currency = True
      Precision = 10
      Size = 2
    end
    object query_caixafuncionario_abertura: TStringField
      DisplayLabel = 'Funcionario Abertura'
      DisplayWidth = 18
      FieldName = 'funcionario_abertura'
      Origin = 'funcionario_abertura'
      Required = True
      Size = 30
    end
    object query_caixadata_fechamento: TDateField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Data Fechamento'
      DisplayWidth = 9
      FieldName = 'data_fechamento'
      Origin = 'data_fechamento'
    end
    object query_caixahora_fechamento: TTimeField
      AutoGenerateValue = arDefault
      FieldName = 'hora_fechamento'
      Origin = 'hora_fechamento'
    end
    object query_caixavalor_fechamento: TBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Valor Fechamento'
      DisplayWidth = 9
      FieldName = 'valor_fechamento'
      Origin = 'valor_fechamento'
      currency = True
      Precision = 10
      Size = 2
    end
    object query_caixavalor_vendido: TBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Valor Vendido'
      DisplayWidth = 11
      FieldName = 'valor_vendido'
      Origin = 'valor_vendido'
      currency = True
      Precision = 10
      Size = 2
    end
    object query_caixavalor_quebra: TBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Valor Quebra'
      DisplayWidth = 9
      FieldName = 'valor_quebra'
      Origin = 'valor_quebra'
      currency = True
      Precision = 10
      Size = 2
    end
    object query_caixafuncionario_fechamento: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Funcionario Fechamento'
      DisplayWidth = 18
      FieldName = 'funcionario_fechamento'
      Origin = 'funcionario_fechamento'
      Size = 30
    end
    object query_caixanum_caixa: TIntegerField
      DisplayLabel = 'Num Caixa'
      FieldName = 'num_caixa'
      Origin = 'num_caixa'
      Required = True
    end
    object query_caixaoperador: TStringField
      DisplayLabel = 'Operador'
      DisplayWidth = 18
      FieldName = 'operador'
      Origin = 'operador'
      Required = True
      Visible = False
      Size = 30
    end
    object query_caixastatus: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 15
      FieldName = 'status'
      Origin = 'status'
      Required = True
    end
  end
  object DSCaixa: TDataSource
    DataSet = query_caixa
    Left = 584
    Top = 584
  end
  object rel_caixa: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44132.106505486100000000
    ReportOptions.LastChange = 44133.019093009300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 32
    Top = 760
    Datasets = <
      item
        DataSet = DS_Rel_Canc
        DataSetName = 'CANC'
      end
      item
        DataSet = rel_Det_Vendas
        DataSetName = 'DS_Det_Vendas'
      end
      item
        DataSet = rel_DS_DetVendasDir
        DataSetName = 'DS_Det_VendasDir'
      end
      item
        DataSet = rel_DS_Prod
        DataSetName = 'DS_Produtos'
      end
      item
        DataSet = rel_DS_Caixa
        DataSetName = 'DSCaixa'
      end
      item
        DataSet = rel_ds_mov
        DataSetName = 'DSMov'
      end
      item
        DataSet = rel_DS_Vendas
        DataSetName = 'DSVendas'
      end
      item
        DataSet = rel_DS_VendasDir
        DataSetName = 'DSVendasDir'
      end
      item
        DataSet = Rel_Dados_Comprovante
        DataSetName = 'Rel_Dados_Comprovante'
      end
      item
        DataSet = rel_DS_Mov_Vendas
        DataSetName = 'RelMovVendas'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'totDinheiro'
        Value = Null
      end
      item
        Name = 'totCartao'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page2: TfrxReportPage
      PaperWidth = 100.000000000000000000
      PaperHeight = 120.000000000000000000
      PaperSize = 256
      BackPicture.Data = {
        0A544A504547496D61676592220000FFD8FFE104C44578696600004D4D002A00
        0000080007011200030000000100010000011A00050000000100000062011B00
        05000000010000006A0128000300000001000200000131000200000022000000
        720132000200000014000000948769000400000001000000A8000000D4000AFC
        8000002710000AFC800000271041646F62652050686F746F73686F7020434320
        32303137202857696E646F77732900323031393A30333A31332032313A30313A
        3237000003A001000300000001FFFF0000A0020004000000010000011BA00300
        0400000001000001710000000000000006010300030000000100060000011A00
        050000000100000122011B0005000000010000012A0128000300000001000200
        0002010004000000010000013202020004000000010000038A00000000000000
        48000000010000004800000001FFD8FFED000C41646F62655F434D0002FFEE00
        0E41646F626500648000000001FFDB0084000C08080809080C09090C110B0A0B
        11150F0C0C0F1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E
        0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC000110800A0007B03012200
        021101031101FFDD00040008FFC4013F00000105010101010101000000000000
        00030001020405060708090A0B01000105010101010101000000000000000100
        02030405060708090A0B1000010401030204020507060805030C330100021103
        04211231054151611322718132061491A1B14223241552C16233347282D14307
        259253F0E1F163733516A2B283264493546445C2A3743617D255E265F2B384C3
        D375E3F3462794A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F6
        37475767778797A7B7C7D7E7F711000202010204040304050607070605350100
        021103213112044151617122130532819114A1B14223C152D1F0332462E17282
        92435315637334F1250616A2B283072635C2D2449354A317644555367465E2F2
        B384C3D375E3F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6
        E6F62737475767778797A7B7C7FFDA000C03010002110311003F00F504924950
        4A92492494A4924925292492494A4924925292492494A4924925292492494FFF
        D0F5049249504A92492494A4924925292492494A4924925292492494A4924925
        292492494FFFD1F5049249504A92492494A4924925292492494A492492529249
        2494A4924925292492494FFFD2F5049249504A92492494A4924925292492494A
        4924925292492494A4924925292492494FFFD3F5049249504A92492494A49249
        25292492494A4924925292492494A4924925292492494FFFD4F5049249504A92
        492494A4924925292492494A4924925292492494A4924925292492494FFFD5F5
        049249504A92492494A4924925292492494A4924925292492494A49249252924
        92494FFFD6F5049249504A92492494A4924925292492494A4924925292492494
        A4924925292492494FFFD7F5049249504A92492494A4924925292492494A4924
        925292492494A4924925292492494FFFD0F5049249504A92492494A492492529
        2492494A4924925292492494A4924925292492494FFFD9FFED0CD650686F746F
        73686F7020332E30003842494D04250000000000100000000000000000000000
        00000000003842494D043A000000000125000000100000000100000000000B70
        72696E744F7574707574000000050000000050737453626F6F6C010000000049
        6E7465656E756D00000000496E746500000000436C726D0000000F7072696E74
        5369787465656E426974626F6F6C000000000B7072696E7465724E616D655445
        585400000017004800500020004400650073006B006A00650074002000330035
        00310030002000730065007200690065007300000000000F7072696E7450726F
        6F6653657475704F626A63000000160043006F006E0066006900670075007200
        6100E700E3006F002000640065002000500072006F0076006100000000000A70
        726F6F6653657475700000000100000000426C746E656E756D0000000C627569
        6C74696E50726F6F660000000970726F6F66434D594B003842494D043B000000
        00022D00000010000000010000000000127072696E744F75747075744F707469
        6F6E7300000017000000004370746E626F6F6C0000000000436C6272626F6F6C
        00000000005267734D626F6F6C000000000043726E43626F6F6C000000000043
        6E7443626F6F6C00000000004C626C73626F6F6C00000000004E677476626F6F
        6C0000000000456D6C44626F6F6C0000000000496E7472626F6F6C0000000000
        42636B674F626A63000000010000000000005247424300000003000000005264
        2020646F7562406FE000000000000000000047726E20646F7562406FE0000000
        000000000000426C2020646F7562406FE000000000000000000042726454556E
        744623526C74000000000000000000000000426C6420556E744623526C740000
        0000000000000000000052736C74556E74462350786C40520000000000000000
        000A766563746F7244617461626F6F6C010000000050675073656E756D000000
        00506750730000000050675043000000004C656674556E744623526C74000000
        000000000000000000546F7020556E744623526C740000000000000000000000
        0053636C20556E74462350726340590000000000000000001063726F70576865
        6E5072696E74696E67626F6F6C000000000E63726F7052656374426F74746F6D
        6C6F6E67000000000000000C63726F70526563744C6566746C6F6E6700000000
        0000000D63726F705265637452696768746C6F6E67000000000000000B63726F
        7052656374546F706C6F6E6700000000003842494D03ED000000000010004800
        000001000200480000000100023842494D042600000000000E00000000000000
        0000003F8000003842494D040D0000000000040000005A3842494D0419000000
        0000040000001E3842494D03F300000000000900000000000000000100384249
        4D271000000000000A000100000000000000023842494D03F500000000004800
        2F66660001006C66660006000000000001002F6666000100A1999A0006000000
        000001003200000001005A00000006000000000001003500000001002D000000
        060000000000013842494D03F80000000000700000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03
        E800003842494D04080000000000100000000100000240000002400000000038
        42494D041E000000000004000000003842494D041A00000000034D0000000600
        00000000000000000001710000011B0000000C00530065006D0020005400ED00
        740075006C006F002D0031000000010000000000000000000000000000000000
        00000100000000000000000000011B0000017100000000000000000000000000
        0000000100000000000000000000000000000000000000100000000100000000
        00006E756C6C0000000200000006626F756E64734F626A630000000100000000
        0000526374310000000400000000546F70206C6F6E6700000000000000004C65
        66746C6F6E67000000000000000042746F6D6C6F6E6700000171000000005267
        68746C6F6E670000011B00000006736C69636573566C4C73000000014F626A63
        00000001000000000005736C6963650000001200000007736C69636549446C6F
        6E67000000000000000767726F757049446C6F6E6700000000000000066F7269
        67696E656E756D0000000C45536C6963654F726967696E0000000D6175746F47
        656E6572617465640000000054797065656E756D0000000A45536C6963655479
        706500000000496D672000000006626F756E64734F626A630000000100000000
        0000526374310000000400000000546F70206C6F6E6700000000000000004C65
        66746C6F6E67000000000000000042746F6D6C6F6E6700000171000000005267
        68746C6F6E670000011B0000000375726C54455854000000010000000000006E
        756C6C54455854000000010000000000004D7367655445585400000001000000
        000006616C74546167544558540000000100000000000E63656C6C5465787449
        7348544D4C626F6F6C010000000863656C6C5465787454455854000000010000
        00000009686F727A416C69676E656E756D0000000F45536C696365486F727A41
        6C69676E0000000764656661756C740000000976657274416C69676E656E756D
        0000000F45536C69636556657274416C69676E0000000764656661756C740000
        000B6267436F6C6F7254797065656E756D0000001145536C6963654247436F6C
        6F7254797065000000004E6F6E6500000009746F704F75747365746C6F6E6700
        0000000000000A6C6566744F75747365746C6F6E67000000000000000C626F74
        746F6D4F75747365746C6F6E67000000000000000B72696768744F7574736574
        6C6F6E6700000000003842494D042800000000000C000000023FF00000000000
        003842494D041100000000000101003842494D04140000000000040000000138
        42494D040C0000000003A6000000010000007B000000A0000001740000E88000
        00038A00180001FFD8FFED000C41646F62655F434D0002FFEE000E41646F6265
        00648000000001FFDB0084000C08080809080C09090C110B0A0B11150F0C0C0F
        1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E
        0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0CFFC000110800A0007B03012200021101031101
        FFDD00040008FFC4013F00000105010101010101000000000000000300010204
        05060708090A0B01000105010101010101000000000000000100020304050607
        08090A0B1000010401030204020507060805030C330100021103042112310541
        51611322718132061491A1B14223241552C16233347282D14307259253F0E1F1
        63733516A2B283264493546445C2A3743617D255E265F2B384C3D375E3F34627
        94A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F6374757677787
        97A7B7C7D7E7F711000202010204040304050607070605350100021103213112
        044151617122130532819114A1B14223C152D1F0332462E17282924353156373
        34F1250616A2B283072635C2D2449354A317644555367465E2F2B384C3D375E3
        F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F627374757
        67778797A7B7C7FFDA000C03010002110311003F00F5049249504A92492494A4
        924925292492494A4924925292492494A4924925292492494FFFD0F504924950
        4A92492494A4924925292492494A4924925292492494A4924925292492494FFF
        D1F5049249504A92492494A4924925292492494A4924925292492494A4924925
        292492494FFFD2F5049249504A92492494A4924925292492494A492492529249
        2494A4924925292492494FFFD3F5049249504A92492494A4924925292492494A
        4924925292492494A4924925292492494FFFD4F5049249504A92492494A49249
        25292492494A4924925292492494A4924925292492494FFFD5F5049249504A92
        492494A4924925292492494A4924925292492494A4924925292492494FFFD6F5
        049249504A92492494A4924925292492494A4924925292492494A49249252924
        92494FFFD7F5049249504A92492494A4924925292492494A4924925292492494
        A4924925292492494FFFD0F5049249504A92492494A4924925292492494A4924
        925292492494A4924925292492494FFFD93842494D042100000000005D000000
        01010000000F00410064006F00620065002000500068006F0074006F00730068
        006F00700000001700410064006F00620065002000500068006F0074006F0073
        0068006F00700020004300430020003200300031003700000001003842494D04
        060000000000070007010100010100FFE10CFD687474703A2F2F6E732E61646F
        62652E636F6D2F7861702F312E302F003C3F787061636B657420626567696E3D
        22EFBBBF222069643D2257354D304D7043656869487A7265537A4E54637A6B63
        3964223F3E203C783A786D706D65746120786D6C6E733A783D2261646F62653A
        6E733A6D6574612F2220783A786D70746B3D2241646F626520584D5020436F72
        6520352E362D633133382037392E3135393832342C20323031362F30392F3134
        2D30313A30393A30312020202020202020223E203C7264663A52444620786D6C
        6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F30
        322F32322D7264662D73796E7461782D6E7323223E203C7264663A4465736372
        697074696F6E207264663A61626F75743D222220786D6C6E733A786D703D2268
        7474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F2220786D6C
        6E733A64633D22687474703A2F2F7075726C2E6F72672F64632F656C656D656E
        74732F312E312F2220786D6C6E733A786D704D4D3D22687474703A2F2F6E732E
        61646F62652E636F6D2F7861702F312E302F6D6D2F2220786D6C6E733A737445
        76743D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F
        73547970652F5265736F757263654576656E74232220786D6C6E733A70686F74
        6F73686F703D22687474703A2F2F6E732E61646F62652E636F6D2F70686F746F
        73686F702F312E302F2220786D703A43726561746F72546F6F6C3D2241646F62
        652050686F746F73686F702043432032303137202857696E646F777329222078
        6D703A437265617465446174653D22323031392D30332D31335432313A30313A
        32372D30333A30302220786D703A4D65746164617461446174653D2232303139
        2D30332D31335432313A30313A32372D30333A30302220786D703A4D6F646966
        79446174653D22323031392D30332D31335432313A30313A32372D30333A3030
        222064633A666F726D61743D22696D6167652F6A7065672220786D704D4D3A49
        6E7374616E636549443D22786D702E6969643A62316535623364622D65343935
        2D393234302D386134312D6466356163313930646432362220786D704D4D3A44
        6F63756D656E7449443D22786D702E6469643A62316535623364622D65343935
        2D393234302D386134312D6466356163313930646432362220786D704D4D3A4F
        726967696E616C446F63756D656E7449443D22786D702E6469643A6231653562
        3364622D653439352D393234302D386134312D64663561633139306464323622
        2070686F746F73686F703A436F6C6F724D6F64653D2233223E203C786D704D4D
        3A486973746F72793E203C7264663A5365713E203C7264663A6C692073744576
        743A616374696F6E3D2263726561746564222073744576743A696E7374616E63
        6549443D22786D702E6969643A62316535623364622D653439352D393234302D
        386134312D646635616331393064643236222073744576743A7768656E3D2232
        3031392D30332D31335432313A30313A32372D30333A3030222073744576743A
        736F6674776172654167656E743D2241646F62652050686F746F73686F702043
        432032303137202857696E646F777329222F3E203C2F7264663A5365713E203C
        2F786D704D4D3A486973746F72793E203C2F7264663A4465736372697074696F
        6E3E203C2F7264663A5244463E203C2F783A786D706D6574613E202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020203C3F787061
        636B657420656E643D2277223F3EFFEE002141646F6265006440000000010300
        1003020306000000000000000000000000FFDB00840001010101010101010101
        0201010102020101010102020202020202020302030303030203030404040404
        0305050505050507070707070808080808080808080801010101020202040303
        0407050405070808080808080808080808080808080808080808080808080808
        0808080808080808080808080808080808080808080808FFC20011080171011B
        03011100021101031101FFC4005F000101000000000000000000000000000000
        0A01010101000000000000000000000000000005081001000000000000000000
        000000000000A01101000000000000000000000000000000A012010000000000
        00000000000000000000A0FFDA000C03010102110311000000BC2C8140000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000001FFDA00080102000105
        00539FFFDA0008010300010500539FFFDA0008010100010500539FFFDA000801
        0202063F00539FFFDA0008010302063F00539FFFDA0008010101063F00539FFF
        D9}
      Frame.Typ = []
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 44.936920000000000000
        Top = 196.535560000000000000
        Width = 377.953000000000000000
        DataSet = rel_DS_Mov_Vendas
        DataSetName = 'RelMovVendas'
        RowCount = 0
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 64.252010000000000000
          Top = 3.779534880000000000
          Width = 32.755926670000000000
          Height = 13.858276670000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'VALOR TOTAL')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 117.165430000000000000
          Top = 3.779534880000000000
          Width = 32.755926670000000000
          Height = 13.858276670000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'MOV')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Left = 154.960730000000000000
          Top = 3.779534880000000000
          Width = 44.094516670000000000
          Height = 13.858276670000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'METODO')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          AllowVectorExport = True
          Top = 33.598330000000000000
          Width = 381.732530000000000000
          Height = 11.338590000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            
              '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ' +
              '- - - - - - - - - - - - - - - - - - - ')
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 207.874150000000000000
          Top = 3.779530000000000000
          Width = 32.755926670000000000
          Height = 13.858276670000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'FUNC')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 253.228510000000000000
          Top = 3.779530000000000000
          Width = 32.755926670000000000
          Height = 13.858276670000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'HORA')
          ParentFont = False
        end
        object RelMovVendasvalor: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 49.133890000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 22.677180000000000000
          DataField = 'valor'
          DataSet = rel_DS_Mov_Vendas
          DataSetName = 'RelMovVendas'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[RelMovVendas."valor"]')
          ParentFont = False
        end
        object RelMovVendasmovimento: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 109.606370000000000000
          Top = 18.897650000000000000
          Width = 45.354360000000000000
          Height = 22.677180000000000000
          DataField = 'movimento'
          DataSet = rel_DS_Mov_Vendas
          DataSetName = 'RelMovVendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[RelMovVendas."movimento"]')
          ParentFont = False
        end
        object RelMovVendasmetodo: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 154.960730000000000000
          Top = 18.897650000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataField = 'metodo'
          DataSet = rel_DS_Mov_Vendas
          DataSetName = 'RelMovVendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[RelMovVendas."metodo"]')
          ParentFont = False
        end
        object RelMovVendasfuncionario: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 196.535560000000000000
          Top = 18.897650000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataField = 'funcionario'
          DataSet = rel_DS_Mov_Vendas
          DataSetName = 'RelMovVendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[RelMovVendas."funcionario"]')
          ParentFont = False
        end
        object RelMovVendashora: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 249.448980000000000000
          Top = 18.897650000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DataField = 'hora'
          DataSet = rel_DS_Mov_Vendas
          DataSetName = 'RelMovVendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[RelMovVendas."hora"]')
          ParentFont = False
        end
        object RelMovVendastroco: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 291.023810000000000000
          Top = 3.779530000000000000
          Width = 34.015770000000000000
          Height = 15.118120000000000000
          DataSet = rel_DS_Mov_Vendas
          DataSetName = 'RelMovVendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Troco')
          ParentFont = False
        end
        object RelMovVendastroco1: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 287.244280000000000000
          Top = 18.897650000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataField = 'troco'
          DataSet = rel_DS_Mov_Vendas
          DataSetName = 'RelMovVendas'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[RelMovVendas."troco"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 211.653680000000000000
        Top = 264.567100000000000000
        Width = 377.953000000000000000
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Left = 52.913420000000000000
          Top = 42.114762860000000000
          Width = 91.248652860000000000
          Height = 16.197985710000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'VALOR TOTAL:')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          AllowVectorExport = True
          Left = 143.622140000000000000
          Top = 68.031540000000000000
          Width = 90.708720000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'LOJA')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          AllowVectorExport = True
          Left = 49.133890000000000000
          Top = 79.370130000000000000
          Width = 275.905690000000000000
          Height = 35.275613330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[<Rel_Dados_Comprovante."endereco">] - [Rel_Dados_Comprovante."n' +
              'um"] - [Rel_Dados_Comprovante."bairro"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Memo44: TfrxMemoView
          AllowVectorExport = True
          Left = 68.031540000000000000
          Top = 117.165430000000000000
          Width = 238.110390000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'AT'#201' AQUI NOS AJUDOU O SENHOR.  1 Samuel 7:12')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Left = 68.031540000000000000
          Top = 136.063080000000000000
          Width = 238.110390000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Desenvolvido por Bruno dos Santos - (21) 97021-7483')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 52.913420000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'TOTAL DINHEIRO:')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 52.913420000000000000
          Top = 22.677180000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'TOTAL CART'#195'O:')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 151.181200000000000000
          Width = 71.811070000000000000
          Height = 22.677180000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          Memo.UTF8W = (
            '[totDinheiro]')
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 147.401670000000000000
          Top = 22.677180000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          Memo.UTF8W = (
            '[totCartao]')
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 143.622140000000000000
          Top = 41.574830000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          Memo.UTF8W = (
            '[SUM(<RelMovVendas."valor">,MasterData1)]')
        end
      end
      object Header2: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 156.598435770000000000
        Top = 18.897650000000000000
        Width = 377.953000000000000000
        object Memo47: TfrxMemoView
          AllowVectorExport = True
          Left = 59.212636670000000000
          Top = 11.338590000000000000
          Width = 265.826943330000000000
          Height = 20.157493330000000000
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'RELAT'#211'RIO DO DIA [Date]')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 20.157493330000000000
          Width = 379.212843330000000000
          Height = 17.637806670000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ' +
              '- - - - - - - - - - - - - - - - -')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          AllowVectorExport = True
          Left = 57.952793340000000000
          Top = 95.748093330000000000
          Width = 262.047413330000000000
          Height = 25.196866670000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              'CNPJ:  [Rel_Dados_Comprovante."cnpj"]    IE: [Rel_Dados_Comprova' +
              'nte."ie"]')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          AllowVectorExport = True
          Left = 71.811070000000000000
          Top = 122.204803330000000000
          Width = 59.212636670000000000
          Height = 12.598433330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          AllowVectorExport = True
          Left = 137.322923340000000000
          Top = 122.078776770000000000
          Width = 34.015770000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Time]')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          AllowVectorExport = True
          Left = 210.393836670000000000
          Top = 122.204803330000000000
          Width = 110.866213330000000000
          Height = 12.598433330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Tel: [Rel_Dados_Comprovante."tel"]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          AllowVectorExport = True
          Top = 128.504020000000000000
          Width = 386.771903330000000000
          Height = 17.637806670000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ' +
              '- - - - - - - - - - - - - - - - - - - - ')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          AllowVectorExport = True
          Left = 59.212636670000000000
          Top = 60.472480000000000000
          Width = 260.787570000000000000
          Height = 39.055143330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[<Rel_Dados_Comprovante."endereco">] - [Rel_Dados_Comprovante."n' +
              'um"] - [Rel_Dados_Comprovante."bairro"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Memo55: TfrxMemoView
          AllowVectorExport = True
          Left = 60.472480000000000000
          Top = 44.094516670000000000
          Width = 262.047413330000000000
          Height = 16.377963330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'LOJA')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          AllowVectorExport = True
          Left = 90.708720000000000000
          Top = 140.220472440000000000
          Width = 205.354463330000000000
          Height = 16.377963330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'VENDAS DO DIA')
          ParentFont = False
        end
      end
    end
  end
  object rel_DS_Caixa: TfrxDBDataset
    UserName = 'DSCaixa'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=id'
      'data_abertura=data_abertura'
      'hora_abertura=hora_abertura'
      'valor_abertura=valor_abertura'
      'funcionario_abertura=funcionario_abertura'
      'data_fechamento=data_fechamento'
      'hora_fechamento=hora_fechamento'
      'valor_fechamento=valor_fechamento'
      'valor_vendido=valor_vendido'
      'valor_quebra=valor_quebra'
      'funcionario_fechamento=funcionario_fechamento'
      'num_caixa=num_caixa'
      'operador=operador'
      'status=status')
    DataSet = query_caixa
    BCDToCurrency = False
    Left = 104
    Top = 760
  end
  object Rel_Dados_Comprovante: TfrxDBDataset
    UserName = 'Rel_Dados_Comprovante'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=id'
      'cnpj=cnpj'
      'ie=ie'
      'tel=tel'
      'endereco=endereco'
      'num=num'
      'fantasia=fantasia'
      'bairro=bairro')
    DataSet = query_comprovante
    BCDToCurrency = False
    Left = 224
    Top = 720
  end
  object tb_comprovante: TFDTable
    Connection = fd
    UpdateOptions.UpdateTableName = 'pdv.dados_comprovante'
    TableName = 'pdv.dados_comprovante'
    Left = 392
    Top = 792
  end
  object query_comprovante: TFDQuery
    Connection = fd
    SQL.Strings = (
      'select * from dados_comprovante ')
    Left = 496
    Top = 792
    object query_comprovanteid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object query_comprovantecnpj: TStringField
      FieldName = 'cnpj'
      Origin = 'cnpj'
      Required = True
      Size = 25
    end
    object query_comprovanteie: TStringField
      FieldName = 'ie'
      Origin = 'ie'
      Required = True
      Size = 25
    end
    object query_comprovantetel: TStringField
      FieldName = 'tel'
      Origin = 'tel'
      Required = True
      Size = 25
    end
    object query_comprovanteendereco: TStringField
      FieldName = 'endereco'
      Origin = 'endereco'
      Required = True
      Size = 60
    end
    object query_comprovantenum: TStringField
      FieldName = 'num'
      Origin = 'num'
      Required = True
      Size = 8
    end
    object query_comprovantefantasia: TStringField
      FieldName = 'fantasia'
      Origin = 'fantasia'
      Required = True
      Size = 35
    end
    object query_comprovantebairro: TStringField
      FieldName = 'bairro'
      Origin = 'bairro'
      Required = True
      Size = 25
    end
  end
  object DSComprovante: TDataSource
    DataSet = query_comprovante
    Left = 584
    Top = 784
  end
  object rel_movimentacoes: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44105.661395682900000000
    ReportOptions.LastChange = 44107.603272986110000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 184
    Top = 800
    Datasets = <
      item
        DataSet = rel_ds_mov
        DataSetName = 'DSMov'
      end>
    Variables = <
      item
        Name = ' Datas'
        Value = Null
      end
      item
        Name = 'dataInicial'
        Value = Null
      end
      item
        Name = 'dataFinal'
        Value = ''
      end
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'totalEntradas'
        Value = Null
      end
      item
        Name = 'totalSaidas'
        Value = Null
      end
      item
        Name = 'New Variable1'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      BackPicture.Data = {
        0A544A504547496D616765C9890000FFD8FFE106BA4578696600004D4D002A00
        0000080007011200030000000100010000011A00050000000100000062011B00
        05000000010000006A0128000300000001000200000131000200000022000000
        720132000200000014000000948769000400000001000000A8000000D4000AFC
        8000002710000AFC800000271041646F62652050686F746F73686F7020434320
        32303137202857696E646F77732900323031393A30333A31322031363A31373A
        3232000003A001000300000001FFFF0000A00200040000000100000253A00300
        04000000010000034A0000000000000006010300030000000100060000011A00
        050000000100000122011B0005000000010000012A0128000300000001000200
        0002010004000000010000013202020004000000010000058000000000000000
        48000000010000004800000001FFD8FFED000C41646F62655F434D0002FFEE00
        0E41646F626500648000000001FFDB0084000C08080809080C09090C110B0A0B
        11150F0C0C0F1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E
        0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC000110800A0007103012200
        021101031101FFDD00040008FFC4013F00000105010101010101000000000000
        00030001020405060708090A0B01000105010101010101000000000000000100
        02030405060708090A0B1000010401030204020507060805030C330100021103
        04211231054151611322718132061491A1B14223241552C16233347282D14307
        259253F0E1F163733516A2B283264493546445C2A3743617D255E265F2B384C3
        D375E3F3462794A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F6
        37475767778797A7B7C7D7E7F711000202010204040304050607070605350100
        021103213112044151617122130532819114A1B14223C152D1F0332462E17282
        92435315637334F1250616A2B283072635C2D2449354A317644555367465E2F2
        B384C3D375E3F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6
        E6F62737475767778797A7B7C7FFDA000C03010002110311003F00F414924948
        85249249294924924A5249249294924924A5249249294A8F52E6AFED7FDF55E5
        47A97357F6BFEFA90534D24924E43FFFD0F4AFB11FF49FF47FF324BEC47F7C7D
        DFED56924788A1ABF623FE907DDFED4DF623FE907DDFED56924ACA9ABF623FE9
        07DDFED4BEC47FD20FBBFDAAD249595357EC47FD20FBBFDA97D88FFA4FFA3FED
        569246CA9ABF623FE907DDFED4FF00623FE907DDFED565242CA9ADF623FBE3EE
        FF00CC92FB11FDFF00C3FF00325653A5654D5FB11FF49FF47FF32599D669F49D
        47BB76E0FED1C6C5BAB1FAFF00D2C7F83FFF0045A3126D45CA492494887FFFD1
        F530653A82903292174C9D2492B249248A1492499252E92694A5252E92694A52
        53258FD7FE963FC1FF00F7C5AFB96475F3EEC7F83FFEF88C770A72924925221F
        FFD2F538F24BE497C928F2450BA49BE49D05293274924AC924922858CA5253A6
        D5252B54B54B5F14B5F1494AD564F5F9DD8F3E0FFF00BE2D6D7C564F5EFA58FF
        0007FF00DF118EEA72924925221FFFD3F52DC96E5182941450CB725B9460A509
        2996E4B728A492996E4A5452494CA5295149252E9264A1252EB27AF7D2C7F83F
        FEF8B5564F5DFA58FF0007FF00DF118EEA73124925221FFFD4F5191E0948F04C
        92285E4782523C1324929791E0948F04C924A5E4782523C1324929791E0948F0
        4C924A5F4F04A4782649252F23C164F5EFA58FF07FFDF16AACAEBBF4B1FE0FFF
        00BE231DD4E5A4924A443FFFD5F50493A48A16493A49296493A49296493A4929
        6493A49296493A49296595D77E963FC1FF00F7C5ACB27AF7D2C7F83FFEF88C77
        539692492910FF00FFD6F53D12D132708A15A7825ED48A8A4A652D4B44C02749
        4AD12D3C1327494A81E09E0264E82950128092492550163F5FFA58FF0007FF00
        DF16C2C7EBFF004B1FE0FF00FBE231DC20B9492492950FFFD7F5209D249142C9
        25AF9A7494A4C927494A4E9248294924924A5249249254B1FAFF00D2C7F83FFE
        F8B6163F5FFA58FF0007FF00DF118EE145CA492494AB5FFFD0F5320A6DA567EF
        B3F7DDF794B7D9FBEEFBCA7521D18849676FB3F7DDF794B7D9FBEEFBCA5C2A74
        613ACDDF67EFBBEF296FB3F7DDF794B854E924B377D9FBEEFBCA5BECFDF77DE5
        2E153A492CDDF67EFBBEF296FB3F7DDF794B854E924B377D9FBEEFBCA5BECFDF
        77DE52E153A4B1FAFF00D2C7F83FFEF88DBECFDF77DE551EA6E71356E24E8EE4
        CFEEA206AA69249249E87FFFD9FFED0F1A50686F746F73686F7020332E300038
        42494D0425000000000010000000000000000000000000000000003842494D04
        3A000000000125000000100000000100000000000B7072696E744F7574707574
        000000050000000050737453626F6F6C0100000000496E7465656E756D000000
        00496E746500000000436C726D0000000F7072696E745369787465656E426974
        626F6F6C000000000B7072696E7465724E616D65544558540000001700480050
        0020004400650073006B006A0065007400200033003500310030002000730065
        007200690065007300000000000F7072696E7450726F6F6653657475704F626A
        63000000160043006F006E00660069006700750072006100E700E3006F002000
        640065002000500072006F0076006100000000000A70726F6F66536574757000
        00000100000000426C746E656E756D0000000C6275696C74696E50726F6F6600
        00000970726F6F66434D594B003842494D043B00000000022D00000010000000
        010000000000127072696E744F75747075744F7074696F6E7300000017000000
        004370746E626F6F6C0000000000436C6272626F6F6C00000000005267734D62
        6F6F6C000000000043726E43626F6F6C0000000000436E7443626F6F6C000000
        00004C626C73626F6F6C00000000004E677476626F6F6C0000000000456D6C44
        626F6F6C0000000000496E7472626F6F6C000000000042636B674F626A630000
        000100000000000052474243000000030000000052642020646F7562406FE000
        000000000000000047726E20646F7562406FE0000000000000000000426C2020
        646F7562406FE000000000000000000042726454556E744623526C7400000000
        0000000000000000426C6420556E744623526C74000000000000000000000000
        52736C74556E74462350786C40520000000000000000000A766563746F724461
        7461626F6F6C010000000050675073656E756D00000000506750730000000050
        675043000000004C656674556E744623526C7400000000000000000000000054
        6F7020556E744623526C7400000000000000000000000053636C20556E744623
        50726340590000000000000000001063726F705768656E5072696E74696E6762
        6F6F6C000000000E63726F7052656374426F74746F6D6C6F6E67000000000000
        000C63726F70526563744C6566746C6F6E67000000000000000D63726F705265
        637452696768746C6F6E67000000000000000B63726F7052656374546F706C6F
        6E6700000000003842494D03ED00000000001000480000000100020048000000
        0100023842494D042600000000000E000000000000000000003F800000384249
        4D040D0000000000040000005A3842494D04190000000000040000001E384249
        4D03F3000000000009000000000000000001003842494D271000000000000A00
        0100000000000000023842494D03F5000000000048002F66660001006C666600
        06000000000001002F6666000100A1999A000600000000000100320000000100
        5A00000006000000000001003500000001002D00000006000000000001384249
        4D03F80000000000700000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800
        000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800003842494D040000
        000000000200023842494D04020000000000060000000000003842494D043000
        0000000003010101003842494D042D0000000000060001000000033842494D04
        08000000000010000000010000024000000240000000003842494D041E000000
        000004000000003842494D041A00000000035900000006000000000000000000
        00034A000002530000001200460055004E0044004F002000520045004C004100
        54004F00520049004F0020004100340000000100000000000000000000000000
        000000000000010000000000000000000002530000034A000000000000000000
        0000000000000001000000000000000000000000000000000000001000000001
        0000000000006E756C6C0000000200000006626F756E64734F626A6300000001
        000000000000526374310000000400000000546F70206C6F6E67000000000000
        00004C6566746C6F6E67000000000000000042746F6D6C6F6E670000034A0000
        0000526768746C6F6E670000025300000006736C69636573566C4C7300000001
        4F626A6300000001000000000005736C6963650000001200000007736C696365
        49446C6F6E67000000000000000767726F757049446C6F6E6700000000000000
        066F726967696E656E756D0000000C45536C6963654F726967696E0000000D61
        75746F47656E6572617465640000000054797065656E756D0000000A45536C69
        63655479706500000000496D672000000006626F756E64734F626A6300000001
        000000000000526374310000000400000000546F70206C6F6E67000000000000
        00004C6566746C6F6E67000000000000000042746F6D6C6F6E670000034A0000
        0000526768746C6F6E67000002530000000375726C5445585400000001000000
        0000006E756C6C54455854000000010000000000004D73676554455854000000
        01000000000006616C74546167544558540000000100000000000E63656C6C54
        657874497348544D4C626F6F6C010000000863656C6C54657874544558540000
        0001000000000009686F727A416C69676E656E756D0000000F45536C69636548
        6F727A416C69676E0000000764656661756C740000000976657274416C69676E
        656E756D0000000F45536C69636556657274416C69676E000000076465666175
        6C740000000B6267436F6C6F7254797065656E756D0000001145536C69636542
        47436F6C6F7254797065000000004E6F6E6500000009746F704F75747365746C
        6F6E67000000000000000A6C6566744F75747365746C6F6E6700000000000000
        0C626F74746F6D4F75747365746C6F6E67000000000000000B72696768744F75
        747365746C6F6E6700000000003842494D042800000000000C000000023FF000
        00000000003842494D041100000000000101003842494D041400000000000400
        0000083842494D040C00000000059C0000000100000071000000A00000015400
        00D4800000058000180001FFD8FFED000C41646F62655F434D0002FFEE000E41
        646F626500648000000001FFDB0084000C08080809080C09090C110B0A0B1115
        0F0C0C0F1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14
        140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC000110800A00071030122000211
        01031101FFDD00040008FFC4013F000001050101010101010000000000000003
        0001020405060708090A0B010001050101010101010000000000000001000203
        0405060708090A0B1000010401030204020507060805030C3301000211030421
        1231054151611322718132061491A1B14223241552C16233347282D143072592
        53F0E1F163733516A2B283264493546445C2A3743617D255E265F2B384C3D375
        E3F3462794A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F63747
        5767778797A7B7C7D7E7F7110002020102040403040506070706053501000211
        03213112044151617122130532819114A1B14223C152D1F0332462E172829243
        5315637334F1250616A2B283072635C2D2449354A317644555367465E2F2B384
        C3D375E3F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F6
        2737475767778797A7B7C7FFDA000C03010002110311003F00F4149249488524
        9249294924924A5249249294924924A5249249294A8F52E6AFED7FDF55E547A9
        7357F6BFEFA90534D24924E43FFFD0F4AFB11FF49FF47FF324BEC47F7C7DDFED
        56924788A1ABF623FE907DDFED4DF623FE907DDFED56924ACA9ABF623FE907DD
        FED4BEC47FD20FBBFDAAD249595357EC47FD20FBBFDA97D88FFA4FFA3FED5692
        46CA9ABF623FE907DDFED4FF00623FE907DDFED565242CA9ADF623FBE3EEFF00
        CC92FB11FDFF00C3FF00325653A5654D5FB11FF49FF47FF32599D669F49D47BB
        76E0FED1C6C5BAB1FAFF00D2C7F83FFF0045A3126D45CA492494887FFFD1F530
        653A82903292174C9D2492B249248A1492499252E92694A5252E92694A525325
        8FD7FE963FC1FF00F7C5AFB96475F3EEC7F83FFEF88C770A72924925221FFFD2
        F538F24BE497C928F2450BA49BE49D05293274924AC924922858CA5253A6D525
        2B54B54B5F14B5F1494AD564F5F9DD8F3E0FFF00BE2D6D7C564F5EFA58FF0007
        FF00DF118EEA72924925221FFFD3F52DC96E5182941450CB725B9460A5092996
        E4B728A492996E4A5452494CA5295149252E9264A1252EB27AF7D2C7F83FFEF8
        B5564F5DFA58FF0007FF00DF118EEA73124925221FFFD4F5191E0948F04C9228
        5E4782523C1324929791E0948F04C924A5E4782523C1324929791E0948F04C92
        4A5F4F04A4782649252F23C164F5EFA58FF07FFDF16AACAEBBF4B1FE0FFF00BE
        231DD4E5A4924A443FFFD5F50493A48A16493A49296493A49296493A49296493
        A49296493A49296595D77E963FC1FF00F7C5ACB27AF7D2C7F83FFEF88C775396
        92492910FF00FFD6F53D12D132708A15A7825ED48A8A4A652D4B44C027494AD1
        2D3C1327494A81E09E0264E82950128092492550163F5FFA58FF0007FF00DF16
        C2C7EBFF004B1FE0FF00FBE231DC20B9492492950FFFD7F5209D249142C925AF
        9A7494A4C927494A4E9248294924924A5249249254B1FAFF00D2C7F83FFEF8B6
        163F5FFA58FF0007FF00DF118EE145CA492494AB5FFFD0F5320A6DA567EFB3F7
        DDF794B7D9FBEEFBCA7521D18849676FB3F7DDF794B7D9FBEEFBCA5C2A74613A
        CDDF67EFBBEF296FB3F7DDF794B854E924B377D9FBEEFBCA5BECFDF77DE52E15
        3A492CDDF67EFBBEF296FB3F7DDF794B854E924B377D9FBEEFBCA5BECFDF77DE
        52E153A4B1FAFF00D2C7F83FFEF88DBECFDF77DE551EA6E71356E24E8EE4CFEE
        A206AA69249249E87FFFD93842494D042100000000005D00000001010000000F
        00410064006F00620065002000500068006F0074006F00730068006F00700000
        001700410064006F00620065002000500068006F0074006F00730068006F0070
        0020004300430020003200300031003700000001003842494D04060000000000
        070007010100010100FFE1120D687474703A2F2F6E732E61646F62652E636F6D
        2F7861702F312E302F003C3F787061636B657420626567696E3D22EFBBBF2220
        69643D2257354D304D7043656869487A7265537A4E54637A6B633964223F3E20
        3C783A786D706D65746120786D6C6E733A783D2261646F62653A6E733A6D6574
        612F2220783A786D70746B3D2241646F626520584D5020436F726520352E362D
        633133382037392E3135393832342C20323031362F30392F31342D30313A3039
        3A30312020202020202020223E203C7264663A52444620786D6C6E733A726466
        3D22687474703A2F2F7777772E77332E6F72672F313939392F30322F32322D72
        64662D73796E7461782D6E7323223E203C7264663A4465736372697074696F6E
        207264663A61626F75743D222220786D6C6E733A786D703D22687474703A2F2F
        6E732E61646F62652E636F6D2F7861702F312E302F2220786D6C6E733A64633D
        22687474703A2F2F7075726C2E6F72672F64632F656C656D656E74732F312E31
        2F2220786D6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E
        636F6D2F7861702F312E302F6D6D2F2220786D6C6E733A73744576743D226874
        74703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970652F
        5265736F757263654576656E74232220786D6C6E733A73745265663D22687474
        703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970652F52
        65736F75726365526566232220786D6C6E733A70686F746F73686F703D226874
        74703A2F2F6E732E61646F62652E636F6D2F70686F746F73686F702F312E302F
        2220786D703A43726561746F72546F6F6C3D2241646F62652050686F746F7368
        6F702043432032303137202857696E646F7773292220786D703A437265617465
        446174653D22323031392D30332D31325431363A31303A35392D30333A303022
        20786D703A4D65746164617461446174653D22323031392D30332D3132543136
        3A31373A32322D30333A30302220786D703A4D6F64696679446174653D223230
        31392D30332D31325431363A31373A32322D30333A3030222064633A666F726D
        61743D22696D6167652F6A7065672220786D704D4D3A496E7374616E63654944
        3D22786D702E6969643A62363966383932382D393063382D383934352D613530
        312D3862613432396534356232312220786D704D4D3A446F63756D656E744944
        3D2261646F62653A646F6369643A70686F746F73686F703A3665626435353434
        2D343466622D313165392D613635342D6335636565343334373364662220786D
        704D4D3A4F726967696E616C446F63756D656E7449443D22786D702E6469643A
        34316464636231302D613935342D373234322D616633642D6635663335396264
        66626233222070686F746F73686F703A436F6C6F724D6F64653D2233223E203C
        786D704D4D3A486973746F72793E203C7264663A5365713E203C7264663A6C69
        2073744576743A616374696F6E3D2263726561746564222073744576743A696E
        7374616E636549443D22786D702E6969643A34316464636231302D613935342D
        373234322D616633642D663566333539626466626233222073744576743A7768
        656E3D22323031392D30332D31325431363A31303A35392D30333A3030222073
        744576743A736F6674776172654167656E743D2241646F62652050686F746F73
        686F702043432032303137202857696E646F777329222F3E203C7264663A6C69
        2073744576743A616374696F6E3D227361766564222073744576743A696E7374
        616E636549443D22786D702E6969643A66313461373734302D396136622D3434
        34372D613462352D303737383032663837336362222073744576743A7768656E
        3D22323031392D30332D31325431363A31373A30392D30333A30302220737445
        76743A736F6674776172654167656E743D2241646F62652050686F746F73686F
        702043432032303137202857696E646F777329222073744576743A6368616E67
        65643D222F222F3E203C7264663A6C692073744576743A616374696F6E3D2273
        61766564222073744576743A696E7374616E636549443D22786D702E6969643A
        30393063613532612D396433612D626534392D623635632D6235363861333161
        36326530222073744576743A7768656E3D22323031392D30332D31325431363A
        31373A32322D30333A3030222073744576743A736F6674776172654167656E74
        3D2241646F62652050686F746F73686F702043432032303137202857696E646F
        777329222073744576743A6368616E6765643D222F222F3E203C7264663A6C69
        2073744576743A616374696F6E3D22636F6E766572746564222073744576743A
        706172616D65746572733D2266726F6D206170706C69636174696F6E2F766E64
        2E61646F62652E70686F746F73686F7020746F20696D6167652F6A706567222F
        3E203C7264663A6C692073744576743A616374696F6E3D226465726976656422
        2073744576743A706172616D65746572733D22636F6E7665727465642066726F
        6D206170706C69636174696F6E2F766E642E61646F62652E70686F746F73686F
        7020746F20696D6167652F6A706567222F3E203C7264663A6C69207374457674
        3A616374696F6E3D227361766564222073744576743A696E7374616E63654944
        3D22786D702E6969643A62363966383932382D393063382D383934352D613530
        312D386261343239653435623231222073744576743A7768656E3D2232303139
        2D30332D31325431363A31373A32322D30333A3030222073744576743A736F66
        74776172654167656E743D2241646F62652050686F746F73686F702043432032
        303137202857696E646F777329222073744576743A6368616E6765643D222F22
        2F3E203C2F7264663A5365713E203C2F786D704D4D3A486973746F72793E203C
        786D704D4D3A4465726976656446726F6D2073745265663A696E7374616E6365
        49443D22786D702E6969643A30393063613532612D396433612D626534392D62
        3635632D623536386133316136326530222073745265663A646F63756D656E74
        49443D22786D702E6469643A34316464636231302D613935342D373234322D61
        6633642D663566333539626466626233222073745265663A6F726967696E616C
        446F63756D656E7449443D22786D702E6469643A34316464636231302D613935
        342D373234322D616633642D663566333539626466626233222F3E203C70686F
        746F73686F703A446F63756D656E74416E636573746F72733E203C7264663A42
        61673E203C7264663A6C693E61646F62653A646F6369643A70686F746F73686F
        703A63383837363862342D336162612D313165392D396266372D626532623861
        3737326435633C2F7264663A6C693E203C2F7264663A4261673E203C2F70686F
        746F73686F703A446F63756D656E74416E636573746F72733E203C2F7264663A
        4465736372697074696F6E3E203C2F7264663A5244463E203C2F783A786D706D
        6574613E20202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        20202020203C3F787061636B657420656E643D2277223F3EFFEE002141646F62
        650064400000000103001003020306000000000000000000000000FFDB008400
        0101010101010101010102010101020201010101020202020202020203020303
        0303020303040404040403050505050505070707070708080808080808080808
        0101010102020204030304070504050708080808080808080808080808080808
        0808080808080808080808080808080808080808080808080808080808080808
        08FFC2001108034A025303011100021101031101FFC400CE0001010100020301
        010000000000000000000102030904070A060501010101010101010100000000
        0000000000010203060405071000020103020405040301000301000000000111
        0212131003203021144031041517330607375060323641220523110001020106
        070D06050204050500000001003111214191A1023220305161D133A41040B112
        4203D3E30405B536077181E135757660C122B4065013F0F16214A2247495A552
        921585161200010403010002030100000000000000006001310271A1B1322080
        40A05190FFDA000C03010102110311000000FB0AF59F98000000000000000000
        000000000000000000000000000000000075D9FAB8FCBEC07677F8FB00000000
        000000000000000000000000000000000000000000003AECFD5C7E5F603B3BFC
        7D80000000000000000000000000000000000000000000000000001D767EAE3F
        2FB01D9DFE3EC000000000000000000000000000000000000000000000000000
        0EBB3F571F97D80ECEFF001F6000000000000000000000000000000000000000
        000000000000075D9FAB8FCBEC07677F8FB00000000000000000000000000000
        000000000000000000000003AECFD5C7E5F603B3BFC7D8000000000000000000
        0000000000000000000000000000000001D767EAE3F2FB01D9DFE3EC00000000
        00000000000000000000000000000000000000000000EBB3F571F97D80ECEFF1
        F6000000000000000000000000000000000000000000000000000075D9FAB8FC
        BEC07677F8FB0000000000000000000000000000000000000000000000000000
        3AECFD5C7E5F603B3BFC7D800000000000000000000000000000000000000000
        00000000001D767EAE3F2FB01D9DFE3EC0000000000000000000000000000000
        000000000000000000000EBB3F571F97D80ECEFF001F60000000000000000000
        00000000000000000000000000000000075D9FAB8FCBEC077CDE1FEE0056B8B5
        9C6B000022D40000000000000059B025C0B340A012596680008014800882A81C
        F9E8C801480E957D97C1F82EF903E87FF9E7E90002B8379C6B24022D0800E2A0
        00A002000AA2255000214042B9337535400002805894956585A359BCB8D80001
        D117BCFCBF5DFD1903E87FF9E7E90000B75E36F9E759245A1000335C5B850000
        00000000002428896DB973635B9A00012BC8C6B774240A485B20881699A001D1
        17BCFCBF5DFD1903E87FF9E7E9000019B78378C59AB90000066B86CBAA000000
        0000001001168172E6C6B535400012C110000004DE7A7918D950259D11FBBFCC
        F5DFD1903E87FF009E7E90000545278FD312E400000335C5B000000000000099
        5A014032A73635B9A00019B9DCD6A68500080069778D0523A22F79F97EBBFA32
        07D0FF00F3CFD2000504095E3F4C4B9000000CD70EA5B4000000000224975409
        2555002C7373D6A6A800039F3A5A1900042821A5B9A3A22F79F97EBBFA3207D0
        FF00F3CFD200282001357C7DF39720000019AE2D8000000001248BAA001332DA
        A005CB9B3ADE74000066E753433723534258204D4BE4E7AB17A22F79F97EBBFA
        3207D0FF00F3CFD20141000026AF8DBC2E4800000C5716A5B400000022497540
        000490B6802C7373D6A6A80010E696CD0001424034B65E88BDDFE5FAEFE8C81F
        43FF00CF3F48290000029136F1B585840000062B8F60000004492EA800000224
        97540172E6C6B7340000724D000022550217A27F71F9DEBBFA3207D0FF00F3CF
        D252000000056F3BC78FAE79AA800000C5716A5B400842C9175400000001332D
        AA02C73F3D59AA000012C4B4C5CD00D4D429D157B7F83D79F4640FA1EFE7BFA5
        600000000559ACEA78DBE52AA00000315C7B002E521A2800000000020280B973
        635B9A0000B3C9C749282001681D11FB9FCCF5DFD1903E82FC27D65F379F4E7C
        6900000003537C7D39F8FAC4AA100000C570EB2CDD154B2E5AA0000000000224
        97540B1CDCF5A9AA003373C99DF3E365400001D117BCFCBF5DFD1903E813C3FD
        229FD3E3DF9F968000000568B8D63C7E9CC02000018AC994AB29A00000000000
        009996D50B973E35A9A000CDCF2675CF8E8940000E88BDE7E5FAEFE8C81F409E
        1FE9029FD4E3DF9B9E900000002B78DE3C7D7350202E2C08D2E2B29351680000
        0000000002495542C7373D6A6A8337356272677CF8E810001D117BCFCBF5DFD1
        903E813C3FD200B1FD4E5DB9B96C00000059BA7174C706F902887159A548519B
        26C0000000000000001124BAA2E5CF8D6A6B373A9A19B91CB9DF363A20003A22
        F79F97EBBFA3207D02787FA40029FD4E1DF9B1A40000000D37C3BE7C3BE6004D
        4AE3B988B0456A8000084405D40014202824821692C72E75652669608BCB9D72
        677598BB97933BE88FDDFE5FAEBE8C81F409E1FE9000165FEA71EBCDCF600000
        02DD55E1DF3E1BCCB5512B16096042B1B000211C7ACF8FBE79BA2405812AA422
        824B51A922AC1C990160A2ACB2CA2AFF005787D1D14FB7FCFF005DFD1903E813
        C3FD2000058FEA71EFCDCF640000000AE2DE784A5258B9E133B9562112ACB740
        00386E7C4E98D482000025A00B1A44B2CCDB64E4CB5340002168597A3CF63F37
        AF7BC03E813C3FD200000B2FF578F6E5E7A00000015A9670EA71DCB592010C51
        2AC4CDB34000124E2B38772A580005B6282255405B4458E6CDAD24145A8E6C6B
        95B47451EE3F3BD77F4640FA08F0BF50A0012A89A97FA5CBB6A56400002AA962
        70EF1C7AC08B5218A5225019A500000190902E8A02665D5002249755172E7CEE
        A80489579F1BE4CEBA22F77F99EBAFA3207D0C780FD1012800691036BAC80002
        ADA94335A9E3EF963590520E331A85B0A94A0000249E3EF9C582DA9010B10580
        149951516F2628325A44CAEE5E8EBD97CDEBEEF00FA04F0FF480000001A8FEA7
        1EFCB8D20142ADA9249A9D06758E0DF3C6B20B003082D23358DCAA00038D9F13
        A73CDA00000B20968000153979D0285113A3DF63C3D7DDE01F425E0BEF160290
        8A833ABA9059BF2716C05BA5952422353A089358F1F78CEB20A09C1A8A0866DD
        2680001971EB3E2EF0A8551A90010D012904B51691CD9A8AA42C4E8E3D9FCDEB
        DEF00FA0DF07F658540500AA02053CACF4E5C52DA922000353A133BC78FBC66E
        4028200071D6351680001249269A50400000005925B570E79BD4B2883A2BF6DF
        0FAF3E8C81F40FE1BEA804102A0028406A5FEA70FA39705A900006A7412E66A7
        8FBE59B000000071D6360000892716A67524514428000008322B79BB96CA64BD
        1B7B3F97D7BDE01F431E03F42C45D848B5742412DB150B8AD46A02000001A9D0
        6779F1B5CA6B2002900038EB1A8B404492DB867C4EBCF16800000000002C8397
        16A8E8F3D8FCFEBEEF00FA04F0FF004810A0080A416A4294B2FF004F8F7E5C50
        00006A7404C6F1E3EF9CB0005200071D63608925D508C33E275C44CDA00D4822
        8025002C0D49C99D17A3CF63F37AFBBC03E84BC17DE22DB2466C2EA494922D32
        8B4CD8559AF3B9F4B900001A9D0019DE3C6DF296000A0800E3AE3D445D500004
        13341001540500008CEE6B9B1AE8B3DB7C3EBCFA201F435FCFFF0054000262B5
        2DDE732D89A854586A4A962140001A9D000B31BCF8FBE510000A400715674500
        0018673480A000080000A65A5E8DBD9FC9EBDEF00FA1EFE7BFA400000290042A
        C0000000000D4E800C74C78FBE510000A08071D629A0000CC9E274E5C7AA0000
        00000001D217ADE1EBFEF00FA1FF00E7BFA4000042C280000000000000D4D800
        71EF1E3EF9900186EA6990071D63600008CA787D39E340000000000379747FEB
        F87AFF00BC03E82BC2FD600E3B38F59B28291400000000000000B1CD9D846779
        C2008AA40A090634CD116D800433600010011400017A41F5DC3D7FDE01F409E1
        FE9000E2DE78F50021410440001A6C0000000B97366D94442AAC010A01104B33
        650B650204A40A00000025511D1FFB0E1EBEEF00FA04F0FF0048000E2DE7152C
        1490AB2CB080005B29400000068E5C2CA000000000A2652CB54000000000019B
        2C551D1E7B1F9FD7DDE01DF6F87FA40CD962AC1400492ACAA040014000000008
        216168000204B45012D8D00000000000085003A50F5BC3F03DE01DF6787FA442
        80000002522800000000000020AB000000021400351A0000000000428003A51F
        5BC3F03DE01DF6787FA400000000008500000000000101400000000405000000
        0000010255000E947D8FCFF81EF00EFB3C3FD440000000000214000000000101
        40000000001014000000000D4D66C200001D28FB1F9FF03DE01DFB788FAB8AE4
        000000000010588000000002D320A80000000160B352C4000002A89672E7496D
        9C3720000749BEBF8FE07BC03BF8F17F4000000000000138AE4B400000400D4D
        40500000000101412C45500019B8DCD7262AB2716F3A9A00003A49F5DC3F01DA
        01DFDF89FA400000000000010B24B4000062CE2D66CD80000000000000292C45
        580A42B3C99D58C59C7B965280001D257AEE1F80ED00FA0EFE7FFA0000000000
        000001116D8004B2CA0000000000000000024B6C0A42ACAD44B240000007467E
        E3E1F5EFD1903E807C37D7400000000000000085008500000000000000000000
        03971AB5C361028000000747DECBE5F5F778077E9E2FBD5000000000000000CD
        CEA544D44B54000000000000000003373A9752D814E3D42800000003A49F5DC3
        F01DA01DFA78BEF54000000000000003373AC8B2CAD0000000000000000000CD
        CEE5DE2DAD4BC1ACAD000000000E927D770FC0768077E9E2FBD5000000000000
        0044966A6866E753400000000000000000009C99BA978F59C5168000000001D2
        4FAEE1F80ED00EFD3C5F7AA00000000000004B11540110550000000000000000
        227366C33671EB3A9B88AB2800000003A49F5DC3F01DA01DFA78BEF540000000
        000004B986A680004B05940000000000000CDCD379BACDD1C7A98B4500CDCD96
        A8000000E927D770FC0768077E9E2FBD500000000000097296A80000222ACA00
        0000000001139212EA2D7156358B3740009725B28000007493EBB87E03B403BF
        4F17F450000000000012C4550000000337365AA0000000003373A979B1752E6B
        8ECCE90A000019B9A59A000007493EBB87E03B403BF3F17DB4D000000000012E
        52D50000000009730D4D00000000066E772F262CAE3D3371A9B00000011259A9
        A00003A49F5DC3F01DA01DFA78CEF12CB5400000001966AD500000000002584B
        340000000088525500000000002588AA001D24FAEE1F80ED00EFD3C5FD149725
        B28000000CDCEA6800000000000044966A6800000066E6CB540000000000004B
        226A6801D24FAEE1F80ED00EFD3C5F7AA337365AA00000CDCEA6800000000000
        0002588AA00004415400000000000001105503A49F5DC3F01DA01DFA78BEF540
        892CD4D0000CDCEA68000002148500000000960B28004B115400000000000000
        00CDCD96AF493EBB87E03B403BF4F17DAA800440B02696594000000445B96373
        60000000082CB28102550014100000000000000895AE927D770FC0768077F1E2
        7A94000096EA4CDB6400000000BC7B89AE4CE0A000000000B5209560012B16D5
        DE72000000000000001D237AFE5F80EF00EFE7C4F51680089756245D64000000
        0048B0D2140000002512CDCDC230A001065695014000000000009443A46F5FCB
        D7FDE01DFE78CEE0002259A32550000000010005000000011059A22800000000
        000000000001194D7489EB787AFF00B80EFF003C5F7AB100960D4D0CDC92CD00
        0000000000000000290055CDC8B28000000000000000004B1157A43F5DC7D7FD
        A01F405E27E84000000085000000000000000002C4A000428000000000000000
        00000E8FBD870F5F77807D06F84FB00850000002140000000000000042800000
        10A00000000000000042800E8D3DA7C9EBDEF00FA1FF00E79FA4255100000012
        8580005000001000128580000001285800000000000012A88007449EEFF3FD77
        F4640FA1FF00E79FA59B752000000002545D480294000004204A028020000002
        50B00000000000095600007449EEFF003FD77F4640FA11F05F6D0000002D6B3A
        D000C94F1F78E1D60000003CBE7D779D0ABC7738DE5007367540000073E37602
        02928005000A44AAA80A201D11FBAFCEF5DFD1903E82FC1FD2000000391BE694
        0011C1B9E0F5E566400001E4E3BF95CF60B9B386F344D652F335C928000039B1
        D3931400001A9D000005466CD0BD20000E88BDC7E67AEBE8C81F417E0FE90000
        00D5D73E77500030781DB966E22D9000072E7AF9BCFA2325AE1D7396149BCEB9
        66824B6D2141BCEB9F1B812A8010353A00005912CD017A40001D117B8FCCF5D7
        D1903E82FC1FD200000B6F919DD000965781D7971DE6066DD2200D4DF9FCBB12
        04E2D670C6A685396DB1532D724D6359C5BBCE6CBE4F3D802AEB3B0A080353A0
        0B2259A000BD20007445EE3F33D75F4640FA0BF07F480000AE7CF4D800097C3E
        98F1F7C40025A4B15BF3F8F6A133666E38D986A695CD2D02B79D645C0E39D3CB
        E7740035376501410353A09722CD000017A4007445EE3F33D75F4640FA0BF07F
        4800069CB9DF2CA0028E0D67C2E9C4800000F2F1F473F3B8B1666CE399A08725
        D72CC896EB3A96E6E2C439F1D3932006A6ACD000050D67A4B91668000002F480
        7445EE3F33D75F4640FA0BF07F48000DB5CF340008C69FCFEBC632000146FC9E
        7D3C9E7D32CE759B6713280356DBBE5CF306ACD6359A88DE77CF8A00B2EA6C00
        00504B5AB28000000BD201D117B8FCCF5D7D1903E82FC1FD20069737C89BA000
        23C4E99C6B2000044DCDF95CBA66C8CB6E39890055E4D6B368DE33C937C7732C
        1BCEBC9E7400353A5800001402353A000000017A41D117B8FCCF5D7D1903E82F
        C1FD202AE9CFCFA680001C1A440A000B26B3BDCD66E66B0309862CD09672DDCB
        A49A4E4C6A8055F239EEE68805580000A2A4015ACF4000000005E93A22F71F99
        EBAFA3207D05F83FA4361CD8DF24A0008F1B73C5E9C400010D6F3AF231D3926B
        3BC6A4CA70A0D44396EA6B4359CEB376A0179F1BDE2800000001480028A9353A
        00000001D11FBCFCBF5D7D1903E82FC2FD2C9B6F1BE7940004250002150D4D40
        71EF1A9331C57165CD0E595BD8D4CD9AE4C801CB9E9CBCE80000000148000015
        66ACD0000000E88FDE7E5FAEBE8C81F417E13E946B579F1D2A000653F9FDB397
        35A00D4D25A72E75E573DE6F3CEE8E398400AE46E6A8D49CB8A00DE75CFCF600
        0000005200000000D4E8000001D117BCFCBF5DFD1903E82FC27D34E7CF4D0000
        38EB3400011A9656A25CCB25B8989002B99ACDACA69CD8B402CBE473E9600000
        000520000000015AB3400000E88BDE7E5FAEFE8C81F415E13EAE7CEB91400078
        BBCF0EB200006A5AD7938D5678F7522678E66A85723535A164DE6EA5A8266F93
        9DEB3400000000000000000353A4B916680007445EF3F2FD77F4640FA0FF0007
        F66E6F49500195F1778200009565E4979A5E3D496DCE78E6401BB574B472626E
        58B0D272E3A72E280000008500000000000D4E825C8B34001D117BCFCBF5DFD1
        903E857C17DA228A838CE1DE41002C22D39737965E3D633AD6B39E2990259B6A
        DD2D1A9397140171BF233AB00000012AC0000000000000D4E92E459A007445EF
        3F2FD77F4640FA15F05F681161A4F0778C6F12D08115572D1E772E99D31A5931
        33962CD0572DD66E926A4E4CEA8026BC9E7B292C0000128580000000000001A9
        D0446A336A8E88BDE7E5FAEFE8C81F42BE0BED000E1AA94000C9A11C8B8B25CE
        A4E2B712085392EE5A3526F2D28097C8C74D64250B0000255800000000000000
        0D4E825C96CBD117BCFCBF5DFD1903E857C17DA00F1F53C4E9C336D0044B7532
        5F2F9F6E6CDCEB14B262D96865E4635A9445D5BBC5956017500084AD40105580
        000000000000001A9D009723A23F77F9BEBBFA3207D0AF82FB40E3B3C0EDC648
        2B711512C839F3D7CCE7BCEB1C7AD8006B33979DE7CD0235C99D000000003342
        C2AC00000000000000001A9D0012E7A23F77F9BEBBFA3207D0AF82FB40F0F79C
        DC80585082B5E673DE2E71BA001ACCDE2F938A00D4E96000000001C7AA393300
        0000000000000000353A0026B3D11FBAFCDF5DFD1903E857C17DA00032B402A0
        18B38F7400127261E4F3D500D4DD94000000094850B000000000000000000006
        A749724E88FDDFE77AEFE8C81F42BE0BED000CB5A4202E574CCB38B4968006B3
        3C9E5ADC006F79A00000004A4500942C0000000000000000005692D5E88BDE7E
        5FAEFE8C81DD4794FA0012DB20000CDB2C00003797266812B534000000008500
        00000000000000000000002CD750FEA3E3FC4F6807677F8FB000000000000000
        00000000000000000000000000000000000003AECFD5C7E5F603B3BFC7D80000
        000000000000000000000000000000000000000000000001D767EAE3F2FB01D9
        DFE3EC0000000000000000000000000000000000000000000000000000EBB3F5
        71F97D80ECEFF1F6000000000000000000000000000000000000000000000000
        000075D9FAB8FCBEC07677F8FB00000000000000000000000000000000000000
        000000000000003AECFD5C7E5F603FFFDA0008010200010500FE8FB7FE7FA56D
        FF009FE95B7FE7FA56DFF9FE95B7FE7FA56DFF009FE95B7FE7FA56DFF9FE95B7
        FE7FA56DFF009FE95B7FE7FA56DFF9FE95B7FE75EFB74EFB74EFB74EFB747EB7
        745EB770EF370EF370EF370EF370EF370EF370EF370EF370EF370EF370EF370E
        F370EF370EF370EF370EF370EF370EF370EF370EF370EF370EF370EF370EF370
        EF370EF370EF370EF370EF370EF370EF370EF370EF374EF374EF370EF370EF37
        0EF374EF370EF370EF370EF370EF370EF370EF370EF374EF374EF374EF374EF3
        74EF374EF374EF374EF374EF370EF370EF3747EB774EFB74EFB74EFB74EFB74E
        FB74EFB74EFB74F4B537B5C94F97041041041041041041041041041041041041
        0411CAB8924B892492E2492791E8FE8F297293F0D248DEAD0F911AC11A24410C
        B48208E2F47F479484C9E4A6353E0D8C5C2C8E4469041041041041040D09F07A
        3FA3CC5CA4FC32E06343E4492492CB8B8B892E2E2E1BE1F47F479B3CA4C6A79E
        DF32391041690416969690410411AFA3FA3CD4C5CA4FC2C09F0B43F0703D3D1F
        D1E727CB4CF3F091CF6CB892492492492492493D1FD1E6B5A2722E527E2DA1F1
        B45A5A8B516A2D45A8B4B4B4B4B4B4F49F4BC5A679F0B291F3A09E0688E4CF04
        924F07A4FA5CF6313917293E17E0609E0687C6C6CB8B8B8B8B8B8B8B8B8F49F4
        B5B0B074C7393E5267993C0BC03E28E2631A1723D1FD1E16A4AA98E5B114BE5A
        7C097876B8E0688E47A3FA3C75531E1208D234425E1589F29150D09F17A3FA3C
        6D49528E6A7C53A493A27E1DA275687C6D0D717A3FA3C974C731F4170CF05A5B
        C9F32D2D2DE6753A9D482D2082082D2D1523A0B0B0B074E9E8FE9725A92A51CB
        A8A593C324E924E93C74E905A884416905A411A41047022081F29A2AA4F47F47
        94D0E98E6262279108845C4AE34F49249249249278FF00F2F4688E438140E993
        D2FD2E5B454A398842E2B4B48208E37D05517171797179797979717171717990
        559717978EA2E2E2E2E2E2E2F1D4C92E83D27D2D6E2E2E2E2E2E2F2E2F436344
        2E627C525C49717170B932492C964F2635688E381A7A7A3FA3AC104104104105
        A432D2DE4C93A27C882D2D65A2E4C169616969696A2D2D2D2D20821102A48442
        2D2358208D2D47A5FA5CE6874F31313E3924927934D5CA927C07A5FA5AE43217
        9797B2F65ECBCBCBD8F705B837C73C5227C524925C88278FC855124925C5C892
        4924B8B8B8B8924B8B8B87521D45C5C5C5E5E7A5FA5AE33198CB0B0C6632C319
        8CC6633198C74C13CB4C5CB4C6A790CB89D649249249249249192344717A4FA5
        ADC5C4971717124925CB49D5A92A51CC9E627C95496961616169696969696969
        6969696969696169696969E97E96B0C820B59D7586433A9D74EA753AE902E9CB
        427CB4C6A78E927C135C1E97E96B0410410410411A4105A8820843A4AA9E5A27
        989F1B62A89E64924924E8F5F4BF4B5BCBCBCBCBCBCBCC86432190C85E643219
        0C83A87CC5CC4C7CA75171717171717171771C11A7A4FA5CC83AEB0493CF4C9E
        627CA82C2C2D2D2C2D2D2D2C2C2C2C2C2C2D63A0C6CF4BF4BF829297CC4CF3E3
        42F05E9BE9F1C104704104104104104104104104104104104104409F313E4489
        F80A8F4DF4F5B4B4B4B4B0C6633198CC6633198CC6633198CC6633198CC66331
        98CC6633198CC6622C2C2C4585A5A8B4B4B4B4B4820B4B482D2082C2C2C2C238
        A0820820820820820F4DF4F909F8A688E19E5492492492492492492492492492
        4924925C49E9BE9F253E19D649F02C8E74788F4BF4B9524924F0492492492492
        4924924924924924F0492492493C3249226410410410410410410410411A4104
        107A6FA7FCAA64924924924924924924924924924927A6FA7FD2BD2FD2FE82C5
        C8F4BF4B82D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2
        D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2
        DD2048B4B4B4B4B4B4B4F4DF4F5820820820820820820820820823973E3DEA90
        B91E9BE9EB0410410410410410410410410416905A5A5A5A5A5A5A5A27E39888
        122393E9BE9EB9D99D99D99D99D99D99D99D99D99D99D99D99D99D99D99D99D9
        9D99D99D99D99CCECCECCECCECCECCECCECCECCECCECCECCECCECCECCECCECCE
        CCECCECCECCECCECCECCECCECCECCECCECCECCECEE199D99D99D99D999999999
        99D99CCECCECCECCECCECCECCECCECCECF48E76B5C48C48C48C48C48C48C48C4
        8C48C48C48C48C48C48C48C48C48C48C48C48C48C48C46246246246231189189
        1891891891891891891891891891891891891891891891891891891891891891
        8918918918918918D18D188C4623123123123123123123123123123123D2AFFF
        002F12FC73D3C87D443E77A6FA7E25F8E63D3CB45CEF4DF4FF009791B244BC07
        A6FA7FCC40A9F03E9BE9FF0026864E902F05E9BE9FF27237AA5E0FD37D3FE45F
        0411E13D37D3FE458F48F0DE9BE9FF004AF4DF4FFA57A6FA7FD2BD37D3FE95E9
        BE9EB24924924924924E924924924924924924EB2492492492492492493A4924
        E92492493AC92492492492492492492492492493A7A6FA7ABE54F313F0689E19
        F0F27A6FA7AC1041041046B0410410410410410411A433AE9041041041041041
        0468C488208208D7A90F582082082082082082082082082047A6FA7C12492493
        AC6924924924924924924F0C924924924924924F0C9249249249249249249249
        2492492492492492493AFA6FA7FD2234F4DF4F592E2592C92492492592CB8925
        92C964B2592C964B2592C964B2592C964B2592C964B2592C924B8964B2E2E249
        2592C964B2592C964B2592C964B2592C964B2592C964B2592C964925C4B3D2FD
        3D6F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F
        2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F
        2F2F2F2F2F2F2F2F3D2FD2F0F041041041047147F0DE8FE978682592C964B259
        2C964BE38208FE0FD1FD2D6C2C4588B11622C4588B11622C43A4B4B4B4B4B482
        0A682C2C4588B11622C4588B51622A42A4820815258584104104104104103238
        238A492492395E93E973678994D3CAA993AAD6091F25BF00B95E93E9783484B9
        353D208D11248DEB04F137C73E13D27D2E5B7C53A534F25B2758D172A746FC67
        A4FA5E060A572AA7AA5A473193E33D27D2E4A637C6972AAAB58E4CE890F56F98
        84FC07A4FA5CF6CA57264AAAE17C084F856ADF8EF49F4B8EAE44099722E45C8B
        91722E44A2E43AB9AF482082A7E3FD27D2E37C8B4B4B4B4B4B4B4B0B4B74489E
        521BE16FC7FA4FA5C2941237C4D1493C725C3625C086B8A389BFE03D27D2E1AB
        C043D1B12D18B54C6B810DF0B7FC0FA4FA5AFF00E46F8D212E26488AB85F0CEB
        E5C2FF0082F47F475FFCF2131D42A8B8B99732E65C4924E887C88247C0C9FE0B
        D1FD1D50F8E9A47496969696969696168C4B8DF03E16C6FF0083F47F4756F917
        17979797979797978EA122796DF0D4FF0084F47F479291696161616161696160
        D11C688E07C2DFF0BE8FE8F25124924924A24B912362E05C723E06362FE13D1F
        D1E45A5A5A41041043208D121F22491F0C8FF86F47F478E95AB5AC7054C489E2
        6C7512C964B249249249FE1FD1FD1E24B9553E4B7C13CD823C7FA3FA5C499717
        1722F2E2F2E2E1D648B890DF8262F1FE8FE97804B8EA7C2F9D24F8FF0047F479
        E909F13637C0DFF1FE8FE8EBEDC7B71EDC7B71EDC7B71EDC7B71EDC7B71EDC7B
        71EDE7607607607607607603FF00E71ED87B61ED87B69ED87B61ED87B61ED87B
        61ED87B61ED87B61ED87B61ED87B61ED87B61ED87B61ED87B61ED87B61ED87B6
        1ED87B61ED87B61ED87B61ED87B61ED87B61ED87B61ED87B61ED87B61ED87B61
        ED87B61ED87B61ED67A7A6DDBFE95B7FE7FA56DFF9FE95B7FE7FA56DFF009FE9
        5B7FE75FFFDA0008010300010500FE8EFF00A5BFE96FFA5BFE96FF00A5BFE96F
        FA5BFE96FF00A5BFE96FFA5BFE96F8315262A4C5498A916D523DA4588B11622C
        4588B11622C4588B11622C4588B11622C4588B11622C4588B11622C4588B1162
        31D263A4C749622C463A4C7498E931D263A4C7498D18E931D263A4C7498E916D
        A1D1498E931D263A4B292CA4B2931A31A31231A15148B6A930D261A4C3498693
        0D261A4C3495A87C96B973E0249249249D249249279369690416969616160A81
        53C8DCFF005CAA972A3C4C6AB8E04F592492759249278B73FD7290D0F94DF865
        C33C8924B8B8B8B8B8B8B8B891313E066E7FAE527A55FC32E34882C2C2D2D2D2
        D2D2C2C2D12E1DCFF5CD6B97E5E03CF973C8B8B8B8B8B8B8B8B8B8B8B8B89D77
        3FD739AFE1972275964BD64920913169B9FEBC4B5E3279091696969696904169
        69691A6E7FAE7B43FE1971A65C5C5C5C5C5C5C5C5E5E5E5C57FEB9E864729A3C
        BC5CF26DE0B4B4B782BF3F014952FE1D71A122D20B4B4B4B4B4B4B4DCFF5ADEC
        BD94D53CD6B99E42F153C54E93C9DCFF005C2994D53CBA468A97F0EB8A44C5C8
        DCFF005C74D53CB9132A5CA9249F173C305452F91B9FEB8D329AA796969553C5
        02A48208F1AB87CC4CA5F1EE7FAE4D354F310D70C12497171772E49249249E39
        2513A49249717176B714D66445E5E2AB4DCFF5C94E0A6A9E5D23435A411A470C
        7259248DEB3A4F0C6BD783A9D4EA753A89E89EA994D46E7FAE5262AA44F98D11
        ABD6DD3A9D4EA75E36B49249249249278A5923D193CA4E0ABCF969C14B9E5F4D
        1A1F1CE92895C687496969696B2D2D20B4B4B4B482D2D2D2D2D2D2D2D2D2C2C2
        C2D2C152588B0AFCF5B596B2D65A5A5A5ACB596B1213E6B5C4F58208F113C0A0
        9249211D0915449B9FEB5B8B8B8B8B8B8B8B8B894362AB9703435C725C493CAB
        8B9925C5C5CCBCB8B8B8964925C5C5C3A8B8965C5C49248C551732AF3E726535
        7318D731AE3A972208249E4412470A1F9EB8CC66331988C6632C2C3198CB0547
        1413C2D1035C505A432394E923582D2D65A5A4696B2D65A5A5A5A5A5A582A0B0
        B19616161579EB7979797979797991990C86432B323320AA9E5BD2A5E1639D1C
        13A410415F9EB696B20B590410410411A41027052E79690D0D78382E2E2E2E2E
        24B8B8B8B8B8B8B8B8BCB892E2F2E2F2E2E2AF3D6F44A2E44A25128944A25128
        84743A1D0E84A131F2D8D783635E0A04F5ABCF952492492C924924B8A5F2DA1A
        1F836881E92493AC10411C51A410CABCF5C66231188C43DB3118CC4CC6633198
        CC658636631524732A435CCF2238E082082082082082393257E7CC83AE9E6412
        493CE68A973239324971717171717171717171717171717171795F9EB2492492
        493C33E16AA7C231AF04FCFC7C924924C9553C4D8B9B6F827E7ADC5C5C5C5ECC
        86466432190C86432190C86432190C86432190C86432190C86432190C8642F65
        E5C5E642F2F2F2F2F2F2F2F2F2492492E2E2E2E249E182082082082082347E7C
        86883A1D3450743A1D38D41D0E8743A1D0E8743A1D08279D041075D3A1041041
        0410410410410410411AC0FCF9304104104104169690410411A4104104104104
        11AC6B0410411AC1046AD13E096B579F2638A08FE0649F10FCFC027E15BFE15F
        9FF4AABCF56BC7C78F81AE455E7AB249249249249249249249249D27993A493C
        D9249279324899248DF21F9EB24924924924924924924924925CC86753A9D4EA
        753A9D4EA752D248F09027C7E62E0AB90FCF5B91722E45C8B91722E45C8B9172
        2E45C8B91722E45C8B912892492492492492746BC33427C2C5AC971E7C87E7AE
        0460460460460460460460460460460460460460460460460460460460460460
        3023023023023023018118118118118118118118118118118118118118118118
        1181181181181181181181181181180C08C08C28C28C28C28C28C28C08C08C08
        C08C08C08C08C08C08AD43D72332332332332332332332332332332332332332
        3323323323323323323323323323323323323329919919919919919919919919
        9199199199199199199199199199199199199199199199199199199199199199
        197B3233233233233233233233233233233233233232AF3D5786A49D18978AA7
        5F2F00FCF55E1A910DF8CA74F2D5F39F9EABC2B625AB7E2DA168DF807E7AAF08
        D8970C09F8A91B129D1A279AFCF55E0DB12E3689F09514E923E3F213E5BF3D57
        82912E4B44F826411A468DF1B427CA7E7AAF03225CCF213E7D3C1237CA813E4B
        F3D67C0A5CE689E75232757CB68F2E43F3E0F213E779780684F9AD888F01027C
        4FCF55A409F2FCFC1B47972DB12F06D09F0BF3D56B027E3E04F90D89785689E0
        7E7AAE068F2F1ED09F13625E2204F47E7C98208208E6F973BCF8978A6B47E7AB
        E4C13CD6BC0C0993C33E21F9F0C92493C324924924924924924E924E92492492
        49249249248B8249249D649D649249249249249249249249249D1F9EB05A5A5A
        5A5BAC105A5A5A5A5A5A5A5A5A5A5A5A4104105A5A5A5A5A5A5A5A5A5A5A3425
        ADA5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A35A3F3D
        6749249D2756C9249249249249249249249249249249249249246C4493A32492
        49249249249249249249249249249249249249247E7C10410410410410411A41
        0410410410410410410410410410411A41041041041041041041041041041041
        041041041041041041041579EB616161616161616161616161618CB0B0B0B0B0
        B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0C65858585858
        585858585858585858585858585858585858585855E7FD2ABFF5FD2ABFF5ADE5
        E5E5E5E5E5E5E5E5E2AC5512492497125558B70C8CC8CC8CC8CC8CC8CC82AD97
        17124923A8BCBC550AA249249249249E382082082D2D2D2D20B448B4B4B4B4B4
        B4B4AFFD7352E248A9F2A94411A3D234812E4A5E07CF93B9FEB98971B654C5C8
        A56924923AB8249244F824929249279B3CBDCFF5CB4B91555C13C2A92092746C
        AB544EAB59D12E14B96D91CBDCFF005E0AA7C49EA8A50DEAD97094F174121EAB
        892F0FB9FEB94971B63E4245348F491BE15AB625A31890970A5E2373FD7252E3
        63AB9105348F4918B817025A2D570A5CBE9CEDCFF5C84B90D161616161616169
        60A9D1BD27931A345A5A25E3F73FD71AE43A855171717171717A2E2E5A3245A5
        4F542D57125E3F73FD71A5C7510C86432190C86416B2D121B1F147040B852FE0
        373FD7125CDE9A4224824918C6F542D57125E1BCF97B9FEB852E36C91B2592C9
        64BD5A29431F1A42E425FC16E7FAE18E368820820820B448B74A9948C6F86390
        97F07B9FEB5812E375179797979797978AB2747AC8F5485AB42235484BF83DCF
        F5AA5C8748A82C4588B11622C4582A11031BD678172578E9E2DCFF005C3235AB
        65C5E8BD17A2F45E8B8B8B89E4342E4AF1F04F0EE7FAE4B20820820B4B482048
        9E0A9EB491ACF0A5A4F8F8D275DCFF005C87512492492497124EAF47ACF0B447
        02FE1674DCFF005C753244C65CCB9923649225A4EAC82048820820B48208208F
        E1609373FD71363D5245A5BC14D3C8812E05FC6366E7FAE268C6633196161698
        CC625C8425FC8A2BFF005CA9E6A5C297F1DB9FEB9EC4F8D702FE3634DCFF005A
        E432190C86532190C86432190CA2DC32190C864321905B86532994CA673399CC
        E673399CCE673399CCE673399CCE673399CCE673399CCE673399CCE673399CCE
        673399CCE673399CCE673399CCE67339DC15397FD29FF4B7FD2DFF004B7FD2DF
        07FFDA0008010100010500FE8FF7BFFD9FF4AFBDFF00ECFF00A57DEFFF0067FD
        2BEF7FFB3FE95F7BFF00D9FF004AFBDFFECFFA57DEFF00F67FD2BEF7FF00B3FE
        95F7BFFD9FF4AFBDFF00ECFF00A57DEFFF0067FD2BEF7FFB3FE95F7BFF00D9EB
        F1B7D947C6DF651F1B7D947C6DF651F1B7D9457F8DFECDA4F8E7ECD3E39FB34F
        8E7ECD3E39FB34F8E7ECD3E39FB347F8E7ECD3E39FB34F8E7ECD3E39FB34F8E7
        ECD3E39FB34F8E7ECD3E39FB34F8E7ECD3E39FB34F8E7ECD3E39FB34F8E7ECD3
        E39FB34F8E7ECD3E39FB34F8E7ECD3E39FB34F8E7ECD3E39FB34F8E7ECD3E38F
        B30F8E3ECC3E38FB30F8E7ECD3E39FB30F8E7ECC3E39FB30F8E3ECC3E38FB30F
        8E3ECC3E39FB305F8E7ECD3E38FB30F8E3ECC3E38FB30F8E3ECC3E38FB30F8E3
        ECC3E39FB30F8E7ECC3E39FB30F8E7ECC3E39FB30F8E7ECC3E39FB30F8E7ECC3
        E39FB30F8E3ECC3E38FB305F8E7ECB95F8DBEC96BE35FB28F8D7ECA3E35FB28F
        8D7ECA3E35FB28F8D7ECA3E35FB28FCA9E9B63D17E50E4D745BC2E785CC5ECBD
        97B2F65ECBD97B2F65ECBD97B2F65ECBD97B2F66466466466465ECC8CBD99199
        199197B1549AE3892CA8B2A2CA8C7598EA31D463A8C5518EA31D4534D74BE3FC
        BDFB6793D0AA8B5EBE5C55533E2D369D2D35C4BA14D772D3A1D0E87425128BA9
        2EA4BA93A3E2FCBDFB6795575556DDA53C9AA991F865E5AA6D35526B8E512892
        4924924924928A9D2D435AB3F2F7ED9E53523529D163E4D54CF83F3E426D14B4
        F8D229A2E31331331331188C46231188C4534BA787F2F7ED9E6352AAA5D2F935
        533E07CF949B42A935C49B4D6E52D64A4BE92FA4BE82FA0BE92FA0BE92FA4BE9
        2FA44D3D7F2F7ED9E6D54AA934E97C9AA99E7F9F31368A5A7C89D7A9D759248D
        28A9D2D35523F2F7ED9E7554AA93A5D2F935533E1609E14DA1549F229A29A963
        A4C7498E931D263A4C7498E91EDD22DBA116522A552CFCBDFB679F552AA5552E
        97C9AA99E54C733CB85369D2D3E3A6A74BCA6532994CA653375CA6532994CA7E
        5E73F9639E8AE955269A27935533E2D369AA935C88E08208E0FCBBFB5F54D3E6
        A2BA5549A3CB935533C294B87E15382969AE2A5C34A86ADA4B692DA48A48A48A
        4B692DA4B693F2F7ED9D7B9DD4775BC6CEF2DD5CCAE8B8F2E5554C9E47412509
        52CA5B9F03E5C09B4D549AE14515DAD43E4FE5EFDB3C34D4E97B3BCB757290D1
        5D12B955D32269A50D28A7C2791E7AA6D09A6B8A8AEDE4FE5EFDB3C54D4E97B3
        BD4EEAE5A65744E913C0DC2BD17A2F45D4A2B74B1BA5F868E04DA69A6B5F3D19
        4576F23F2F7ED9E3A6A74BD9DEA77572A34AE89E17D56363DB6DE392C70E9716
        D5E2D382969A3CF5F324A2B8E3FCBDFB67914D4E97B3BB4EED3CCAE89E26DD25
        553464AA2FA8C8C6E7C4CA2EA455A4D6E50D64A0C941976CCBB665DB33ED147A
        ADB4773B2773B0773B06DEF6DEE33F2F7ED9E4D353A1ECEF53BB4F29695D1AB5
        047489150A2DA0B682DA0B291D1C8AEF325664ACBEB664ACC9597D65F517545C
        C9649249D04A5B490E981C09C34E4EA753A9D49E14DA7B1BEB757E5EFDB3CAA6
        A7455B3BCB769E66E510252293AD23F31F9DBA753A92C97C7B9B7710D3B4B482
        0B4B4B4B78544B83A5AA20A5C133CA4DD2FF002DB757E56E5D353A2AD9DEA776
        9E574D2BA14B7C2DC2BCC85E64A46D37C75EDDC60ACC15982A305460A8C0CC0C
        EDD981980EDD1811811811DBA305260A4C140B66942D8DB676D41DBD076F41DB
        D076FB676FB66DECECB3B6D93B7D83F2F24BF2C6B8774C3BA60DE306E98374C1
        BA60DE306F18378A76B7E8AA875554F32AA1D3AF968D4AB19632C658CB18E869
        781F3E4D2ED134F83A1D094515DC433F2FFED9D726D9936CC9B665DB32ED9976
        CCBB665DB32ED99768CBB6535D15723C89D2082BA2DD7AEB5B69CB2E65D5173E
        4B98CB5A79EA33B33D667A8CD599B70CBB8CCBB866DC32D665ACCB5197707B95
        9937117EE32FDC16EEE216E56CBF70C95992B2FAC75564D5392B3F2D75FCABCE
        A2BAA8AB6B769DDA787A42FF00DB85A2BA6D7AC8D265B49FFE67FF0099141141
        5243E3AF6D569A74BE2964B2110B909B5A470F43F2CFED4D7B4DB3B4DB3B5DB3
        B5DB3B6DA3B5DA3B5DA3B4DB3B4DB3B5DB3B5DA6769B653B14D1579F07467FEB
        1FF9E0686A4AA974BD7CB4B6A2D65B511516B21F22BDB55AB2B459598EB31D66
        2ACC7598EB315662ACC3598AB315661DC316E18B70C3B862ACC358B6AB42D8AD
        98370EDEB3B7ACEDEB3B7ACFCB4ADFCABAAF5559DDD6777B877551DD5477759D
        DD677551DDD4776CEED9DDB3BB6776D1B5BB4EED3CB84D554BA5F2AAA793D3C0
        79694D4E9134F482083F2EFED7D716E18F711656595965659596565B516D45AC
        B6A21EB45555156D6F53BAB9486935552E97CAAA9E479956EDA6746746747708
        CE8EE11DC23B847708EE11DC23B846793399D99DA33B29F51552D7A9677151DC
        5477159F969CFE55D6EA055D25D4A1574B528913489E0EBAF98940B99524D34E
        97CAAA9E198D6BA154AAA5D0FC07989C3D7F2CFED4E28E44B45CC9A855548BEB
        29DDDCA6ADADDA7769E5D54AA934D3E5554EB3025C1550AA5552E96886C86432
        190C86432190C86432190C86410C52886D4547E59FDA9AF6DB676DB676D41DB6
        D8FD2D076B4A7DAD27688ED51DA1DA33B36768D9DA5476959DA567695947A7DD
        A2A4E572EAA5549A69F2AAA639BD0E8743A72BC8A6AB44E4FCB9FB5F93D69254
        1723FF0053CC9549722D65AC8E7D74A6351CBAA88E4BAE9A4CB4196832ED9976
        CCBB666DB336D99B6CCDB665DB32ED9976CCBB665DB32ED99B6CCB414FA8A293
        F2DB557E56D6110884422110884744743A32085E16BA1549A8E2F2E1AA9E4554
        AA9574BA1A71E07F2C7ED3E57FE7C4D7426B869498FA70D54C721D29AAE87435
        D79F41F963F69EBDC6E9DC6E9DC6E9DC6E956FFA84775BE775BE777BE777BE77
        7BE775BE777BE777BE777BE777BE777BE777BE775BE775BE775BE775BE775BE7
        75BE775BE775EA0EEB7CEEB7CEEB7CEEB7CEEB7C5EAF7D35EA775AEE374EE378
        AB7B76A32EE19770CBB885BDB864ACCBB865DC9CDB866DC335666AC75D664DC3
        25664DC325664ACC95992B1D75B44924B2597171717125CCB99732491368FCB1
        FB4F915D30743A1D0E8283A1D0E9C6A0E8743A1D0E8743A1D0E840AA869CAD60
        853C8843A4B510422D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D1D2A6C45A7E59F
        DA9C9AA9D20823482082086432190C8E626D09CAD6190C864321EB0C8643D234
        EBE05B128D7F2CFED4D6592C965CD92D12CB99D4EA753A92C96896CEA753A9D4
        EA753A9D4EA753A9D4EA753A9D4EA753A89B2E67526A26A26A26A26A26A258DB
        2EA91351351351D4BAA2592C964B2592C964B2592C964B2592C964B2592C964B
        259F957F68F0CCF2DAF09E425CBF2F15F957F687F07E5CFF003F11F957F686AE
        9AA9F01E5CF6E08E7F992B9D452AD69AE47E55FDA1AD54D2A8C68C68C68C68C6
        8C68C68C68C68C68C68C68C68C68C68C68C68B2931A31A31A31A31A31A31A31A
        31A31A31A2C42DB48B116231A31A31A31A31A31A31A31A31A31A31A31A2C4588
        C68C6918D18D18D18D18D18D18D18D18D18D32C462DBA13A12A6AA29B31A31A3
        1A31A31A31A31A3F2B74FCA3AE6DC336E19B70CDB866DC336E19B70CDB866DC3
        36E19B70CDB866DC336E19B70CDB866DC1EF6E33A9D4EA753A9D4EA753A9D48F
        0E9F1F994BB6ADC54C34B70AADA697C8FCAFFB4B5CBB665DB32ED9976CCBB665
        DB32ED9976CCBB665DB32ED9976CCBB665DB32ED9976CCBB665DB32D065A0CBB
        68CB4196832D065A0CB4196832D0575D152F0F3C54ABAA75529B6A8753A19279
        F23F2BFED2D7DB364F6CD93DB364F6CD93DB364F6CD93DB364F6CD93DB364F6C
        D93DB364F6CD93DB364F6CD93DB364F6CD93DB364F6CD93DB364F6CD93DB364F
        6CDA17FF0037659ED9B27B66C9ED9B27B66C9EDBB33ED9B27B66C9ED9B27B66C
        9ED9B27B66C9ED9B27B66C9ED9B27B66C9ED9B27B66C9ED9B27B66C9ED9B27B6
        6C9ED9B27B66C9ED9B27B66C9ED9B27B66C9ED9B27B66C9ED9B27B6ECA3DB364
        F6CD917FF3B651EDBB285FFCEDA4DFFF003B62A6FF00F9FB551ED9B27B66C9ED
        9B27B66C9ED9B27B66C9ED9B27B66C9ED9B27B66C9F96E9547E56D7DC3D49EE1
        EA0F70F507B87A83DC3D41EE1EA0F70F507B87A83DC3D41EE1EA0F70F507B87A
        83DC3D41EE1EA0F70F507B87A83DC3D41EE1EA0F70F507B87A83DC3D41EE1EA0
        F70F507B87A93DC3D41EE1EA0F70F527B87A83DC3D41EE1EA0F70F507B87A83D
        C3D41EE1EA0F70F507B87A83DC3D41EE1EA0F70F507B87A83DC3D41EE1EA0F70
        F507B87A83DC3D41EE1EA0F70F507B87A83DC3D41EE1EA0F70F507B87A83DC3D
        41EE1EA0F70F507B87A93BCDF477BBF0FD7FA94DFF00F47D437EE1EA4F70F507
        B87A83DC3D41EE1EA0F70F507B87A83DC3D41EE1EA0F70F507B87A83F2CD4EBF
        CA9AAF2F0A84BA7418BC52126CA69BC854555D355D57FEB45553A9F33F2BFED2
        D57978544A85E6FC5A29BA6D8A632AA5BA4AA53E6FE57FDA5AAF2F0A96ADF8B5
        4BA8A3FF0054BFF52B74AAB9FF0095FF00696ABCBC225E3EB6E9537EDBAFFF00
        5F3D1AE77E57FDA5AAF2F05225E3188DBA555565735D54A75572B87CB99F95FF
        00696ABCBC5B5E0D8E84E9A55293A9535BA36E92AA9D4DBF05F95FF697855CCF
        2F0085D44E9DA6D50E86E855535BA572A793F95FF697F228A5C3AB6EAA9D714D
        1CDF2E47E57FDA5C1E5CEF33CBF804DAF029F17E57FDA5E07CFC27972DBF091C
        5F95FF00696ABCB99E7E1D3E437E2FF2BFED2D579707971F9F888FE03CB5FCAF
        FB4B586432190C86432189496B2D6410D90C86432190C86432190C86433C910C
        86432190C86432190C86432190432190C86410C86432190F586432190C864321
        90C86432190C86432190C86432196BD3F2BFED2D52850C86432190C87A742191
        D6190C86432190C86432190C8634E1AD2190C86432190C86432190C86432190C
        54B218D74B486432190C869690C86432190C86432190C86432190C86432190C8
        64321907E57FDA5C524EB56889249249249249249D6116AD6492492492492757
        E4C5AC93C16A21704924924924924924924924EB5797E58FDA7AC10410411A42
        3A1088208208208208208208442211088208208208208208204B582082082082
        082082082082082082082082082082083A1F963F69F0F53A9D74E9AB6893A9D4
        EA753A9D4EA753A9D4EA753A9D4EA753A9D4EA753A9D4EA753A9223A9D7593A9
        D4EA753A9D4EA753A9D4EA753A9D4EA753A9D4EA753A9D4EA753AEBD4FCB1FB4
        F5B692CA4B692DA4B292CA4B292CA4B292CA4B692CA4B692DA4B692DA4B692DA
        4B692DA4B692DA4B692DA4B692DA4B692DA4B692DA4B692DA4B692DA4B692DA4
        B292CA4B692DA4B292CA4B292DA4B692DA4B692DA4B692DA4B692DA4B692DA4B
        692DA4B692DA4B692DA4B692DA4B692DA4B692DA4B692CA4B292CA4B693F2CFE
        D4D7B4DD3B4DD3B4DD3B5DD6FB4DD3B4DD3B4DD3B4DD3B4DD3B4DD3B4DD3B4DD
        3B5DD3B5DD3B4DD3B4DD3B4DD3B4DD3B4DD3B4DD3B4DD3B4DD3B4DD3B4DD3B4D
        D3B4DD3B4DD3B4DD3B4DD3B4DD3B4DD3B4DD3B4DD3B4DD1FA5DD42F49BA769BA
        769BA769BA769BA769BA769BA769BA769BA3F4BBC8ED774ED374ED374ED374ED
        374ED374ED374ED374ED374ED374ED374ED374ED374ED374ED374ED374ED374E
        D374ED374ED374ED374ED775BED374ED374ED374ED374FCB69D3F95B87CF993E
        0DB12E6273E0FCF8BF2F7ED9E0F3E77978094F44B9D3E07CF8FF002F7ED9D73D
        4CCF519EA33D467A8CF519EA33D467A8CF519EA16E56D64ACC95992B32565D5A
        3256CDEF515D2FB9DF3B9DF3B9DF3B9DF3B9DF3B9DF3B9DF3B9DF3B9DF28AF76
        D75D62AEA9756E4D5BB5A59B74CDBA66DD16EEEB6AADC8BEB2FACBEB2FACBEB2
        FACBEB1555CA4D2E182190C8643208208219044904104104107E5EFDB3CDA299
        E3DDAD514A7C9D9DB244FA4B6E5524BA9C6B4531C9DBA5AF03E7C9FCBFFB6799
        4D373885C3554A8A6AA9D4DA4CEAB8F6B6EFA9B4855175A5D45255537A492505
        E8B8BA04E74944A2514529B9F01E7CAFCBFF00B6796BABA55AB86616EEE64AB5
        8684E7828A1D55529509B85FE92A995391EB4A92235EAC4A07D4B58E0A55CD28
        F01E7CBFCBFF00B67974530B8B7F72789A139D14B746DA49BA5910A545754127
        9E8BA94A54AD3FF610DCEAA9753A6954AE04A1786FCBFF00B6795453C4D49BBB
        962E4ECED5ABA1524C86371C34D31AA50529A553829F243706DD16AE05C89F01
        F97FF6CF268A65F16E56A8A5B753E263A5D251B499E74FF9122552A67829479E
        ABA8DC27D47D046DD13C2972FA73BF2FFED9E4252D285C5B946ED6F06E98374C
        1BA60DD306E98374C3B861DD28F4ED35FF00E638436989153B9EB4AB9FFE745D
        5F449B6DDC5C50AE7D2383CBC4FE5FFDB3C8A69B57167A13EE283B8A0EE283B8
        A0EE283B8A0EE2817A8A1B55A9FF00D1BA9968FCABAA47AA4D9D16886E44A16A
        94B4952BC77E5FFDB3C7453C7BFB9690753A9D4EA75204AA652AA54EC6DD83AA
        1A527FE6A7034E539D6951ADC52B868A6D5E0BCB9BF97FF6CF1514CF1CA4743A
        1D0E8742693A17286E1A6EDAAA70948941368DB91A913295AD4534CF0EDD3E1B
        CF97F97FF6CF0D2AE710B86AA9534D753AEAE1A1D25915BAA69DAA3236C5FF00
        B1E6FAC373C14D2AA7D56A93AB868A6E7FC0FE5EFDB3C094BA69B571574535AC
        1B660DB30ED9876CC3B661DB16CED42DBA1BC7B4C487353A85E75552F54A5AE8
        79BEA85D44A16B4AB9A50BF81FCBDFB6759828A61716EEF34F2EE19B70CDB866
        DC336E19B70CDB82DDA9A5BB5D250AA54D5569E656E13D521285A2702A44F5F3
        74D36AF15E5C8FCBDFB675A29970D09A7C355D6F6F59DBD676F59DBD676F59DB
        D676F58BD3D6CEDAB36B66C6DC24A74A9C2E0A547052B469325AD36E8B7F84FC
        BDFB6785A13D6BA96DD3DC1DC9DC9DC9DC9DC9DC23B893B946DEE641B84DF525
        24DCBD194A2754A5F06DD1E3E09E1FCBDFB6789A4C96B4DCBF72AC7598EB31EE
        18F70C7B8595A31D6CB2B29DAAAA74D34D29BBB4892A72DEB4A9138D111D5285
        AD14BA9F911CA8F0DE5C1F97BF6CF21EE514BCDB666DB336D99B6CCDB666DB32
        EDB79B6C5B9B6D95329F22A7C090946AAA84970436E9A552B553FC04CE9F97BF
        6CF1EF6E5886BAA724104C289724B3676ED553856A3C90A9A5914914908A36A9
        4ACA0B281D14229A292DA4B282DA4B691534AE2EABF81FCBDFB678B73716DD2D
        B6F5871E4253AECEDDC3690BABE1B8DBA38129E6DC8552D174F1BF97BF6CF157
        46ED7560DC305660DC16C6E2787725EC6E3305660ACA7D3D6EA4924DDCF86A36
        E9B9EBE6251CDA20ABC723F2F7ED9E4CB9820885AD5571212BDA492D2509473A
        110BC7FE5EFDB3C899128D5A925AD2A709A8E248A29B56B4AE637FC079EBF97B
        F6CEBF319F319F319F318FF3149F319F319F319F319F319F319F31437F9824F9
        80F980F980F980F980F980A7F312A5FCCC7CCC7CCC2FCCB07CCE7CCE7CCE7CCE
        7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE
        7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE
        7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CD07CCE7CD07E4AF5BEE5F91BFA57DE
        FF00F67FD2BEF7FF00B3FE95F7BFFD9FF4AFBDFF00ECFF00A57DEFFF0067AFFF
        DA0008010202063F0043B22D916C8B645B22D916C8B645B22D916C8B645B7C27
        84F09E13C2784924924924924924924924924924924924924924924924924924
        92492492492492492492493C2784F09E12492493C2784F09E13C278493C27855
        DFF8C8BAE1B88BAE1B88BAE1B88BAE1B88BAE1B88BAE1B88BAE1B88BAE1B88BA
        E1B88BAE1B88BAE1B88BAE1B88BAE1B88BAE1B88BAE1B88BAE1B88BAE1B88BAE
        1B88BAE1B88BAE19175C322EB8645D70DC45D70C8BAE19175C322EB86E22EB86
        45D70C8BAE19175C322EB8645D70C8BAE19175C322EB8645D70C8BAE19175C32
        2EB8645D70DC45D70C8BAE19175C322EB8645D70C8BAE19175C322EB8645D70C
        8BAE19175C322EB8645D70C8BAE19175C322EB8645D70C8BAE19175C322EB864
        5D70DC45D70DC45D70DC45D70DC45D70DC45D70DC45D70DC45D70DC45D70DC45
        D70DC45D70DC45D70DC45D70DC45D70DC45D70DC45D70DC45D70DC45D70DC45D
        70DC45D70DC45D70DC45D70DC45D70DC45D70DC45D70DCF84924924924924924
        9249249249249EB47AD1EB47AD1EB47AD1EB47AD1EB47AD1EB47AD1EB47AD1EB
        47AD1EB47AD1EB47AD1EB47AD1EB47AD1EB47AD1EB47AD1EB47AD1EB47AD1EB4
        7AD1EB47AD1EB47AD1EB47AD1EB47AD1EB47AD1EB47AD1EB47AD1EB47AD1EB47
        AD156FE3322D916C8B645B22DBE1FFDA0008010302063F00FD03A08208208208
        1D16E8B745BA2DD16E8B745BA2DD16E8B745BA2DD16E8B745BA2DD16E8B745BF
        D2C7FA58E8B7FF0073DFF627745BA2DD16E8B745BA2DD16E8B745BA2DD16E8B7
        45BA2DD16E8B745BA2DD16E8B745BA2DD16E8B7FCC8208208208208208208208
        208208208208208208208208208208208208208208208208FAF9FFDA00080101
        01063F00FC0FFCBBEA9DBFF77CE7E0BFE5DF54EDFF00BBE73F05FF002EFAA76F
        FDDF39F82FF977D53B7FEEF9CFC17FCBBEA9DBFF0077CE7E0BFE5DF54EDFFBBE
        73F05FF2EFAA76FF00DDF39F82FF00977D53B7FEEF9CFC17FCBBEA9DBFF77CE7
        E0BFE5DF54EDFF00BBE73F05FF002EFAA76FFDDF39F82FF977D53B7FEEF9CFC1
        7FCBBEA9DBFF0077CE607C9769ED7D2AF92ED3DAFA55F25DA7B5F4ABE4BB4F6B
        E957C9769ED7D2A8FF00F0D27FD476AE957C9B68ED5D2AF936D1DABA55F26DA3
        B574ABE4DB476AE957C9B68ED5D2AF936D1DABA5501DCDB476AE957C9B68ED5D
        2AF936D1DABA55F26DA3B574ABE4DB476AE957C9B68ED5D2AF936D1DABA55F26
        DA3B574ABE4DB476AE957C9B68ED5D2AF936D1DABA55F26DA3B574ABE4DB476A
        E957C9B68ED5D2AF936D1DABA55F26DA3B574ABE4DB476AE957C9B68ED5D2AF9
        36D1DABA55F26DA3B574ABE4DB476AE957C9B68ED7D2AF936D1DAFA55F26DA3B
        5F4ABE4DB476BE957C9B68ED7D2AF93ED1DABA55F27DA3B574ABE4DB476BE957
        C9B68ED7D2AF936D1DAFA55F26DA3B5F4ABE4CF37FB8ED5D2AF936D1DAFA55F2
        6DA3B5F4ABE4DB476BE957C9B68ED7D2AF936D1DAFA55F26DA3B574ABE4DB476
        BE957C9B68ED7D2AF936D1DAFA55F27DA3B574ABE4DB476AE957C9B68ED5D2AF
        936D1DABA55F26DA7B574ABE4DB4F6AE957C9F68ED5D2AF936D1DABA552F7347
        37FB8ED7D2A88EE593FEA7B5F4ABE4BB4F6BE957C9769ED7D2AF92ED3DAFA55F
        25DA7B5F4ABE4BB4F6BE957C9769ED7D2AF92ED3DAFA55EA4763ECD63FB7D9BB
        277F77C766ECFCDC49E2D8E6FBC39EB36446D124C009F13C2A22E9AB064A7064
        7DC64C993264C993264C993264C993264C9934A993264C99328D231122BA6857
        4A65755DE04DC09AB09AB09AB4CA462F2E23D50FB8BBEFC4B9EC57B6651174F0
        EEF09C3887DF31DC88511EF18881BC2BDD74E9D3A714A70AF0A55E14ABC29510
        6385EA87DC5DF7E25CF62E0E0B8460C5BFC654464C4C43EFB8851A779E69C288
        310707D50FB8BBEFC4B9EC57E5B902C8CB1067C5443EF3E0C444288F78C44844
        9314E1384E2B4E9D3A74E9EA57AA57A42E307D50FB8BBEFC4B9EC5709DD8382A
        07DD8A887DE3F962A2149EF18608994A6072417F9A74F527A93D49D39A13A74E
        9D444BBBEA87DC5DF7E25CF63A07DC542D7B88C5443E3F34C30A4A30A214463D
        9327DC88972833A88DCF543EE2EFBF12E7B11C3864169910E3F2CD8A8879F1B1
        3EE189817C19144622209CE1394E5394E53953A9D4E9A59C9299446E7AA1F717
        7DF8973DBC20694431134D8A887C5C4FB862FF003C188F785118711EF0AED6AE
        D6AED6AED6AED6AED6A4B3416577DF14D5A6AD3569AB5EA81CBFC8BBECFF00E4
        B9EDE390CC510642A071310F9313C031B2518311EF5263201E73930FD4FF00B8
        7BEBC4B9EC0931D9E6502B362621E7C18292CC00DEB11EF0A230E51113C5022C
        829930F6ABA15D0AE8574264C997AA1F7177DF8973D812103DCAF0A028192D87
        18DCE18A815251898879C6E694496120032A801C522E90A36ADC26E2AC91961B
        C65A70223DE14461E5138524A32E27D50FB8BBEFC4B9EC216818112C540C96C5
        E18D887DCCF9567C4443CE14C6D8108146C992704E5512624301BD3F2C08D214
        66C2CCA1C99C28C6319F11EA87DC5DF7E25CF618B564C0862B25A0E31B117B87
        765A7762A753EE09224CBEE46D59FD3684A649913C5FD464CDBDA33E07085113
        E0C9B9032D9C47AA1F7177DF8973D8816AC9811282B25B17ACE3621F26090866
        960A366102EBF49973A02D484480E5500231739936F8969DDFC9472EE66DDC9B
        902DC187EA87DC5DF7E25CF6245AB260431592D8BD671A4D912CE32E0C6640D9
        311389D3FE92C5432E697718289C53A7C738578529C6795478C21ED0AF0A42BE
        290AF8A55F14ABE15F15A85AB724C6557EA3A15EA8ABC682B8B62D7EA78110DC
        F543EE2EFBF12E7B142D5930227592D0BD671BC61EF1F9EE4B27B5466C884265
        122400840549EB57AB57AB4F5A925CC7111B260722BD50578ABC55E2AF157AB0
        AF1A55F34957CD253D69CD29CD2A7A7720A597D8A2E3D9B92290EEBA7C204181
        1282140C9CE07197D8BD50FB8BBEFC4B9EC58B564C08C8B25B17ACE3499A70A5
        888B45716D52A318E50818C416CDB8705B111B3219F3AC89D3A74E9D3A74F820
        CCB4414232AD3BB2628106044A17A9B68BDAFE43DF44FBFBCB9EC60B564C0851
        6B42F59C6F185AF6013220DE124306299326DC88F7E2222F6E384E138AD5EE15
        7856AF0AD5E57EA57AA0AF2BCAF2BCAF2BC6A4E6A4E6A4E5441268D09CD2A7A5
        4F4A634A63494C692A16ACCB34A55CACAD5D76B4AF53C0900FE45DF600FF00EC
        B9EC0D595AB2AE1A95CE0573815CE05AB2AE15AB35216ACD92086281B567896A
        718A2770C99A289174BFB7773706E413EE3A994CB2E61BCB36273288C3817E14
        CBD50FB8BBEFC4B9EC0BD6691A15EB348D0AF59A46857ECD2342BF6691A15FB3
        48D0AF8A46857C5216B05216B054AF887B57E9B42D7B311C2570A9043732E651
        0DBBF96E8814E53A74F89307CEA0408870629856AE84C1327142F82CDEC4F527
        15274FC09EA57B814B6B815EF7ABC55E2AF957CD2AF9A55F349578D255E34957
        8D255E34952DB3495EA61CBFC83BE7C4B9EC78B564C0851125A17ACE070284E8
        C0640B3B152339F6E040CEEB28DDFCD4AA50997F9AFF0035352A6A5441F76232
        10C542D4D361BA74E9F787A99F7077CF88F3D80F6A9F827B54FC139A7E09CD3F
        04E691A15E348D0AF1A4684E691A139A468578FF008F7292D1AB427348D085AB
        36AD023D943604B2059D3BCAA4F60C294485669B099315F04C684C98E233862A
        E9F72BA55D2AEABAAE702B9C0AEF026E04C9B81370261526AD3569AB4C01F6A6
        14A614A04112E7F827149D09C57A138AF42BC2B57856BD4D05C7F21EFA1FF92E
        7B02E598E68ABA15C14957056AE057456AE8A4AB82B5705255CACAB9595AB14A
        D58A55CAD444845EB266DCCE26513898162B80E049461C47BC62BF2C7CBB99A7
        0A49F07D4FFB87BEBC4B9EC0D59A0AB87DB0570D0AE1A15C341570D055D34157
        4D0AE9A131A15D3426DD16ACC84288908BD64CD8C81503EEC5923DF888D08836
        7815D2AE9A95D5755D5755D5755D5755D5755D576B576B5764C9157692AE884F
        2ABA295745255D0AE8A4AF534973FC87BE89FF00B973D81785215E1EF2149681
        192215E1484F595785255E09EB4C9D356A6DC65003DA5087BF1B03EE2A069C5C
        47BC6144FB86E40D2A07FCF78E7C8B3607A99F7077CF88F3D8F73494E69578D2
        A4B4692AF9A4A1685A324C4A8871786320540B8C5C47BC6044FB86040FB8A81F
        7109AADC64C993549AA4D526A93549AA4C993264C684D5263051164D098D057A
        99F7077CF88F3D80E69F82E552342BC6AD0AF1A94968D4A5B66196015F3405AC
        3405ACABE2AFFF00C3F157E3EC1F157EA5273926581525B10F6157856AF057C2
        16ACDBB31F7CAA579E18C95D40BE2E23DE3733E29B1F9A70A2258AF53BEE1EFA
        F12E7B159464C8A224381FE9E150C0931F90CCA070A5A7078C3DE3132986457B
        855EE157AA2AF5455EA8ABD5157AA2AF5455EA8ABD5157AA2AF5455EA8ABD515
        7AA2AF54548639A055E927102BD4E218FF0021EFA23FEE5CF603264C993264CB
        228C37088489B7AE433152E2E21A718881956505AD268EF1F52FEE0EF9F11E7B
        FA2C43E14AA419B0623DE311033ACA32EF02BD4BFB83BE7C479EC0BE6A57CD4A
        F9A95F35288E70C3248B58681A16B4D4B5A680B59C0B5A680B5A680B58680B58
        680B58680B5A680B5A680B58680B5A681A16B4D0342D69A0685AD340D0B5A681
        A16B8D0342D71A0685AE340D0B5A681A16B4D0342D69A0685AD340D0B5A681A1
        4BCE139A4D0A22D9A95F352BE6A51E3CAAF9A16B0D014B6CD4AF1A95F352BE6A
        D0AF157D5F578ABC5445AA60AF702BD5057B815FE057B815EE057F8140DA8839
        60BE014D40535015D142BB52715A715A715A715A6180C134BB9EA5FDC1DF3E23
        CF626207B77D669C288C18D18B65F14E5394E5394E5394E9D394E5394E5394E5
        394E5394E5403EE395EA5FDC1DF3E23CF62A207BB072E29B17C2A2378326DE30
        0FC181EA67DC1DF3E23CF60394E5395089AD39A4A729CD69CD2539A4A73494E6
        929CD25484FB22539A4A73494E6929CD2539A4A73494E6929CD2539A4A73494E
        6929CD2539A4A73494E6929CD2539A4A73494E6929CD2539A4A735A73494E692
        9CD2539A4A73494E6929CD2539A4A73494E7DB129CD2539A4A73494E6929CD29
        CA729CA729CA729CA729CA729CA729CA729CA729CA729CA729CAF523EBFDF1E2
        3CF61494E2E21D427DE912F8BCDBEBD48FAFF7C788F3DBCE5A77944BE373EF29
        29C3F523EBFDF1E23CF604A200FB28DE19B7844BEF08638DB364DA31E28B2265
        2D9364168E23D48FAFF7C788F3D806CF1CDB2658E44E5394E5394E5394E5394E
        5394E5394E5394E5394E5394E5394E5394E5394E5394E5394E5394E5394E5394
        E5394E5394E5394E5394E5394E5394E5394E5394E5394E5394E5394E5394E7DC
        9D016BF5DA7CC171F9B240325AB2608D936F8E498C42729CA729CA729CA72BD4
        9193BFFBE3C479EC0BD57C15EABE0AF55F057AAF82BD57C15EABE0AF55F057AA
        F82BD57C15EABE0AF55F057AAF82BD57C15EABE0AF55F057AAF82BD57C140DA7
        9186320B3EF4FCB120E440D91FA4F2865408B50B4C415C4B262498DA2313EA57
        D7FBE7C479EC0D48A56A452B52295A914AD48A56A452B52295A914AD48A56A45
        2B52295A914AD48A56A452B52295A914AD48A56A452B53656A42D48A56A6CAD4
        D95A9B2B53656A6CAD4D95A9B2A1679B160BC41DEF9F0C5968BA80B008139518
        46C5B11E2A02C8694938AF52BEBFDF3E23CF606B2D55A16B2D55A16B2D55A16B
        2D55A16B2D55A16B2D55A16B2D55A16B2D55A16B2D55A16B2D55A16B2D55A16B
        2D55A16B2D55A16B2D55A16B2D55A16B2D55A16B2D55A16B2D55A16B2D55A16B
        2D55A16B2D55A15FB5568527396AAD0B596AAD0B596AAD0B596AAD0B596AAD0A
        1C7B55685ACB55685ACB55685ACB55685ACB55685ACB55685ACB55685ACB5568
        5ACB55685ACB55685ACB55685ACB55685ACB55685ACB55685ACB55685ACB5568
        5ACB55685ACB55685ACB55685ACB55685ACB55685ACB55685ACB55685ACB5568
        5ACB55685ACB55685ACB50CB2685ACB55685ACB55685036AD1E3491934231B76
        B336842D59E72D187B3428FF0076D08CB09342BF6801206D0B596AAD0B596AAD
        0B596AAD0B596AAD0B596AAD0B596AAD0B596AAD0B596AAD0B596AAD0B596AAD
        0BD4DB025163F90F7D5904E6EF2E78603D9FFDBF15C9A172685C9A172685C9A1
        72685C9A172685C9A172685C9A172685C9A172685C9A172685C9A172685C9A17
        2685C9A147F4FB609ECD0B9342E4D09ECD1F15C9A172685C9A172685C9A17268
        5C9A172685C9A172685C9A172685C9A172685C9A172685C9A172685C9A172685
        C9A172685C9A172685C9A172685C9A172685C995A4F8A85BB7641C90F8A81366
        5BB6A1270A20F141F67C57244D20F8AE4D0B9342E4D0B9342E4D0B9342E4D0B9
        342E4D0B9342E4D0BD4CB65ED7F20EF9B46194F78F3C77D839660A45ECDF9002
        2720444605C2B11319CC26448110588566C9BD1E3289F6637D4AFAFF007CF88F
        3DBEC08B4C9F811DF9FA5F32E358278C24B40BE791445F0E32AFEDDA3026E913
        2209899F1DEA57D7FBE7C479EFEB1FA447D8AD59278969C13911B766D71BFF00
        5E751B25E592482FCF1FEA57D7FBE7C479EDFDF96FAB366CC8211F6A26D4A6C9
        90D0B8A2CF162F0C0FCF1BEA57D7FBE7C479EDEF26FF009584A46552002CE4CC
        8036636611080038A04C30B3633D4AFAFF007CF88F3DBDA4C5CB4EF3E358960E
        11B76844300AC9E2C0112819D0B529B2E0289C4442CF8AF52BEBFDF3E23CF6F5
        863728DE200F628131B53C194230B36A5198A36A3C6B4D640951044419B159D4
        B89F52BEBFDF3E23CF607E7BC3F3C7C42CF8F0724AB8D64C41962ACD88C4DE30
        FF0019F1D9B11EA57D7FBE7C479EC00B28C7426CBBC73A81C7C86148DE1F961F
        A95F5FEF9F11E7B0A459F179BFAA4B83EA57D7FBE7C479EC3CFF00D03F2FE81F
        9E07A95F5FEF9F11E7B139BFA367DF9EA57D7FBE7C479EC01229D4EA753A9D49
        46E3264EB329D4EA753A9D4EA753A9D4EA7C09D4EA753A9D4EA753A9D4EA74CB
        F353A9D4E9A54CA753A9D4FBB3A9D4EA753A9D4EA753A9D4EA753A9D4EA753A9
        D4E9B73D49FAFF007CF88F3D82E9D3A74E9D64F6A7F7C24518C7D8A51009D3A7
        4E9D3A74E9D3A7463BAE9D3A74E9D3A74E9D3A74E9D343DA9A3EC2A01674E9D3
        A7453EE3A74E9D3A74E9D3A74E9D3A74E9D3A74E9D44C9ED5EA57D7FBE7C479E
        C264C9936E0932AE04646907B13264C993264C993264C9B75B7193264C993264
        C993264C8C8994A37193264DBAC9B7593264C993264C993264C993264C993212
        457A95F7077CF88F3D8A852B2A6E14DFD7732F52FEE0EF9F11E7B0993265C384
        C993264C993264C993264C993264C993264C993264DBAC9B77F24C993264C993
        264C993264C993264C993264C993264CBF352265EA5FDC1DF3E23CF603264C99
        3264C993264DB8C993264C993264C993264C993264C993264C993264C993264C
        993264C993264C993264C993264C993264C993264C993264C9932F52FEE0EF9F
        11E7B026A54D4A9A952421398A9A95352A6A54D4A9A95352A6A54D4A9BD91534
        72454D4A9A95352A6A54D4A9A95352A6A54D4A9A95352A6A54D4A9A95352A6A5
        4D4A9A95352A6A54D198454B0A54D4A9A95352A6A54D4A9A95352A6A530232C5
        4D4A9A95352A6A54D4A9A95352A6A54D4A9A95352A6A54D4A9A95352A6A54D4A
        9A95352A6A54D4A92109CC54D4A9A95352A6A57A9B64BD9FE43DF40FBBBCB9EC
        2CD8C817DE79E618C928526F3FCF0BD50FB8BBEFC4B9EC1CD8ECD977848B2ACF
        39DFF9B2E1FAA1F7177DF8973D819BDD2E2B4C1024C233489F813F027E04FC0A
        4B5EE91486A0B8B66D40B93250B59559D0B59559D0B59559D0B59559D0B59559
        D0B59559D0B59559D0B59559D0A4B64FBACE85FAED46D3969332BD5043F5C685
        188C83FC414232FB95FA82BD5057AA0AF4A732BFEF82BD52BD52BD52BD52BD52
        BD52BD5290C72040131339DE39B11EA87DC5DF7E25CF63A25B0E4BE58FF8994B
        29329267C48B644BC9078533CA11B508C240142D07C88931244408224CF294FB
        B12F89897C9BC73627D50FB8BBEFC4B9EC6C29524984496E146D196356652A95
        B2E1C4DD0F09CE45087B00950B328394A811ED2A23F5648CCA2536EC48902629
        8A651DC74E9D44B0619D3EF0CD9315EA87DC5DF7E25CF6320A184F084E57FA45
        D1F9E048D93078B4E619D7143597421213292AD03C9962B3B44A8061819A7500
        D3EE90A01664CB2414260E5406FBF543EE2EFBF12E7B1919CE19B0185E861443
        AC877042532421957FA8DF8284200480850238D6728500200B99D407BF0009CA
        03766DC86E800C62A14EF0E0C67AA1F7177DF8973D8B89F761C05E2D986559E7
        C4F1EDCF25913A301FAB215C60D3ACC5C059CB60E7321C095D403E044DE356F0
        97DD8DF543EE2EFBF12E7B159861C4CA580CE89B4E5F10232878665C72C20409
        A2A13D998A249CC0297DA724513919470227DD811994548A40A2D95718B4C378
        7B31DEA87DC5DF7E25CF62A187187E96128902BB58576B0AED615DAC2BB58574
        5215D1484CEC22142D8005A9220C501C960A22D7B02043990852ACD930333AFD
        3BB184AB32804C997FA44CB363E18FF543EE2EFBF12E7B139CB9C3225C910245
        CAA172A85CAA172A85CAA172A853D0A001A159803688C8254D18CE8D978314E8
        162A01B2E0410130DD0A18100A01863736F2F543EE2EFBF12E7B1119CB61F12C
        DE37889826C39013056E485A9BD881E517CDED46072A82B2A1397510F9167C9B
        BC270225F07FD45CEF3CD971BEA87DC5DF7E25CF61C4B09F2E1BD2AF702BDC0A
        F702BDC0AF702BC2A57B8165E042C83002599120CA18A7847DCA44E892E5673B
        990E5502EA27DD8119B078C5E6FE83EA87DC5DF7E25CF61429425801844960B8
        D6A8C8371AA4D526A935488B424B53C2A42C9110FED0ADE41201EF405B120941
        CA14210166580A944EE44991669B02244814B28CB888961FD0BD50FB8BBEFC4B
        9EC186550A4E18E333C2298D2531A4A63494C69298D2531A4A89B318C8012540
        D9842510251FD0EE25752084180FF0EA561221B900C1F024F794042033EE4436
        4522860001A7391406F981C4FAA1F7177DF8973D819B2A8CE70F8B61C5E2AFD4
        AF1A95E352BC6A578D4AF1A95E352E2DAB7C522506447F5F1ED1900004E871CF
        1AD3C7F2500FBB00FC1819CA8527022C540C8774012C54279CFF0043F543EE2E
        FBF12E7B038C42886C8A4C13C572CAF034ABC2B57856AF0AD5E15ABC2B57856A
        22D0AD5E15AE35A2090D059F7419E618312FC18113B92A816CBB91378EFD9164
        C2F543EE2EFBF12E7B0A2242A0643BA6D1F70CEAE1A55CAD5CAD5CAD5CAD5CAD
        5DFF00895C30F6AB869448B3002494CEA2819B70C583295E6C0896189E338174
        6FFF00CD4B83EA87DC5DF7E25CF61CAA05B2EE4788602402069574D6AE9A0E95
        74D074ABA683A55D341D2AE9F7C5478861EC2AEDAAF4A8104672182003090291
        84FBB09860669D4BBB050C0CC2F1500A224389CF9167CBBEBD50FB8BBEFC4B9E
        C4DF1908C8AF857C2BE15F0AF857C289B608982BE1002D024B01B901BBC5133E
        0003D880CB812E040280A7025A77FC8BF2DCF543EE2EFBF12E7B11C5B378CF90
        6E443E04AA27DC3778D6AF160660B3E032FF0035FE6A0044A96CCA55DA95C575
        44D90322BA15D0AE857429043D985946FF00C9B9EA87DC5DF7E25CF61C4CA587
        B51265267DD90473ACF914A20A27DDBBC7224174652A25470A5A571AD0979230
        3364C6C92FB164390EFED0BD50FB8BBEFC4B9EC38F1601808891356135615DAC
        23256137BA210FD3ED64D584D585FAA41398CA800C0420B365C2072A89BB6702
        0A18DE159346FF00F543EE2EFBF12E7B1500C1CA787B13A94C7DB8107C3007BC
        A80DE1F96E326DFB22C8BD50FB8BBEFC4B9EC4C034E54376054B28CBB99F0C00
        224ACA673811A3199E61839F7F7AA1F7177DF8973D81E5CDB3A85E5CDB3A85E5
        CDB3A85E5CDB3A85E5DF6FFCDF50BCB9B6750BCB9B6750BCB9B6750BCB9B6750
        BCB9B6750BCB9B6750A4FE3B0193FDDF52BCBBB5F52BCBDB5F52BCBBB5F52BCB
        BB5F52BCBBB5F52BCBBB5F52BCBBB5F52A3FFE72266FF9CEA1796F6CEA1796F6
        CEA1796F6CEA1796E4FF00ACEA1796F6CEA1796F6CEA1796F6CEA1796F6CEA17
        96F6CEA1796F6CEA1796F6CEA1796F6CEA1796F6CEA1796F6CEA1796F6CEA179
        6F6CEA1796E5CBFEF3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A
        85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A8
        5E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85
        E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E
        5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5
        ADB3A85FCFFBC7FB5FD9FF007FDF7DEBDB7FB3C6E3713FBBDBF9DE738B1808C2
        2F0FC17FCBBEA9DBFF0077CE7E0BFE5DF54EDFFBBE73F05FF2EFAA76FF00DDF3
        9F82FF00977D53B7FEEF9CFC17FCBBEA9DBFF77CE607FFD9}
      Frame.Typ = []
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 158.740260000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 15.118120000000000000
          Top = 34.015770000000000000
          Width = 313.700990000000000000
          Height = 34.015770000000000000
          Frame.Typ = []
          Picture.Data = {
            0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000011200
            0000170806000000C78DC024000001266943435041646F626520524742202831
            39393829000028CF636060327074717265126060C8CD2B290A72775288888C52
            603FCFC0C6C0CC000689C9C5058E01013E20765E7E5E2A0306F8768D8111445F
            D60599C5401AE04A2E282A01D27F80D82825B538998181D100C8CE2E2F29008A
            33CE01B24592B2C1EC0D207651489033907D04C8E64B87B0AF80D84910F61310
            BB08E80920FB0B487D3A98CDC4013607C29601B14B522B40F63238E717541665
            A6679428185A5A5A2A38A6E427A52A04571697A4E6162B78E625E71715E41725
            96A4A600D542DC0706821085A010D3006AB4D064A03200C50384F539101CBE8C
            6267106208905C5A54066532321913E623CC9823C1C0E0BF948181E50F42CCA4
            978161810E0303FF5484989A210383803E03C3BE3900C0C64FFD193A365C0000
            00097048597300000B1300000B1301009A9C18000006C969545874584D4C3A63
            6F6D2E61646F62652E786D7000000000003C3F787061636B657420626567696E
            3D22EFBBBF222069643D2257354D304D7043656869487A7265537A4E54637A6B
            633964223F3E203C783A786D706D65746120786D6C6E733A783D2261646F6265
            3A6E733A6D6574612F2220783A786D70746B3D2241646F626520584D5020436F
            726520352E362D633134352037392E3136333439392C20323031382F30382F31
            332D31363A34303A32322020202020202020223E203C7264663A52444620786D
            6C6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F
            30322F32322D7264662D73796E7461782D6E7323223E203C7264663A44657363
            72697074696F6E207264663A61626F75743D222220786D6C6E733A786D703D22
            687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F2220786D
            6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F78
            61702F312E302F6D6D2F2220786D6C6E733A73744576743D22687474703A2F2F
            6E732E61646F62652E636F6D2F7861702F312E302F73547970652F5265736F75
            7263654576656E74232220786D6C6E733A70686F746F73686F703D2268747470
            3A2F2F6E732E61646F62652E636F6D2F70686F746F73686F702F312E302F2220
            786D6C6E733A64633D22687474703A2F2F7075726C2E6F72672F64632F656C65
            6D656E74732F312E312F2220786D703A43726561746F72546F6F6C3D2241646F
            62652050686F746F73686F702043432032303139202857696E646F7773292220
            786D703A437265617465446174653D22323032302D30372D30365432333A3334
            3A33382D30333A30302220786D703A4D65746164617461446174653D22323032
            302D30372D30365432333A33363A30312D30333A30302220786D703A4D6F6469
            6679446174653D22323032302D30372D30365432333A33363A30312D30333A30
            302220786D704D4D3A496E7374616E636549443D22786D702E6969643A306666
            37383631612D316465612D323734662D383439632D6536313961303761633065
            642220786D704D4D3A446F63756D656E7449443D2261646F62653A646F636964
            3A70686F746F73686F703A39383735313939622D333533362D646634372D3834
            34632D3236623165613138376434622220786D704D4D3A4F726967696E616C44
            6F63756D656E7449443D22786D702E6469643A64343838323733382D64383938
            2D653434662D623635332D643738336564373861353064222070686F746F7368
            6F703A436F6C6F724D6F64653D2233222070686F746F73686F703A4943435072
            6F66696C653D2241646F62652052474220283139393829222064633A666F726D
            61743D22696D6167652F706E67223E203C786D704D4D3A486973746F72793E20
            3C7264663A5365713E203C7264663A6C692073744576743A616374696F6E3D22
            63726561746564222073744576743A696E7374616E636549443D22786D702E69
            69643A64343838323733382D643839382D653434662D623635332D6437383365
            64373861353064222073744576743A7768656E3D22323032302D30372D303654
            32333A33343A33382D30333A3030222073744576743A736F6674776172654167
            656E743D2241646F62652050686F746F73686F70204343203230313920285769
            6E646F777329222F3E203C7264663A6C692073744576743A616374696F6E3D22
            7361766564222073744576743A696E7374616E636549443D22786D702E696964
            3A38336438623264642D313861632D336634312D623435652D65666431306137
            3061323934222073744576743A7768656E3D22323032302D30372D3036543233
            3A33343A33382D30333A3030222073744576743A736F6674776172654167656E
            743D2241646F62652050686F746F73686F702043432032303139202857696E64
            6F777329222073744576743A6368616E6765643D222F222F3E203C7264663A6C
            692073744576743A616374696F6E3D227361766564222073744576743A696E73
            74616E636549443D22786D702E6969643A30666637383631612D316465612D32
            3734662D383439632D653631396130376163306564222073744576743A776865
            6E3D22323032302D30372D30365432333A33363A30312D30333A303022207374
            4576743A736F6674776172654167656E743D2241646F62652050686F746F7368
            6F702043432032303139202857696E646F777329222073744576743A6368616E
            6765643D222F222F3E203C2F7264663A5365713E203C2F786D704D4D3A486973
            746F72793E203C2F7264663A4465736372697074696F6E3E203C2F7264663A52
            44463E203C2F783A786D706D6574613E203C3F787061636B657420656E643D22
            72223F3E1B552C82000005644944415478DAED9B5F68544714C6276F42BB7DA8
            5831A5B1AD8981842579289816454B935AB1A089AD8A4411D95090A5B04D63A0
            124A597C8871BBA52CC5E222456310894904415B23BA2815C1878425FEA9D850
            4B28FAD087A601DFD299C05DEE9DCC9C3B67E6C698EDF9BD98DD9DD93933F3CD
            3733E7AE15B3B3B38C2008C2850A321282205C21232108C219321282209C2919
            C9F973E75AB195D7D6D6DE893734FC099591BF77C7CE9DC39836E4FAB158ECEF
            0FB76C2998968762F497352D17D67E18C5F1F1377E7BF0E09DA8C6035BDF168C
            3E743161FBFECBA54B1BA7A7A75FB56D0F3366726C61DA368D2D2C46536D61D7
            676565E5EFEFAE5F3F8EA9633A562A4A46B27AD932F4D1E4DB53A7DAA0867ECA
            E7135F27932730756454715D9F9878E5AD356BA65583F0C5BE7D4326ED09E17C
            BC6EDD636CB94F1289FE4C2EB7173B56BA182FDEBE5D1566C61EB76EDE6CD8DD
            DC3CE67F2FD1D575AC279DEEB28DC784F7E2F17FA71E3E7CC9B4BCAE4F98BEAB
            B4A3E3F59A9A99332323AB549A10C81AFAE3D9B38AB0D8209D626283DA946383
            B465B33E4F0C0F6FC26C7A2EFA5A3023997CF428B6A9BEFE1FF97D31E9BF168B
            2F9BB6A18AEB83B6B69F4F0E0C7C24BFAF127C3919C9B6969689B11B37EAE4F7
            31DF81E5FB4CE650E6F0E15E4C9D288C04AB4748F0511B89CD5A590C23C1AE35
            177D698D8457D6D5A9F2FE80BEBC33993C3D98CFB72B3F3B72A4FBF3CECEA326
            9DD30DA03CD13AC1978B91A84E5B1E8D1B36DCBD70E54ABD6D4C10B23903BA10
            CC6903BA229AF45D2EC7F5C2DE6F6E9EF77D7C5E4A7F438B264A23318D8DF9D6
            0934263646C2375296EAEE564EC0C8E020CBF7F5955E3F2F7D698D84774A5961
            F3D6ADA1C725717FEC686DBDEEBDE693CCB81803654C3BA83312BF7074A71F41
            B918893C0EF29862AF8CA61CD8B3E7F2D5A1A1CDBEFE6BCBC61B1B3BF6271279
            D7BE2B16B5B8ABABC624F0DA64D7D795B33512BEC858756DADAA59239DD81889
            9883642AC572D9ECBC72B70A85802E746980B031C2EA0B7DB53111ACBC8B0921
            DC2D16034E69BA8B427179C759E8F4530E4622F78FF79BD5C5E38C7F4FA09C6E
            21B900ED542AA02B868B91AC9516EBDBD5D5AC6EF972A3FE2FA4914098CC87AD
            91ECEFE8089CC854986A350A7D456E2472224A1CC34E0E0CB0999919D6D2D484
            DE45FD7109F7E777B8C0E742B8DCA0BEC4C6BB548C444E80899D62647494BDB6
            72A51000E3022895758D4D07364F629A0CC718492C1663FC945B2A2374C54F4A
            817AFF2323E9E746F2955F9732A65A884A5F508EA44A550112BDEA8AC145C5B8
            A8BCA0D96EDF7DD22419240F203F3E17A08CF937B91CE39F975E2F7523911360
            FE63FED3274FD8763E9E7E733E3B3ADA68F3D8CF043116FC9F79E2CDF6F60616
            B5E922C45E6D78FBECB3F6F679D7648FC53012284782BDB2628C44945319BC30
            821FFBFBAD13F8B6FAD21A89CD31593E2289EB8B2A0BEC276C61AA0650975D56
            3975D446624A144F2E54F771F9442683CDD487015D1B75E8C466DA77D563C830
            744FF204729EC7A50F36B109A27C6AE32FA73A214163E1274A7D456624F2007B
            39109349847651D500EA2653C46C6B102FA291C8B9267165285CBBB62BEC370C
            FC5406263D31608D04CA7D61FAAEDB2C6CFA2C27FF5DFA60139B60A18C44D73F
            61263DE9F4A750A2354A7D456624F2E07AE6003D51F180264E3780B2C03D2328
            172349F7F4F4F9733FFEC93311B269B63E0C8C918879FCEEF8F1265DBB182311
            BAC965B33F604C0C3213D176269D3E1DF6C33AA1B1642A75101A3B9BD816D248
            042A33817EA817B5BEE8FFDA1004E1CC9C918C8F8DBDF97872127554230882F0
            983392FBF7EEADF86B6AAA66B1832108626942571B82209C21232108C2193212
            82209C21232108C219321282209CF90F88611FF9E4DA81680000000049454E44
            AE426082}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 49.133890000000000000
        Top = 653.858690000000000000
        Width = 740.409927000000000000
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 177.637910000000000000
          Top = 22.677180000000000000
          Width = 328.819110000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Desenvolvido por Bruno dos Santos - (21) 97021-7483')
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 593.386210000000000000
          Top = 26.456710000000000000
          Width = 98.267780000000000000
          Height = 22.677180000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'P'#225'gina: [Page]')
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 71.811070000000000000
        Top = 370.393940000000000000
        Width = 740.409927000000000000
        DataSet = rel_ds_mov
        DataSetName = 'DSMov'
        RowCount = 0
        object DSMovtipo: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 18.897650000000000000
          Top = 52.913420000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'tipo'
          DataSet = rel_ds_mov
          DataSetName = 'DSMov'
          Frame.Typ = []
          Memo.UTF8W = (
            '[DSMov."tipo"]')
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 41.574830000000000000
          Top = 11.338590000000000000
          Width = 34.015770000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Tipo')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 128.504020000000000000
          Top = 11.338590000000000000
          Width = 86.929190000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Movimento')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 238.110390000000000000
          Top = 11.338590000000000000
          Width = 68.031540000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'M'#233'todo')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 340.157700000000000000
          Top = 11.338590000000000000
          Width = 60.472480000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 434.645950000000000000
          Top = 11.338590000000000000
          Width = 105.826840000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Funcion'#225'rio')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 585.827150000000000000
          Top = 11.338590000000000000
          Width = 71.811070000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object DSMovmovimento: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 128.504020000000000000
          Top = 52.913420000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataField = 'movimento'
          DataSet = rel_ds_mov
          DataSetName = 'DSMov'
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[DSMov."movimento"]')
        end
        object DSMovmetodo: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 238.110390000000000000
          Top = 52.913420000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataField = 'metodo'
          DataSet = rel_ds_mov
          DataSetName = 'DSMov'
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[DSMov."metodo"]')
        end
        object DSMovvalor: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 340.157700000000000000
          Top = 52.913420000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'valor'
          DataSet = rel_ds_mov
          DataSetName = 'DSMov'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[DSMov."valor"]')
        end
        object DSMovfuncionario: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 434.645950000000000000
          Top = 52.913420000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataField = 'funcionario'
          DataSet = rel_ds_mov
          DataSetName = 'DSMov'
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[DSMov."funcionario"]')
        end
        object DSMovdata: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 585.827150000000000000
          Top = 52.913420000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'data'
          DataSet = rel_ds_mov
          DataSetName = 'DSMov'
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[DSMov."data"]')
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 109.606370000000000000
        Top = 238.110390000000000000
        Width = 740.409927000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 185.196970000000000000
          Top = 34.015770000000000000
          Width = 366.614410000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'RELATORIO DE MOVIMENTA'#199#213'ES')
          ParentFont = False
        end
        object Picture2: TfrxPictureView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 3.779530000000000000
          Width = 170.078850000000000000
          Height = 94.488250000000000000
          Frame.Typ = []
          Picture.Data = {
            0A544A504547496D616765831C0000FFD8FFE000104A46494600010100000100
            010000FFDB008400090607141312151313131616121717151715151817171A1A
            181D1517171D15151717181D2820181D251D151521312125292B2E2E2E171F33
            38332D37282D2E2B010A0A0A0E0D0E1B10101A2D251F252D2E2D2D2B2D2D2D2D
            2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2B2D2D2D2D2D352D2D2D2D2D
            2D2D2D2D2D2D2D2D2DFFC000110800AB012803012200021101031101FFC4001C
            0000020203010100000000000000000000010200030405060708FFC4003C1000
            0103030203070105080202030100000100021103213112410405610613225171
            81A1324291B1C1E1142352627282D1F092F133A216B2B307FFC4001801010101
            010100000000000000000000000002010304FFC4001D11010100030003010100
            0000000000000000010211210312314161FFDA000C03010002110311003F00F6
            C7BC10403755D11064D941488B9D933DDAAC3D500AF788BA6A4E0041B14AC3A3
            3BF920E6175C6102961998B4CABAAB81102E50EF4446F848DA65B738080D1106
            F642B0936BA679D761F2A31DA6C7E10353700209BAA5AC3331694CEA65D71829
            CD506DBE104AAE9102E52D0B4CD906B34DCA2FF1E36F3EA805612645C2B58F00
            013748C7E9B14A69137D8DD02D36104122CACAC6440BA2EAA1C206EBCF3B6FDB
            66510EA749C0E43DC0FD44669B4F97F11F653965318D936C9ED77690B41A549D
            0DFB6F1F80201F6F3F4CF37C8FB6B56990D97561246889766D11675A2EDF95C0
            FEDEFAD521F5034BC92F79366B4024DB7300C0F40B77D95ED0329778C0D0C04F
            82A182E222035CEDA489F2B95E6CAE5F5D66BE3D9FFF0094D16D36BAAEAA5222
            1D163E563D0AB79573AA158CD3AAD766D3071E472BC7F9E7332693813243DD92
            0EE6049F5CAE72971970E692D20D9CD3F044907D2CAA797265C23E917714CA96
            63DAE23203813F72BA898106CBC068530F1ADAEEEEA0C96921A4F9C6D7217A17
            FF00CCF8BAA59569577CBDAE6B985C47883810749DE0B7D6EAF0F37B5D54E586
            9DC546124902CAE7BC1044DD015436C72120A445F6175D909444193608D7BC45
            D17BF55820CF0677F2E881A8BA041B1553986662D299CCD57184E2A816DF080D
            47822065574441BD946D32DB9C04CF76AB0F9402B09C5D3D270020D8A561D363
            F095D4CBAE30502861998B4AB6AB81102E54354446F848D616DCE101A1699B21
            584991745FE3C6DE68B1DA6C7D503537800026EA2ACD226E375101EFA6D1950B
            745F3B267530048C8494DDA8C1C20206BE90A779A6D952A7871BA66303849CA0
            1DCEF3D50EF355B1294D4331B6158FA61A24650291A2F9950375DF1B294CEAB1
            52A1D3608277BA6D1847B98BCF54594C11272AB150931B610307EAB6143E0EB3
            F97FDA2F606891954BB896FDB70B6DBFDC137A14F3527B97BDA48206DD089BFA
            4AE12AF6AAA025B15CC18904C13205AF7CE33D1751CCB9ED32D7D364BB535CD3
            A46A224113698F785C4D4E50C973DCC266E4D5A862D17EED96DB73B2F37932DD
            E2E4E2BADDB375C697EE0835237820FCAD655E7CD8B70F4F78BB4E0F969B2C2E
            3399359519A0D1EE8B9B25B4434C1710E0751276CF55A2E338879351CC92CD4E
            2D88FA649B0173653EACDD74D53B43A448A744589F3C0062C337DD60768F8EA7
            51ECD6C2E8691E131922D1BFE8B91355F53E9F2F4589C555ACD702E0E68B0D47
            E9B9DDD80157A425AE8F9DD4A6683453D405C3B51939969CF95BD82D0F02F2D7
            CC822E0F59E8B7FCCEBBB86E1E934863DEF04D4B97069D474B4B700C09FF002B
            5FCBB9E8046AA14C8DE1AD9F6F349BD722FF007ADDF2F78305A6FE2B6C4E8744
            F9AD872BAE40654A4F3DD92258EBC6A23076849C3F1F4F539B14C39A5CD2DD01
            AE0E163BFAAD5F05C255A4E76921F424B8C1FF00C6478B4907165C2F57791EC1
            CBB9C32950372E7EA240D8081727CAC6C13F66FB42EAB59CD7BF50A9E11E4D2D
            C003C8827EE0BCEE9F30D6F634B88693116C8C4E64182AEE57C61A7545CEA26E
            EBC6B6C1044FE1FCA3CD75C73BCFE3957B51669BE541E3E91F9AC6E57C6F7F4D
            AFD9C248F222C47B190B26A7871BAF5A135E9B651EE66F3D54A6C0E127290D42
            0C6D840DDEEAB46542DD17CEC99F4C012329699D5628201AEF853BCD3689852A
            1D3609994C3849CA01DCEF3D50EF355B09454331B6158F606891940A468EB2A0
            6EBBE36529F8B3B2151DA4C0C203DF45A30A266D30449C945052C2644CC2B6B6
            2D9E88BEA0220655749BA4C9B040D4779F9FD5255266D31D1355F162FF00EF54
            D4DE1A20E5010046D30AAA44C8998EAA1A66662D32ACA8F0440CA015BA7C7E8A
            51C5FE50A434E6C8551AAE2E8054264C4C7456B808DA6106540041CAAC5320CC
            5B2825299BE3AAE0B98D3D3C696D579752871A74EFA6C2E481677D2720E42EEB
            98F141B4DC45C8C03693B2F3AE6C5EC60A85DE263CB9C60F88174EE49BB8013B
            6B5C7CB7E4546E5D59BA65B11E58F3911ECB9DE7DCCC35A7ADBEF58557980A6F
            7807C3A658368BB9B7EA0B8FBDBA711C6F37ABC43BBB6789CF2431AD1E5975F6
            EA570D755B6AF8CAF2417998261B27CE7C44DFDBD16E7957672B3DC2A0A868E0
            B03984B81DB3006DEAB7BC83B2D4E80EF6BE97550353A4FEEE9C5C92E393D4FB
            0DD6979FF6E002E67096C835C8FF00F269B0FEA3F76EABDAE5CC498EBEA9E63C
            B9BC1F10D69730B1EEB31BABF76E2012D22200BF844CC4794ADF54E760533006
            9000D361A89C34920F919B111B15E692E871713E33A8924976A0643C9379927E
            F2BD0381ECAF10EE0BBDA834D6FAD944E4881F579388161F7C4DB72C7F495CFF
            00194490E26830537DA296AF09FB2E0C3691FCA07A25EC572FA678973AB107B9
            01ED67F1907C27D1A60FA96F55D2722AA2693C8B078CFF00BE6B90E77CC5C78E
            E22A0B3855A8206ED0623EE0154B6C64D6D6F30351FC4BAA31AE70A8FB434904
            B888688DCC85E81CA7B0D5DAEEF6B710DA25C1BAA981DE12034021D70D18EB95
            CDF67F8F7F0DC400D6BAA697B8E81921CC23604C8225765539CD5A8437F62699
            9710F973A06F06FF001B853F4B5A1ED551A546BB1944C8D21E4DBEB0E74E3E9F
            08C755B3E1384E21FE3606B698FADF55AED207F29DCDB016CB86AC5F50470BC3
            87B44B496324006E6EE91E20765B5AB45EE0E7D5797FF0FF00032D0480603A06
            A381EF94F59BDB36D772DED91A4E2C65377772EBB20CC1D3244589806015D6F2
            4ED5B6B9D21A4BA24870208C79C8DC5A579D70B4807BB581FBB6D57693041B02
            C01BB7880237FBD6D3B3D5FB8A156B005C5A58C6003C8DE009DDDF0BAEF5F18F
            53AB336C7456B408DA61721CBBB65022A37A9D88F58902F6BC616F796F1CDAE0
            BE983A67368BF91060AB99CA69994C991331D5595B16F845EF0440CA4A434DCD
            9530D47AFCFEA92A933698E89AA8D58BA6A6F0041CA02408DA61554899BCC755
            053333169956547870819402B6D1F1FA234717CF54B4BC39B7FBD10AADD4645C
            2057932626145732A0020E544158A517F24C5DAAC2DBA51549B79A67374DC7A2
            00D3A337950B355C28D1AF3B7928E7E9B0407BDDBD9014F4DFC91EE867DD28A9
            AAC77405C75D85946BB458DF745C345C7CA8D6EBB9F4B200696ABF9A26B4DBD9
            29A9A6C3658FCD3886D0A4EAAE9F08903324FD2D03A9841A8E7DC500ED1A85B3
            7DCFFBF2BCFB9B71CF6D421F2195039A4C584D9827A403EE53F33E39CE0EA8F6
            550E209D46D933110236DF65CC71FC63EFA4924CF847C7877C8F3F55E6BDBB53
            0A936AD6716B351D2E879130D323206E6D6FE513E6BA2E069D1E05A4BE03DCD1
            613DE3A37267C0CF21037DF3AEE0C712C12DAC2930804B480E8245ECEB34EFE7
            26EB1E8F0747512EAA6A38DDCE71D5EE4E3F1517AE9269B1141DC6D2A8FAF50D
            3A26D429B7C3045CD423ED795FAE2CB8CADC92A309860741B1D4C13D5A1C42EB
            D9CD787659B2E75A09123A403FE02C4AD4F87E22BF7AF7D5D440045365CE9DE6
            0EC40C6216CBA4F19DD9EE4B478463789E24B6A5775E9B010E0CF4FE27F9BB03
            6F32FCC7B42F915B5CB6082C00C093F4DE2F8F11593CFB931AC291E1E91A6C6B
            45387F87C22FA8EA3727FED6BC7659A61B538865F48D3DE1249D84003E16FB44
            DDD6B781AAEAB51C28B5CFD5E2F08274999D463171BEF2A56ECEE8E30F1558B4
            33C2FEEE64EB007D5168044E56CF957346B299E169B870E1AF70738532F2E3AA
            0837999B49DA16AF9FB787A7773EAF11536D4E0182FB358493E85C3653BBF8AD
            452C2D7553DD17BEABDC4374C65D68076CF9AEEB9372C32DA4CAAE61690EAD59
            A635B8EAF0309CB4126063EA24602E4FB31C116015EA436AD41149921A295274
            EAA9FCAE709022FA67772EA796F336308D36A4C10D248971DDD02D27CE71000F
            2A934CAEADF45E331540DCC32A7DE3C2EFB9AB1EA57A6618F769B88153C26644
            413E171B0C1D96838CED83448124F90049F602E569389E2B89E241EF08651241
            734992D0DBEC3C2713A88C7459B34DAF6AA9FEF412E024581C784132E9C8902E
            AE7B9ECE1A8B69C99D4F7100490418969B190EC740B5038DE1C91A58EABDDB40
            B071A6D03FA243B1895BD7D77D40DA8D67EEECD634020926C00691B98FB92E57
            5AD1245BCA39754AAE6D1101D996480D60905C4601B90223257A5703459458DA
            4C6C0688FD56B7B39CB0F0D4FC506ABE1CF3E5E4D1D02DC8A40DFDD77F1E3A9B
            A9B4052D37F251CED7616DD0157558EE99CDD171E975D180D3A2C6EA1A7AAFE6
            8B46BB9F84A6A69B0D90377BB7B2029E9B947BA19F741AFD5628238EBC5A110E
            D363EA83868C6FE68B5BAAE7D1029A537F35143548B792882C7D300481755D27
            6A306E12B0191330ADAC645AE7A205ADE1C5935368224E50A1699B7AA4AA0936
            C74400D4331369856D4600246510E11B4C2AA902089C7540D48EACDD0AA74981
            64D5CCE2FE8A51302F6F540D4D80893958AE6EA78D505A3008193BFB0FC4AB2A
            0326263A2BDCE119130839AEDD51D3458E60876B0357902D767A480BC7F8AAF5
            03DC2A1D2E93A83748F43A8DCCF485EC5DB32470754C1FB316C789B75E53DA16
            6BA02A81E302C475C8B642F3F93993AE1F1814E9D3738FDA7030751248B4FDA5
            7F1FCA80D22A38B46904B1AD0725D72F74307D3D49D385395700FA741C5F48BA
            BBD843748D420E1B2319B98F4C29DA17543C253A976D4A6743EF7B7D24C6F21A
            7FB8A9D7597255C170348D40C6318E3692F26A103CCB44345BA2DAB3983BBC75
            2A4D6B6937704B311265A2326000B5BCB086517F11F6EB696B07908B91F3F704
            7836814F4B675388D4760037C2333825D1E6567AEFEA76E83F679176EA9C38BC
            B8FA8D4D8583C4728D513AF580035E594C96E932D234386FD2EB3E954EEDAD6B
            89981203498F26C016810AD3C60027231D67CA0EE9268DB9FE3792543C4BF886
            BDB0E248A6FA7500137209D241BC95894B941ADC417BCD17B580F7741951BE37
            8C35E0C10D1049FE985B5E6BCC7555025CD65312E8244BADA408205C90D93395
            AC22A77752A323BE7CB03CD83664D6AD7BDC9D22063685BA36D5732E64F75473
            019A80CBDD3007BC446DE9E780FC3F07AF41ACE780EFA49616B3FB5CE1F8F598
            587C0F24A959DDD538D00CD7AC416B5A3AB8DCCF964FA6369C3734FD9AA52A54
            E9BABD0ACE731F462EE6B481DE536FD870B907A5CF95FD63AEE5FD9D6C02D83E
            843A6330E32D3ECD0B6D5781A603416EB77D961138E86C16570FC2B8540DA60B
            99A1BA5F6D0036403D48F2B16C102C44673B837005B47FF23BEAACE131FD2DDF
            D31EAA3D2456ED73DCC6A32840A8054AE47EEF876FD23CA63FDF21BADE764780
            A86A1ADC4802B01FBB6ECD07EA21BB663CE15DCBF93B289351C4D4AEE001A8E8
            9B0C00000D1E99DD6EF90C12F79FE91F89FC95618F7A5F8DAD268709372AA350
            CC4DA611AA0936C7456B5C2322617A1095180091955D23A8C1BA5A60C8998EAA
            CAC645AFE880553A7164D4D808939428DB36F54954124C63A2082A1989B4C2B2
            A340122C512E11B4C2AA9020DF1D50351F166E855769302C1357BC45FD11A260
            5F3D5016530449175152F064C4C2882D7550440C94AC6E9B953B98BCE14D5AED
            8DD04A9E2C6C8B1E1A20E509D1D654EEF55F0814D2333B6558FA81C2064A5EFB
            ECC7453BAD3799841298D372A541AAE149D76C429AB45B3BA066D40D10721562
            910676CA6EEB55E6254EFA6D19B20AB98F0ECAF4DD49C25AE1076F707CF75E4F
            5B8034DCFE1EA65A48F5F223A1041F75EBBA34DF2B95ED9F2A2F1FB4D36F8982
            2A0F36DFC5EADBFB7A2E7E4C7736BC2EB8F24E17B3B51C6B7EF2A52A34E704DF
            78001BFEA11E1795F1069398CA8345890F045C4693D1D66F491D0AEA78F654AB
            4432944EA25E098240980D9B79663015DC1C358C6BC6979BB854F0CB80C35D04
            3BC526C7ED13D17132AE1F99F2FE258699AC298A2D1E1631C418689362D11B4F
            92CCE4F58B9E25AE39206662E45BAC4F40BBAE3F94B6BB1A1E61C2E1C00B4E41
            182313E9B2C5E17B3CDA1E39D4FC3006E96B4BAD3124CC123309BE274E238DE1
            5EE739C7C5A893A9C6E3A609B7459F4B8C0D63586A49636E6F73B66F65BAE7C0
            0696B5A0832C0649B322488FB449C1F758FC8B94D314CBDF4DAE2F2400E00D9B
            9E9991FDA16EF9D64C7AE3F81E67A6AD5D220B80F186B5C5864DC076F7CF55B8
            E5FCB8553FBCE2389ADB9636298F774C81D442EA29F67F849D4386603E6D96FF
            00F53E8B6DC0F2EA4D32DA427A9246F3626373F7ADE2F4D4D3E174B34B290786
            93A285310D07F99C4DCCDCB9DD6255BCABB22F1A9EF786D4A93DED4025F04CF7
            74A6D4D83DC9DFC9755449C0000E8AF6519C94D374A795F054E85314D85C5A09
            3724DCE73F86165F78AA2D841AE5A2AE36B405BBE59C3452637ED5CBBD5D78FC
            BD969783E1FBEAC07D96F89DED81EE63E574DF4759FC974C27EA72163C3441CA
            4348933B65368D57C29DF45A31656933EA07081929698D372A775A6F330A6AD7
            6C6E82541AAE1332A0688394B3A2D953BBD5798940052333B653BDE1C20652F7
            DF663A29DDE9BE504A634E7741EDD4646119D7D214D5A2D9DD0336A8020E4229
            3B9D579CA88036A93638299EDD3709EA3400605D5544C9BDC754059E2CEC83DE
            5B61846BDA22DE89A9341126E50414844EF948DA85C60E0A52E331B4ABAAB401
            232815E34DC28C1AAE52D1B9BDFD54AC60DADE8823AA16D86027348013BE51A6
            D0449CAA5AE33136940CC7EAB1C2955A1A2320D883FEF54F58002D629685E66F
            EA83CBB8BE1BBAA8FA7FC2E207A7D93F74140718F0227537C9C242DCF6E386D1
            C4B5E31519FF00B32C7E347DCB9FAAE8F45E6B355DA762FA35E98FA75D13FC97
            67FC0D87B01EAB399C5BE30DAADCCB0E977A9638C7FECB4F9B8591C256D25633
            D634FCF6A9A9569B594DE040641638364124413EB73D174BC3F0D01ADD9A0007
            D373D4DCFBACE654044C26708000DD6DA49A2D0E1B7C05954AC51EF80B26680B
            60B5B5958CAEB11CE0836AEC2FE975A32AA5690B19D5602867C88F5B7EAB2393
            70C2ABDFA84B18DC79938F5C15B26C6E39470BDDD20EFB6F827D0E07DDF8959C
            CF16764289930708D7B445BD175934E40F7E9B0C27148113BE54A201126E554E
            71989B4AD0CDA85D638299E34DC26A8D00481755D1326F7F540CC1AAE52BAA16
            981852B58DADE8ACA4D0449CA0069089DF2918F2EB1C250E331B4AB6AB4016B1
            40AFF0E37458DD572850BCCDFD50AC60DAC3A208EAA4586028ACA6D040917510
            52C610648B2B2ABB508172A1AA0D84DD06B74DCFA5904A3E1CD92D5692645C26
            7F8F1B79A2D7E9B140C1E2226F10AAA6C20C91647BA39DB299D503AC32504AC7
            562EA513A45EC83468B9F851CDD771E9740B51849902CAD73C444DE212B6A86D
            8E4251488BDA3280526C193609AB78A22E8B9FAAC3E5067833BF97441CFF006D
            3830EE1B561F49C1E3A83E170F99FED0B872242F48ED0D035387ABA7F80DB73A
            6F1F0BCE698B2E3E49D74C3E31DAC856913851C506BAF2B9ADB2E11E602CD7D4
            8730199718688C9E9F7AE5F8CE7EEA43BBA660EEEDC0D805AE6F1B51CE69739E
            49FA492E27FB4FF85A9B5E84787330607CA8EA7D4AE4785E7F529B86A25ECC10
            4C91D4137F65D677E0DC5D6826885B0E0E940958549CB29D5E0405B057C6D45B
            3ECCD0229EB8FA9C4CF4161F81FBD73BC5B89B0C9B0F5380BB6E1C06B1B4C6CD
            0D1EC2174C62725B55D2205CA5A3E199B28D669B9F851FE3C6DE7D55A0B55B26
            45C2B5AF11137884AD7E9B1F84A69137DB280536104122C9EB1D42D751D543AC
            32506B745CFA5901A274E6C92A309320484CE1AEE3E516D4D36390818BC444DE
            215549A4193608F7473B6533AA6AB0CF5402B78B174693B48836419E0CEFE4A3
            9BAAE3D2E811EC24920594560AA058CD91400D18BCE100ED76C6E95B50930705
            3D46E91232801F07594453D5742978B37842A3CB4C0C203DEED1D1134F4DFC93
            0A62277CAA98F2E30708181D76C285DA2D9DD1AA34E2CA521AAE6E820A5AAFE6
            877D368E895EF20C0C2B4D3004EF940A59A6F94078FA47E7FF00485371718384
            6AF87169410BF4DB2BCDF9AF0FDDD47B6234B8C7F49BB7E085E934DBA849CAE2
            7B60E02BCF40D27A8C4FB10B9F93E2B0FAE69CB1DF3B2C9AB62B1EA2E6B72FCE
            0C5677B1F80B79C47161D5387734F865F11FD2207455F30E5E2AC1C3861DF91F
            35A8ABCB6A31ED0082E33A74983E113BE16B1D1F13CA5D56A17EB0D6989B1271
            72BA3E1069635B33A406CFA0895C7F29E6D50546D3A86413A6E208381F3E6BB2
            A0120BD853BEAA68B242150CEE43483AAC9BE91A80EB300FB2EA8D18BCE2EB93
            E42ED0F7176E23D2FF00A2EA595498BC82AF1BC4E5F4C1FAAD850F83ACFE48D4
            686891942978B37854910CD57C21DF45A3A2151C5A6061582982277CA0534B4D
            FC900ED76C6E958F24C1C27AA34DC59002745B288A7AAFE6A521AB3748F79060
            610377BB47444D3D374C69889DF2ABA6F2E30708083AFA4285DA2D9DD4ABE1C5
            A51A6DD424E5041466F395123AA1060602882D7C4188955D1CDF1D506D320C9C
            04F51DA840CA015F68F8FD135288BE7AA5A5E1CEE854617191840A6677895755
            88B44F44054111BE156C61699384068F5F9FD54AD9B7C26AA75614A474D8A06A
            711789EAA96CCEF128BE99264615A6A02237C2015622D9E89686FABE7F5429B4
            B4C9C2357C58D9062F34E30526EA38C08DCAF3EE6BC5778E71FB44CFAFE8BBFE
            65C18A94F41CE63FDF45C3738E4555AED4DF6D8FEAB9E78DABC6C8D2B9D1638D
            8F974295D23215EF6DA1C20F5FC95629988C8D973D58AE349CE786A861F48BA4
            082D0483D0803392B1DBCCC97522EA6ED6CD523F8A5B122CB7E699F2419C3F88
            3A2E0103DE27F00A98C1E53CBAA54ADDF546E96EAD507248FA44663175DBF0E4
            0175A7A4E859AD7141986A4A76BD554987D4ACDE1B97BDF602656EAD37231297
            10413BCFC0D96FFB3F59E75023C116F5DA3E53705C918D3350C9F2FF00256D69
            D1D3168015638E9372D9A8E6F8EA8D7DB4FC7E88D476A1032852F0E775693528
            8BE7AAA9D33BC4A6A8D2E3230AC150011BE104A911689E8ABA39BFCA0CA64193
            84F54EAB040B5BA7C7E8ACA511789EA9691D3948F61719184004CEF12ADAB116
            CF444D4111BE1574D85A64E101A1BCFCFEA856CDB1D11ABE2C6C8D3769107281
            991026254553A9926460A881CD59B46500DD17CECAAA590AFE271EE8148D7D21
            11534D94E17755F11F5207EEB79EA89A9AADE6AC6FD3EDF92C6A1F50FF007641
            601A2F950B75DF1B23C56023C2E0FAA002AE9B7921DCC5E7AAAEBFD4564BFE93
            E9F920ACBF55B080F0759FCBFED270F94FC56DEFF920859AAF841EE11A4898B2
            B386C2C7A993EA83178AE474DC248FB96ADDD94A6E3E1B7C7E0BA8ADF495470D
            9F6FF08396ABD928FB5F2520EC938E09FF0097EABADE2B215BC3FD21071ACECB
            DF27FE4B3E8F66836E4FC92B75F6BDFF003593C47D27DBF141ADE1795B36CF55
            9CD865A3AD94E1774BC4E7DBFCA0634B55FCD135A6D19B2B28FD2162D3C8F541
            68669BE543E3E91F9A7E2709385DFD9010FD36CA1DCCDE7AA4E23EA590CFA47A
            7E482B35755BCD00DD17CECABA1F505771581EA8148D77C222A69B7923C2E0AA
            6BFD47FDD9059DD6F3D5135355958EFA7DBF258FC3FD481C0D1D6542DD77C6C8
            F15B23C363DD001562D1851535725441FFD9}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 185.196970000000000000
          Top = 68.031540000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Data Inicial: ')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 362.834880000000000000
          Top = 68.031540000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Data Inicial: ')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 260.787570000000000000
          Top = 68.031540000000000000
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          DisplayFormat.Kind = fkDateTime
          Frame.Typ = []
          Memo.UTF8W = (
            '[dataInicial]')
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 442.205010000000000000
          Top = 68.031540000000000000
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          DisplayFormat.Kind = fkDateTime
          Frame.Typ = []
          Memo.UTF8W = (
            '[dataFinal]')
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 128.504020000000000000
        Top = 464.882190000000000000
        Width = 740.409927000000000000
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 49.133890000000000000
          Width = 132.283550000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'TOTAL ENTRADA:')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 83.149660000000000000
          Width = 132.283550000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'TOTAL SAIDA:')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 453.543600000000000000
          Top = 52.913420000000000000
          Width = 132.283550000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'SALDO TOTAL: ')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 143.622140000000000000
          Top = 49.133890000000000000
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          Memo.UTF8W = (
            'R$ [totalEntradas]')
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 139.842610000000000000
          Top = 83.149660000000000000
          Width = 98.267780000000000000
          Height = 22.677180000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          Memo.UTF8W = (
            'R$ [totalSaidas]')
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 585.827150000000000000
          Top = 52.913420000000000000
          Width = 79.370130000000000000
          Height = 22.677180000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          Memo.UTF8W = (
            'R$ [<totalEntradas> - <totalSaidas>]')
        end
      end
    end
  end
  object rel_ds_mov: TfrxDBDataset
    UserName = 'DSMov'
    CloseDataSource = False
    DataSet = query_mov
    BCDToCurrency = False
    Left = 280
    Top = 808
  end
  object rel_Mov_Cartao: TFDQuery
    Connection = fd
    Left = 248
    Top = 768
  end
  object rel_Mov_Dinheiro: TFDQuery
    Connection = fd
    SQL.Strings = (
      '')
    Left = 328
    Top = 755
  end
  object rel_produtos: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44105.661395682900000000
    ReportOptions.LastChange = 44105.997549166670000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 464
    Top = 736
    Datasets = <
      item
        DataSet = rel_DS_Prod
        DataSetName = 'DS_Produtos'
      end>
    Variables = <
      item
        Name = ' Datas'
        Value = Null
      end
      item
        Name = 'dataInicial'
        Value = Null
      end
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'totalEntradas'
        Value = Null
      end
      item
        Name = 'totalSaidas'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page2: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      BackPicture.Data = {
        0A544A504547496D616765C9890000FFD8FFE106BA4578696600004D4D002A00
        0000080007011200030000000100010000011A00050000000100000062011B00
        05000000010000006A0128000300000001000200000131000200000022000000
        720132000200000014000000948769000400000001000000A8000000D4000AFC
        8000002710000AFC800000271041646F62652050686F746F73686F7020434320
        32303137202857696E646F77732900323031393A30333A31322031363A31373A
        3232000003A001000300000001FFFF0000A00200040000000100000253A00300
        04000000010000034A0000000000000006010300030000000100060000011A00
        050000000100000122011B0005000000010000012A0128000300000001000200
        0002010004000000010000013202020004000000010000058000000000000000
        48000000010000004800000001FFD8FFED000C41646F62655F434D0002FFEE00
        0E41646F626500648000000001FFDB0084000C08080809080C09090C110B0A0B
        11150F0C0C0F1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E
        0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC000110800A0007103012200
        021101031101FFDD00040008FFC4013F00000105010101010101000000000000
        00030001020405060708090A0B01000105010101010101000000000000000100
        02030405060708090A0B1000010401030204020507060805030C330100021103
        04211231054151611322718132061491A1B14223241552C16233347282D14307
        259253F0E1F163733516A2B283264493546445C2A3743617D255E265F2B384C3
        D375E3F3462794A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F6
        37475767778797A7B7C7D7E7F711000202010204040304050607070605350100
        021103213112044151617122130532819114A1B14223C152D1F0332462E17282
        92435315637334F1250616A2B283072635C2D2449354A317644555367465E2F2
        B384C3D375E3F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6
        E6F62737475767778797A7B7C7FFDA000C03010002110311003F00F414924948
        85249249294924924A5249249294924924A5249249294A8F52E6AFED7FDF55E5
        47A97357F6BFEFA90534D24924E43FFFD0F4AFB11FF49FF47FF324BEC47F7C7D
        DFED56924788A1ABF623FE907DDFED4DF623FE907DDFED56924ACA9ABF623FE9
        07DDFED4BEC47FD20FBBFDAAD249595357EC47FD20FBBFDA97D88FFA4FFA3FED
        569246CA9ABF623FE907DDFED4FF00623FE907DDFED565242CA9ADF623FBE3EE
        FF00CC92FB11FDFF00C3FF00325653A5654D5FB11FF49FF47FF32599D669F49D
        47BB76E0FED1C6C5BAB1FAFF00D2C7F83FFF0045A3126D45CA492494887FFFD1
        F530653A82903292174C9D2492B249248A1492499252E92694A5252E92694A52
        53258FD7FE963FC1FF00F7C5AFB96475F3EEC7F83FFEF88C770A72924925221F
        FFD2F538F24BE497C928F2450BA49BE49D05293274924AC924922858CA5253A6
        D5252B54B54B5F14B5F1494AD564F5F9DD8F3E0FFF00BE2D6D7C564F5EFA58FF
        0007FF00DF118EEA72924925221FFFD3F52DC96E5182941450CB725B9460A509
        2996E4B728A492996E4A5452494CA5295149252E9264A1252EB27AF7D2C7F83F
        FEF8B5564F5DFA58FF0007FF00DF118EEA73124925221FFFD4F5191E0948F04C
        92285E4782523C1324929791E0948F04C924A5E4782523C1324929791E0948F0
        4C924A5F4F04A4782649252F23C164F5EFA58FF07FFDF16AACAEBBF4B1FE0FFF
        00BE231DD4E5A4924A443FFFD5F50493A48A16493A49296493A49296493A4929
        6493A49296493A49296595D77E963FC1FF00F7C5ACB27AF7D2C7F83FFEF88C77
        539692492910FF00FFD6F53D12D132708A15A7825ED48A8A4A652D4B44C02749
        4AD12D3C1327494A81E09E0264E82950128092492550163F5FFA58FF0007FF00
        DF16C2C7EBFF004B1FE0FF00FBE231DC20B9492492950FFFD7F5209D249142C9
        25AF9A7494A4C927494A4E9248294924924A5249249254B1FAFF00D2C7F83FFE
        F8B6163F5FFA58FF0007FF00DF118EE145CA492494AB5FFFD0F5320A6DA567EF
        B3F7DDF794B7D9FBEEFBCA7521D18849676FB3F7DDF794B7D9FBEEFBCA5C2A74
        613ACDDF67EFBBEF296FB3F7DDF794B854E924B377D9FBEEFBCA5BECFDF77DE5
        2E153A492CDDF67EFBBEF296FB3F7DDF794B854E924B377D9FBEEFBCA5BECFDF
        77DE52E153A4B1FAFF00D2C7F83FFEF88DBECFDF77DE551EA6E71356E24E8EE4
        CFEEA206AA69249249E87FFFD9FFED0F1A50686F746F73686F7020332E300038
        42494D0425000000000010000000000000000000000000000000003842494D04
        3A000000000125000000100000000100000000000B7072696E744F7574707574
        000000050000000050737453626F6F6C0100000000496E7465656E756D000000
        00496E746500000000436C726D0000000F7072696E745369787465656E426974
        626F6F6C000000000B7072696E7465724E616D65544558540000001700480050
        0020004400650073006B006A0065007400200033003500310030002000730065
        007200690065007300000000000F7072696E7450726F6F6653657475704F626A
        63000000160043006F006E00660069006700750072006100E700E3006F002000
        640065002000500072006F0076006100000000000A70726F6F66536574757000
        00000100000000426C746E656E756D0000000C6275696C74696E50726F6F6600
        00000970726F6F66434D594B003842494D043B00000000022D00000010000000
        010000000000127072696E744F75747075744F7074696F6E7300000017000000
        004370746E626F6F6C0000000000436C6272626F6F6C00000000005267734D62
        6F6F6C000000000043726E43626F6F6C0000000000436E7443626F6F6C000000
        00004C626C73626F6F6C00000000004E677476626F6F6C0000000000456D6C44
        626F6F6C0000000000496E7472626F6F6C000000000042636B674F626A630000
        000100000000000052474243000000030000000052642020646F7562406FE000
        000000000000000047726E20646F7562406FE0000000000000000000426C2020
        646F7562406FE000000000000000000042726454556E744623526C7400000000
        0000000000000000426C6420556E744623526C74000000000000000000000000
        52736C74556E74462350786C40520000000000000000000A766563746F724461
        7461626F6F6C010000000050675073656E756D00000000506750730000000050
        675043000000004C656674556E744623526C7400000000000000000000000054
        6F7020556E744623526C7400000000000000000000000053636C20556E744623
        50726340590000000000000000001063726F705768656E5072696E74696E6762
        6F6F6C000000000E63726F7052656374426F74746F6D6C6F6E67000000000000
        000C63726F70526563744C6566746C6F6E67000000000000000D63726F705265
        637452696768746C6F6E67000000000000000B63726F7052656374546F706C6F
        6E6700000000003842494D03ED00000000001000480000000100020048000000
        0100023842494D042600000000000E000000000000000000003F800000384249
        4D040D0000000000040000005A3842494D04190000000000040000001E384249
        4D03F3000000000009000000000000000001003842494D271000000000000A00
        0100000000000000023842494D03F5000000000048002F66660001006C666600
        06000000000001002F6666000100A1999A000600000000000100320000000100
        5A00000006000000000001003500000001002D00000006000000000001384249
        4D03F80000000000700000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800
        000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800003842494D040000
        000000000200023842494D04020000000000060000000000003842494D043000
        0000000003010101003842494D042D0000000000060001000000033842494D04
        08000000000010000000010000024000000240000000003842494D041E000000
        000004000000003842494D041A00000000035900000006000000000000000000
        00034A000002530000001200460055004E0044004F002000520045004C004100
        54004F00520049004F0020004100340000000100000000000000000000000000
        000000000000010000000000000000000002530000034A000000000000000000
        0000000000000001000000000000000000000000000000000000001000000001
        0000000000006E756C6C0000000200000006626F756E64734F626A6300000001
        000000000000526374310000000400000000546F70206C6F6E67000000000000
        00004C6566746C6F6E67000000000000000042746F6D6C6F6E670000034A0000
        0000526768746C6F6E670000025300000006736C69636573566C4C7300000001
        4F626A6300000001000000000005736C6963650000001200000007736C696365
        49446C6F6E67000000000000000767726F757049446C6F6E6700000000000000
        066F726967696E656E756D0000000C45536C6963654F726967696E0000000D61
        75746F47656E6572617465640000000054797065656E756D0000000A45536C69
        63655479706500000000496D672000000006626F756E64734F626A6300000001
        000000000000526374310000000400000000546F70206C6F6E67000000000000
        00004C6566746C6F6E67000000000000000042746F6D6C6F6E670000034A0000
        0000526768746C6F6E67000002530000000375726C5445585400000001000000
        0000006E756C6C54455854000000010000000000004D73676554455854000000
        01000000000006616C74546167544558540000000100000000000E63656C6C54
        657874497348544D4C626F6F6C010000000863656C6C54657874544558540000
        0001000000000009686F727A416C69676E656E756D0000000F45536C69636548
        6F727A416C69676E0000000764656661756C740000000976657274416C69676E
        656E756D0000000F45536C69636556657274416C69676E000000076465666175
        6C740000000B6267436F6C6F7254797065656E756D0000001145536C69636542
        47436F6C6F7254797065000000004E6F6E6500000009746F704F75747365746C
        6F6E67000000000000000A6C6566744F75747365746C6F6E6700000000000000
        0C626F74746F6D4F75747365746C6F6E67000000000000000B72696768744F75
        747365746C6F6E6700000000003842494D042800000000000C000000023FF000
        00000000003842494D041100000000000101003842494D041400000000000400
        0000083842494D040C00000000059C0000000100000071000000A00000015400
        00D4800000058000180001FFD8FFED000C41646F62655F434D0002FFEE000E41
        646F626500648000000001FFDB0084000C08080809080C09090C110B0A0B1115
        0F0C0C0F1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14
        140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC000110800A00071030122000211
        01031101FFDD00040008FFC4013F000001050101010101010000000000000003
        0001020405060708090A0B010001050101010101010000000000000001000203
        0405060708090A0B1000010401030204020507060805030C3301000211030421
        1231054151611322718132061491A1B14223241552C16233347282D143072592
        53F0E1F163733516A2B283264493546445C2A3743617D255E265F2B384C3D375
        E3F3462794A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F63747
        5767778797A7B7C7D7E7F7110002020102040403040506070706053501000211
        03213112044151617122130532819114A1B14223C152D1F0332462E172829243
        5315637334F1250616A2B283072635C2D2449354A317644555367465E2F2B384
        C3D375E3F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F6
        2737475767778797A7B7C7FFDA000C03010002110311003F00F4149249488524
        9249294924924A5249249294924924A5249249294A8F52E6AFED7FDF55E547A9
        7357F6BFEFA90534D24924E43FFFD0F4AFB11FF49FF47FF324BEC47F7C7DDFED
        56924788A1ABF623FE907DDFED4DF623FE907DDFED56924ACA9ABF623FE907DD
        FED4BEC47FD20FBBFDAAD249595357EC47FD20FBBFDA97D88FFA4FFA3FED5692
        46CA9ABF623FE907DDFED4FF00623FE907DDFED565242CA9ADF623FBE3EEFF00
        CC92FB11FDFF00C3FF00325653A5654D5FB11FF49FF47FF32599D669F49D47BB
        76E0FED1C6C5BAB1FAFF00D2C7F83FFF0045A3126D45CA492494887FFFD1F530
        653A82903292174C9D2492B249248A1492499252E92694A5252E92694A525325
        8FD7FE963FC1FF00F7C5AFB96475F3EEC7F83FFEF88C770A72924925221FFFD2
        F538F24BE497C928F2450BA49BE49D05293274924AC924922858CA5253A6D525
        2B54B54B5F14B5F1494AD564F5F9DD8F3E0FFF00BE2D6D7C564F5EFA58FF0007
        FF00DF118EEA72924925221FFFD3F52DC96E5182941450CB725B9460A5092996
        E4B728A492996E4A5452494CA5295149252E9264A1252EB27AF7D2C7F83FFEF8
        B5564F5DFA58FF0007FF00DF118EEA73124925221FFFD4F5191E0948F04C9228
        5E4782523C1324929791E0948F04C924A5E4782523C1324929791E0948F04C92
        4A5F4F04A4782649252F23C164F5EFA58FF07FFDF16AACAEBBF4B1FE0FFF00BE
        231DD4E5A4924A443FFFD5F50493A48A16493A49296493A49296493A49296493
        A49296493A49296595D77E963FC1FF00F7C5ACB27AF7D2C7F83FFEF88C775396
        92492910FF00FFD6F53D12D132708A15A7825ED48A8A4A652D4B44C027494AD1
        2D3C1327494A81E09E0264E82950128092492550163F5FFA58FF0007FF00DF16
        C2C7EBFF004B1FE0FF00FBE231DC20B9492492950FFFD7F5209D249142C925AF
        9A7494A4C927494A4E9248294924924A5249249254B1FAFF00D2C7F83FFEF8B6
        163F5FFA58FF0007FF00DF118EE145CA492494AB5FFFD0F5320A6DA567EFB3F7
        DDF794B7D9FBEEFBCA7521D18849676FB3F7DDF794B7D9FBEEFBCA5C2A74613A
        CDDF67EFBBEF296FB3F7DDF794B854E924B377D9FBEEFBCA5BECFDF77DE52E15
        3A492CDDF67EFBBEF296FB3F7DDF794B854E924B377D9FBEEFBCA5BECFDF77DE
        52E153A4B1FAFF00D2C7F83FFEF88DBECFDF77DE551EA6E71356E24E8EE4CFEE
        A206AA69249249E87FFFD93842494D042100000000005D00000001010000000F
        00410064006F00620065002000500068006F0074006F00730068006F00700000
        001700410064006F00620065002000500068006F0074006F00730068006F0070
        0020004300430020003200300031003700000001003842494D04060000000000
        070007010100010100FFE1120D687474703A2F2F6E732E61646F62652E636F6D
        2F7861702F312E302F003C3F787061636B657420626567696E3D22EFBBBF2220
        69643D2257354D304D7043656869487A7265537A4E54637A6B633964223F3E20
        3C783A786D706D65746120786D6C6E733A783D2261646F62653A6E733A6D6574
        612F2220783A786D70746B3D2241646F626520584D5020436F726520352E362D
        633133382037392E3135393832342C20323031362F30392F31342D30313A3039
        3A30312020202020202020223E203C7264663A52444620786D6C6E733A726466
        3D22687474703A2F2F7777772E77332E6F72672F313939392F30322F32322D72
        64662D73796E7461782D6E7323223E203C7264663A4465736372697074696F6E
        207264663A61626F75743D222220786D6C6E733A786D703D22687474703A2F2F
        6E732E61646F62652E636F6D2F7861702F312E302F2220786D6C6E733A64633D
        22687474703A2F2F7075726C2E6F72672F64632F656C656D656E74732F312E31
        2F2220786D6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E
        636F6D2F7861702F312E302F6D6D2F2220786D6C6E733A73744576743D226874
        74703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970652F
        5265736F757263654576656E74232220786D6C6E733A73745265663D22687474
        703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970652F52
        65736F75726365526566232220786D6C6E733A70686F746F73686F703D226874
        74703A2F2F6E732E61646F62652E636F6D2F70686F746F73686F702F312E302F
        2220786D703A43726561746F72546F6F6C3D2241646F62652050686F746F7368
        6F702043432032303137202857696E646F7773292220786D703A437265617465
        446174653D22323031392D30332D31325431363A31303A35392D30333A303022
        20786D703A4D65746164617461446174653D22323031392D30332D3132543136
        3A31373A32322D30333A30302220786D703A4D6F64696679446174653D223230
        31392D30332D31325431363A31373A32322D30333A3030222064633A666F726D
        61743D22696D6167652F6A7065672220786D704D4D3A496E7374616E63654944
        3D22786D702E6969643A62363966383932382D393063382D383934352D613530
        312D3862613432396534356232312220786D704D4D3A446F63756D656E744944
        3D2261646F62653A646F6369643A70686F746F73686F703A3665626435353434
        2D343466622D313165392D613635342D6335636565343334373364662220786D
        704D4D3A4F726967696E616C446F63756D656E7449443D22786D702E6469643A
        34316464636231302D613935342D373234322D616633642D6635663335396264
        66626233222070686F746F73686F703A436F6C6F724D6F64653D2233223E203C
        786D704D4D3A486973746F72793E203C7264663A5365713E203C7264663A6C69
        2073744576743A616374696F6E3D2263726561746564222073744576743A696E
        7374616E636549443D22786D702E6969643A34316464636231302D613935342D
        373234322D616633642D663566333539626466626233222073744576743A7768
        656E3D22323031392D30332D31325431363A31303A35392D30333A3030222073
        744576743A736F6674776172654167656E743D2241646F62652050686F746F73
        686F702043432032303137202857696E646F777329222F3E203C7264663A6C69
        2073744576743A616374696F6E3D227361766564222073744576743A696E7374
        616E636549443D22786D702E6969643A66313461373734302D396136622D3434
        34372D613462352D303737383032663837336362222073744576743A7768656E
        3D22323031392D30332D31325431363A31373A30392D30333A30302220737445
        76743A736F6674776172654167656E743D2241646F62652050686F746F73686F
        702043432032303137202857696E646F777329222073744576743A6368616E67
        65643D222F222F3E203C7264663A6C692073744576743A616374696F6E3D2273
        61766564222073744576743A696E7374616E636549443D22786D702E6969643A
        30393063613532612D396433612D626534392D623635632D6235363861333161
        36326530222073744576743A7768656E3D22323031392D30332D31325431363A
        31373A32322D30333A3030222073744576743A736F6674776172654167656E74
        3D2241646F62652050686F746F73686F702043432032303137202857696E646F
        777329222073744576743A6368616E6765643D222F222F3E203C7264663A6C69
        2073744576743A616374696F6E3D22636F6E766572746564222073744576743A
        706172616D65746572733D2266726F6D206170706C69636174696F6E2F766E64
        2E61646F62652E70686F746F73686F7020746F20696D6167652F6A706567222F
        3E203C7264663A6C692073744576743A616374696F6E3D226465726976656422
        2073744576743A706172616D65746572733D22636F6E7665727465642066726F
        6D206170706C69636174696F6E2F766E642E61646F62652E70686F746F73686F
        7020746F20696D6167652F6A706567222F3E203C7264663A6C69207374457674
        3A616374696F6E3D227361766564222073744576743A696E7374616E63654944
        3D22786D702E6969643A62363966383932382D393063382D383934352D613530
        312D386261343239653435623231222073744576743A7768656E3D2232303139
        2D30332D31325431363A31373A32322D30333A3030222073744576743A736F66
        74776172654167656E743D2241646F62652050686F746F73686F702043432032
        303137202857696E646F777329222073744576743A6368616E6765643D222F22
        2F3E203C2F7264663A5365713E203C2F786D704D4D3A486973746F72793E203C
        786D704D4D3A4465726976656446726F6D2073745265663A696E7374616E6365
        49443D22786D702E6969643A30393063613532612D396433612D626534392D62
        3635632D623536386133316136326530222073745265663A646F63756D656E74
        49443D22786D702E6469643A34316464636231302D613935342D373234322D61
        6633642D663566333539626466626233222073745265663A6F726967696E616C
        446F63756D656E7449443D22786D702E6469643A34316464636231302D613935
        342D373234322D616633642D663566333539626466626233222F3E203C70686F
        746F73686F703A446F63756D656E74416E636573746F72733E203C7264663A42
        61673E203C7264663A6C693E61646F62653A646F6369643A70686F746F73686F
        703A63383837363862342D336162612D313165392D396266372D626532623861
        3737326435633C2F7264663A6C693E203C2F7264663A4261673E203C2F70686F
        746F73686F703A446F63756D656E74416E636573746F72733E203C2F7264663A
        4465736372697074696F6E3E203C2F7264663A5244463E203C2F783A786D706D
        6574613E20202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        20202020203C3F787061636B657420656E643D2277223F3EFFEE002141646F62
        650064400000000103001003020306000000000000000000000000FFDB008400
        0101010101010101010102010101020201010101020202020202020203020303
        0303020303040404040403050505050505070707070708080808080808080808
        0101010102020204030304070504050708080808080808080808080808080808
        0808080808080808080808080808080808080808080808080808080808080808
        08FFC2001108034A025303011100021101031101FFC400CE0001010100020301
        010000000000000000000102030904070A060501010101010101010100000000
        0000000000010203060405071000020103020405040301000301000000000111
        0212131003203021144031041517330607375060323641220523110001020106
        070D06050204050500000001003111214191A1023220305161D133A41040B112
        4203D3E30405B536077181E135757660C122B4065013F0F16214A2247495A552
        921585161200010403010002030100000000000000006001310271A1B1322080
        40A05190FFDA000C03010102110311000000FB0AF59F98000000000000000000
        000000000000000000000000000000000075D9FAB8FCBEC07677F8FB00000000
        000000000000000000000000000000000000000000003AECFD5C7E5F603B3BFC
        7D80000000000000000000000000000000000000000000000000001D767EAE3F
        2FB01D9DFE3EC000000000000000000000000000000000000000000000000000
        0EBB3F571F97D80ECEFF001F6000000000000000000000000000000000000000
        000000000000075D9FAB8FCBEC07677F8FB00000000000000000000000000000
        000000000000000000000003AECFD5C7E5F603B3BFC7D8000000000000000000
        0000000000000000000000000000000001D767EAE3F2FB01D9DFE3EC00000000
        00000000000000000000000000000000000000000000EBB3F571F97D80ECEFF1
        F6000000000000000000000000000000000000000000000000000075D9FAB8FC
        BEC07677F8FB0000000000000000000000000000000000000000000000000000
        3AECFD5C7E5F603B3BFC7D800000000000000000000000000000000000000000
        00000000001D767EAE3F2FB01D9DFE3EC0000000000000000000000000000000
        000000000000000000000EBB3F571F97D80ECEFF001F60000000000000000000
        00000000000000000000000000000000075D9FAB8FCBEC077CDE1FEE0056B8B5
        9C6B000022D40000000000000059B025C0B340A012596680008014800882A81C
        F9E8C801480E957D97C1F82EF903E87FF9E7E90002B8379C6B24022D0800E2A0
        00A002000AA2255000214042B9337535400002805894956585A359BCB8D80001
        D117BCFCBF5DFD1903E87FF9E7E90000B75E36F9E759245A1000335C5B850000
        00000000002428896DB973635B9A00012BC8C6B774240A485B20881699A001D1
        17BCFCBF5DFD1903E87FF9E7E9000019B78378C59AB90000066B86CBAA000000
        0000001001168172E6C6B535400012C110000004DE7A7918D950259D11FBBFCC
        F5DFD1903E87FF009E7E90000545278FD312E400000335C5B000000000000099
        5A014032A73635B9A00019B9DCD6A68500080069778D0523A22F79F97EBBFA32
        07D0FF00F3CFD2000504095E3F4C4B9000000CD70EA5B4000000000224975409
        2555002C7373D6A6A800039F3A5A1900042821A5B9A3A22F79F97EBBFA3207D0
        FF00F3CFD200282001357C7DF39720000019AE2D8000000001248BAA001332DA
        A005CB9B3ADE74000066E753433723534258204D4BE4E7AB17A22F79F97EBBFA
        3207D0FF00F3CFD20141000026AF8DBC2E4800000C5716A5B400000022497540
        000490B6802C7373D6A6A80010E696CD0001424034B65E88BDDFE5FAEFE8C81F
        43FF00CF3F48290000029136F1B585840000062B8F60000004492EA800000224
        97540172E6C6B7340000724D000022550217A27F71F9DEBBFA3207D0FF00F3CF
        D252000000056F3BC78FAE79AA800000C5716A5B400842C9175400000001332D
        AA02C73F3D59AA000012C4B4C5CD00D4D429D157B7F83D79F4640FA1EFE7BFA5
        600000000559ACEA78DBE52AA00000315C7B002E521A2800000000020280B973
        635B9A0000B3C9C749282001681D11FB9FCCF5DFD1903E82FC27D65F379F4E7C
        6900000003537C7D39F8FAC4AA100000C570EB2CDD154B2E5AA0000000000224
        97540B1CDCF5A9AA003373C99DF3E365400001D117BCFCBF5DFD1903E813C3FD
        229FD3E3DF9F968000000568B8D63C7E9CC02000018AC994AB29A00000000000
        009996D50B973E35A9A000CDCF2675CF8E8940000E88BDE7E5FAEFE8C81F409E
        1FE9029FD4E3DF9B9E900000002B78DE3C7D7350202E2C08D2E2B29351680000
        0000000002495542C7373D6A6A8337356272677CF8E810001D117BCFCBF5DFD1
        903E813C3FD200B1FD4E5DB9B96C00000059BA7174C706F902887159A548519B
        26C0000000000000001124BAA2E5CF8D6A6B373A9A19B91CB9DF363A20003A22
        F79F97EBBFA3207D02787FA40029FD4E1DF9B1A40000000D37C3BE7C3BE6004D
        4AE3B988B0456A8000084405D40014202824821692C72E75652669608BCB9D72
        677598BB97933BE88FDDFE5FAEBE8C81F409E1FE9000165FEA71EBCDCF600000
        02DD55E1DF3E1BCCB5512B16096042B1B000211C7ACF8FBE79BA2405812AA422
        824B51A922AC1C990160A2ACB2CA2AFF005787D1D14FB7FCFF005DFD1903E813
        C3FD2000058FEA71EFCDCF640000000AE2DE784A5258B9E133B9562112ACB740
        00386E7C4E98D482000025A00B1A44B2CCDB64E4CB5340002168597A3CF63F37
        AF7BC03E813C3FD200000B2FF578F6E5E7A00000015A9670EA71DCB592010C51
        2AC4CDB34000124E2B38772A580005B6282255405B4458E6CDAD24145A8E6C6B
        95B47451EE3F3BD77F4640FA08F0BF50A0012A89A97FA5CBB6A56400002AA962
        70EF1C7AC08B5218A5225019A500000190902E8A02665D5002249755172E7CEE
        A80489579F1BE4CEBA22F77F99EBAFA3207D0C780FD1012800691036BAC80002
        ADA94335A9E3EF963590520E331A85B0A94A0000249E3EF9C582DA9010B10580
        149951516F2628325A44CAEE5E8EBD97CDEBEEF00FA04F0FF480000001A8FEA7
        1EFCB8D20142ADA9249A9D06758E0DF3C6B20B003082D23358DCAA00038D9F13
        A73CDA00000B20968000153979D0285113A3DF63C3D7DDE01F425E0BEF160290
        8A833ABA9059BF2716C05BA5952422353A089358F1F78CEB20A09C1A8A0866DD
        2680001971EB3E2EF0A8551A90010D012904B51691CD9A8AA42C4E8E3D9FCDEB
        DEF00FA0DF07F658540500AA02053CACF4E5C52DA922000353A133BC78FBC66E
        4028200071D6351680001249269A50400000005925B570E79BD4B2883A2BF6DF
        0FAF3E8C81F40FE1BEA804102A0028406A5FEA70FA39705A900006A7412E66A7
        8FBE59B000000071D6360000892716A67524514428000008322B79BB96CA64BD
        1B7B3F97D7BDE01F431E03F42C45D848B5742412DB150B8AD46A02000001A9D0
        6779F1B5CA6B2002900038EB1A8B404492DB867C4EBCF16800000000002C8397
        16A8E8F3D8FCFEBEEF00FA04F0FF004810A0080A416A4294B2FF004F8F7E5C50
        00006A7404C6F1E3EF9CB0005200071D63608925D508C33E275C44CDA00D4822
        8025002C0D49C99D17A3CF63F37AFBBC03E84BC17DE22DB2466C2EA494922D32
        8B4CD8559AF3B9F4B900001A9D0019DE3C6DF296000A0800E3AE3D445D500004
        13341001540500008CEE6B9B1AE8B3DB7C3EBCFA201F435FCFFF0054000262B5
        2DDE732D89A854586A4A962140001A9D000B31BCF8FBE510000A400715674500
        0018673480A000080000A65A5E8DBD9FC9EBDEF00FA1EFE7BFA400000290042A
        C0000000000D4E800C74C78FBE510000A08071D629A0000CC9E274E5C7AA0000
        00000001D217ADE1EBFEF00FA1FF00E7BFA4000042C280000000000000D4D800
        71EF1E3EF9900186EA6990071D63600008CA787D39E340000000000379747FEB
        F87AFF00BC03E82BC2FD600E3B38F59B28291400000000000000B1CD9D846779
        C2008AA40A090634CD116D800433600010011400017A41F5DC3D7FDE01F409E1
        FE9000E2DE78F50021410440001A6C0000000B97366D94442AAC010A01104B33
        650B650204A40A00000025511D1FFB0E1EBEEF00FA04F0FF0048000E2DE7152C
        1490AB2CB080005B29400000068E5C2CA000000000A2652CB54000000000019B
        2C551D1E7B1F9FD7DDE01DF6F87FA40CD962AC1400492ACAA040014000000008
        216168000204B45012D8D00000000000085003A50F5BC3F03DE01DF6787FA442
        80000002522800000000000020AB000000021400351A0000000000428003A51F
        5BC3F03DE01DF6787FA400000000008500000000000101400000000405000000
        0000010255000E947D8FCFF81EF00EFB3C3FD440000000000214000000000101
        40000000001014000000000D4D66C200001D28FB1F9FF03DE01DFB788FAB8AE4
        000000000010588000000002D320A80000000160B352C4000002A89672E7496D
        9C3720000749BEBF8FE07BC03BF8F17F4000000000000138AE4B400000400D4D
        40500000000101412C45500019B8DCD7262AB2716F3A9A00003A49F5DC3F01DA
        01DFDF89FA400000000000010B24B4000062CE2D66CD80000000000000292C45
        580A42B3C99D58C59C7B965280001D257AEE1F80ED00FA0EFE7FFA0000000000
        000001116D8004B2CA0000000000000000024B6C0A42ACAD44B240000007467E
        E3E1F5EFD1903E807C37D7400000000000000085008500000000000000000000
        03971AB5C361028000000747DECBE5F5F778077E9E2FBD5000000000000000CD
        CEA544D44B54000000000000000003373A9752D814E3D42800000003A49F5DC3
        F01DA01DFA78BEF54000000000000003373AC8B2CAD0000000000000000000CD
        CEE5DE2DAD4BC1ACAD000000000E927D770FC0768077E9E2FBD5000000000000
        0044966A6866E753400000000000000000009C99BA978F59C5168000000001D2
        4FAEE1F80ED00EFD3C5F7AA00000000000004B11540110550000000000000000
        227366C33671EB3A9B88AB2800000003A49F5DC3F01DA01DFA78BEF540000000
        000004B986A680004B05940000000000000CDCD379BACDD1C7A98B4500CDCD96
        A8000000E927D770FC0768077E9E2FBD500000000000097296A80000222ACA00
        0000000001139212EA2D7156358B3740009725B28000007493EBB87E03B403BF
        4F17F450000000000012C4550000000337365AA0000000003373A979B1752E6B
        8ECCE90A000019B9A59A000007493EBB87E03B403BF3F17DB4D000000000012E
        52D50000000009730D4D00000000066E772F262CAE3D3371A9B00000011259A9
        A00003A49F5DC3F01DA01DFA78CEF12CB5400000001966AD500000000002584B
        340000000088525500000000002588AA001D24FAEE1F80ED00EFD3C5FD149725
        B28000000CDCEA6800000000000044966A6800000066E6CB540000000000004B
        226A6801D24FAEE1F80ED00EFD3C5F7AA337365AA00000CDCEA6800000000000
        0002588AA00004415400000000000001105503A49F5DC3F01DA01DFA78BEF540
        892CD4D0000CDCEA68000002148500000000960B28004B115400000000000000
        00CDCD96AF493EBB87E03B403BF4F17DAA800440B02696594000000445B96373
        60000000082CB28102550014100000000000000895AE927D770FC0768077F1E2
        7A94000096EA4CDB6400000000BC7B89AE4CE0A000000000B5209560012B16D5
        DE72000000000000001D237AFE5F80EF00EFE7C4F51680089756245D64000000
        0048B0D2140000002512CDCDC230A001065695014000000000009443A46F5FCB
        D7FDE01DFE78CEE0002259A32550000000010005000000011059A22800000000
        000000000001194D7489EB787AFF00B80EFF003C5F7AB100960D4D0CDC92CD00
        0000000000000000290055CDC8B28000000000000000004B1157A43F5DC7D7FD
        A01F405E27E84000000085000000000000000002C4A000428000000000000000
        00000E8FBD870F5F77807D06F84FB00850000002140000000000000042800000
        10A00000000000000042800E8D3DA7C9EBDEF00FA1FF00E79FA4255100000012
        8580005000001000128580000001285800000000000012A88007449EEFF3FD77
        F4640FA1FF00E79FA59B752000000002545D480294000004204A028020000002
        50B00000000000095600007449EEFF003FD77F4640FA11F05F6D0000002D6B3A
        D000C94F1F78E1D60000003CBE7D779D0ABC7738DE5007367540000073E37602
        02928005000A44AAA80A201D11FBAFCEF5DFD1903E82FC1FD2000000391BE694
        0011C1B9E0F5E566400001E4E3BF95CF60B9B386F344D652F335C928000039B1
        D3931400001A9D000005466CD0BD20000E88BDC7E67AEBE8C81F417E0FE90000
        00D5D73E77500030781DB966E22D9000072E7AF9BCFA2325AE1D7396149BCEB9
        66824B6D2141BCEB9F1B812A8010353A00005912CD017A40001D117B8FCCF5D7
        D1903E82FC1FD200000B6F919DD000965781D7971DE6066DD2200D4DF9FCBB12
        04E2D670C6A685396DB1532D724D6359C5BBCE6CBE4F3D802AEB3B0A080353A0
        0B2259A000BD20007445EE3F33D75F4640FA0BF07F480000AE7CF4D800097C3E
        98F1F7C40025A4B15BF3F8F6A133666E38D986A695CD2D02B79D645C0E39D3CB
        E7740035376501410353A09722CD000017A4007445EE3F33D75F4640FA0BF07F
        4800069CB9DF2CA0028E0D67C2E9C4800000F2F1F473F3B8B1666CE399A08725
        D72CC896EB3A96E6E2C439F1D3932006A6ACD000050D67A4B91668000002F480
        7445EE3F33D75F4640FA0BF07F48000DB5CF340008C69FCFEBC632000146FC9E
        7D3C9E7D32CE759B6713280356DBBE5CF306ACD6359A88DE77CF8A00B2EA6C00
        00504B5AB28000000BD201D117B8FCCF5D7D1903E82FC1FD20069737C89BA000
        23C4E99C6B2000044DCDF95CBA66C8CB6E39890055E4D6B368DE33C937C7732C
        1BCEBC9E7400353A5800001402353A000000017A41D117B8FCCF5D7D1903E82F
        C1FD202AE9CFCFA680001C1A440A000B26B3BDCD66E66B0309862CD09672DDCB
        A49A4E4C6A8055F239EEE68805580000A2A4015ACF4000000005E93A22F71F99
        EBAFA3207D05F83FA4361CD8DF24A0008F1B73C5E9C400010D6F3AF231D3926B
        3BC6A4CA70A0D44396EA6B4359CEB376A0179F1BDE2800000001480028A9353A
        00000001D11FBCFCBF5D7D1903E82FC2FD2C9B6F1BE7940004250002150D4D40
        71EF1A9331C57165CD0E595BD8D4CD9AE4C801CB9E9CBCE80000000148000015
        66ACD0000000E88FDE7E5FAEBE8C81F417E13E946B579F1D2A000653F9FDB397
        35A00D4D25A72E75E573DE6F3CEE8E398400AE46E6A8D49CB8A00DE75CFCF600
        0000005200000000D4E8000001D117BCFCBF5DFD1903E82FC27D34E7CF4D0000
        38EB3400011A9656A25CCB25B8989002B99ACDACA69CD8B402CBE473E9600000
        000520000000015AB3400000E88BDE7E5FAEFE8C81F415E13EAE7CEB91400078
        BBCF0EB200006A5AD7938D5678F7522678E66A85723535A164DE6EA5A8266F93
        9DEB3400000000000000000353A4B916680007445EF3F2FD77F4640FA0FF0007
        F66E6F49500195F1778200009565E4979A5E3D496DCE78E6401BB574B472626E
        58B0D272E3A72E280000008500000000000D4E825C8B34001D117BCFCBF5DFD1
        903E857C17DA228A838CE1DE41002C22D39737965E3D633AD6B39E2990259B6A
        DD2D1A9397140171BF233AB00000012AC0000000000000D4E92E459A007445EF
        3F2FD77F4640FA15F05F681161A4F0778C6F12D08115572D1E772E99D31A5931
        33962CD0572DD66E926A4E4CEA8026BC9E7B292C0000128580000000000001A9
        D0446A336A8E88BDE7E5FAEFE8C81F42BE0BED000E1AA94000C9A11C8B8B25CE
        A4E2B712085392EE5A3526F2D28097C8C74D64250B0000255800000000000000
        0D4E825C96CBD117BCFCBF5DFD1903E857C17DA00F1F53C4E9C336D0044B7532
        5F2F9F6E6CDCEB14B262D96865E4635A9445D5BBC5956017500084AD40105580
        000000000000001A9D009723A23F77F9BEBBFA3207D0AF82FB40E3B3C0EDC648
        2B711512C839F3D7CCE7BCEB1C7AD8006B33979DE7CD0235C99D000000003342
        C2AC00000000000000001A9D0012E7A23F77F9BEBBFA3207D0AF82FB40F0F79C
        DC80585082B5E673DE2E71BA001ACCDE2F938A00D4E96000000001C7AA393300
        0000000000000000353A0026B3D11FBAFCDF5DFD1903E857C17DA00032B402A0
        18B38F7400127261E4F3D500D4DD94000000094850B000000000000000000006
        A749724E88FDDFE77AEFE8C81F42BE0BED000CB5A4202E574CCB38B4968006B3
        3C9E5ADC006F79A00000004A4500942C0000000000000000005692D5E88BDE7E
        5FAEFE8C81DD4794FA0012DB20000CDB2C00003797266812B534000000008500
        00000000000000000000002CD750FEA3E3FC4F6807677F8FB000000000000000
        00000000000000000000000000000000000003AECFD5C7E5F603B3BFC7D80000
        000000000000000000000000000000000000000000000001D767EAE3F2FB01D9
        DFE3EC0000000000000000000000000000000000000000000000000000EBB3F5
        71F97D80ECEFF1F6000000000000000000000000000000000000000000000000
        000075D9FAB8FCBEC07677F8FB00000000000000000000000000000000000000
        000000000000003AECFD5C7E5F603FFFDA0008010200010500FE8FB7FE7FA56D
        FF009FE95B7FE7FA56DFF9FE95B7FE7FA56DFF009FE95B7FE7FA56DFF9FE95B7
        FE7FA56DFF009FE95B7FE7FA56DFF9FE95B7FE75EFB74EFB74EFB74EFB747EB7
        745EB770EF370EF370EF370EF370EF370EF370EF370EF370EF370EF370EF370E
        F370EF370EF370EF370EF370EF370EF370EF370EF370EF370EF370EF370EF370
        EF370EF370EF370EF370EF370EF370EF370EF370EF374EF374EF370EF370EF37
        0EF374EF370EF370EF370EF370EF370EF370EF370EF374EF374EF374EF374EF3
        74EF374EF374EF374EF374EF370EF370EF3747EB774EFB74EFB74EFB74EFB74E
        FB74EFB74EFB74F4B537B5C94F97041041041041041041041041041041041041
        0411CAB8924B892492E2492791E8FE8F297293F0D248DEAD0F911AC11A24410C
        B48208E2F47F479484C9E4A6353E0D8C5C2C8E4469041041041041040D09F07A
        3FA3CC5CA4FC32E06343E4492492CB8B8B892E2E2E1BE1F47F479B3CA4C6A79E
        DF32391041690416969690410411AFA3FA3CD4C5CA4FC2C09F0B43F0703D3D1F
        D1E727CB4CF3F091CF6CB892492492492492493D1FD1E6B5A2722E527E2DA1F1
        B45A5A8B516A2D45A8B4B4B4B4B4B4F49F4BC5A679F0B291F3A09E0688E4CF04
        924F07A4FA5CF6313917293E17E0609E0687C6C6CB8B8B8B8B8B8B8B8B8F49F4
        B5B0B074C7393E5267993C0BC03E28E2631A1723D1FD1E16A4AA98E5B114BE5A
        7C097876B8E0688E47A3FA3C75531E1208D234425E1589F29150D09F17A3FA3C
        6D49528E6A7C53A493A27E1DA275687C6D0D717A3FA3C974C731F4170CF05A5B
        C9F32D2D2DE6753A9D482D2082082D2D1523A0B0B0B074E9E8FE9725A92A51CB
        A8A593C324E924E93C74E905A884416905A411A41047022081F29A2AA4F47F47
        94D0E98E6262279108845C4AE34F49249249249278FF00F2F4688E438140E993
        D2FD2E5B454A398842E2B4B48208E37D05517171797179797979717171717990
        559717978EA2E2E2E2E2E2E2F1D4C92E83D27D2D6E2E2E2E2E2E2F2E2F436344
        2E627C525C49717170B932492C964F2635688E381A7A7A3FA3AC104104104105
        A432D2DE4C93A27C882D2D65A2E4C169616969696A2D2D2D2D20821102A48442
        2D2358208D2D47A5FA5CE6874F31313E3924927934D5CA927C07A5FA5AE43217
        9797B2F65ECBCBCBD8F705B837C73C5227C524925C88278FC855124925C5C892
        4924B8B8B8B8924B8B8B87521D45C5C5C5E5E7A5FA5AE33198CB0B0C6632C319
        8CC6633198C74C13CB4C5CB4C6A790CB89D649249249249249192344717A4FA5
        ADC5C4971717124925CB49D5A92A51CC9E627C95496961616169696969696969
        6969696969696169696969E97E96B0C820B59D7586433A9D74EA753AE902E9CB
        427CB4C6A78E927C135C1E97E96B0410410410411A4105A8820843A4AA9E5A27
        989F1B62A89E64924924E8F5F4BF4B5BCBCBCBCBCBCBCC86432190C85E643219
        0C83A87CC5CC4C7CA75171717171717171771C11A7A4FA5CC83AEB0493CF4C9E
        627CA82C2C2D2D2C2D2D2D2C2C2C2C2C2C2D63A0C6CF4BF4BF829297CC4CF3E3
        42F05E9BE9F1C104704104104104104104104104104104104104409F313E4489
        F80A8F4DF4F5B4B4B4B4B0C6633198CC6633198CC6633198CC6633198CC66331
        98CC6633198CC6622C2C2C4585A5A8B4B4B4B4B4820B4B482D2082C2C2C2C238
        A0820820820820820F4DF4F909F8A688E19E5492492492492492492492492492
        4924925C49E9BE9F253E19D649F02C8E74788F4BF4B9524924F0492492492492
        4924924924924924F0492492493C3249226410410410410410410410411A4104
        107A6FA7FCAA64924924924924924924924924924927A6FA7FD2BD2FD2FE82C5
        C8F4BF4B82D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2
        D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2
        DD2048B4B4B4B4B4B4B4F4DF4F5820820820820820820820820823973E3DEA90
        B91E9BE9EB0410410410410410410410410416905A5A5A5A5A5A5A5A27E39888
        122393E9BE9EB9D99D99D99D99D99D99D99D99D99D99D99D99D99D99D99D99D9
        9D99D99D99D99CCECCECCECCECCECCECCECCECCECCECCECCECCECCECCECCECCE
        CCECCECCECCECCECCECCECCECCECCECCECCECCECEE199D99D99D99D999999999
        99D99CCECCECCECCECCECCECCECCECCECF48E76B5C48C48C48C48C48C48C48C4
        8C48C48C48C48C48C48C48C48C48C48C48C48C48C48C46246246246231189189
        1891891891891891891891891891891891891891891891891891891891891891
        8918918918918918D18D188C4623123123123123123123123123123123D2AFFF
        002F12FC73D3C87D443E77A6FA7E25F8E63D3CB45CEF4DF4FF009791B244BC07
        A6FA7FCC40A9F03E9BE9FF0026864E902F05E9BE9FF27237AA5E0FD37D3FE45F
        0411E13D37D3FE458F48F0DE9BE9FF004AF4DF4FFA57A6FA7FD2BD37D3FE95E9
        BE9EB24924924924924E924924924924924924EB2492492492492492493A4924
        E92492493AC92492492492492492492492492493A7A6FA7ABE54F313F0689E19
        F0F27A6FA7AC1041041046B0410410410410410411A433AE9041041041041041
        0468C488208208D7A90F582082082082082082082082082047A6FA7C12492493
        AC6924924924924924924F0C924924924924924F0C9249249249249249249249
        2492492492492492493AFA6FA7FD2234F4DF4F592E2592C92492492592CB8925
        92C964B2592C964B2592C964B2592C964B2592C964B2592C924B8964B2E2E249
        2592C964B2592C964B2592C964B2592C964B2592C964B2592C964925C4B3D2FD
        3D6F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F
        2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F
        2F2F2F2F2F2F2F2F3D2FD2F0F041041041047147F0DE8FE978682592C964B259
        2C964BE38208FE0FD1FD2D6C2C4588B11622C4588B11622C43A4B4B4B4B4B482
        0A682C2C4588B11622C4588B51622A42A4820815258584104104104104103238
        238A492492395E93E973678994D3CAA993AAD6091F25BF00B95E93E9783484B9
        353D208D11248DEB04F137C73E13D27D2E5B7C53A534F25B2758D172A746FC67
        A4FA5E060A572AA7AA5A473193E33D27D2E4A637C6972AAAB58E4CE890F56F98
        84FC07A4FA5CF6CA57264AAAE17C084F856ADF8EF49F4B8EAE44099722E45C8B
        91722E44A2E43AB9AF482082A7E3FD27D2E37C8B4B4B4B4B4B4B4B0B4B74489E
        521BE16FC7FA4FA5C2941237C4D1493C725C3625C086B8A389BFE03D27D2E1AB
        C043D1B12D18B54C6B810DF0B7FC0FA4FA5AFF00E46F8D212E26488AB85F0CEB
        E5C2FF0082F47F475FFCF2131D42A8B8B99732E65C4924E887C88247C0C9FE0B
        D1FD1D50F8E9A47496969696969696168C4B8DF03E16C6FF0083F47F4756F917
        17979797979797978EA122796DF0D4FF0084F47F479291696161616161696160
        D11C688E07C2DFF0BE8FE8F25124924924A24B912362E05C723E06362FE13D1F
        D1E45A5A5A41041043208D121F22491F0C8FF86F47F478E95AB5AC7054C489E2
        6C7512C964B249249249FE1FD1FD1E24B9553E4B7C13CD823C7FA3FA5C499717
        1722F2E2F2E2E1D648B890DF8262F1FE8FE97804B8EA7C2F9D24F8FF0047F479
        E909F13637C0DFF1FE8FE8EBEDC7B71EDC7B71EDC7B71EDC7B71EDC7B71EDC7B
        71EDE7607607607607607603FF00E71ED87B61ED87B69ED87B61ED87B61ED87B
        61ED87B61ED87B61ED87B61ED87B61ED87B61ED87B61ED87B61ED87B61ED87B6
        1ED87B61ED87B61ED87B61ED87B61ED87B61ED87B61ED87B61ED87B61ED87B61
        ED87B61ED87B61ED67A7A6DDBFE95B7FE7FA56DFF9FE95B7FE7FA56DFF009FE9
        5B7FE75FFFDA0008010300010500FE8EFF00A5BFE96FFA5BFE96FF00A5BFE96F
        FA5BFE96FF00A5BFE96FFA5BFE96F8315262A4C5498A916D523DA4588B11622C
        4588B11622C4588B11622C4588B11622C4588B11622C4588B11622C4588B1162
        31D263A4C749622C463A4C7498E931D263A4C7498D18E931D263A4C7498E916D
        A1D1498E931D263A4B292CA4B2931A31A31231A15148B6A930D261A4C3498693
        0D261A4C3495A87C96B973E0249249249D249249279369690416969616160A81
        53C8DCFF005CAA972A3C4C6AB8E04F592492759249278B73FD7290D0F94DF865
        C33C8924B8B8B8B8B8B8B8B891313E066E7FAE527A55FC32E34882C2C2D2D2D2
        D2D2C2C2D12E1DCFF5CD6B97E5E03CF973C8B8B8B8B8B8B8B8B8B8B8B8B89D77
        3FD739AFE1972275964BD64920913169B9FEBC4B5E3279091696969696904169
        69691A6E7FAE7B43FE1971A65C5C5C5C5C5C5C5C5E5E5E5C57FEB9E864729A3C
        BC5CF26DE0B4B4B782BF3F014952FE1D71A122D20B4B4B4B4B4B4B4DCFF5ADEC
        BD94D53CD6B99E42F153C54E93C9DCFF005C2994D53CBA468A97F0EB8A44C5C8
        DCFF005C74D53CB9132A5CA9249F173C305452F91B9FEB8D329AA796969553C5
        02A48208F1AB87CC4CA5F1EE7FAE4D354F310D70C12497171772E49249249E39
        2513A49249717176B714D66445E5E2AB4DCFF5C94E0A6A9E5D23435A411A470C
        7259248DEB3A4F0C6BD783A9D4EA753A89E89EA994D46E7FAE5262AA44F98D11
        ABD6DD3A9D4EA75E36B49249249249278A5923D193CA4E0ABCF969C14B9E5F4D
        1A1F1CE92895C687496969696B2D2D20B4B4B4B482D2D2D2D2D2D2D2D2D2C2C2
        C2D2C152588B0AFCF5B596B2D65A5A5A5ACB596B1213E6B5C4F58208F113C0A0
        9249211D0915449B9FEB5B8B8B8B8B8B8B8B8B894362AB9703435C725C493CAB
        8B9925C5C5CCBCB8B8B8964925C5C5C3A8B8965C5C49248C551732AF3E726535
        7318D731AE3A972208249E4412470A1F9EB8CC66331988C6632C2C3198CB0547
        1413C2D1035C505A432394E923582D2D65A5A4696B2D65A5A5A5A5A5A582A0B0
        B19616161579EB7979797979797991990C86432B323320AA9E5BD2A5E1639D1C
        13A410415F9EB696B20B590410410411A41027052E79690D0D78382E2E2E2E2E
        24B8B8B8B8B8B8B8B8BCB892E2F2E2F2E2E2AF3D6F44A2E44A25128944A25128
        84743A1D0E84A131F2D8D783635E0A04F5ABCF952492492C924924B8A5F2DA1A
        1F836881E92493AC10411C51A410CABCF5C66231188C43DB3118CC4CC6633198
        CC658636631524732A435CCF2238E082082082082082393257E7CC83AE9E6412
        493CE68A973239324971717171717171717171717171717171795F9EB2492492
        493C33E16AA7C231AF04FCFC7C924924C9553C4D8B9B6F827E7ADC5C5C5C5ECC
        86466432190C86432190C86432190C86432190C86432190C86432190C8642F65
        E5C5E642F2F2F2F2F2F2F2F2F2492492E2E2E2E249E182082082082082347E7C
        86883A1D3450743A1D38D41D0E8743A1D0E8743A1D08279D041075D3A1041041
        0410410410410410411AC0FCF9304104104104169690410411A4104104104104
        11AC6B0410411AC1046AD13E096B579F2638A08FE0649F10FCFC027E15BFE15F
        9FF4AABCF56BC7C78F81AE455E7AB249249249249249249249249D27993A493C
        D9249279324899248DF21F9EB24924924924924924924924925CC86753A9D4EA
        753A9D4EA752D248F09027C7E62E0AB90FCF5B91722E45C8B91722E45C8B9172
        2E45C8B91722E45C8B912892492492492492746BC33427C2C5AC971E7C87E7AE
        0460460460460460460460460460460460460460460460460460460460460460
        3023023023023023018118118118118118118118118118118118118118118118
        1181181181181181181181181181180C08C08C28C28C28C28C28C28C08C08C08
        C08C08C08C08C08C08AD43D72332332332332332332332332332332332332332
        3323323323323323323323323323323323323329919919919919919919919919
        9199199199199199199199199199199199199199199199199199199199199199
        197B3233233233233233233233233233233233233232AF3D5786A49D18978AA7
        5F2F00FCF55E1A910DF8CA74F2D5F39F9EABC2B625AB7E2DA168DF807E7AAF08
        D8970C09F8A91B129D1A279AFCF55E0DB12E3689F09514E923E3F213E5BF3D57
        82912E4B44F826411A468DF1B427CA7E7AAF03225CCF213E7D3C1237CA813E4B
        F3D67C0A5CE689E75232757CB68F2E43F3E0F213E779780684F9AD888F01027C
        4FCF55A409F2FCFC1B47972DB12F06D09F0BF3D56B027E3E04F90D89785689E0
        7E7AAE068F2F1ED09F13625E2204F47E7C98208208E6F973BCF8978A6B47E7AB
        E4C13CD6BC0C0993C33E21F9F0C92493C324924924924924924E924E92492492
        49249249248B8249249D649D649249249249249249249249249D1F9EB05A5A5A
        5A5BAC105A5A5A5A5A5A5A5A5A5A5A5A4104105A5A5A5A5A5A5A5A5A5A5A3425
        ADA5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A35A3F3D
        6749249D2756C9249249249249249249249249249249249249246C4493A32492
        49249249249249249249249249249249249249247E7C10410410410410411A41
        0410410410410410410410410410411A41041041041041041041041041041041
        041041041041041041041579EB616161616161616161616161618CB0B0B0B0B0
        B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0C65858585858
        585858585858585858585858585858585858585855E7FD2ABFF5FD2ABFF5ADE5
        E5E5E5E5E5E5E5E5E2AC5512492497125558B70C8CC8CC8CC8CC8CC8CC82AD97
        17124923A8BCBC550AA249249249249E382082082D2D2D2D20B448B4B4B4B4B4
        B4B4AFFD7352E248A9F2A94411A3D234812E4A5E07CF93B9FEB98971B654C5C8
        A56924923AB8249244F824929249279B3CBDCFF5CB4B91555C13C2A92092746C
        AB544EAB59D12E14B96D91CBDCFF005E0AA7C49EA8A50DEAD97094F174121EAB
        892F0FB9FEB94971B63E4245348F491BE15AB625A31890970A5E2373FD7252E3
        63AB9105348F4918B817025A2D570A5CBE9CEDCFF5C84B90D161616161616169
        60A9D1BD27931A345A5A25E3F73FD71AE43A855171717171717A2E2E5A3245A5
        4F542D57125E3F73FD71A5C7510C86432190C86416B2D121B1F147040B852FE0
        373FD7125CDE9A4224824918C6F542D57125E1BCF97B9FEB852E36C91B2592C9
        64BD5A29431F1A42E425FC16E7FAE18E368820820820B448B74A9948C6F86390
        97F07B9FEB5812E375179797979797978AB2747AC8F5485AB42235484BF83DCF
        F5AA5C8748A82C4588B11622C4582A11031BD678172578E9E2DCFF005C3235AB
        65C5E8BD17A2F45E8B8B8B89E4342E4AF1F04F0EE7FAE4B20820820B4B482048
        9E0A9EB491ACF0A5A4F8F8D275DCFF005C87512492492497124EAF47ACF0B447
        02FE1674DCFF005C753244C65CCB9923649225A4EAC82048820820B48208208F
        E1609373FD71363D5245A5BC14D3C8812E05FC6366E7FAE268C6633196161698
        CC625C8425FC8A2BFF005CA9E6A5C297F1DB9FEB9EC4F8D702FE3634DCFF005A
        E432190C86532190C86432190CA2DC32190C864321905B86532994CA673399CC
        E673399CCE673399CCE673399CCE673399CCE673399CCE673399CCE673399CCE
        673399CCE673399CCE673399CCE67339DC15397FD29FF4B7FD2DFF004B7FD2DF
        07FFDA0008010100010500FE8FF7BFFD9FF4AFBDFF00ECFF00A57DEFFF0067FD
        2BEF7FFB3FE95F7BFF00D9FF004AFBDFFECFFA57DEFF00F67FD2BEF7FF00B3FE
        95F7BFFD9FF4AFBDFF00ECFF00A57DEFFF0067FD2BEF7FFB3FE95F7BFF00D9EB
        F1B7D947C6DF651F1B7D947C6DF651F1B7D9457F8DFECDA4F8E7ECD3E39FB34F
        8E7ECD3E39FB34F8E7ECD3E39FB347F8E7ECD3E39FB34F8E7ECD3E39FB34F8E7
        ECD3E39FB34F8E7ECD3E39FB34F8E7ECD3E39FB34F8E7ECD3E39FB34F8E7ECD3
        E39FB34F8E7ECD3E39FB34F8E7ECD3E39FB34F8E7ECD3E39FB34F8E7ECD3E38F
        B30F8E3ECC3E38FB30F8E7ECD3E39FB30F8E7ECC3E39FB30F8E3ECC3E38FB30F
        8E3ECC3E39FB305F8E7ECD3E38FB30F8E3ECC3E38FB30F8E3ECC3E38FB30F8E3
        ECC3E39FB30F8E7ECC3E39FB30F8E7ECC3E39FB30F8E7ECC3E39FB30F8E7ECC3
        E39FB30F8E3ECC3E38FB305F8E7ECB95F8DBEC96BE35FB28F8D7ECA3E35FB28F
        8D7ECA3E35FB28F8D7ECA3E35FB28FCA9E9B63D17E50E4D745BC2E785CC5ECBD
        97B2F65ECBD97B2F65ECBD97B2F65ECBD97B2F66466466466465ECC8CBD99199
        199197B1549AE3892CA8B2A2CA8C7598EA31D463A8C5518EA31D4534D74BE3FC
        BDFB6793D0AA8B5EBE5C55533E2D369D2D35C4BA14D772D3A1D0E87425128BA9
        2EA4BA93A3E2FCBDFB6795575556DDA53C9AA991F865E5AA6D35526B8E512892
        4924924924928A9D2D435AB3F2F7ED9E53523529D163E4D54CF83F3E426D14B4
        F8D229A2E31331331331188C46231188C4534BA787F2F7ED9E6352AAA5D2F935
        533E07CF949B42A935C49B4D6E52D64A4BE92FA4BE82FA0BE92FA0BE92FA4BE9
        2FA44D3D7F2F7ED9E6D54AA934E97C9AA99E7F9F31368A5A7C89D7A9D759248D
        28A9D2D35523F2F7ED9E7554AA93A5D2F935533E1609E14DA1549F229A29A963
        A4C7498E931D263A4C7498E91EDD22DBA116522A552CFCBDFB679F552AA5552E
        97C9AA99E54C733CB85369D2D3E3A6A74BCA6532994CA653375CA6532994CA7E
        5E73F9639E8AE955269A27935533E2D369AA935C88E08208E0FCBBFB5F54D3E6
        A2BA5549A3CB935533C294B87E15382969AE2A5C34A86ADA4B692DA48A48A48A
        4B692DA4B693F2F7ED9D7B9DD4775BC6CEF2DD5CCAE8B8F2E5554C9E47412509
        52CA5B9F03E5C09B4D549AE14515DAD43E4FE5EFDB3C34D4E97B3BCB757290D1
        5D12B955D32269A50D28A7C2791E7AA6D09A6B8A8AEDE4FE5EFDB3C54D4E97B3
        BD4EEAE5A65744E913C0DC2BD17A2F45D4A2B74B1BA5F868E04DA69A6B5F3D19
        4576F23F2F7ED9E3A6A74BD9DEA77572A34AE89E17D56363DB6DE392C70E9716
        D5E2D382969A3CF5F324A2B8E3FCBDFB67914D4E97B3BB4EED3CCAE89E26DD25
        553464AA2FA8C8C6E7C4CA2EA455A4D6E50D64A0C941976CCBB665DB33ED147A
        ADB4773B2773B0773B06DEF6DEE33F2F7ED9E4D353A1ECEF53BB4F29695D1AB5
        047489150A2DA0B682DA0B291D1C8AEF325664ACBEB664ACC9597D65F517545C
        C9649249D04A5B490E981C09C34E4EA753A9D49E14DA7B1BEB757E5EFDB3CAA6
        A7455B3BCB769E66E510252293AD23F31F9DBA753A92C97C7B9B7710D3B4B482
        0B4B4B4B78544B83A5AA20A5C133CA4DD2FF002DB757E56E5D353A2AD9DEA776
        9E574D2BA14B7C2DC2BCC85E64A46D37C75EDDC60ACC15982A305460A8C0CC0C
        EDD981980EDD1811811811DBA305260A4C140B66942D8DB676D41DBD076F41DB
        D076FB676FB66DECECB3B6D93B7D83F2F24BF2C6B8774C3BA60DE306E98374C1
        BA60DE306F18378A76B7E8AA875554F32AA1D3AF968D4AB19632C658CB18E869
        781F3E4D2ED134F83A1D094515DC433F2FFED9D726D9936CC9B665DB32ED9976
        CCBB665DB32ED99768CBB6535D15723C89D2082BA2DD7AEB5B69CB2E65D5173E
        4B98CB5A79EA33B33D667A8CD599B70CBB8CCBB866DC32D665ACCB5197707B95
        9937117EE32FDC16EEE216E56CBF70C95992B2FAC75564D5392B3F2D75FCABCE
        A2BAA8AB6B769DDA787A42FF00DB85A2BA6D7AC8D265B49FFE67FF0099141141
        5243E3AF6D569A74BE2964B2110B909B5A470F43F2CFED4D7B4DB3B4DB3B5DB3
        B5DB3B6DA3B5DA3B5DA3B4DB3B4DB3B5DB3B5DA6769B653B14D1579F07467FEB
        1FF9E0686A4AA974BD7CB4B6A2D65B511516B21F22BDB55AB2B459598EB31D66
        2ACC7598EB315662ACC3598AB315661DC316E18B70C3B862ACC358B6AB42D8AD
        98370EDEB3B7ACEDEB3B7ACFCB4ADFCABAAF5559DDD6777B877551DD5477759D
        DD677551DDD4776CEED9DDB3BB6776D1B5BB4EED3CB84D554BA5F2AAA793D3C0
        79694D4E9134F482083F2EFED7D716E18F711656595965659596565B516D45AC
        B6A21EB45555156D6F53BAB9486935552E97CAAA9E479956EDA6746746747708
        CE8EE11DC23B847708EE11DC23B846793399D99DA33B29F51552D7A9677151DC
        5477159F969CFE55D6EA055D25D4A1574B528913489E0EBAF98940B99524D34E
        97CAAA9E198D6BA154AAA5D0FC07989C3D7F2CFED4E28E44B45CC9A855548BEB
        29DDDCA6ADADDA7769E5D54AA934D3E5554EB3025C1550AA5552E96886C86432
        190C86432190C86432190C86410C52886D4547E59FDA9AF6DB676DB676D41DB6
        D8FD2D076B4A7DAD27688ED51DA1DA33B36768D9DA5476959DA567695947A7DD
        A2A4E572EAA5549A69F2AAA639BD0E8743A72BC8A6AB44E4FCB9FB5F93D69254
        1723FF0053CC9549722D65AC8E7D74A6351CBAA88E4BAE9A4CB4196832ED9976
        CCBB666DB336D99B6CCDB665DB32ED9976CCBB665DB32ED99B6CCB414FA8A293
        F2DB557E56D6110884422110884744743A32085E16BA1549A8E2F2E1AA9E4554
        AA9574BA1A71E07F2C7ED3E57FE7C4D7426B869498FA70D54C721D29AAE87435
        D79F41F963F69EBDC6E9DC6E9DC6E9DC6E956FFA84775BE775BE777BE777BE77
        7BE775BE777BE777BE777BE777BE777BE777BE775BE775BE775BE775BE775BE7
        75BE775BE775EA0EEB7CEEB7CEEB7CEEB7CEEB7C5EAF7D35EA775AEE374EE378
        AB7B76A32EE19770CBB885BDB864ACCBB865DC9CDB866DC335666AC75D664DC3
        25664DC325664ACC95992B1D75B44924B2597171717125CCB99732491368FCB1
        FB4F915D30743A1D0E8283A1D0E9C6A0E8743A1D0E8743A1D0E840AA869CAD60
        853C8843A4B510422D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D1D2A6C45A7E59F
        DA9C9AA9D20823482082086432190C8E626D09CAD6190C864321EB0C8643D234
        EBE05B128D7F2CFED4D6592C965CD92D12CB99D4EA753A92C96896CEA753A9D4
        EA753A9D4EA753A9D4EA753A9D4EA753A89B2E67526A26A26A26A26A26A258DB
        2EA91351351351D4BAA2592C964B2592C964B2592C964B2592C964B2592C964B
        259F957F68F0CCF2DAF09E425CBF2F15F957F687F07E5CFF003F11F957F686AE
        9AA9F01E5CF6E08E7F992B9D452AD69AE47E55FDA1AD54D2A8C68C68C68C68C6
        8C68C68C68C68C68C68C68C68C68C68C68C68B2931A31A31A31A31A31A31A31A
        31A31A31A2C42DB48B116231A31A31A31A31A31A31A31A31A31A31A31A2C4588
        C68C6918D18D18D18D18D18D18D18D18D18D32C462DBA13A12A6AA29B31A31A3
        1A31A31A31A31A3F2B74FCA3AE6DC336E19B70CDB866DC336E19B70CDB866DC3
        36E19B70CDB866DC336E19B70CDB866DC1EF6E33A9D4EA753A9D4EA753A9D48F
        0E9F1F994BB6ADC54C34B70AADA697C8FCAFFB4B5CBB665DB32ED9976CCBB665
        DB32ED9976CCBB665DB32ED9976CCBB665DB32ED9976CCBB665DB32D065A0CBB
        68CB4196832D065A0CB4196832D0575D152F0F3C54ABAA75529B6A8753A19279
        F23F2BFED2D7DB364F6CD93DB364F6CD93DB364F6CD93DB364F6CD93DB364F6C
        D93DB364F6CD93DB364F6CD93DB364F6CD93DB364F6CD93DB364F6CD93DB364F
        6CDA17FF0037659ED9B27B66C9ED9B27B66C9EDBB33ED9B27B66C9ED9B27B66C
        9ED9B27B66C9ED9B27B66C9ED9B27B66C9ED9B27B66C9ED9B27B66C9ED9B27B6
        6C9ED9B27B66C9ED9B27B66C9ED9B27B66C9ED9B27B66C9ED9B27B6ECA3DB364
        F6CD917FF3B651EDBB285FFCEDA4DFFF003B62A6FF00F9FB551ED9B27B66C9ED
        9B27B66C9ED9B27B66C9ED9B27B66C9ED9B27B66C9F96E9547E56D7DC3D49EE1
        EA0F70F507B87A83DC3D41EE1EA0F70F507B87A83DC3D41EE1EA0F70F507B87A
        83DC3D41EE1EA0F70F507B87A83DC3D41EE1EA0F70F507B87A83DC3D41EE1EA0
        F70F507B87A93DC3D41EE1EA0F70F527B87A83DC3D41EE1EA0F70F507B87A83D
        C3D41EE1EA0F70F507B87A83DC3D41EE1EA0F70F507B87A83DC3D41EE1EA0F70
        F507B87A83DC3D41EE1EA0F70F507B87A83DC3D41EE1EA0F70F507B87A83DC3D
        41EE1EA0F70F507B87A93BCDF477BBF0FD7FA94DFF00F47D437EE1EA4F70F507
        B87A83DC3D41EE1EA0F70F507B87A83DC3D41EE1EA0F70F507B87A83F2CD4EBF
        CA9AAF2F0A84BA7418BC52126CA69BC854555D355D57FEB45553A9F33F2BFED2
        D57978544A85E6FC5A29BA6D8A632AA5BA4AA53E6FE57FDA5AAF2F0A96ADF8B5
        4BA8A3FF0054BFF52B74AAB9FF0095FF00696ABCBC225E3EB6E9537EDBAFFF00
        5F3D1AE77E57FDA5AAF2F05225E3188DBA555565735D54A75572B87CB99F95FF
        00696ABCBC5B5E0D8E84E9A55293A9535BA36E92AA9D4DBF05F95FF697855CCF
        2F0085D44E9DA6D50E86E855535BA572A793F95FF697F228A5C3AB6EAA9D714D
        1CDF2E47E57FDA5C1E5CEF33CBF804DAF029F17E57FDA5E07CFC27972DBF091C
        5F95FF00696ABCB99E7E1D3E437E2FF2BFED2D579707971F9F888FE03CB5FCAF
        FB4B586432190C86432189496B2D6410D90C86432190C86432190C86433C910C
        86432190C86432190C86432190432190C86410C86432190F586432190C864321
        90C86432190C86432190C86432196BD3F2BFED2D52850C86432190C87A742191
        D6190C86432190C86432190C8634E1AD2190C86432190C86432190C86432190C
        54B218D74B486432190C869690C86432190C86432190C86432190C86432190C8
        64321907E57FDA5C524EB56889249249249249249D6116AD6492492492492757
        E4C5AC93C16A21704924924924924924924924EB5797E58FDA7AC10410411A42
        3A1088208208208208208208442211088208208208208208204B582082082082
        082082082082082082082082082082083A1F963F69F0F53A9D74E9AB6893A9D4
        EA753A9D4EA753A9D4EA753A9D4EA753A9D4EA753A9D4EA753A9223A9D7593A9
        D4EA753A9D4EA753A9D4EA753A9D4EA753A9D4EA753A9D4EA753AEBD4FCB1FB4
        F5B692CA4B692DA4B292CA4B292CA4B292CA4B692CA4B692DA4B692DA4B692DA
        4B692DA4B692DA4B692DA4B692DA4B692DA4B692DA4B692DA4B692DA4B692DA4
        B292CA4B692DA4B292CA4B292DA4B692DA4B692DA4B692DA4B692DA4B692DA4B
        692DA4B692DA4B692DA4B692DA4B692DA4B692DA4B692CA4B292CA4B693F2CFE
        D4D7B4DD3B4DD3B4DD3B5DD6FB4DD3B4DD3B4DD3B4DD3B4DD3B4DD3B4DD3B4DD
        3B5DD3B5DD3B4DD3B4DD3B4DD3B4DD3B4DD3B4DD3B4DD3B4DD3B4DD3B4DD3B4D
        D3B4DD3B4DD3B4DD3B4DD3B4DD3B4DD3B4DD3B4DD3B4DD1FA5DD42F49BA769BA
        769BA769BA769BA769BA769BA769BA769BA3F4BBC8ED774ED374ED374ED374ED
        374ED374ED374ED374ED374ED374ED374ED374ED374ED374ED374ED374ED374E
        D374ED374ED374ED374ED775BED374ED374ED374ED374FCB69D3F95B87CF993E
        0DB12E6273E0FCF8BF2F7ED9E0F3E77978094F44B9D3E07CF8FF002F7ED9D73D
        4CCF519EA33D467A8CF519EA33D467A8CF519EA16E56D64ACC95992B32565D5A
        3256CDEF515D2FB9DF3B9DF3B9DF3B9DF3B9DF3B9DF3B9DF3B9DF3B9DF28AF76
        D75D62AEA9756E4D5BB5A59B74CDBA66DD16EEEB6AADC8BEB2FACBEB2FACBEB2
        FACBEB1555CA4D2E182190C8643208208219044904104104107E5EFDB3CDA299
        E3DDAD514A7C9D9DB244FA4B6E5524BA9C6B4531C9DBA5AF03E7C9FCBFFB6799
        4D373885C3554A8A6AA9D4DA4CEAB8F6B6EFA9B4855175A5D45255537A492505
        E8B8BA04E74944A2514529B9F01E7CAFCBFF00B6796BABA55AB86616EEE64AB5
        8684E7828A1D55529509B85FE92A995391EB4A92235EAC4A07D4B58E0A55CD28
        F01E7CBFCBFF00B67974530B8B7F72789A139D14B746DA49BA5910A545754127
        9E8BA94A54AD3FF610DCEAA9753A6954AE04A1786FCBFF00B6795453C4D49BBB
        962E4ECED5ABA1524C86371C34D31AA50529A553829F243706DD16AE05C89F01
        F97FF6CF268A65F16E56A8A5B753E263A5D251B499E74FF9122552A67829479E
        ABA8DC27D47D046DD13C2972FA73BF2FFED9E4252D285C5B946ED6F06E98374C
        1BA60DD306E98374C3B861DD28F4ED35FF00E638436989153B9EB4AB9FFE745D
        5F449B6DDC5C50AE7D2383CBC4FE5FFDB3C8A69B57167A13EE283B8A0EE283B8
        A0EE283B8A0EE2817A8A1B55A9FF00D1BA9968FCABAA47AA4D9D16886E44A16A
        94B4952BC77E5FFDB3C7453C7BFB9690753A9D4EA75204AA652AA54EC6DD83AA
        1A527FE6A7034E539D6951ADC52B868A6D5E0BCB9BF97FF6CF1514CF1CA4743A
        1D0E8742693A17286E1A6EDAAA70948941368DB91A913295AD4534CF0EDD3E1B
        CF97F97FF6CF0D2AE710B86AA9534D753AEAE1A1D25915BAA69DAA3236C5FF00
        B1E6FAC373C14D2AA7D56A93AB868A6E7FC0FE5EFDB3C094BA69B571574535AC
        1B660DB30ED9876CC3B661DB16CED42DBA1BC7B4C487353A85E75552F54A5AE8
        79BEA85D44A16B4AB9A50BF81FCBDFB6759828A61716EEF34F2EE19B70CDB866
        DC336E19B70CDB82DDA9A5BB5D250AA54D5569E656E13D521285A2702A44F5F3
        74D36AF15E5C8FCBDFB675A29970D09A7C355D6F6F59DBD676F59DBD676F59DB
        D676F58BD3D6CEDAB36B66C6DC24A74A9C2E0A547052B469325AD36E8B7F84FC
        BDFB6785A13D6BA96DD3DC1DC9DC9DC9DC9DC9DC23B893B946DEE641B84DF525
        24DCBD194A2754A5F06DD1E3E09E1FCBDFB6789A4C96B4DCBF72AC7598EB31EE
        18F70C7B8595A31D6CB2B29DAAAA74D34D29BBB4892A72DEB4A9138D111D5285
        AD14BA9F911CA8F0DE5C1F97BF6CF21EE514BCDB666DB336D99B6CCDB666DB32
        EDB79B6C5B9B6D95329F22A7C090946AAA84970436E9A552B553FC04CE9F97BF
        6CF1EF6E5886BAA724104C289724B3676ED553856A3C90A9A5914914908A36A9
        4ACA0B281D14229A292DA4B282DA4B691534AE2EABF81FCBDFB678B73716DD2D
        B6F5871E4253AECEDDC3690BABE1B8DBA38129E6DC8552D174F1BF97BF6CF157
        46ED7560DC305660DC16C6E2787725EC6E3305660ACA7D3D6EA4924DDCF86A36
        E9B9EBE6251CDA20ABC723F2F7ED9E4CB9820885AD5571212BDA492D2509473A
        110BC7FE5EFDB3C899128D5A925AD2A709A8E248A29B56B4AE637FC079EBF97B
        F6CEBF319F319F319F318FF3149F319F319F319F319F319F319F31437F9824F9
        80F980F980F980F980F980A7F312A5FCCC7CCC7CCC2FCCB07CCE7CCE7CCE7CCE
        7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE
        7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE
        7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CD07CCE7CD07E4AF5BEE5F91BFA57DE
        FF00F67FD2BEF7FF00B3FE95F7BFFD9FF4AFBDFF00ECFF00A57DEFFF0067AFFF
        DA0008010202063F0043B22D916C8B645B22D916C8B645B22D916C8B645B7C27
        84F09E13C2784924924924924924924924924924924924924924924924924924
        92492492492492492492493C2784F09E12492493C2784F09E13C278493C27855
        DFF8C8BAE1B88BAE1B88BAE1B88BAE1B88BAE1B88BAE1B88BAE1B88BAE1B88BA
        E1B88BAE1B88BAE1B88BAE1B88BAE1B88BAE1B88BAE1B88BAE1B88BAE1B88BAE
        1B88BAE1B88BAE19175C322EB8645D70DC45D70C8BAE19175C322EB86E22EB86
        45D70C8BAE19175C322EB8645D70C8BAE19175C322EB8645D70C8BAE19175C32
        2EB8645D70DC45D70C8BAE19175C322EB8645D70C8BAE19175C322EB8645D70C
        8BAE19175C322EB8645D70C8BAE19175C322EB8645D70C8BAE19175C322EB864
        5D70DC45D70DC45D70DC45D70DC45D70DC45D70DC45D70DC45D70DC45D70DC45
        D70DC45D70DC45D70DC45D70DC45D70DC45D70DC45D70DC45D70DC45D70DC45D
        70DC45D70DC45D70DC45D70DC45D70DC45D70DC45D70DCF84924924924924924
        9249249249249EB47AD1EB47AD1EB47AD1EB47AD1EB47AD1EB47AD1EB47AD1EB
        47AD1EB47AD1EB47AD1EB47AD1EB47AD1EB47AD1EB47AD1EB47AD1EB47AD1EB4
        7AD1EB47AD1EB47AD1EB47AD1EB47AD1EB47AD1EB47AD1EB47AD1EB47AD1EB47
        AD156FE3322D916C8B645B22DBE1FFDA0008010302063F00FD03A08208208208
        1D16E8B745BA2DD16E8B745BA2DD16E8B745BA2DD16E8B745BA2DD16E8B745BF
        D2C7FA58E8B7FF0073DFF627745BA2DD16E8B745BA2DD16E8B745BA2DD16E8B7
        45BA2DD16E8B745BA2DD16E8B745BA2DD16E8B7FCC8208208208208208208208
        208208208208208208208208208208208208208208208208FAF9FFDA00080101
        01063F00FC0FFCBBEA9DBFF77CE7E0BFE5DF54EDFF00BBE73F05FF002EFAA76F
        FDDF39F82FF977D53B7FEEF9CFC17FCBBEA9DBFF0077CE7E0BFE5DF54EDFFBBE
        73F05FF2EFAA76FF00DDF39F82FF00977D53B7FEEF9CFC17FCBBEA9DBFF77CE7
        E0BFE5DF54EDFF00BBE73F05FF002EFAA76FFDDF39F82FF977D53B7FEEF9CFC1
        7FCBBEA9DBFF0077CE607C9769ED7D2AF92ED3DAFA55F25DA7B5F4ABE4BB4F6B
        E957C9769ED7D2A8FF00F0D27FD476AE957C9B68ED5D2AF936D1DABA55F26DA3
        B574ABE4DB476AE957C9B68ED5D2AF936D1DABA5501DCDB476AE957C9B68ED5D
        2AF936D1DABA55F26DA3B574ABE4DB476AE957C9B68ED5D2AF936D1DABA55F26
        DA3B574ABE4DB476AE957C9B68ED5D2AF936D1DABA55F26DA3B574ABE4DB476A
        E957C9B68ED5D2AF936D1DABA55F26DA3B574ABE4DB476AE957C9B68ED5D2AF9
        36D1DABA55F26DA3B574ABE4DB476AE957C9B68ED7D2AF936D1DAFA55F26DA3B
        5F4ABE4DB476BE957C9B68ED7D2AF93ED1DABA55F27DA3B574ABE4DB476BE957
        C9B68ED7D2AF936D1DAFA55F26DA3B5F4ABE4CF37FB8ED5D2AF936D1DAFA55F2
        6DA3B5F4ABE4DB476BE957C9B68ED7D2AF936D1DAFA55F26DA3B574ABE4DB476
        BE957C9B68ED7D2AF936D1DAFA55F27DA3B574ABE4DB476AE957C9B68ED5D2AF
        936D1DABA55F26DA7B574ABE4DB4F6AE957C9F68ED5D2AF936D1DABA552F7347
        37FB8ED7D2A88EE593FEA7B5F4ABE4BB4F6BE957C9769ED7D2AF92ED3DAFA55F
        25DA7B5F4ABE4BB4F6BE957C9769ED7D2AF92ED3DAFA55EA4763ECD63FB7D9BB
        277F77C766ECFCDC49E2D8E6FBC39EB36446D124C009F13C2A22E9AB064A7064
        7DC64C993264C993264C993264C993264C9934A993264C99328D231122BA6857
        4A65755DE04DC09AB09AB09AB4CA462F2E23D50FB8BBEFC4B9EC57B6651174F0
        EEF09C3887DF31DC88511EF18881BC2BDD74E9D3A714A70AF0A55E14ABC29510
        6385EA87DC5DF7E25CF62E0E0B8460C5BFC654464C4C43EFB8851A779E69C288
        310707D50FB8BBEFC4B9EC57E5B902C8CB1067C5443EF3E0C444288F78C44844
        9314E1384E2B4E9D3A74E9EA57AA57A42E307D50FB8BBEFC4B9EC5709DD8382A
        07DD8A887DE3F962A2149EF18608994A6072417F9A74F527A93D49D39A13A74E
        9D444BBBEA87DC5DF7E25CF63A07DC542D7B88C5443E3F34C30A4A30A214463D
        9327DC88972833A88DCF543EE2EFBF12E7B11C3864169910E3F2CD8A8879F1B1
        3EE189817C19144622209CE1394E5394E53953A9D4E9A59C9299446E7AA1F717
        7DF8973DBC20694431134D8A887C5C4FB862FF003C188F785118711EF0AED6AE
        D6AED6AED6AED6AED6A4B3416577DF14D5A6AD3569AB5EA81CBFC8BBECFF00E4
        B9EDE390CC510642A071310F9313C031B2518311EF5263201E73930FD4FF00B8
        7BEBC4B9EC0931D9E6502B362621E7C18292CC00DEB11EF0A230E51113C5022C
        829930F6ABA15D0AE8574264C997AA1F7177DF8973D812103DCAF0A028192D87
        18DCE18A815251898879C6E694496120032A801C522E90A36ADC26E2AC91961B
        C65A70223DE14461E5138524A32E27D50FB8BBEFC4B9EC216818112C540C96C5
        E18D887DCCF9567C4443CE14C6D8108146C992704E5512624301BD3F2C08D214
        66C2CCA1C99C28C6319F11EA87DC5DF7E25CF618B564C0862B25A0E31B117B87
        765A7762A753EE09224CBEE46D59FD3684A649913C5FD464CDBDA33E07085113
        E0C9B9032D9C47AA1F7177DF8973D8816AC9811282B25B17ACE3621F26090866
        960A366102EBF49973A02D484480E5500231739936F8969DDFC9472EE66DDC9B
        902DC187EA87DC5DF7E25CF6245AB260431592D8BD671A4D912CE32E0C6640D9
        311389D3FE92C5432E697718289C53A7C738578529C6795478C21ED0AF0A42BE
        290AF8A55F14ABE15F15A85AB724C6557EA3A15EA8ABC682B8B62D7EA78110DC
        F543EE2EFBF12E7B142D5930227592D0BD671BC61EF1F9EE4B27B5466C884265
        122400840549EB57AB57AB4F5A925CC7111B260722BD50578ABC55E2AF157AB0
        AF1A55F34957CD253D69CD29CD2A7A7720A597D8A2E3D9B92290EEBA7C204181
        1282140C9CE07197D8BD50FB8BBEFC4B9EC58B564C08C8B25B17ACE3499A70A5
        888B45716D52A318E50818C416CDB8705B111B3219F3AC89D3A74E9D3A74F820
        CCB4414232AD3BB2628106044A17A9B68BDAFE43DF44FBFBCB9EC60B564C0851
        6B42F59C6F185AF6013220DE124306299326DC88F7E2222F6E384E138AD5EE15
        7856AF0AD5E57EA57AA0AF2BCAF2BCAF2BC6A4E6A4E6A4E5441268D09CD2A7A5
        4F4A634A63494C692A16ACCB34A55CACAD5D76B4AF53C0900FE45DF600FF00EC
        B9EC0D595AB2AE1A95CE0573815CE05AB2AE15AB35216ACD92086281B567896A
        718A2770C99A289174BFB7773706E413EE3A994CB2E61BCB36273288C3817E14
        CBD50FB8BBEFC4B9EC0BD6691A15EB348D0AF59A46857ECD2342BF6691A15FB3
        48D0AF8A46857C5216B05216B054AF887B57E9B42D7B311C2570A9043732E651
        0DBBF96E8814E53A74F89307CEA0408870629856AE84C1327142F82CDEC4F527
        15274FC09EA57B814B6B815EF7ABC55E2AF957CD2AF9A55F349578D255E34957
        8D255E34952DB3495EA61CBFC83BE7C4B9EC78B564C0851125A17ACE070284E8
        C0640B3B152339F6E040CEEB28DDFCD4AA50997F9AFF0035352A6A5441F76232
        10C542D4D361BA74E9F787A99F7077CF88F3D80F6A9F827B54FC139A7E09CD3F
        04E691A15E348D0AF1A4684E691A139A468578FF008F7292D1AB427348D085AB
        36AD023D943604B2059D3BCAA4F60C294485669B099315F04C684C98E233862A
        E9F72BA55D2AEABAAE702B9C0AEF026E04C9B81370261526AD3569AB4C01F6A6
        14A614A04112E7F827149D09C57A138AF42BC2B57856BD4D05C7F21EFA1FF92E
        7B02E598E68ABA15C14957056AE057456AE8A4AB82B5705255CACAB9595AB14A
        D58A55CAD444845EB266DCCE26513898162B80E049461C47BC62BF2C7CBB99A7
        0A49F07D4FFB87BEBC4B9EC0D59A0AB87DB0570D0AE1A15C341570D055D34157
        4D0AE9A131A15D3426DD16ACC84288908BD64CD8C81503EEC5923DF888D08836
        7815D2AE9A95D5755D5755D5755D5755D5755D576B576B5764C9157692AE884F
        2ABA295745255D0AE8A4AF534973FC87BE89FF00B973D81785215E1EF2149681
        192215E1484F595785255E09EB4C9D356A6DC65003DA5087BF1B03EE2A069C5C
        47BC6144FB86E40D2A07FCF78E7C8B3607A99F7077CF88F3D8F73494E69578D2
        A4B4692AF9A4A1685A324C4A8871786320540B8C5C47BC6044FB86040FB8A81F
        7109AADC64C993549AA4D526A93549AA4C993264C684D5263051164D098D057A
        99F7077CF88F3D80E69F82E552342BC6AD0AF1A94968D4A5B66196015F3405AC
        3405ACABE2AFFF00C3F157E3EC1F157EA5273926581525B10F6157856AF057C2
        16ACDBB31F7CAA579E18C95D40BE2E23DE3733E29B1F9A70A2258AF53BEE1EFA
        F12E7B159464C8A224381FE9E150C0931F90CCA070A5A7078C3DE3132986457B
        855EE157AA2AF5455EA8ABD5157AA2AF5455EA8ABD5157AA2AF5455EA8ABD515
        7AA2AF54548639A055E927102BD4E218FF0021EFA23FEE5CF603264C993264CB
        228C37088489B7AE433152E2E21A718881956505AD268EF1F52FEE0EF9F11E7B
        FA2C43E14AA419B0623DE311033ACA32EF02BD4BFB83BE7C479EC0BE6A57CD4A
        F9A95F35288E70C3248B58681A16B4D4B5A680B59C0B5A680B5A680B58680B58
        680B58680B5A680B5A680B58680B5A681A16B4D0342D69A0685AD340D0B5A681
        A16B8D0342D71A0685AE340D0B5A681A16B4D0342D69A0685AD340D0B5A681A1
        4BCE139A4D0A22D9A95F352BE6A51E3CAAF9A16B0D014B6CD4AF1A95F352BE6A
        D0AF157D5F578ABC5445AA60AF702BD5057B815FE057B815EE057F8140DA8839
        60BE014D40535015D142BB52715A715A715A715A6180C134BB9EA5FDC1DF3E23
        CF626207B77D669C288C18D18B65F14E5394E5394E5394E9D394E5394E5394E5
        394E5394E5403EE395EA5FDC1DF3E23CF62A207BB072E29B17C2A2378326DE30
        0FC181EA67DC1DF3E23CF60394E5395089AD39A4A729CD69CD2539A4A73494E6
        929CD25484FB22539A4A73494E6929CD2539A4A73494E6929CD2539A4A73494E
        6929CD2539A4A73494E6929CD2539A4A73494E6929CD2539A4A735A73494E692
        9CD2539A4A73494E6929CD2539A4A73494E7DB129CD2539A4A73494E6929CD29
        CA729CA729CA729CA729CA729CA729CA729CA729CA729CA729CAF523EBFDF1E2
        3CF61494E2E21D427DE912F8BCDBEBD48FAFF7C788F3DBCE5A77944BE373EF29
        29C3F523EBFDF1E23CF604A200FB28DE19B7844BEF08638DB364DA31E28B2265
        2D9364168E23D48FAFF7C788F3D806CF1CDB2658E44E5394E5394E5394E5394E
        5394E5394E5394E5394E5394E5394E5394E5394E5394E5394E5394E5394E5394
        E5394E5394E5394E5394E5394E5394E5394E5394E5394E5394E5394E5394E7DC
        9D016BF5DA7CC171F9B240325AB2608D936F8E498C42729CA729CA729CA72BD4
        9193BFFBE3C479EC0BD57C15EABE0AF55F057AAF82BD57C15EABE0AF55F057AA
        F82BD57C15EABE0AF55F057AAF82BD57C15EABE0AF55F057AAF82BD57C140DA7
        9186320B3EF4FCB120E440D91FA4F2865408B50B4C415C4B262498DA2313EA57
        D7FBE7C479EC0D48A56A452B52295A914AD48A56A452B52295A914AD48A56A45
        2B52295A914AD48A56A452B52295A914AD48A56A452B53656A42D48A56A6CAD4
        D95A9B2B53656A6CAD4D95A9B2A1679B160BC41DEF9F0C5968BA80B008139518
        46C5B11E2A02C8694938AF52BEBFDF3E23CF606B2D55A16B2D55A16B2D55A16B
        2D55A16B2D55A16B2D55A16B2D55A16B2D55A16B2D55A16B2D55A16B2D55A16B
        2D55A16B2D55A16B2D55A16B2D55A16B2D55A16B2D55A16B2D55A16B2D55A16B
        2D55A16B2D55A15FB5568527396AAD0B596AAD0B596AAD0B596AAD0B596AAD0A
        1C7B55685ACB55685ACB55685ACB55685ACB55685ACB55685ACB55685ACB5568
        5ACB55685ACB55685ACB55685ACB55685ACB55685ACB55685ACB55685ACB5568
        5ACB55685ACB55685ACB55685ACB55685ACB55685ACB55685ACB55685ACB5568
        5ACB55685ACB55685ACB50CB2685ACB55685ACB55685036AD1E3491934231B76
        B336842D59E72D187B3428FF0076D08CB09342BF6801206D0B596AAD0B596AAD
        0B596AAD0B596AAD0B596AAD0B596AAD0B596AAD0B596AAD0B596AAD0B596AAD
        0BD4DB025163F90F7D5904E6EF2E78603D9FFDBF15C9A172685C9A172685C9A1
        72685C9A172685C9A172685C9A172685C9A172685C9A172685C9A172685C9A17
        2685C9A147F4FB609ECD0B9342E4D09ECD1F15C9A172685C9A172685C9A17268
        5C9A172685C9A172685C9A172685C9A172685C9A172685C9A172685C9A172685
        C9A172685C9A172685C9A172685C9A172685C995A4F8A85BB7641C90F8A81366
        5BB6A1270A20F141F67C57244D20F8AE4D0B9342E4D0B9342E4D0B9342E4D0B9
        342E4D0B9342E4D0BD4CB65ED7F20EF9B46194F78F3C77D839660A45ECDF9002
        2720444605C2B11319CC26448110588566C9BD1E3289F6637D4AFAFF007CF88F
        3DBEC08B4C9F811DF9FA5F32E358278C24B40BE791445F0E32AFEDDA3026E913
        2209899F1DEA57D7FBE7C479EFEB1FA447D8AD59278969C13911B766D71BFF00
        5E751B25E592482FCF1FEA57D7FBE7C479EDFDF96FAB366CC8211F6A26D4A6C9
        90D0B8A2CF162F0C0FCF1BEA57D7FBE7C479EDEF26FF009584A46552002CE4CC
        8036636611080038A04C30B3633D4AFAFF007CF88F3DBDA4C5CB4EF3E358960E
        11B76844300AC9E2C0112819D0B529B2E0289C4442CF8AF52BEBFDF3E23CF6F5
        863728DE200F628131B53C194230B36A5198A36A3C6B4D640951044419B159D4
        B89F52BEBFDF3E23CF607E7BC3F3C7C42CF8F0724AB8D64C41962ACD88C4DE30
        FF0019F1D9B11EA57D7FBE7C479EC00B28C7426CBBC73A81C7C86148DE1F961F
        A95F5FEF9F11E7B0A459F179BFAA4B83EA57D7FBE7C479EC3CFF00D03F2FE81F
        9E07A95F5FEF9F11E7B139BFA367DF9EA57D7FBE7C479EC01229D4EA753A9D49
        46E3264EB329D4EA753A9D4EA753A9D4EA7C09D4EA753A9D4EA753A9D4EA74CB
        F353A9D4E9A54CA753A9D4FBB3A9D4EA753A9D4EA753A9D4EA753A9D4EA753A9
        D4E9B73D49FAFF007CF88F3D82E9D3A74E9D64F6A7F7C24518C7D8A51009D3A7
        4E9D3A74E9D3A7463BAE9D3A74E9D3A74E9D3A74E9D343DA9A3EC2A01674E9D3
        A7453EE3A74E9D3A74E9D3A74E9D3A74E9D3A74E9D44C9ED5EA57D7FBE7C479E
        C264C9936E0932AE04646907B13264C993264C993264C9B75B7193264C993264
        C993264C8C8994A37193264DBAC9B7593264C993264C993264C993264C993212
        457A95F7077CF88F3D8A852B2A6E14DFD7732F52FEE0EF9F11E7B0993265C384
        C993264C993264C993264C993264C993264C993264DBAC9B77F24C993264C993
        264C993264C993264C993264C993264CBF352265EA5FDC1DF3E23CF603264C99
        3264C993264DB8C993264C993264C993264C993264C993264C993264C993264C
        993264C993264C993264C993264C993264C993264C993264C9932F52FEE0EF9F
        11E7B026A54D4A9A952421398A9A95352A6A54D4A9A95352A6A54D4A9BD91534
        72454D4A9A95352A6A54D4A9A95352A6A54D4A9A95352A6A54D4A9A95352A6A5
        4D4A9A95352A6A54D198454B0A54D4A9A95352A6A54D4A9A95352A6A530232C5
        4D4A9A95352A6A54D4A9A95352A6A54D4A9A95352A6A54D4A9A95352A6A54D4A
        9A95352A6A54D4A92109CC54D4A9A95352A6A57A9B64BD9FE43DF40FBBBCB9EC
        2CD8C817DE79E618C928526F3FCF0BD50FB8BBEFC4B9EC1CD8ECD977848B2ACF
        39DFF9B2E1FAA1F7177DF8973D819BDD2E2B4C1024C233489F813F027E04FC0A
        4B5EE91486A0B8B66D40B93250B59559D0B59559D0B59559D0B59559D0B59559
        D0B59559D0B59559D0B59559D0A4B64FBACE85FAED46D3969332BD5043F5C685
        188C83FC414232FB95FA82BD5057AA0AF4A732BFEF82BD52BD52BD52BD52BD52
        BD52BD5290C72040131339DE39B11EA87DC5DF7E25CF63A25B0E4BE58FF8994B
        29329267C48B644BC9078533CA11B508C240142D07C88931244408224CF294FB
        B12F89897C9BC73627D50FB8BBEFC4B9EC6C29524984496E146D196356652A95
        B2E1C4DD0F09CE45087B00950B328394A811ED2A23F5648CCA2536EC48902629
        8A651DC74E9D44B0619D3EF0CD9315EA87DC5DF7E25CF6320A184F084E57FA45
        D1F9E048D93078B4E619D7143597421213292AD03C9962B3B44A8061819A7500
        D3EE90A01664CB2414260E5406FBF543EE2EFBF12E7B1919CE19B0185E861443
        AC877042532421957FA8DF8284200480850238D6728500200B99D407BF0009CA
        03766DC86E800C62A14EF0E0C67AA1F7177DF8973D8B89F761C05E2D986559E7
        C4F1EDCF25913A301FAB215C60D3ACC5C059CB60E7321C095D403E044DE356F0
        97DD8DF543EE2EFBF12E7B159861C4CA580CE89B4E5F10232878665C72C20409
        A2A13D998A249CC0297DA724513919470227DD811994548A40A2D95718B4C378
        7B31DEA87DC5DF7E25CF62A187187E96128902BB58576B0AED615DAC2BB58574
        5215D1484CEC22142D8005A9220C501C960A22D7B02043990852ACD930333AFD
        3BB184AB32804C997FA44CB363E18FF543EE2EFBF12E7B139CB9C3225C910245
        CAA172A85CAA172A85CAA172A853D0A001A159803688C8254D18CE8D978314E8
        162A01B2E0410130DD0A18100A01863736F2F543EE2EFBF12E7B1119CB61F12C
        DE37889826C39013056E485A9BD881E517CDED46072A82B2A1397510F9167C9B
        BC270225F07FD45CEF3CD971BEA87DC5DF7E25CF61C4B09F2E1BD2AF702BDC0A
        F702BDC0AF702BC2A57B8165E042C83002599120CA18A7847DCA44E892E5673B
        990E5502EA27DD8119B078C5E6FE83EA87DC5DF7E25CF61429425801844960B8
        D6A8C8371AA4D526A935488B424B53C2A42C9110FED0ADE41201EF405B120941
        CA14210166580A944EE44991669B02244814B28CB888961FD0BD50FB8BBEFC4B
        9EC186550A4E18E333C2298D2531A4A63494C69298D2531A4A89B318C8012540
        D9842510251FD0EE25752084180FF0EA561221B900C1F024F794042033EE4436
        4522860001A7391406F981C4FAA1F7177DF8973D819B2A8CE70F8B61C5E2AFD4
        AF1A95E352BC6A578D4AF1A95E352E2DAB7C522506447F5F1ED1900004E871CF
        1AD3C7F2500FBB00FC1819CA8527022C540C8774012C54279CFF0043F543EE2E
        FBF12E7B038C42886C8A4C13C572CAF034ABC2B57856AF0AD5E15ABC2B57856A
        22D0AD5E15AE35A2090D059F7419E618312FC18113B92A816CBB91378EFD9164
        C2F543EE2EFBF12E7B0A2242A0643BA6D1F70CEAE1A55CAD5CAD5CAD5CAD5CAD
        5DFF00895C30F6AB869448B3002494CEA2819B70C583295E6C0896189E338174
        6FFF00CD4B83EA87DC5DF7E25CF61CAA05B2EE4788602402069574D6AE9A0E95
        74D074ABA683A55D341D2AE9F7C5478861EC2AEDAAF4A8104672182003090291
        84FBB09860669D4BBB050C0CC2F1500A224389CF9167CBBEBD50FB8BBEFC4B9E
        C4DF1908C8AF857C2BE15F0AF857C289B608982BE1002D024B01B901BBC5133E
        0003D880CB812E040280A7025A77FC8BF2DCF543EE2EFBF12E7B11C5B378CF90
        6E443E04AA27DC3778D6AF160660B3E032FF0035FE6A0044A96CCA55DA95C575
        44D90322BA15D0AE857429043D985946FF00C9B9EA87DC5DF7E25CF61C4CA587
        B51265267DD90473ACF914A20A27DDBBC7224174652A25470A5A571AD0979230
        3364C6C92FB164390EFED0BD50FB8BBEFC4B9EC38F1601808891356135615DAC
        23256137BA210FD3ED64D584D585FAA41398CA800C0420B365C2072A89BB6702
        0A18DE159346FF00F543EE2EFBF12E7B1500C1CA787B13A94C7DB8107C3007BC
        A80DE1F96E326DFB22C8BD50FB8BBEFC4B9EC4C034E54376054B28CBB99F0C00
        224ACA673811A3199E61839F7F7AA1F7177DF8973D81E5CDB3A85E5CDB3A85E5
        CDB3A85E5CDB3A85E5DF6FFCDF50BCB9B6750BCB9B6750BCB9B6750BCB9B6750
        BCB9B6750BCB9B6750A4FE3B0193FDDF52BCBBB5F52BCBDB5F52BCBBB5F52BCB
        BB5F52BCBBB5F52BCBBB5F52BCBBB5F52A3FFE72266FF9CEA1796F6CEA1796F6
        CEA1796F6CEA1796E4FF00ACEA1796F6CEA1796F6CEA1796F6CEA1796F6CEA17
        96F6CEA1796F6CEA1796F6CEA1796F6CEA1796F6CEA1796F6CEA1796F6CEA179
        6F6CEA1796E5CBFEF3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A
        85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A8
        5E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85
        E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E
        5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5
        ADB3A85FCFFBC7FB5FD9FF007FDF7DEBDB7FB3C6E3713FBBDBF9DE738B1808C2
        2F0FC17FCBBEA9DBFF0077CE7E0BFE5DF54EDFFBBE73F05FF2EFAA76FF00DDF3
        9F82FF00977D53B7FEEF9CFC17FCBBEA9DBFF77CE607FFD9}
      Frame.Typ = []
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 49.133890000000000000
        Top = 525.354670000000000000
        Width = 740.409927000000000000
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 177.637910000000000000
          Top = 22.677180000000000000
          Width = 328.819110000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Desenvolvido por Bruno dos Santos - (21) 97021-7483')
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 593.386210000000000000
          Top = 26.456710000000000000
          Width = 98.267780000000000000
          Height = 22.677180000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'P'#225'gina: [Page]')
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 151.181200000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 26.456710000000000000
          Width = 332.598640000000000000
          Height = 49.133890000000000000
          Frame.Typ = []
          Picture.Data = {
            0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000011200
            0000170806000000C78DC024000001266943435041646F626520524742202831
            39393829000028CF636060327074717265126060C8CD2B290A72775288888C52
            603FCFC0C6C0CC000689C9C5058E01013E20765E7E5E2A0306F8768D8111445F
            D60599C5401AE04A2E282A01D27F80D82825B538998181D100C8CE2E2F29008A
            33CE01B24592B2C1EC0D207651489033907D04C8E64B87B0AF80D84910F61310
            BB08E80920FB0B487D3A98CDC4013607C29601B14B522B40F63238E717541665
            A6679428185A5A5A2A38A6E427A52A04571697A4E6162B78E625E71715E41725
            96A4A600D542DC0706821085A010D3006AB4D064A03200C50384F539101CBE8C
            6267106208905C5A54066532321913E623CC9823C1C0E0BF948181E50F42CCA4
            978161810E0303FF5484989A210383803E03C3BE3900C0C64FFD193A365C0000
            00097048597300000B1300000B1301009A9C18000006C969545874584D4C3A63
            6F6D2E61646F62652E786D7000000000003C3F787061636B657420626567696E
            3D22EFBBBF222069643D2257354D304D7043656869487A7265537A4E54637A6B
            633964223F3E203C783A786D706D65746120786D6C6E733A783D2261646F6265
            3A6E733A6D6574612F2220783A786D70746B3D2241646F626520584D5020436F
            726520352E362D633134352037392E3136333439392C20323031382F30382F31
            332D31363A34303A32322020202020202020223E203C7264663A52444620786D
            6C6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F
            30322F32322D7264662D73796E7461782D6E7323223E203C7264663A44657363
            72697074696F6E207264663A61626F75743D222220786D6C6E733A786D703D22
            687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F2220786D
            6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F78
            61702F312E302F6D6D2F2220786D6C6E733A73744576743D22687474703A2F2F
            6E732E61646F62652E636F6D2F7861702F312E302F73547970652F5265736F75
            7263654576656E74232220786D6C6E733A70686F746F73686F703D2268747470
            3A2F2F6E732E61646F62652E636F6D2F70686F746F73686F702F312E302F2220
            786D6C6E733A64633D22687474703A2F2F7075726C2E6F72672F64632F656C65
            6D656E74732F312E312F2220786D703A43726561746F72546F6F6C3D2241646F
            62652050686F746F73686F702043432032303139202857696E646F7773292220
            786D703A437265617465446174653D22323032302D30372D30365432333A3334
            3A33382D30333A30302220786D703A4D65746164617461446174653D22323032
            302D30372D30365432333A33363A30312D30333A30302220786D703A4D6F6469
            6679446174653D22323032302D30372D30365432333A33363A30312D30333A30
            302220786D704D4D3A496E7374616E636549443D22786D702E6969643A306666
            37383631612D316465612D323734662D383439632D6536313961303761633065
            642220786D704D4D3A446F63756D656E7449443D2261646F62653A646F636964
            3A70686F746F73686F703A39383735313939622D333533362D646634372D3834
            34632D3236623165613138376434622220786D704D4D3A4F726967696E616C44
            6F63756D656E7449443D22786D702E6469643A64343838323733382D64383938
            2D653434662D623635332D643738336564373861353064222070686F746F7368
            6F703A436F6C6F724D6F64653D2233222070686F746F73686F703A4943435072
            6F66696C653D2241646F62652052474220283139393829222064633A666F726D
            61743D22696D6167652F706E67223E203C786D704D4D3A486973746F72793E20
            3C7264663A5365713E203C7264663A6C692073744576743A616374696F6E3D22
            63726561746564222073744576743A696E7374616E636549443D22786D702E69
            69643A64343838323733382D643839382D653434662D623635332D6437383365
            64373861353064222073744576743A7768656E3D22323032302D30372D303654
            32333A33343A33382D30333A3030222073744576743A736F6674776172654167
            656E743D2241646F62652050686F746F73686F70204343203230313920285769
            6E646F777329222F3E203C7264663A6C692073744576743A616374696F6E3D22
            7361766564222073744576743A696E7374616E636549443D22786D702E696964
            3A38336438623264642D313861632D336634312D623435652D65666431306137
            3061323934222073744576743A7768656E3D22323032302D30372D3036543233
            3A33343A33382D30333A3030222073744576743A736F6674776172654167656E
            743D2241646F62652050686F746F73686F702043432032303139202857696E64
            6F777329222073744576743A6368616E6765643D222F222F3E203C7264663A6C
            692073744576743A616374696F6E3D227361766564222073744576743A696E73
            74616E636549443D22786D702E6969643A30666637383631612D316465612D32
            3734662D383439632D653631396130376163306564222073744576743A776865
            6E3D22323032302D30372D30365432333A33363A30312D30333A303022207374
            4576743A736F6674776172654167656E743D2241646F62652050686F746F7368
            6F702043432032303139202857696E646F777329222073744576743A6368616E
            6765643D222F222F3E203C2F7264663A5365713E203C2F786D704D4D3A486973
            746F72793E203C2F7264663A4465736372697074696F6E3E203C2F7264663A52
            44463E203C2F783A786D706D6574613E203C3F787061636B657420656E643D22
            72223F3E1B552C82000005644944415478DAED9B5F68544714C6276F42BB7DA8
            5831A5B1AD8981842579289816454B935AB1A089AD8A4411D95090A5B04D63A0
            124A597C8871BBA52CC5E222456310894904415B23BA2815C1878425FEA9D850
            4B28FAD087A601DFD299C05DEE9DCC9C3B67E6C698EDF9BD98DD9DD93933F3CD
            3733E7AE15B3B3B38C2008C2850A321282205C21232108C219321282209C2919
            C9F973E75AB195D7D6D6DE893734FC099591BF77C7CE9DC39836E4FAB158ECEF
            0FB76C2998968762F497352D17D67E18C5F1F1377E7BF0E09DA8C6035BDF168C
            3E743161FBFECBA54B1BA7A7A75FB56D0F3366726C61DA368D2D2C46536D61D7
            676565E5EFEFAE5F3F8EA9633A562A4A46B27AD932F4D1E4DB53A7DAA0867ECA
            E7135F27932730756454715D9F9878E5AD356BA65583F0C5BE7D4326ED09E17C
            BC6EDD636CB94F1289FE4C2EB7173B56BA182FDEBE5D1566C61EB76EDE6CD8DD
            DC3CE67F2FD1D575AC279DEEB28DC784F7E2F17FA71E3E7CC9B4BCAE4F98BEAB
            B4A3E3F59A9A99332323AB549A10C81AFAE3D9B38AB0D8209D626283DA946383
            B465B33E4F0C0F6FC26C7A2EFA5A3023997CF428B6A9BEFE1FF97D31E9BF168B
            2F9BB6A18AEB83B6B69F4F0E0C7C24BFAF127C3919C9B6969689B11B37EAE4F7
            31DF81E5FB4CE650E6F0E15E4C9D288C04AB4748F0511B89CD5A590C23C1AE35
            177D698D8457D6D5A9F2FE80BEBC33993C3D98CFB72B3F3B72A4FBF3CECEA326
            9DD30DA03CD13AC1978B91A84E5B1E8D1B36DCBD70E54ABD6D4C10B23903BA10
            CC6903BA229AF45D2EC7F5C2DE6F6E9EF77D7C5E4A7F438B264A23318D8DF9D6
            0934263646C2375296EAEE564EC0C8E020CBF7F5955E3F2F7D698D84774A5961
            F3D6ADA1C725717FEC686DBDEEBDE693CCB81803654C3BA83312BF7074A71F41
            B918893C0EF29862AF8CA61CD8B3E7F2D5A1A1CDBEFE6BCBC61B1B3BF6271279
            D7BE2B16B5B8ABABC624F0DA64D7D795B33512BEC858756DADAA59239DD81889
            9883642AC572D9ECBC72B70A85802E746980B031C2EA0B7DB53111ACBC8B0921
            DC2D16034E69BA8B427179C759E8F4530E4622F78FF79BD5C5E38C7F4FA09C6E
            21B900ED542AA02B868B91AC9516EBDBD5D5AC6EF972A3FE2FA4914098CC87AD
            91ECEFE8089CC854986A350A7D456E2472224A1CC34E0E0CB0999919D6D2D484
            DE45FD7109F7E777B8C0E742B8DCA0BEC4C6BB548C444E80899D62647494BDB6
            72A51000E3022895758D4D07364F629A0CC718492C1663FC945B2A2374C54F4A
            817AFF2323E9E746F2955F9732A65A884A5F508EA44A550112BDEA8AC145C5B8
            A8BCA0D96EDF7DD22419240F203F3E17A08CF937B91CE39F975E2F7523911360
            FE63FED3274FD8763E9E7E733E3B3ADA68F3D8CF043116FC9F79E2CDF6F60616
            B5E922C45E6D78FBECB3F6F679D7648FC53012284782BDB2628C44945319BC30
            821FFBFBAD13F8B6FAD21A89CD31593E2289EB8B2A0BEC276C61AA0650975D56
            3975D446624A144F2E54F771F9442683CDD487015D1B75E8C466DA77D563C830
            744FF204729EC7A50F36B109A27C6AE32FA73A214163E1274A7D456624F2007B
            39109349847651D500EA2653C46C6B102FA291C8B9267165285CBBB62BEC370C
            FC5406263D31608D04CA7D61FAAEDB2C6CFA2C27FF5DFA60139B60A18C44D73F
            61263DE9F4A750A2354A7D456624F2E07AE6003D51F180264E3780B2C03D2328
            172349F7F4F4F9733FFEC93311B269B63E0C8C918879FCEEF8F1265DBB182311
            BAC965B33F604C0C3213D176269D3E1DF6C33AA1B1642A75101A3B9BD816D248
            042A33817EA817B5BEE8FFDA1004E1CC9C918C8F8DBDF97872127554230882F0
            983392FBF7EEADF86B6AAA66B1832108626942571B82209C21232108C2193212
            82209C21232108C219321282209CF90F88611FF9E4DA81680000000049454E44
            AE426082}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 68.031540000000000000
        Top = 396.850650000000000000
        Width = 740.409927000000000000
        DataSet = rel_DS_Prod
        DataSetName = 'DS_Produtos'
        RowCount = 0
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 45.354360000000000000
          Top = 11.338590000000000000
          Width = 45.354360000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Nome')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 173.858380000000000000
          Top = 11.338590000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Descri'#231#227'o')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 321.260050000000000000
          Top = 11.338590000000000000
          Width = 41.574830000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 408.189240000000000000
          Top = 11.338590000000000000
          Width = 86.929190000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Quantidade')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 514.016080000000000000
          Top = 11.338590000000000000
          Width = 83.149660000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object DS_Produtosnome: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 41.574830000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataField = 'nome'
          DataSet = rel_DS_Prod
          DataSetName = 'DS_Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[DS_Produtos."nome"]')
          ParentFont = False
        end
        object DS_Produtosdescricao: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 132.283550000000000000
          Top = 41.574830000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataField = 'descricao'
          DataSet = rel_DS_Prod
          DataSetName = 'DS_Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[DS_Produtos."descricao"]')
          ParentFont = False
        end
        object DS_Produtosvalor: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 302.362400000000000000
          Top = 41.574830000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'valor'
          DataSet = rel_DS_Prod
          DataSetName = 'DS_Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[DS_Produtos."valor"]')
          ParentFont = False
        end
        object DS_Produtosestoque: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 419.527830000000000000
          Top = 41.574830000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataField = 'estoque'
          DataSet = rel_DS_Prod
          DataSetName = 'DS_Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[DS_Produtos."estoque"]')
          ParentFont = False
        end
        object DS_Produtosdata: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 514.016080000000000000
          Top = 41.574830000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataField = 'data'
          DataSet = rel_DS_Prod
          DataSetName = 'DS_Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[DS_Produtos."data"]')
          ParentFont = False
        end
        object DS_Produtosimagem: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 907.087200000000000000
          Top = -283.464750000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'imagem'
          DataSet = rel_DS_Prod
          DataSetName = 'DS_Produtos'
          Frame.Typ = []
          Memo.UTF8W = (
            '[DS_Produtos."imagem"]')
        end
        object Picture3: TfrxPictureView
          AllowVectorExport = True
          Left = 612.283860000000000000
          Top = 3.779530000000000000
          Width = 60.472440940000000000
          Height = 60.472440940000000000
          DataField = 'imagem'
          DataSet = rel_DS_Prod
          DataSetName = 'DS_Produtos'
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 143.622140000000000000
        Top = 230.551330000000000000
        Width = 740.409927000000000000
        object Picture2: TfrxPictureView
          AllowVectorExport = True
          Left = 136.063080000000000000
          Top = 30.236240000000000000
          Width = 94.488250000000000000
          Height = 105.826840000000000000
          Frame.Typ = []
          Picture.Data = {
            0A544A504547496D616765133E0100FFD8FFE000104A46494600010100000100
            010000FFFE003B43524541544F523A2067642D6A7065672076312E3020287573
            696E6720494A47204A50454720763632292C207175616C697479203D2039300A
            FFDB0043000302020302020303030304030304050805050404050A070706080C
            0A0C0C0B0A0B0B0D0E12100D0E110E0B0B1016101113141515150C0F17181614
            1812141514FFDB00430103040405040509050509140D0B0D1414141414141414
            1414141414141414141414141414141414141414141414141414141414141414
            14141414141414141414FFC2001108025802EE03012200021101031101FFC400
            1C0000010403010000000000000000000000000105060702030408FFC4001C01
            00010501010100000000000000000000000102030405060708FFDA000C030100
            02100310000001F5480000000000000000000000002028802880288028008280
            818A0A7157334569A4024023FE5CBBA29335C551CA028A20028008A000022800
            0000000000000000000000000002280000000000000000000000000000000000
            0000008A000022880A8A0022808A008B88063A437615D5570EEDF6DBE70DF16F
            FAE738CC9ADF0F92E2116488218C662F426B51778BEAC7A6C09074C5F3574D76
            F13B67E9BC48EB3668D3D26F7E55CEBC9EB8DBE4D97D49BD08B44C92BCD6915C
            3FC32CA1746DAD2AAEBCD4C80500000000000000000000000000000000000000
            000000000000000000000000000000000011401050114010500C7240D3E7CBF7
            CDF16FC4F669323D4D526B5FAC56E5BDE51D56F93F4BB479B1625F47F5F9D1CF
            3AC7556F33867A6795EFDBC1B35F39DB0DF26AEFE775ABF6B92F8EBA3F9EA59B
            963903CECD0D99EBCADE7E7B79D14EBB079A6D93A6D9DBB79F3F41EE6701E081
            6E5E8A4B389F7614BB830B6082B84124ACC16193210055450005000000000000
            0450000114000000000010104510055C72140000000000405000400504015005
            4444324D1079239C511857B74E5E75E4E6FD86D6AFB9A516B0A2393B3B579D9E
            4BD122E2EF37C566F118C85C79CF8FDD3CA5DECDDB0FC2DAB0A2DD33CCFBF12D
            3D11C9EBBDD6569C634F2EB257FE7E9B976971DB72539E94DD6FD66E89ABA98D
            F6E527944DB4EDEDD8D7D35D645DB1CCA2739D772260BB0F275EF7A7B6D89051
            59E75BF46BF7973AA8CDEA7CBCDCF104F7D1513F4525803039D77F69AD635CCC
            51173111C64200A22800000000018AEB432E660F3EB36AFF00DDE4DCEB74DED1
            DBE74F4059E43AC4593394000000004540150C50C8C3154DA8CD5FCF05A75BD3
            8D7AD97231899B333FB610F5A33DCD12A8BF53FA175BFF00CCD6FD8D76090F3C
            3707B39C37611DCBDD9135CF24B5A1A7E1D6CD4DEA7E457D471DDC303AD8F64D
            8F347638931D4E739F7C79D9D5763A41FB5B0495E6B2494946BD0CBA78F59CFE
            BFB167A38B9384AB88DEAF65DBF934293861B31217C7AADD8342BD9759F734C1
            348A755CCCA83251B9B9C56AB6F1C8F66A5783EC92F3EB361CDB37E09278F753
            DED7C5B2450B6C48AE374F3CB7245E9CCBCD92289D789563EC124D959FBA17F5
            180D5CD3111579F7350BE6E85383764FB04BE3AF51F9574FA37CE96CB72FD04B
            867A9E60A00A000218A192611592395F35115A6AE5FA56888773ED63ECE3DB38
            B30E86E468E2A53B396F2A9678D77436F6ED69D16CD5F472DB5965F169B66E08
            14B35E277AD32568B52ADD7D686CE6C8C48D55D66D65EA3C83F3C424E9B1EF48
            5D7E559E79D35D13456BC7A1315C4D5EE77ACE478576433FF3D3C3A4F57D52C3
            874F473B6AAEB3381F407D9AC5E5B738FE9DF8EDDCC9E970E0EEAF2ED62776F8
            DF036DB078DB2441DFAD722F35E325DDE5BB7167576C7A0A2D5D9CCD97EB4AFA
            20FDD292BD10C71749DBAF6B8DC46878E369B54A411E61E1E8321C62BD4CDA54
            F9BADAF5ECC12F9055C914975C9FCE327A367D3D5ACF7CE1CF75304D5B34E17A
            B182E233A2E7ABFD25A7C1CC77E395BE454014454030CF5B5292A0BD155FF438
            55876CF35DAC9E1ECE27ECEB18BD4DEA9A5B9029948D9E9E7BABF49B92EEAB85
            2174EB11928CB62BBA19B8432C3ADAF597E9053929CFEB276F74733407AA387C
            F524B35A48C08EFD3E63567E9588D8A3534BA7532AD37982E48B5FAA942D5DE9
            4A4F2B468FD4FBC1977B8641C16A3A369ECBC2632D2F3DCA6E567E37A2AB6D58
            2CFBBFE7DCB3D6AFADD3D4D63473E4E1D6A7672722BA4C1B658D95AE459F9A99
            789ED2684133D2AD606F85F7E4C72120FAB2AD58DCB1B75C98138DE7AE280DDA
            CC772F3F424AD65609C9AD5EAE66B9F474B9F43E3338AFADF22EF2FABDBAEC7E
            81F3DE0D75749CD38B7F31E95963CFD39DA56C7A1ABCB3EFF9CE403EA8000080
            639A041E80F55510CA34FEEED6AADC2BADDFE7FD96B5BD0956AD95637FBDA75F
            0CF6BA62363D4EC8AD3A3B4D92CCBE66B68C77E8F1D693B8767F50C93EAF1CEB
            DBE3E6446AEEECE1E84593E71578997D2DC7E75BE5637893B3392322D6441E0C
            367B42DA94456BECDA0E7CAD6F5DCD6A4B57CC6EF6ECE4DB459AF8B7704D2C4E
            5D1693FB5F24EC6BD96A9AA74E80E7D3D1CC4AC71B668BE1FA3FAAB6F9C64F2E
            1DCC411E2C63481BB3707568342EE4AEABED54B2162EFC6F4995B8D75B25C9B0
            74C0F1A3258DD155ECC175B8F75A61859D676110EFA9524B147EA9F6B1E158F0
            1F4B7917569D63E210C5B6324C909317869DF149EADB0FC79E93E4B7A6396BCF
            2AFA80A00002009019FF000079318ED2A9EA715B179716E4F67A0BCE162DCDEB
            3F89FA89B9BD2BAC3B65D1E5BB56FB66DD7E357D2F6E8BCAEE08DBE43796ED53
            4B6CE6B59915D740DC13414F46A6F3E8E5A2279E878FC3759B38B39B74AC0EE6
            373757D9585895A5DCE96F9BBD1B4FD77413AAF3B0B1AED19E8BA0DE39AD3BA3
            8681B15F0BD4766300EAF364B2E844BB5F39F3A1B234C8A7B8D73BA0B13AE18B
            E0D96171B766EE77D8B05C16AE96B554741B2411CC5F5A7CB0059E9D99D9546D
            58EF48D576C13664938B93AF37695D5A6779B0E5C96871F2B8F5CF6CBD9ED4FC
            34F5F54A76FC9B1E5865ECDE5D92E28B1BB66CFD6C39B1766C737054163EA95C
            37B639BD732FF277A978DEA3B80CFB8228000098E6815E79A3D91E768A855F8F
            7B845CB479DA4FDCFD0736191F352F42E7834DB376BC5E43D0A8EDD1B7BE75AF
            E74C9D19F679A6879995EE91D27EA36A695BF38AC9EF861DAABF91F25D9BD142
            3B24BAAFF2CCB3A8E4EA95BEAAFE6B94F4A030B9CB7C77B867D1E788E284C1A7
            71D747DB2B8D35DECEB8F3A5FA88678F94FE87B6E0AD5DF9D160173EA96F3FA6
            953DBD0BCFBB07E8D2963D2B2C57AD178B1966E9F2A1A763BA4B1D27F0A7C3C8
            4EE228E6C82CD2012E3B86C329735C2D1AD5BD20F4E3F7941DAA727E9FC2959F
            723B0FD5A58D0CABB1457669E1FA03CC9D95BFAF6F2F62A2C953145094540917
            2C3715A4BEB0A03D19C774AE6A8B95780010501151430AE6C86E54F37C766908
            D8A39BBECCFCFBD85545CBD44E7DEDF28EFB383AD8CDD8262D6C32CCAFB87ACE
            66E58E45A6162A703F561C91E85E7C9D7D7A7CCB4C7CEE85CD98754420BAE938
            A5A4B97AF76655272B73DC6BDECD0C99E67F0597C98D0A62EDE7BC3636742BEB
            EBDDDBB846AD7DDB951925B1FE2724E9DA33DF15DB7A3B1293E569571BE4B2B9
            FA787D8F0DB9F4398A5753472D5DC9158B53DE76B9DE3893E745AC78CB73FC22
            3D0ADA093D8965752EBBB9DE12BEA7026D5F9B8EF058DC71F9FD5DC563C6FA18
            F74CA9EC6E6F76F176AF698ECBB1D75324D3BF46A47F765C0B247DE71744B576
            BAEC9BD17D9F6D47647C6F43900280000002202E19720903A8A5918E7BD0B5E5
            B1713A4C0C846E18EE14D3B97523B3611B67B9A5B5E38B4A876702DEBA5CBD6B
            1BBDA3B5736411BE87EDB821F0FB11A21E86BCD76CF4D79AAB8BBD3032291579
            3261AD2C2B87AB46C70DA3A79E4C413B73C39A0D18CF733F4B23966EE6B768BE
            A791CBE1961B946275CF9F6A04EDC7DBA2CD930AEDF1BB1674EE86F46DDA3E59
            BEA01AEAEE4ADD1CEBED0E5658E9177946F1B7F4C6DD14DAA98A6AA76B66C71E
            AA7D44166AF0E57B9C63B021B71D0CF89F14F787032EBE64B063D1D0AA23F368
            77AAE6E497F39ECD8F3816A56D7737885267EB4DA91CF972F4C073EED8F60537
            21920F6749BC55EA7E77466062B9775515141510175EAA9268A6B404699BA8C6
            729AD4D30E4BD2A62316FE13BE7656AC111E118F915EECD084B6F04D9BEE652C
            FB44AFA0F39ABEDCD6454FAB4B57150C775E666E5AD0D86B5E37EBB9F217387D
            D0D685C8AB2A3DC969466B091D3BAD6ECCB9DCA5DB675357ED3B721ADEE1A6B2
            EE334E2AFE9B55AF3B73CA761C67A519A88EE563AB3F7B2E0EA479BA6CDF61F1
            0966B73D17C62F7A19E93ACF43C5644D3BDE6B149B7999DEB6C5FB5FD3AC32C1
            72466B3D30DC9FE75D75C17EDA778ABDBEB4C77F2C5B63947CBA3CD36D62A58B
            AF89CB4E8B5C6A6B03A6DA279AC5BDBABA51A9275A64DFE7AD675E7FBF560888
            BD3E30A998C6083BB34F1BD2F74CA0365685778B42B29DE9E67AA767374713D1
            2A2E2AA31477CF7A742435F6A6EEA7176F32B325DE9E9AFB7F25D25E7B3438F2
            7E95CCBDB955D0E1D8E3DEFA6C9BA5D22BFCDC265D21EED2E6783B7A354F4E3F
            187363C6C96F7476ED86E46DBDC4CDB0D1CB250AB12894D782EE4F9DF86C8AE7
            776F7BAF6B3D8B8DB82E4C8CF41457B6ADBB36A1ECE1C7DB8A343B76EAE6F34E
            9A6799F764132AEA679B3EC8DF5B0665DEFE464EDB7147F4D8D02D28D85B22AE
            5B90776BCB5DEC7707C870E85D9BF42074E7C7D0A62D9DED91BAF4786DEB6DB9
            0C7138509058AC560E3D28E4C60CCD773ACDA06C8ACFA7AF73CA393AF3ACED4D
            7835DC2CCFF54D84A434F5F3F4B431E4EE6575682E3BB671FBCE165333EF51CF
            E76DD796FC13DC5D5A37F25B491E90D49621A35A3AF9BB6E6D971E48C57D6EF8
            A618F31A04F207655793D203EBBC8F8A74C9B38D583B1D772378BA3A7273352A
            E2262DBDD188E36DC98DE33694CE9CB123D63BAEFDED3CED594412CAD8BCFD7C
            CF34AE721954C66CEAF6FE6B0AF27669DDD43E58514F3686DC950591E5BDD659
            C8F4D026EED83CF1F749207217D77994396DAD23DB7F0F5D0B49A79A31525935
            6CF9869C14F3CB5F675FCEF7F2EED5347A13660D5C4550CBA39762A6EE05D2A9
            32B4AB5904963A7B5BB5D77B67A33CC9DDD573BEBCA7BA77E2318E47DFDF3335
            CAA35AD1D3CD502E98E69452F34AB9F659B9A67AE0E8AB18CCBEBFBF8CD92060
            B323A0F3923C7478328B0E1F3DE7F76CFCD1702EE352DB7049E3F2E9D8D3DCF2
            DCB1898EDAF66A36FBB9B32342ACB177EFB07A324F52D898BA4FD9F1EE637A57
            4E4D361AB10DBAF56B62EB883FC433135F3EE67C4347639F696F89C61EFF00AD
            7797AA4B95CD167E758832BC2213644469F2559D890FBF2C6DEBB1A12F896EF1
            61DFBAC51A265B574F39AE89BABBB8271465AB9CE5716ACE82C76FBEA72D0728
            BA7BE08EBD8ECC79596EBBC64135B95FC7DD561D41DAF3D28E38EE8BF4DEF747
            911B2F6968CDA629DFDF1DA6B7A79736DB93BDD64E72C0FAD0D7C73685B1019B
            45B678494CB6A69E56A124EE8E3ADF8247DECF8C765D38F8B6B64E5874DE1AB2
            C899DEA1565D56C13B78B275B2B42B5B17528BECFA23655CADCB68406EAE5B65
            CD516A4B8C7E43C22794A2367D69D9F3DCCA1A39EBB74089BB6F2648BD93081A
            569EF792F9A1D73AFF00A332A5E65977E709185C2DC7F6DE1C79FD2D2CAE8C29
            80F6F1A783729926819617B4E677CDB11B6B9D73D7B5DFBDADF9F2D7D0AB4EBB
            C8D1AEEDD8D4DAE4D1392466571D8BDF87B79F6307CFBD4DBC14362CEEE70E8E
            4AD32EE926BAE74235F6C75F9B7766D548E374860966675866FDB752BA8B6E89
            7699D22E2E8DF755A9B650C4D5B55BAB5EC7C7A242C4FF0005CDADFB9B5CDE74
            9F58F95351CFFB32DC6DE740DA75FDAE222AE6DEB5702CA9ED0368DF7D9F1EE9
            835C91CF557ADF264CF5AA3FDD5ECCAE04E55759D98FF57338E46D394DE233EE
            9B19CAD28A5874E697CDF9FA79DD40140D3B710A3297F4A79FFA0CB8EE3BF574
            7878990ADC0C84315114C9715432E9E4C4490774472A36E6FBA079E3D8B35F2A
            698625C9FB36C66966B1D99B622AE798FDB4D31AC5276DF5FD67D9FCB1F76C3D
            5E5A8E7557675EB13AD99F5DBF14956CE9D0759FCDA9D7779BA46257032E66E6
            76053131C4A56663583464B2E0E5A8E5E8B37DBCDB2DD666DDAA2942EC9E90CE
            AFDF81BB9A4BC7D131AF7CA5EE0B505E7B059CBFADC1CE5D2C14F3BCD3A25A15
            9499EDC2395E5F63925CB96B891F1B96BD376DACF277E1C1EA4F61D61364D059
            CAE2B163B8EE6526AEE1A79546B9F4B2734AFDF5F3D3149D475F7EA769DF2296
            B3D81D4F3B25B66BDB9F92E87A94294EA080A8A03652B7E7209E4F68F53436F4
            1E7EE6B5A33A942188E7C1BB93AF1D9AE48D4404540054515304CC40D9A9153A
            FA1AF389CEAF318CAA59B4FBAA6DD9972E989C66558F75DA396141F9BE82330D
            B461556694CF23396CEA3C73D76ED5B46F2D3BF7E8F3755B539D5593D258AB4A
            6E765FA91EFCE509C58BD72C9E657C9E2BAE71E2DBFF005A9CB59ACF805FAF0E
            83DC3850B757356B6DB169E7176E3A1DAEA6092C492DC82F4A3EC5D9F3CB06AC
            D70996B23DEACA96AD94E30EE0C7D27D85C8A2B24763BDF045FA6E22E16F80EA
            BD04B589B2790D7A0F4C8A4381156AD7E858668A564D76C79DECCDC0B83A36FE
            F98314CBA3C575B2582432ACAEE0AD2CEE5B6720217228000008A8026407246A
            5F807982B8F4CF9F7A4C866175EEE46698C4A29E5C98E5242A9962F8C0140541
            040044CC544DDAD113AF6B6AB49238C3B7D0BB3F8C35E78BA8FCEB1172E77AF6
            C9D56D66E44B7C66B9EB6356D515D34D646CD55D09BF4A9B845AC0B1B2ECD096
            44C66D0A79E2EF98F464CD2466E2E7B75E315F5C3873BABE75E0B235F6EDC62B
            6DD5943ADC63EFD10BF33D5CBE7FB936BCEA7ED50DB466CEA2A5BAA41CB7609C
            7D7AA9B989AA58C372BCEF755B2DEB79377478E1C98DB714C64A710942715619
            985D1974F5AB18D3BB3CD477B8E878B50CAA42DD38EB79B942F448B9FDE9DC9F
            4EEC4B6288A2A0A00000000002020D7E78F4CD63623F35EB7C66ED79DD2CCF98
            BDADED921C6197B1B72D0A9BF7C5646ACDA47A40AC0CF19E0101515571004511
            31CF25356C4444E8DCDE80E8F117DF527BE259E61CB374ADD8646FB79CE82B8C
            75B642BEA969737FF3FE9B774F46DE7E7D3BFAB6B22E5D9B743E2CB4E3B2DA56
            FDEE9E77ED6C5CEC8C51A6EBBA68D7BB5F9E4B2A8CB8ED51981008624D67BE69
            DF83A3C526F3F58D7ABCCEACB06B5B75727958AF4FCD3BBAB4B5D98A7D8D6CB4
            E4B05209AB3E77A80F45780CF9E0F23566B9BA74B81D767C1AC174DD56F416D5
            E4F6F3C91607022A88A20280022800008A008D4ED8079AEB6F4A505D0E53163B
            B5EF6547642CEFB9DAC697871A13C4174F6EBE5C2DE5D71548C77F5B5C52C88E
            3854D0D8589C53D4EC5CB2919AF34553050044504C51543032C55BBF6F20D4EE
            D3AB36C928B1E98DDCC6BFA03ABCF4FDC86FDD1BA110D82C5E8E1445DDAB0764
            49E2B09F4F92A6B52AACDEA64F079140E3BD39DFA9D75B84E7B16B991093973A
            BA5AC57EA6AF3F35C73436EDF3E6A921F4D31D3F33A7B527DB1DECDEE124B9B1
            7568B7834BB6E94E0D6F9A5EE82D5F2C8B674AF53EC7BB7F03076D2F533719BC
            427F93AB65CAF8FB399D354540545011514000004051141151404501B3CFFE90
            AE658FCD5A5F597B6E778B99D5BD64ED9CC29CE85A8FBDF166F3930E9D37F370
            36239BA5ADE11AEE78FC9F164ACFDCBB18BCEE70499B5DBB068EF745D18E6B6A
            BEB4CD066028A8864808B8821B30037F437A20E59B66D4253B633B69694A5F6B
            A317A5B2EAEEF6ECADC6E637273AD1C66CA82B856D893F131F1D793D09248134
            EB730F31573E1CAE96A826BCF16EB77138E956CDF3904CB43CC2A062F51D6966
            A52B21B1BA2D3612DF34A3AD360D2A89DB9659D4B8F5F418922E3954429DF78B
            8EB4BFB9DD4765173ACA28020A020A0000000000000000236B960279CAB4F4B5
            03D0E630A67CDBB97D1A9B5D91C7174EE0D196DD6ADC13347B51141314C81359
            B01342EDC456BD0F2559DAE37358BD59E59A561566BCEB08DC8A56667277490E
            A4C924620A2A6299A06B147222E209D3D0DA20EE34F431DBF97AB7B256B64976
            199B2DACF26D397AF70581E7F79A4FB5281BC2A5A7A7AB4376DE6FD4F9F0DED9
            728EBBCBCD8CBBDE53EBCA9AB77B8B22E392D68F96DF0DA3BAB4BA6954F3937F
            57CF24BE2F650FDCC12199F3FB0E16473F4E3DD5100540051001500500045011
            40114004500C7201BA87F43C1246798F448A3FDAF3B1F7D6DE9966E3766ED91B
            7071864ADAB98A59AB80A226299008028264818A668A9826CC46EAE27018E66E
            FE946BAAAB18EACEBBCDB382282D8F861869D1DD8E59AC5A136632C589922AEB
            4D809A8CF10C72C545DFDCD222BB6F63DCC1CB5EAD8D5E86C7BD74EFF1E9E8E5
            C3EC3A5C581CF3B5239029572D9E6A3D976EB969736934B2C699A73CF7469186
            ED9BD872498B738E3ED39DD10F9FF33AA9922B1C08A0020280008A0000000000
            0000000007176E2140555EA1F3FEDE74530E96FE8B273659064D7F273BA3231E
            F38E78CD5931D98A981922888A2222828828A222818192098198A9ACCD10C747
            462D7606691C9CE9BC6BE3B206171AD3B8E1C91D9EBCAD732E54C31CD159AD36
            62E30150708280088BB3B5B8447FCE3B9347CE7E7714381BA4FDB04B5DE8B038
            D93455D3BB09215C75E13C1BE40C72B86D4A9E1AEC3E6B7A72E1865916D41014
            401410144500401400000000000000000000E4A62F08DB93CAAC362433B2C1E0
            E3D6E0E5472883AA35F34B0BF4B12639A491A264AA9A9362020AA26B33453132
            C40400011515054314CF1718E1B710D66C06E299E2D30C762C16963AFDC08EC1
            C8C2B58C9235CF241294DDAB433F0321CCC454505505C4047E2648AE4E9E746B
            9D11AC45E9D7866E8B2DB866D4EA98446654F425D755716DF21BBB142BC80000
            000000008A0000000000000000008A000069DC8253B4DFAC691BD5E947273E5E
            A7162123155F1094343F31F0B9AC266ED393AAB9B21F1E08CEF32438AAA48CC1
            324505325304CC0C136600899A098A64822264298A2A08A22AA6B4CD10C13622
            A6BC7662A9C8C3285AB735C0E7ADEC235358CC899263B211D8C595A6C3533349
            BB072602A0FC0512544C8517663B08976E3B5ABD3388DDBFCFEC5832BE7E9E6F
            5D505011404500115014004050000000000000000000000000C591F710F3857F
            EBA84DA87CE3D969F05EAB5E734F192C3215B249A342AC15FF00AF8A76C4655B
            5B98F471E26D6A49935B659ACEEB9A491E2282E299620003714C85314CB11715
            5458F14C81531C8131140C71CD151962F2BAD39EDBB70D4C5AD9D23C23928923
            6A6D7FDAD935E3BB1B7575EC4C54DBB793240D7D00ED193877355936BD7644E6
            77A915A1CE6CC72E6DBD78BA228A08A000000000000000202800000000000000
            000000000228089901AF1DC07231C9D02A3817A5F8DC794F97D2502B95EA26A9
            DB46AD36489580DDA5570ACAD188A2CAEBC9DC1DAB3CC7863F2452E468779624
            11648CC7204C53341759922A2228222648260AA28899209CB04B198B9DDEED67
            78E0BF4E236445E539F6DBA13218656B16AA19757CDE18EC47C7826C455C7763
            D28F734EE64AF65E5D1B2CCCDB9674AF56FE5B5C141400114004501140105000
            01140000000000000000000000000000000000000045031C362834C4EC144281
            88FA9DA644F2C68BEA05A356B7679BF0EA5289EB93F3DDAD0197B54895F58D99
            5A5910BF93A61B239A2ED4D658AF9A6CC55B8A6C41304CF15541146E299A09AF
            66A4A96F7736FDAF643655D3AE392250DB4A2D42E4B734CF632714CD25660668
            AD5EDE6728E6EB6BCBA1933BFA32AEBE790DDE851694E0202A28008A000020A0
            020280020A000000000000000000000000022800000000000008A0020A082A02
            73F52045E0D70E28799A3FEAB8CCECF3868B6E17A74EB7EC90E8D4A907C260C3
            3276466675F04FE2F2884914B72E5D72C7DA32BF48CD2B90F8B5AE782AE0EADA
            FD46E37F2BDB1393A389B754123B1CD5E4D1D989AB75CA98A668E6E2996426D7
            86D7286C47E5B14B9E8DBB4A5FCDD3C96D8A8A02280000828022800002280000
            8A000000000000000000000000000000000000000008A0022800008A0022A002
            81A9B5DD10AF2097EEA53CB0DDEA288D98A8461B762BA7522AD52CD5A5562AE5
            D65BAD5ECFE1F2E8A68ABB346714924C37B35FCF71DA6B11C9B766B475772273
            CA85C5ACECFADA24B0FAB9BAF4AA622A4D1E3B31DCD774B8E8C20B1D7E95AC6F
            5E536B7E68B46C22A0A2A28008A08A2028008A0022A0280080A0000000000000
            00000000000000000000000000008A002028000008A202A2800008A0089901CE
            D0FF008856704F43F387959BFD410CB50D15CD60C635E9445B66BCFA15B8D864
            6D3769F5F3EFD6A9C2E6CAF849C5BB4B7D399E38FAD926AEEDB116562228A274
            E9EB6ABA6FD562E56959F2CE7E9E5B5D44550100504051140100500011400405
            0001005000000000000000000000000450000114000000011400000000000114
            0040545000011514000000131CC0E28ECB80A620BE9DE053CA5A3D1901BF5AAA
            E495356C67C31E9CF9742A47B5B968597BEB4B3619139DDE1B1D268301566872
            73E17A86575BF2BABAF91DFE85169CC0008A0022808A00228022808A00228000
            08A00000000000000000000000000020280008A000000008A000000000000000
            0000000000020280008A022A002809AB700C50DB3903CE714F57314CCF2FF2DD
            55D69528AB2BE69DECD6DECEBD53C1A3233537CA58AD5C8D1B1E59A77F31B00A
            80280202808A0228020A008A0228008A00002028000000000000000000000000
            00000000000000020A00228008028000000008A00080280022800000008A80A2
            280200A22820286B657D40A5EADF5AC5E56794B9EED86EC52826F90486680BEB
            825DCFEB64A83154101445045401410144014101410144500401400040140000
            0000000000000000000000000000000000450010014000000000000000004500
            1001400450010014004500000000000440698690530CC04E9501450504005001
            140040050000000000000000011403FFC4003210000104010401020502070101
            0101000003010204050006111213141021152022233031401624323341506007
            343542FFDA0008010100010502FF00BC932871464D7711A60EB4AE2606F21C8C
            69D8E4E49E89FF0017BE3888C4937D122644D531259D177F9B7CB7BC0548ADB5
            148B47EF839C246310256C4795A46EA3B203A36BA902407FE8025C06A886541D
            B462634CC7672CDFFE137C295A26D9EAE0C749FA8254FC57B9702FEB7514F49D
            0BE5D4FA99F5459D2CF605547266FB672C6EEAA2A13B863D3C5E3328CEC31A13
            A1AF785D9DA0E4DB078DCCD4658481D652303ABB9226B48BCA26A0893151E8B9
            BE6FFEF9FEC9A92DCE798BFAB55131CEDF11DB668B9FD4625AC50A175641163F
            5E416AB75D447E7F14355359CEF3E5737A624A222F9AEC2CC1111876A3E3DF1D
            B83D41203906E63C969BA4C830D6156D64406266F9CB6C695E98C471890A9254
            46B8D6D80D4362158DAC76C8D79164232589F9CD337CDF37CDFF00DBC95D85A8
            19B4A55C17BBE4552784E4D9639DC17CC2BD5CE6FB6D91A33CEB1A5940ED40A8
            F554F4189C4755D316C65CFD26A21ECAC7211F88392363A611D8D949B34825C5
            DB92A2A66CB9BE54C08A118EDE1584805B0124B268BC92488E6C991868D6D4BC
            583F880D19A8AC40D16B46EE2D55195236A38525E8BBA7FB52EDC753B068F77B
            2EFC5D5B66C3449856B247629B1EC56E44AC24C4875220B22863A8ADA378926D
            09CF3FC5552C8B52085074C8D663055DA69863CE353428258D5F592959A85254
            BBD84906C3D130110F251AE373238A07364A64796D13D2E0CE6B67978A5A9388
            6CD46E15D351EDBB457596A124811E5164B9C42AE45DF9C6D67D220EB48EEC0E
            A7845C0CF09F11E8B9BFEDF7C29D81436A4840C8F7F0E4AB5E8EFDA388834B4D
            5B1203A65D5A592CE0C612B4C3264B5DF2A5FD47D435DF6EA9AD6B7C75164367
            039178498EFE26B79C328A5FF481BC89613BE0F5E789C70884BF7D7323421C84
            F8A4C0B555011065BAD4D49349363D24B92B22AA4C6C0D5C93A0E7AD0D4D9D43
            ACDD7C866C8C85525978B4B1D98EA58FC1F5661B9B593312B646EB547CB0A83B
            15D1E46021F1544E39BE226209CB8C61D8A2B29E0406AA981C16B6F706AD8C4C
            15D45323248DF9CBD77FCF69761AE15AEA29162F523971A573174F6AB2C7280C
            871FEC1E44625D6B48D01096765A91DDB0EA12DAE0B2D8F6A3D1A7EA6B8CD347
            9766BBD7005654858AA195136E2E6842F9B6EE248933A4BC1E2BC8FBA89E3456
            AAA382F1AD3D72FC46455CD58D5F1408C34442CE93684702D4867D403CA9F148
            CBB9B2CD5B6C43C87DD98CE4515DD7CBBE7B1FA9DBCE977DB29AB64DC47BCA70
            53E7C0FC48712531CA2908E6B41DD8D308248D2DBB865C7939675F138900CE71
            23467A869C1C59004DCF1988855DB08AE4CDA14977F0F463A1B4C91B9F09B016
            2595B41416B3983C8DAE42B82D5508981B78A7C695AECDFF00191DC5BA94E8B6
            2ABBE5751BA68A587C72A2FBE8BB05910BF2ABB6C936B1A2B6C35F44065BEAF9
            76595D50E92D9971BA222E38249647423477481E57B15E29EDDD343DDFD9D5A8
            AC92096F639C5F2C4ACE2B16AD66D52406061EA806D56C5E2F970C97358CACF8
            7D354D696C0316A2C5883AFB0AE9126BE6564CB5F2BC98A67C8CAF9A46380D78
            A179EF8501964FF126BE3BA4EB522F93FAAE9E791F61A8D8849AD6B6C1094089
            8B0250944962DC340946C7864C7C9475DDB768E1A159DDF4952BA7A0820B419F
            125B573B1AFCFA17095E37B9D5EEE1E2486B7C73B322CE29DFC82F71A0574952
            69413B1DA6E6031EFB384A1D4F3E3A875D9305AE63AE0355C3328ECE3171A763
            B3966F9BFAD915031269BC894B906F5F0C724FE41589BAE8C93D3211774FC1BE
            6F85923024ED4810C7B1D6B366E1A59A42FEB9554CD41DA5B3E7A8DBC15BF5E4
            0861A7816F36BDD5A612A2D47D25333E8AA3922CCB927975C8CF68F232144D8E
            37B190D867922DB4D7CDA7CAFBA955995FA94C2B065B55C01C8D6534AD8FAC66
            0430F589C583D6CA42EA5B8DD5FA90AD27C7CA288DD4E862D5CB04B2C7835F4E
            B6F63F13B1903E87E8E1B4AFB6AD7CF9B1632461226260D5531AE5C57E4B8C13
            A48D3C27AFF0FA3312AD06A9198F1A520DB9F0B38B11D302EEE226258A8B12D1
            9B326B5C89218ECE23C7421AA2D3A23C90DE051AC8C1B1EE47C08C4491A66217
            0DA484892A90B1D55C58EACB6963C8DAA268145AE643703AF1B913574492E6AF
            24D6D3FC78098BEA3DDC4D3E2E261FF47CEAE4CB4D4512AD2CBFF425764FD433
            2C32314AEC3B5184105E7746AE0D532CACCD64E6B707EE66D1457C2D4F1D4B59
            A5E901297585635C0809C26CE6709ABF64E191BC360DAA9F0FDCF1DAD40108B0
            C552431615D3455F03E745DB2EE51654945D94B62C742CAE739A7DD71DEE8272
            481E9228ABA30E6A3E588BCD131319898EC27EAE4C76393198DCDF39E47DBC95
            0325A959E36470A388F4709CDB5230696CD6A0AD84444908F42763B0C4983425
            DCB163F509B097A5261279498E739CBBE6F9C93113E9A488E34B8C4DC3ABEC56
            6587E89EB4B1BBE55240441A26DF3AE6B9B79B05E52BCAED95D8284A4C8B572F
            8FC0C20C049F332769D18EB15DB6699AA6589AFF004DB5EDD3139D2A11C4861B
            5F329ECAED39D133FAAE1BC0C76F32025A8C60983E0FBD8F1D636AF89BB75042
            3A2DA0E1BB521D26D9AB76C4639D83138CF356498E38FA3259E3AC477960D0C1
            58307473A51357527C126F1DD5536C6FEB0468E2A60E390D81D3536464BD3838
            D16844829214DB11711DB621B6CEF6E295AB8A4C57A63DE898E3330D6430E47B
            C57954DDB9DEA2688CC2E0CAC6A76B57083426004A3CD931F104FC2D485E8DA8
            20DC26758F3645C24511709490C987D2A27A974B19985A4982C204C2771D92BA
            B90AAC9A063A46AC8B1A21A5F93215DBFA6F9BE69A81ED145D62F9D7F4D4B11B
            31EE81531316654053E3FC30F732A4E56D016C5411C70C37B7E6925AAD223F1E
            2009456C43318808A211E4CA6C56A2C73E6A3B51102C8A5296E599693D478D90
            522C688D30A505B8A3C8D254788F57B0525D1DCE1AC9255D1458513C1041D59A
            F1785656BB95350C0F33513977CA77B96DFF00F41FBD725026CE17DB04321DF5
            3A2673D61E8C8A3C0574686D5D932C6132CE340AEF86C80E27A2E2E2E2AE39D9
            185E415D56276174DC73E49D1E4CFE1BB28CAF2DAC5C15F71C4B68AF46118F6C
            DB47072BA44C9C404A90B2FCD70DE29484CDF7CDF37F5DF37CDF0A4463275E35
            5C49DC9C498E54EFC717D9DFA8DD8AA898A4C88DEF93A7617144FC37D0FB0574
            C44C46ED9DAACCAB2B5963616F1ABC35760CB489A9E03A0CF8474242BBAF6D9C
            381BCBA9A9BD7D7CC9C78A484353B9F02A0601CED46C0E4B23A4B2C59F54767D
            CE0D142924FA9ABCB3DB012144AD7B4CD195F15FA5351B2E63DB7DBD4DAE87CA
            AA917952E931ED6869028E94CE475D6AE928EBB22FB01A8E25156C21C145C6EE
            B9C31DED875DC63DDA78EBBA7AAE2E2E4C9C28A81B324996C5456FA6EEC77D68
            68114D92F4AC391965A70B581F25EAB5F75F0F23F5308AF0DC88F85B046A2D89
            95CFB37BB235A6E53D811B215E8C6F36F1619A5F4BE91D1154DF573CE78E5DF3
            7F936DF202A04DA5EC45283F8648BB47735DF74899B2E71DF1793F34BD97892E
            FE079F5F4FBC9A3D36592C778BD12B5A08619308122C9C43C4D3D1CF3CB6A525
            091B14335A76D93151464E0434F73DAA9BE3536C5CF1C8818C551BE5CE410B4C
            D82C4B3B49C39B6DAC1395269E5DE934B33F99FF00D0A491F3742F2E3A909D97
            24C6AECDD0D61E4D6B5D8D7E73DF1CB863306D490C3963E6FEC98D4DDAB8B8FC
            D46FDE5B0CF62C6BE991F23EB42B722EAF8C646DFC27E0EC63957745C2BBADB7
            96ECE960F77AC76E382899E1FB7170F164BDB8F9AF7361218B2A3CD9019F6F60
            7319C76B6BEBBAA080728455D513B99B7F4DFE763B6CA9B42403525E8EC83F81
            72FA1736D9894721737CE58D2F5BE9A7FC460418AB15F69740A919B590DD07F9
            9BB960EAA504BECF218F563AC35230F530E322447CD4381479FA668FAE65898B
            A160923DE538EAA479CE6C7034A6CAFF00FCFE7D8B6BF43C2AD64FAF179FAA4C
            D2D1E97772A3D37EC5D609CEFB4837A07724E56638C796E354CC8EDD073BC692
            326E8A66B116D039636676B2291F2D6203C678D765C4C4C762E1172E979CC5F6
            C6AE3BDFD37C615E358BA826C555D5C72206DA1BD1B6B5E8AC356C870ABA0972
            E031A1A3E4E3D155062DD2A9C4092A233D0D5E5435B58116C6D6FE33F85678EA
            29865348F545D94410C853551458E6B9BF231D95962F8A5A3BA6D9013F049176
            8F5140E18AFDF3962BB13EB5D25314131CE4626A792393655F08934C6247D320
            80773E5CC8639292ABBA59E3B9CC14A448E34E42E6AD565238F4BA4F50253959
            7D6570C9DA56C25CEABFFCBDAD4041ABA40CED6030E4DBA91316B5CC8E93E23A
            4478A3242895255879A84A922DB4FBFAA10E99A69151078ACD1B5F0CB0D03201
            A92411F3A7CB3BF46B64A25D5484CB213A8D18853104EF734B0466C8D5411B99
            AA4C4C91A8CDE386F4FD2BA804E49E6434ADBE65CDBD7B30539E0C7D9A9DE330
            F0C56AB7B9159A6C7ECD4F65AF02BC54C111A55319D90AA990457505604BF93F
            4C14C28B093FBDAED97D51706FDB292D5D0A4C537783F06A185CD96119412B65
            C762239160495872666A96C905769A291D2E7788C25794EE890140EEE54C16D2
            12C609214537610DFD847ECE746B3942069AD253E59E069F1456CA9F160B6CB5
            34B721A490CA8DEC73AA4EA964DE898FB29046C2952263440568A7458EB23A16
            142EC550D6A15B8E76F14EC2C610263DD61264F946A78F2C459EC643CBA78A35
            6C22F14F3182C9C916C92D8B635A9E7C97269D8EF58B3648043B4B2206422F2C
            45C5F991397C865D841272C76FB0E43945108E60E82FA345147BC866C61184F4
            5C2FE97E249026BD58445FC499500EE9150EDE2FE0980ED16A1AEF748C67A8EA
            253F23E9C23F19470A3907262C5696514D9B6714CDB38A62B326761E1D891B18
            EF692C0B4FA0E7593A9F44D7D33256A3895CC2DA4D920AA8BE73E4AB2C63D657
            2CA970AAC009B74AF20AEA335F3E005BC2351BC786A594F7B2B58997CBC010E3
            8638993D87573648234B9CF930EBE2323632CC519D2F519A4C82DA4892A4B729
            50B62F7B234F2808F20AC001B570F07063CB742AEF1124560CA7B7A8E6AADE19
            BE6F818843912938A9228639A5854321B54E4ACA2A6F222A85E4923D2329E193
            1090CB31760435FBA56E301F4B59B222EC4611C982B5920C83AC4C26C1D47166
            239ED72590B925B37AE5B8FB630FBE22EFF8189BAE9E85BE4117503F02FBE5FC
            0E6D9B78B09C6BF9C6C12493E3448DC45CE58ABBA348A8E476FEAE4C2E9BF8BD
            8D4D05752B67EA1144C46CBB570EBC10EC64D9002172F8144188C8B592630E3D
            6E9A8647D7DE9071EAE4BDF2AADBB371975F4433A1593A5B238AFE5248853548
            D0D09DAE2DC1C8E8AC4DA3BD1EFC544303D8388EDD774C57677A35072783E31E
            3CCC76F19605E6EE52A744B73C025FAC92621223B4F567C465DBD4886AC02C59
            072462B63CD0D89EE613529EA7812BA96B5BF13837521FA835AB1AD7CEFEC313
            AE42891CE4666DB24285CD16BD31F031F11CCC42398B5FA80F1164DC80F108BD
            AF247476289CCC47AA634B9D99BFCB045D85D390B1A9B27E1921430F51556CB0
            E170C46ED899B66D8F45E2BED82554CDB37DB1EFE2D65812318F60690E63BC69
            45B28F19B3ED892DD117B256A4541C02C349D5D0EF5918D1A1C9945B3ABAF88D
            8D6A4AC4248795F165F6B566BE2E16EFC80CCB60B472AC40E6515A42616DB50D
            7A8966A49030BF69CBC5DBB1123C6592F955A01E300C7AA57FD1E0F4BDC0231D
            5E55730A119D6AE73A212C76F1B4CD5F9F2B5957EE3D2D6CD86478DA71DC3082
            98CA89646C7AA3C7C93F7EBF4CBF943AC4FE6E41EB6BEC75208F25F33FB7303C
            322AF362477733C57C6757C5D80A0F6245C345C910F0EC70142FE69E9FAE2891
            7141B67154CDD7392E76E35FBE4586D336AABD5C5A989E3813F1EA746082D4F6
            DB13D36F4EA4557339FA7E992E4F666DEE45FAC6359B0ABD924921D42E1E26E0
            2D837E2D4D14D37A0C18D50926D641DE79043B91AAE56C070DA93D5673E42912
            C15E3794AE562BDD884726055C42806A304A678C0590473851BB144A8B878049
            091AB6546370EBC9088E697E9563BA9FE42BD11D929FB41D147451D9C4F32139
            AF0174DD979F0CD5E927515F5DFC1B2D88D9B4556FEFAAD2EFFAA54FF865F4C0
            D6CC7EA5B1759C9467621A231CD14322C9AE67887B7629EC23C2E22588B8E8EB
            8406F9223659038B06D46A7CDC738260E3B5F8C231AA3371CA6D4CE84FAABA8B
            6424FC3BE1A4340CD43702B22A7C9B7AED8F7A0F0F25498B88CE58784418EBE4
            F4488B0C266941CB2552324E426CBA71F64A9439B4252B7F8488AA1D262663D9
            0EB7350493583C511DD038E68C2B7171C2E2055E9D6ECA186A7996035EFB0559
            519ED2B544E57E408855CABAD71A34CD3D237F844F8A7E71D50E21288F0C8C74
            5EA8B922C5938D3377028E7AC19C8EE49AB2B1C097A464B853D8ADF8C6B74FBD
            5AD52698D28FEDA6A16F45C6B46381612A622E165ACEC8A3FA4C3FA6BE1A262C
            66F0DBBEE1A0F6E8C245C3C6C38B2EB82336CA2D330E4571B46422659688305D
            223122BFE4925F1A20E5AF28F2F06FE495F606806D3D76DB687BFCFBE5BEA18F
            543B8D4526CDF1E4F5C81BFB13E5E4898598898F7B9EB9FE210FB5F1E1355B67
            A7FEEC28FE242C554C7484C1CD51BC3643264998C1364DA90F8A869668FA4F9E
            12343AD1DDEA288B2EDDDD98EFA8844460F34501A593694DD2B60658988564E2
            448C163238764A78CA8046358935AD2325529BBA546EB457BD8E769F9539CCA8
            F8796533C8127B6697B1F2E2CE82C9F1EA74C7812CD6A81D4B6D542BA0A16143
            8155A8C75518DA91DE6CCB57CD72984FC1B98FC01DAC63913A84D4E012890D5A
            5495763FD36C7377C287DA647444B37F7CDF87C8DB4E89C3A9EDDB3B1B9AC234
            5740F54F75BB3F11E04DB6561BB3133434D7027B7F4F937C299826DF6B368725
            CC7C879246293DE29DDD6D96EC4999E6E2CC5C594F5C72ABBD36DF36DB0519D2
            1D06B906830706A6CD71A7B5116C1B849698A6E58A45C42FB18E8F74448F668F
            915B442BEFFD2906B67A8665ABDABEE492E58CC7230A695C97B55574E46F1A04
            E9AE48D33EE617703C76EE6644D4C40BD35ECB44FE3992E506A697271D22C652
            488C26BDD3191F16614CE2B5C4157A7F2BFA656583EBA4C3B78F3036FA92256C
            535AB0C58FA8AC7AA49A7B71F2A5E3BC87E70763B9352BA4BDB278B9E9D8E702
            2EE80D41C87368A41433453CC990A5F92CC5CD513120C0D1B5292A5740F660D1
            A8E6E48635A9A9413FBBD5178E5917B24637F5AB8FD31F34A0B7B007B8FE4B3B
            60560AEB531ECC8436D8E22BB1570E76892AEE915CD7F24F9118AEC68937601C
            4C8D54AFC8D5E8CC1011B9C76490FF00AA519533622E4551769E2182AAE55C57
            63FDB1BBA3AFABDF63920048AFC8E252966B3A5CABE8DFD74FDB81B16FA785F1
            4C9F4C876F9FE4109EE4005C66D269A0EC2106321D8AB9284D5C6C71A8CB2440
            49762A5CAF9E5621AE87DA5B72AAB674C76386E7E00A08B89A808119EC4F2339
            B9736CDB088988FEB2E9F7792CAF51AC953B105632996336BEBD1D392BBE981C
            812B157355CB5B0B4A4849060A7A2E498FDD969106E8266A34BE92C9D6173B93
            93DD6B23791211BB23537CD351BAB23FF6BD17350EA5655367D896794A5CDF7F
            4993501863B8CE822534A6417C7C60D153C75C488F5C64322E0EB5570153B286
            B9198C8FB620F38E3BD915399657F5D7899199322C2D42D7FC52A57F88602AA4
            FA93B8F5EC7891B864CBF443AB9BB6537585B31EAF7635392D3E93F3C76350DA
            32F8A5332634CC111A42BA2C4DD5ADEA751F22A9DA749CF2A34520E88D2D8A67
            5CB3362C08E99E4C510AE9E4840660B36C7373D9315E98A5DF39672DB11F8FC7
            37EAD26A9E2CA4E1367C86B22C287C19A738188AC7ED35B3C044D62A024AD4D0
            C95DA5DAC34C12A3D9E8AB8E26D9AC24908258C46E715CE2A992FEEA15BC1E8D
            E2DAC86800ED95B1FB4B4ACD8A2F667A5E58FC3604A92F9653BB66F2DF1576C9
            965C71EF57AE68F077DA24142E256ED8DAE6E2404C6424C6446B7103882C46A2
            7A2E497A235EF4E512B14F225F5468EFB0F3270EE430C4D7B2521F4FC320225A
            0AB5A33574BCB1AF2086F7290D623D9DDEEE23FBA423383C4EE2FD397A408754
            586F7C78AF3C66D7C8305B48308E419382A847902FC10C6B6DDA5AC8F327B99A
            798263A039E47407BB3E1E4DA40C71DB711DDCDABB609D9CF1CEDF17D3FC6226
            37DB1D84CA1B77C679D7B154CD9121A6551C7B1302669CD42CB70917665EC3F3
            5F0F4D8D821D5B226479840E02C464CE68A8B85F64D40920D28925E14F282AB3
            A70DD9CFAA3A7DC7D5C5593236DB11375AF0F4828D9BBD9FD3E9AE4CA90B0CDE
            C1B9FD392E6B8B8BEBA1953E291B1199D699D788CC46E227C8E5C9F27DCDDAF6
            69ED40151DA5492D32E2BFC11BEE52288769358C8F62D74678E14E6C9D25025B
            27C199A732D62B187B366DE917FBAB5E59722A7423E6E40D0CF8ACD5DA5E60A7
            53C440C013C420DAC923F0CE73B191B965750CA9CB074E40A661F58B00B24E1B
            760516088FA89CDC36A699C996324D932BDE2211BC4A3CDBDB862A67E99BA626
            73DB3C86263A63131856949F0A6C241CC7BE3B47E38D57AC28DC892890CCDD4C
            F9E01FB60DC89885DF1468ECE87333BC8C56D911B92EDFAC69A8910A1B001DA5
            EBDAD640DB93CBBB93D92A44828F95D194C65FA5B40DFA93F4F4D60352475FA3
            117264064C6C8A5220CB00A0CE3B6080E32E9D07812A1191CD62EE9F26F9BE6F
            8AB8477B4BFAC8E39213A5C18970068EEEB5A1D53600C5BEADB57D9D6499321E
            770ED1C376449858B51265B244238D5B966CFA7FCE98A3F34F25AD01EA04F134
            2FDDB7CCE716B86223C708621EA258258B1E8654B756E900434977291D93C059
            0C7097AE2D791EA3AEF21F11810211A19C47C6589275329CCA76B9248DB8ED91
            1E56B71D259BB248377D8C64C34FE78E72AE6CAB8C8CE7E43ADDC95B59F4AD5A
            0B2549D8B36538C59350D581B7075311BC7B36C69B185C19710C98EE2FC705AB
            8784D2B625387B92105992DAC6B6E8EC6937EC727D4484BB31137CAD8FD40FF3
            A7C2BC3D7510790E60F8117DB11EB9CF1CD6910D591C98382C0E311584A79DF4
            473EE8D2623F37CDF37C5762BB157249DA24313777623725C88D2481598363AC
            4836EA18E234283ACE2884CB1ABB45B4ACF88479715F04334CB64851BDCB680E
            2183154E7A20ECFB24646348B9F8936ADC5782C99CC16632439A5B11B2040870
            B8004AA3B13C58E2458C11464758063D40DC9120022E3230F9DD0D1C473411D3
            E18E905875C8D4D5B47D5394C4C73DEFF91137CE0BB8E32AE34391A2611DBB1A
            558F91AF1C9924CE69985573B48DAACA1DCB7A6657CEE87025B4E88B824DF1AC
            54472F1C43621B087D9AF95D7214BC996B238B279FB647E8D883E6589FA41DBC
            846F14851BCC930A3A045EB6E1EC05D0B84877AEF9CF3DB11130725F1DD07517
            1C8D7402E0A42131099CF39E7BAE3CCC161263C9846A371D9085E6C95AD12360
            D940C91151E2FE62237CB1150D4D5D37161CFD3CE8F743B3ADA984D8F0ED6074
            3E7D410D0A921AA2D633C41D8FF7F4F077301BB32CD9C8166DEFCAF92C935359
            5AC644205C31C48C3267C24663478CC0B3768DC6969DDBAB95D014AD252F6E16
            1B42097A9590D8511ECDDE1844D48236B5D5637AFC1D3244140668EA5AA91175
            8458109E06F6E040D6A39E8D421DBB15FCB22FFF0044DFEAD3709962583410EA
            01786ECB06FBE4790E02C1B169321712671446C97715598D1AA58332559A1110
            BBE4296AF06A19DD6CFD5CCE590CA842C26F06C21A92439366D1D7A0449F24B6
            F20EA307123D3E645C55DFD11EA980B1383236A73B301A9233DADB5536761499
            C588BDEDDE7111B1A17DCC04668CF6D1664865CB5B4F04CC9A388B7CAA414C89
            2986AEC1B5E1581522884193DA56F6C5B3EE8D128E3AA8B8FDFB57B585D344E5
            263BB7C9C8AB1ECBB11F1272409D005D91A005EC55888D71178E35A4311B1F86
            3233113E9449131B19B3EFA4BDC0A49964EB58312BE3CDB776E929EAF199CF63
            4D9DDB64C3239E092A3534C79C519151CDDD71CC476747612B74F76647D3F091
            B690991E5E9F71AB2612FCD3CB6B56F5C626D8E5C8F2942EAAB80AE126A3853E
            63B08657676AE31F8D7E0247516E25A9E460D0A26D7276907B6D4D178AD6C759
            32823E0CF91E9BB753C6C2B7DD7F173C6970739E341DE182BF1E717052B7C6FD
            C40C1E485AF6B850072E0CF910852D9615CE742935CE224F90C7481D94D46AAF
            3689E856A432B97A9F063EA0EF2BA9BFFCF0F29096204E7452830D63DC88AD9F
            6EF60A790939655795C2D2166A300A534EE62AB91EC45447B0284B48D8233088
            49226A100B2D43044159B62003350D9B2710ED442F52A62388DC46BCB9E3BF61
            471A19B1428EF0C7D464DDF6911212C503C85860738D1A02B523FB3B51C7E32F
            4C8D1CE9CA37DBD605BE66A1D1CB1F08351BB1176C1D81858EB17913BBE94763
            499DC8D4953388DCE57382D423DC2201D083C070C0A524716D9490FA43F2FF00
            8D471B9366475639C9F91176CE5BE6F88AA9829C50E56EA6E97175342E8AC953
            2EC94F77E4C9B6B12EA09F123A448D3EB032E38DAF8D1A44A904CA4B6462CDB9
            6B9B326138DA49229AB65A36147EF334951D6A564488B0A334505DED19ABCC46
            FAECE4B9D0E4FF0016478E85D6ED46ADED84DC6D55B582D76996C5C6C3444E23
            1366CE48E07D890D1E672925AC6952D6C21487CB156CB2A7F0FC86E0F4F8D829
            B1851D4B15854894477D749AC0FF000DDB51B23D2EA213A451E998BB0C5B437C
            59459321825CD44DFB5A77ED86095645AB9AA0B391C9635956C6B00CCD392A2B
            1C3737E5E7B639EA47591515702D11195F1954A26FBD447E0DAA1733476711FC
            D322A481DB50BC6F34256E122371F19ECCDBF16D9B66F9CF11F9BA2E308F1E0C
            EF0478C68B06BAA2E7C5A716A109564CA6440531CD718582E6865C86C503252A
            E5EC577955B05AC6AB55819135AB14B0C06971640CA29738216585CC76B0B6C2
            2E5C465EAAD2D6DD322D3578D18D8D1F0F770A2E07548A63E65E980FAC58F383
            AC3B85122D5EF01AC6D658CC8CB1AEE7165365BBCF72304F7E281B82630493DF
            D4ED2778F852B4F2477D61AD6AE00754EAA87650426392243AE20E53B8622ED9
            A81AC240A9B6220A20FC51489F18EC892C4504A08648ABA39443B78B09EC2568
            08BF0433D4B452C58E825E43A7391D35A9598E772733F57F4484860E91428FD8
            41B3AD94C9F7469F4FCE58ED2649A311B25E9545C93A70A174880E62C88DD2BC
            7F1ED9B67BE7354C42A6766F9FAE14CF3B25CF5B454D4A086D8F21B241671DEE
            7241134531DDB31E151487DDB58D992484353C51CD240AB00072A10DCDB884AD
            C93DE0616DA42A69D92435DD9DFCC0D858D9954E93DE174B348A9048B434BCFF
            00CD6C1C50D9436CE88064B14799A7D24E2806ABAA642BE680E07BC5F7618D37
            C72705B06AA9B4BD7C7B49DA7EA8639153421B08E2D31390512DBC3AF8E22CA2
            793D5922519C9CBBA1D1C7549731AAD0C68C0635B060956D2220C5A7C8673ED7
            6F1A45784CEA7A05DEC14F0C21049E7653870453653A51D30067C55AE0324186
            DDDD531B66AAFBE9F072727E9F876DF1F1D8FC9F4C330EEEB782AA715E79BA2E
            71CDBF1F1CDB6C422A621B1088B9BA2A479E68C9F1D3AE2DA85C19A8321A5497
            BDE162F44B622974B119DA07A39A67F165ABDC66DE270AE2A7F2FA3937BBD448
            8EB4246568869D819D19D6349034BC89EBA5B4EBAA4BBA224B7B1892ADCCB85A
            FB4B22DC5778F3E25191C4488A0A813B8B8CE423A7AA2374A49EABD619B0F584
            8D495558E4D4ECB5143ABE53DD0FA883803181E31848F721169D1473D9246A47
            044F79200391430F8459716112D2E43206D9636B87AA63461CAD4249659C69E6
            659ABD1D8312931867B56109031E183B1E26758863E65A78BD01FC8BEF9A8ABF
            74B08FD2554CDB17F474F2C490232147CD9CB6FC7B66D9BAA62173BB3745CFF2
            845427C495AD7A9242E9184C6904D46B1FFD168F6EFAAD11A39435644D14CE76
            F655069D74CD2234A6AAD191E1B015E28C01B183634DC71C573B1DF5670DB158
            AECD5B115C6A7827A89F751BC91BA0480E74BF69C6694954FEAB2D7D108E3546
            8374BC2AC2A081566F325A31AC42495E038CE54900E0CAE54EC6C843DC31AAAE
            6A39AD912900DF262931C18CE47C502A3A08D53B1A32CD90CE3647429930607A
            36135D24AD4DD6A637BAFB651C1EE30DBC1BF967010C1BE83B2B936CDBD2657A
            487C51BC439ECEA31248CE33CA6810271C8454DBF1AA66D9EE988454C42E7667
            B640B12D7BEBB5A8958CD430A4B26CBED93A943BB6DE5FDBD212123DADD9A30A
            2D5DE16C4EF57F3567246B36CE388DCE9DF1448DC73DADCD4FC8A3A8B10DA0AC
            A5F4CC9D7CD1966590E43E344838E8EC1A5CCBE7463D635E78E24AF9F103052A
            E6323A91DD8387283350A92C2328C86F05D52242A064248BD95A965B2557EA80
            9DCC9957604911E085CDAF048C204711B24108C9753238E2AFBE31BC9C20186E
            871FA59147CDF185D688252BEAE22470FE654DF35157EE9600EA2AFA6D9BE3C6
            D230614664A0F782BFEC63B7E1F18E2F1B90CDDB36FC7B67E988454C42E21133
            9E30C41BA6599268AC2B4A575735D0E7548407891A1062E71C63310788D6A629
            58DC53B973A5E454899771C4D8E32BA2CAAF33887B994D8B6007966051924B96
            04971CA367C4742DDD441AEA2AD62371C0403274E483021DDA116BA4A4F10A4F
            DFD4EDE32203E3022D79DC04A61B7C4A48C39726109244F8911D7765508B1EC9
            46EB1C20BA2B6C1FB3932240748C8B1102CE39503FBA14DD69A2F648626C9F9E
            703BC57903839CDD9571537467214B7378BC115D271CC51B9CD6BB36D9274022
            BE16FE3D93CB1DF5D3DD218E7B11ADD9FF00936CFD3392A634B9CF36C562656D
            C96BF226A18E668ADA317127E779498C8CF7620C4C546A27A6A339E343BAAE4B
            58E66F0990DFD6FB35EC9A38C8C8E8350E348D45D2E362D3D34889A82B6268F8
            75E4B3963972B57D83D6C072BEC525CC60C216A2048937521AE204B0CF026462
            B2BED13E1B4AC1A5769C072895B07CB089F10902B4D1DE0AFB527490CFED2565
            7F7A8808346A63E3F08D509F50729637503F60A99A860724B08FD445F4943FB8
            AFEE1531D63CABC8BD6E31146F512A3315324C6F2870EBDF10C71F606215E23A
            3D71668FB136726DF8F6F4E7B676635DBE260CAF1AC7BD911DD1757832F356CE
            986ADD296B20AF94203436916424EB2957248E27CAAC3AED25E6E81CC94A6357
            1B947E2BC7668C7A04DC67D7511254BD2C19160599122AA6AF477C4CA9C1CD2B
            B2B184EE19BB431DB16422A488D8EB633B27DD46B00BFC69C15092496DA3AC86
            886843EA03EF2A3894A48A0408B228BB4B65F48EA5BED5A0531A30FAC5FB19A0
            430AF60AB1CE4DBD24B790E19737562C80ACAAE333E900FB22AE6D9B62E7E986
            AE19B18DEB4B1675BEBC9B88E6709809ED366C98ADF55FC5D8A9886C426F9BEF
            88BB282EA647C3DB1261A24D186C2B4CC8F76BFC95DDB572326AC2115F611822
            2C47AF643082B453D2159C6D064EABE8EE0C5B88F1E2E9EADA698D336CC02930
            8B45BE47A06F2EA609A167B45D0EC3049A3A5871DA52D369353600C1D4CE2BA1
            40B784A5D3F613B2C9595D18E55906A689F57F84CAD0716D92FD558CFA34FC6C
            4FD92E6A283C9B631FACBE9E2F026DCD205AF434A88E74493D584FEAF936CDB1
            5A8E46C760D5C9C984ED6495FEA74A209D16536487DBF37254C69B3B117117D1
            15CC71271C85B590EB328538B5AE10DD3E20F84377931180EB2D119615E5FC54
            9BA824C379EFAAC3F0DBD7B769451384F5CDB756C5709696D1C289097CC79088
            01CBB3E478A4DDF22714EAF98E693555BF98700D4A4882E806F9158A5231BC1B
            60BC8F51154B95F1BA03FB3980ED15E57F173DBC573971CFF2F135D889B21DEB
            1D0474903F9F6CDB1511D9BE4E8EE382AC4E0C7968BD102C8AA6ECF7430D5DB7
            E5E6A98D3E21931151D8ADC51A2E3A23556409E5085A782BDCA56122AC13DCFF
            0053E241EF9773531496970D9374D99BE1904AC26213740DD92A6554EAE83332
            E6D1AE190C663E88EC5CB718DB1EE2FDB1A139DD8FA487C9EE76D9CB7CA98FB2
            678FCE469EABEA6A7ED1735057F36D946EB7E1DBC87189B3DEBC51AF6BB37C62
            3513D36F9F6F5DF159C99F08708AB96E8A32D31DCE1B8DB3193639738FB7E4DF
            18754C43357376AE2B17D1E26BD3C6FB67BA9048314702736B34DD4AA6B88838
            F6EC722A63D37CF7EFBC6A31E290E1E0EE4ADC6EA476D51AC2085B69AB2AE5C1
            9B23BCC0176921850005C8E2EC7847D4C54F6A4A5C10D06DFDACA0A187775DC1
            CF671554DF1DF4113EA67F43DBEEC6CC6B48F4D97F16DF22E4A86C96912078AE
            2272195145222BDDE3C99E91723CD049C56E6DB7E4DF1A67370729BB35C8E5E1
            E8AD45C198E1C377964F96C1090EC5CFEAC8C66C76EAB694D8D67B6D898AEC21
            7E94CA483CD5C8A9E9511B1132BE379322305043FDBDFC1EC15947EA26D92C7B
            2C52731C9FA5D10DCF2E02E19C0FEE07E7DBD4B04465689043B3076C5AB4564C
            DD51DDCA98C72113862A7CDB66DF334AE6E24A5C6BDAE5E9C70DCDCF6C78184C
            1455013E31263258589EC08F88D60FABDD51A98F726358A45834EE22B11A06F3
            C1B7B5F0C5D23FFF009A083C07FB8923EC65FC0EB7919C1CAD4723048353B398
            E2AB99265B771C07A2B7F61B7A6DE88BB62804E7AFBB93A917C96188F5546B2D
            5CCC615861F1F9B6FC0D2B998D9AF4C6490BD3A184C7C778F155531C36111F5C
            17E3A9199F01660E942DC14210737F5AD1FDC1FE9043E4488A2EA17EE6F20218
            5671B839531D2783DBEE9B371539363447C694BFAFED36CDBD11AD6FA1A1707C
            64FB27691C1158C8093745454FCC8AADC64D231567B0AD0083215690CB8FAA94
            3C7452B7382A67E98AEDB1177C6265727BB13DA821FEECCC423350577590E251
            926B3223F76D8C8244C852BCA1EFEEE4FDC6DEAE76E8CC0C578E4494FB939DD3
            908E5362BBEAFA7158A9F9992483CF89C84C7591DF8A673B37DFD11719FAD726
            471F6BAB81D41FDDDBC2F2036D1158E2339B00EEB3CF0F7C7A97280B68D72C6A
            69AF92D7AA331177FDCED8B8D7B98AE5572C98C925911FE2B09FD73BB1A56581
            125AB9339355553F3A7A260F2BFF004A28DDA56A6C9FBB7A724D455DB2C888A8
            F3C272119EE37274C8F628E237C5992C5DD1A9A439B25DF4B0524655FD96DF8C
            C0EF6FC35ED94B966AF148AEB02F6F2DF14A3E49EFF99303FAD6B37CA58BD21F
            DECD88D903B5AC7442CB23844ED1132457F760C6E1B668B8142FE63971DD1A73
            7EE317781649EE9F131A113DD36F45CDBF6FB62EFE922132460AAD407CB3FA25
            C399B915FEFBB573866DF3A627A226F9122AAAE9FA857384CE0DFDF58416C91D
            BD3B82F2C26E200CDC6F3542461153C550367879B61AEE1BA83D8E844E71EFE3
            2B4F5C4ED876135D04914ED960FDB6DE966E56478D6C56B9ABC9BEDBAA2A7A48
            86C9183ABE92AFEB9BE2136C456B97A176726DF2226231570715CFC043D9D4D4
            4E23A2C66819FE824C0648C99A658FC36945DD74B3F09A70A2C246281536C701
            324477107142E0ACD0A1E3557D196F1BBE251977592BC05067790FDBF6D669BC
            4FF317DE35D2AB12BED79A2A7BB9CD6E7EBEAA9EA8AADCEE73B1365C1811F878
            6C008006B98834DE2543E5AD569C416023B429FE8B6CE099D4DC74763924D308
            B93B4BB5D92B4F9A3A9045163F6763A37B782F139CDE68012C694F4E6C0BD615
            8BBEE33E2068929151EDF6DFF6466736C987C321FB02F9BF621442B9FF00AE49
            AD49208D2DE393F26DE9B63132333774F7EEF6FD23AE029E453C068428DDBFD4
            F145C24461325D088D93B4AED9269CD1F151CCC51B70B5E845E3C32CA0356445
            5FB17C0EB95585EE8378E7C72544A5971DEE46222A3BF2EDEAC5E2EB2614C905
            8AC8F73ED1E35DAB62B7DDB78678840FEFB3FA336F911318991938A35DDD31D9
            A6ABD5CE133837FD62B11D868032A4CD3632E4BD2EE661AB4D1D5E8B8F00C8BE
            2F4658C643B2B9A814B88DE446A1738079A1EC8D5D248298ADC4903577E55C45
            54F4900F244DAA7C670D366EA04FB61FEF0BFB5F2A60D3DCEFE98B01B90C0B24
            D470BA03FEC1C34761EB046C9BA6184C99A708152C43031ED4763A235AE20978
            0C3D065FA9B29AE14D0BFB05648916557954F18E640A30AC27E3764AE4256239
            448DDF15153D25446CB61295C37893617CAD4C0A7BD93FDC29C01A66B792807D
            6CFF0065B63C0D7E49A51192769745C954068F8411058F63099D393EB95EF89F
            482F82AE6511766CD1F38F5EFDE46D896CC6186E42B5536CDBE654F640AE113E
            D8976715D88E4235CBC1AC7A3FE762601BEEF5EE95001E41E9212001FED95BBE
            16230B92F4F8CC9334AAA648A73C75731ECCE0D5C910FB981AF7453B93DBBBC3
            92C7724B38C829B036747B123C31E0D8790BB7CC37F28A61FF002ECCB295D42A
            8773853937851E4104A072BE3FC8898CC76ED0058EECD335BC942CE0CFF72AC4
            5C3578CB92F4D8C99334BBD986AC3C7C7724C70D8B926A108E1B1583B2173CAD
            FA3248BB23433F02EDB2CC9068B260C85923F5611DC564AB86997275712897F9
            399FFC889B2C3FFE4F913069EEF5E2CAC8EB2A4D1C24087FDE6D8E123B0F5633
            64CD32C7E4AD30F1E16BCF1F1CDDB1F1D844583D0F44DF091B891ABBB2F115A5
            A522BB36FA06454C77E9C5AD4DBD930D5E090B161A436C84E51DCD547C25FE53
            E46E05B921DBBF4D56EF801F5B3FDFED8E0B5F922A445C99A6184C99A65E2C34
            030317D90B1464450F5B6C01D83823EB3262A6CA9EE393FDB0BFEE2FF53A4358
            44723BD0B0C26C18BA47EA98CC027B5745F264D2C340813FE0F6C781AFC91523
            324DD2ED764BD3A50E1231419ED9E3B3975AA3C8CE0467F68E9B898BB11DFA9C
            48AE84BB9D7F46DB0B9B1C8467C8C4C7FD01D3358AAA067067FC36DBE1233089
            2A8846C9DA5724519E3A9004163BDD1C1F620D7ABA9CC5C9BCB9C04D89FE2C07
            D64A75DE17AB702DDD411FB8D470FA009FF14AD45C2C219325E9D19726E97733
            24551C18AD733158D762872481CF58CC5693240B93EB5BC23FAB1322B3282076
            942CE0CFF8D70DAEC3D608D9374C30992F4D3C385825067BB55782AF4ED8684F
            458ADE2CF5626400A91D4B090004FF009054C781AFC934C23258E97C99505161
            63918A92D533EDBD144A99B623557022555D3D5FCDC267067FC9AB11C926AC67
            4B4D33932B146AE80ECED2873CBC11486754D53E412B2024517FCB3C68F49D48
            3909374BB9AA6A93873C02EF02A4A57D4562461A26DFF32AC45C58C25CF0C18D
            8E36FEEFFFC40036110002020103030204050401030500000001020003110412
            2105133122411014203206233042513340506115165271243443A1E1FFDA0008
            010301013F01FD76B153CCEE21F7991FE1B04F02697A3EA351E46043F8791133
            9E65959A9CA1F8DFA9EDF02358CE7262BFB45A6F232A217D457E60D59F783540
            C1A84316C56F1FE07A376CDFB5E6368E269EE4D5676FB4D5F474D46A0B6E89D0
            28FDD0F41D37849D51051A96AE6C46F68345B86E5F681AE5F4869F39628DB62C
            B751BFF6424CCCD3A8F24CDDFEE6E23DE77277D7DE0707FBB6708399A7D5B2D8
            0A4AFA9546A5C9E657A84A2E201F306A365FEAF12DD4BE70B34CF61B7F99F885
            71D4089D2FA50751659EF2E0BA5A5D157932BE9F4B57B9BCCEAF5D6028A961AC
            E3389A6D19D436C1E65FA5EC12089B39E2762F2333E5F54DEC66DD527ED852D3
            C91393E62DCC3882F23CC174EE2CCE7F4B43D2EDD61FE04FFA72AC7DC7335BA1
            B344F87FAFC47BD13C98FAD361DB547BB67FB307799774D06B8B7A5CC6D4359C
            AFB4AB76AEA0D34952B7F53CCF9F4A4610733ADBF73584CD05B5D7A651BB93FF
            00D4B7B484FA8666EABB990C31896226D0CD832DA74E4627C9230FCBF69D5956
            BA15517933A574EDF59B98CBED14578C44D4A30E0C7E7DE1A59BDE26955FD2CB
            2DE9683958DA123C46D3381E20A17C345D1D6DC6E8DA3B2B3E98C97A7913BC57
            C882F533B8B323E2A32713429DAA154CADAF36B6F3E99D6AB5B34E5BDFE96754
            19696F5045FB65FAE7B3C44AACB796F10DCA8365734DA6DE72D3EDF47B474EC5
            DC7BCD3D9B2C04F89A2BFB43FD4BF525572B11F2DCCEB03F3F745B581CCB7556
            5A4660D45A3C19A4D4587D261B0C5D5594FA94C3D49EDD4235BE04655ED6ED3F
            D8D35F7177DB3C7880CEE3AF833E6AD1EF34DA9776F5985166A4322F118D9DAD
            D8CC4A95972446D3739530A5DFCE65F55BFF006C75DBF72C723DA6F23C41734A
            AD6633A651DFD4ACF118FF0013AD6AC93DB1F409ADA6C63E789DAAD7EE79A6AD
            1CFA06442AA8BB4CAF442A6EE79815739840F3356FBD95562066E257A9D9505F
            787564ACEF907335E87518713E5A2E9C0894E0F334F5FAB004B34C520D3BBAE2
            2F492CDEB32AA9F4D4EDA8CBC92F96F8E099DB334FDB5705E7734960F43E259A
            62CB953986A651C883447B7DC3C42983E632FF003310A2B7B47D254FE5659D2A
            9C67C4BC5153611B306B1507A44E9FD6DF4576FC4D3FE24D1DFC3360C7D756C8
            5834D4D9DDB0B7D3ABABB959C479A6D70A6A2256E3535E60181896BED4C8965F
            DD5FE04AEF6B5B6572AFF50FC3889E9308E6187D3C99A43B8EE12C6C98832B91
            0A9CCC626A3FA87E2274FE914D9A5DE7EE32FF00C3DAA4E5798FD3B548705213
            7D3FC89A0D5EAECB02E7225AB53D611BDE3F4CD391C1C4AFA6558F398FA3AD54
            C6D112E10711A8C033A83F6686CC6C8399B8C4C1E6033E66CACF0651A90E3EAE
            A1A7ED3E44D93A6B953B0CB6CEDA169DE6B57F33812EB5ADE0789A12EAF812BC
            FBCDD0C0657A4BF51FD35E23F4CEC01DF3C99668542E4197E92EC1C0CCD254EA
            BEA189B57DCCA6C544C196EA768F4C1AA77CE63F9E66C63E20D25867CAD89E44
            E9EBB34C82638844B28AACE1967FC6E9878188FD251BC399F22FA6B81B2CE277
            500C08EFE82D3E6D4B36E1E60D4565942F813F10036A66BF1184D82289C8F10E
            4CAAC28669EDEE8FA75B5776B9B1FC62693477D8E0D6251D02ED460DDC08BF86
            34B8F5CFFA63A70FDB2EFC35420DD4C7A8D276B4C4AF416D98DDC09A7AF4DA6B
            30CBBB1E66A3A9E9F4E30825BAA6D4386B21ED1AB39C18BA8ED1C83C4C8B86E8
            6A50332D45DBC7985491CCEDC3567CCFB0F129B80F30DA8E40025000AD447B15
            572636BE9CE161D554AA1D8F995F50A6DB9AB1ED29D6D179DAA675362B7208AC
            E5A752D63696889D640FBE53AFA6DF78CAB65644D5697169511E86498304E230
            06696BD89F551D3351AED4EC4FB6687A651A050ABE7E244DA49E26AFA3B5F7E7
            30E80507F2C64CF933DBEE587C4C96ABFF002635362214794E87E6557B717A50
            AF06C96748617E49F4CD42A55E8585BDB31ACDBE2163399C9854CD3A86E2574B
            5762E44B7AA2D1A94D389D67517D5AACB789569EB745BEC7C4EAFB16C4ECB646
            6771E96B089A2DBF355B573A92936068BB40DC675E70F5008632C0594E651D4E
            D452B1F50FBB31750ADE66DADE1D37F11EA6594694B9DC7C4000E07D39C4E875
            AAD1BD7C999F88E7895D58E4CD4DEA1B6E799AFBCE8CEF5F79A7EBADB4D778F3
            29D4050531C7B4D3EAF4417371C98DD768AC6DA06625F6DE7B969C09AEBD6EA4
            35665CC49952967968E6621007981D41C4C06113D0D99A7B1AEB944EB74B69F5
            5DE1353B3A9F4E177EE134E0EAAD4A6C3C4D4A76F7283E0CDD9B7C67328A2C36
            28AC7FF935167E6ED63355ABE4D626A2C535A2C64432CA27BE27CA92332CADAB
            3118CEEB625286D5F547DF4723C4A351DDF3F43D8104B7506CF489F856D6351A
            98C3534ED345A3F98B5849ADEA75D0B85F32FD71B2C2E7CCD46B5AD508D0DAB3
            E6408972337AA26A6AAC7E5C7D55B6F0C789A6BF6214963E4CD200ED2EAFB7CC
            5B312D3DDE04AB49EE60A0086B412AFCBBD713A968C6BF4D8F7116DD4E9B342F
            832ED3D4952595D9EB113E5704DED9262EBF4B49DD52789A7EB3BEDE566B3D76
            9DB08DD6159AA5153059E23BED5C98BA7DFEA801513507D10710E49C4A176262
            6AB1B269FEF18F8DDA915F02176B4CA699A0BDB44FBD651D72861EB9FF002DA4
            C7996F5DA147A66A7ADDAFC2CB6F67E4C2732F7F69A5D3B01DC65CC6D25561C8
            389674F661E83980BD67895D9BC40D813CCD2BED78F9B393366E312AC44ACE79
            87038861629EB96F55D4B70A63D85DB7987D5E7E2A769CCBAF2EF81EF281D943
            67BCD43EE7F5C675511983903E3DB6BBD0825BD3F515FED32BD3B86CB09ED355
            6EF6C4D257839F85ADB54999DEDCC4A3F88ABB47C37627726F9BBE0C7022A927
            7113A5B528BEA39632CD10B0655276ADA5B810AD761DAE26CECDBB04E60A58CA
            E9756CACA41FDD2E22B3E26E66F10B3AFF00E65393CBC6B157DA5A77AC6F3F47
            137082B36636FB46B767ACFB78965FBAC31CAB799DC0381058677251A9EC59BE
            275C04732ED4FCCB6E13536769220DED2818F838DCB8960DAD2BD53244D68F71
            3E6F2DC4CE46678F88E7C4B4141CCAB54146D61910269DCF0713E62FD1B70770
            89D4E9B9978C7F3FC4D62D42B2C83CC0AC6CCCA460E4CB772F812ADCAD28B7DE
            38CF26227BCF4CDE17C45F58CE235791CCBD7B666E332660CAF4ECFE61D3AA4B
            59AA5F4FBC6D3AEC0E3F89729562D1ECF680926062B16D9DCCC6F6C4A5362CD6
            F2B34EB911171F1D52E1BE392257A8748BAD1FBA57A9AECE253A5EEF83069ABA
            06E633A83775804F115360C1F826A5C7116C4B86CB04A6B27D1E65BA74494697
            2418F804C5FEACC6C20CEE01CC36EEFB66DC1E6171ED16C73E2738E6390C799B
            526C4FE20A8EE9923D30D6C7813E4188F519A8FC9A36CBC174CC7495E0799730
            C7137912B63E4CD38EE19FEA6B2C1F689A54E3E8D5D64F2210479FA3CCCE257A
            BB6BFB4CF9EB5FEE689AB1EF3BCAFEF399C4CEDF129BFB232B0DDDD1932AACEC
            DC78131437DBCC634ADBB944F99471F678839F58F7801CC29EE4C6407C995E00
            C032DB71C09DB279020A3317460F31EDA50E25BA80E78897E3813B8C0EEB0CD6
            DDBABCC3E25DA70FC88D532C3364AEB2C702535F6D312C7D8998B9B5F32A185F
            A311B4F5B4B345C6563AEDE3E9C4E607222EA5844D5FF312D56F134352EA320C
            602A79B2CD41013ED89A3AF4C33BE114F7BFD4FF00D22A4EE28C28963622D89E
            F354F9FB2546C2B812AD3B1787B8BE913A568C6CDD6799AF45AAAF44D42807CC
            AEA5CFA9A575B3B61045D20AB96E66AD6BAD3912C721A3B6D1982C172CF9546E
            4C3A74F6955201E3E1AEB4FD825098117C7D7ABAB9DC26257477635783898C79
            F8E262620623C4AB5765272A655D5DD5B360CCA7AE52E9B57D305CB672A61C6E
            9663B62705D676B718349EF1AAF46251A328724CEDAFF30115365BC4E9FAA564
            9D4AE515626A9477632AA1C4A89A9445FF00B9CCEA9B3B4A44A40B98878FA652
            3830E9F8DAA62E9DFEDCC5D15689EA30A8538596304524C5FCEB726569FA0EBB
            8623A6C6C188CC87222D855F7309E87B327C4B69C3711E865E6631F462626657
            A874FB4CABA8153968BD5EAB06D2225E8EE0832BAC8E66617FE26E33BA83EE68
            12BD68DA87C4B69F91A3D1C9C42F7DA41265BC1E651A1177A90F31AE3D9C9E63
            AD772FDDCCB77AD251A13B4604DCE07105C4798BA8221B59CC775AC64CD4EA3B
            BC2CD32622F03F47595FB89E25A11E80DEE25BA0AFE57E62A829B593BA3C46D4
            6FAF0666B7AB9F32BA45AB9F79B198E161047D3899C417153E994F55D455EF29
            EB757FF3087AAA59FD28EF6BFBCE9FA2B2DBB360E079CCA74D5D0E581F79D52E
            409885DB7711B9CE60CA7DAF881B750367B4A751DA8A86FA5D8887833388A379
            8DE88BC2EE97DA6D26227A669D73FA4EBB8623A953B4C561B70669F52C2B351F
            129BD950D70F9F82BB278955A51B718CCAF64D422A90563E9F6AEF9838CFD389
            E207C4D36BEDD336E432BFC4B66D22C1983AE69AD5C2F98DAD16FF00B9A24EEB
            123CCD6D4CB57A873150301CCE9DDB3676CF887A5694FA809755E8DA825AA031
            C88DB60715F89BFBA66AACD8BB445E630C281285DABFA7ACAF38610798CA57C4
            0761CC6F3F4E4FBCEF129B0CA1D361065558B5F12CA4A36D8F5B279FA7104C98
            B7327DA669FACEA74E720C6EBCFAAFEA98B65760E0CD05A2BBD70657871C4B8F
            6899AD1B2E23DA1F33CC5010666A2CEE39942E6575E7CFEA32EE18962947C473
            B944C65732C41B030FAF1888C50E44EE12DB8CBEF5B1302575259564C4A8B9C0
            962153898C7D1898F80623C4A75B7D472A668BF15DD40DB60CCBFF0010D5AC5C
            0E26A6CDFC8998A31C99AAD42E36AC032652BE2018FD5D5579191172DC081CA8
            DB108D9B7F4B103328C094586A6CCB2C0F66E972565372C4D29B172B0D673B44
            208E0FC333CFC71F04775F067CC5ABEF0EA2C3E4CFBA52B2A5FD661B8623AF6E
            C9801F31EBFCDC08E9B5B1FA989CF894EA0D43134F662EDC66B5D2C3913E4F7A
            6F13B67DA72267E00CF3F0C4610094888303F5EEA85832259B81C18EF91C4B0E
            76B09701F7096D7B7188519793FABCCAEE755DB34F6AA37AA6A7B6E4158DA405
            37085672203F1317CE2696920E5BFB16A51FCCF934F68DA438F4C7470B8319F2
            983376FAA0AC3579810B0E273FA4669555EA82AEE58565D49ADA0B2E55FF0053
            3F0C7C0A98B512712AD22AF2678FED0E0F98F4A347D3151E98A1EBE0CA0E0906
            53B776D3057B9CAC6428710CCFD7D3EC45521A27FEE275155182B136350388DF
            71F88E61F69A75DCD07F70403E6369C1F11A8656DC26595F74B181B3709A9030
            08965585DD363633F569E837702146A5F9F32EBDAD5DAD29B9057B4C7FB891F1
            48393295DAB9FEF0A2B798DA453E23D560189BBF2F6B4A7942254818ED686BFC
            CDA23A15E0FC74CFDB69737E66E968DCBBE255BD3221E38F8ACD326F6CFF0080
            6A95A1D363ED33B4F536E85897DD35073868CAA69CCC4E442731AE56AF64A0FA
            712CF3F0104A1362FF00836A95A3E97778877AAED9E04CC6189DA1B77450C7ED
            87CF3F01E650996E7FC3601F31F4E8F1F4847DB1D18799DC1DBC4D37996FDE7E
            158CB4A936AFF8928ADE63E914F8843D2616DC73F0D355939FF18CAADE659A25
            3CA98BA123C988028C0FF39FFFC4003311000202020103020405030403010000
            0001020003041112052131132210203241061423305115406133425052244381
            44FFDA0008010201013F01FDF4A9ECFA4434D83C89A23FE1DAC020BC6FE4C4C2
            377B9BC4AEA5AC6963203E631C7DE9A7E5B1EDF11BA729FA6374F71E21C3B47D
            A35162F91F0EFF00DFD9BE3DA6F66580D5A305C42C392D2ECBB7FD8674866B30
            94B7987B43915A9E2C61A6A73BD4FCA027F4DA26315EE4CD7C326C3BE2A2141F
            758D4A34FCAFF061C4B3ED0D4E3ED3BFF7495B3F813F2C8ABFAAD1A825F6B191
            9D25A7549D7999393673E3319DFD41AF13A4697104CEEA56162A9E206F51F913
            1F36C0DE7B4E97637362E67AA9FCCCACB142F2129C85BBC46E207786DA3646E3
            E4E2AF933D6C47FBC46A7EC6690F611F12AF263E255F669F933FED31B16D5FB4
            28C3C887B4DFEC3D8A9E60CA111C38D8FD84A2CB3E9113056A5E7799919BFECA
            7B09DC8D98877E622FDA58AC96106598881B9997595E3FB5274162D80099948C
            D6B76ED1599978EA1DF1D1139B0F116F75FBCF5C9FAA74DDBDFBDCEBB9CF52F0
            AA61DF7E5859762B06EF2A013CACF546BB769664DC9F43C6EA8E8BBB3BCAFADE
            30FF00536251D5316C3ED7832C1EC8D3F32C3CF79EAA37D4B38E3B4FCA237D0D
            1B0AC1E21C7B47910A91F6F92F6E4DA8DE9F0ED31C9F1F2A2359D9653D36C7FA
            A53815D5E44B6FAF1C4CBCC7C86FF12BAF9F78C47D135C5F51C95F74C8BF934B
            3215D784BF1B8A0733F0D372C4EFE23D35D9BD894E0D758F10E3527ED33F12B4
            1B581107DA25296305D44E9C2AA8AA7933AA3D9E8B2BF99D231FD2C6563E61EF
            E6100434A3F99F94AA755C15FCB31AC779FD43214F1633A5B559D91C6C481319
            B2CD2B615FFECB6DBF15C8AEED895F57CB43A64067F5EAD7EBAC8329EBB8F67D
            E5794CDFE9988F98E7B788B5EC7BC46C6A8FDA5F89522EC473A11BB9804A5743
            E433132A8A57BF98FD5AB1E23F52B2CEC8259EE1EF312BE3DDA05D7D31976790
            969E56769E872505A1C4566870120C24D7133A6FA78A9E9CFCFEF604B3358A7B
            664E51DAF197E4330F745B27E729C670F6B4CBFC5B8D426E91B9FD7FF3B901AC
            5F6CA995D79278866B735AF85FEF42B3FA257EA73712AC4C6A9BB2EA5BD0E8B8
            920F7991D2AE51E956FB8D819D5771B9EB6754BA3E236C9F744C8B6AEE8C44A7
            AEE7E3FD364C4FC5F9E1C061CA605F957D7EA5C9ADC7C536FD4659D292C4E20C
            BFA3DF578EF3F2D6A9F708A343E56F13CC4BB8084FAABB9BE5D8C73E9C50F907
            492AC0AB18727F32CFF114EA7983B4E5146CEE7DA68B9E22642103899C7B4EA7
            EAADE55A23271D11DE63060DA130FF00D051F25F96C8FC22E527DE7AC8D348F2
            DA6B03717B36E0B8F832F1CBC197E12BA9631F0393041DA1C601491DCCFC3D84
            F939C808F1146805FE3E46A91C7B84CBC435B725F1F330D19E650DA3C4CBACF4
            C7695259947531F1D7187897AABAEE587ED3714EC43BF119D17C99564F2ECB17
            277B066258A6C04CEA0E3D4FE616B078133F01B2ECE4B313F0FECEEC313A663D
            20701175AD467511B26B4F265799559F49990DCAC266E6E0B08F13F32F0647F2
            20B5187658FC8B4CCB3D3AB6445CF525830F32BCAACB2A83D84FC2B9340CC7DF
            93F13B83E0E81C68CCBC7F45FE571DA713383A7B986A5D9CBBED13ADDC8355AE
            A1EB9967C995F5AB8B7EA18B6071C84D18B6E8684BB932F68B8CCDF518A82B1A
            58EECB6682CAC13F7960666EF36A4F12D2B003769C82789EB833D61E27D53A95
            2CE9A59818ED4772636F918A099E9182B624AC34B05E51AA651B3291ED8088B8
            74661F4EE3A12EFC1F4D9DF16D99BF86F3B0816E3B13A79345C1BC19D3F29ACA
            433C5707E1AF819D42DE766BE61998F8D41761DE65E7DB9677BEDF05EE3BC3DA
            79D4C7C9E15EA7ADCC7BA25A37A137DA6FBC6B789EF32AF661B12ACDFD1E3AEF
            2A776EED0EB72A41A9C42CEDBD4254798B60970E50AC4C7E559798B5A1AFFCC6
            67D95513177DF94FA944B3E820CA88F135DF425B67A52BCC23C198DD56C5ECDD
            C4FE9D85D42D1728D18B4285E021A38F880BACF57F982C0664E62543518F26DF
            CA3FC4EA1CB9F130FC366798892B531579AEE7228DB88E1C4B6B76FA67E51DBB
            BC645D711DE227A6DC4C411FB081F51CCF518B7B632BD9DF539146D19CCB2C2B
            A5DCC460E9C22EE9BF8C2022968877A31871431EEE4B3D1247212AA081C8CCBC
            17C86D896E05D51D895DAF59D19D0AAD53EAB439E81B8CAEF4B3C43A9A12DB85
            4DA138D5903444CBC334771E3E4AA86B9B4B31F096AEE7CCFC458C398B4420CD
            40B00D4A692C772B4EDA8DC6A86C13958ADB5329CE603564EF78F311129F1E65
            D5FA8FCA28D0996FC5261D9EAEF72EA5987698F57E5CF2699396E46AB9EB59FE
            E8B9164AADE49EE94586AB37182D879C5666246A373EDC67A4EFBE465989C476
            3316C23DA61ECBB8FD4ABA8F7953A64272596F4C5C970A20C85C44142FDA3BF3
            6266226DF7BF87804CC9B39D84CC22C4CCB00D477F1C6C26BBB9F12AA92B1A12
            DB16B5D999B67E6BDB2CC0707427E56DFE20C3727BCAF0808B509AE226436C4F
            C91BABEC750A6553D8AEE7E678FF00A83512E752352BB3989AF866525AB94815
            76139F112EBBEE66465687B220763B3387FD8CA086F645C751DE2E9606E3E26F
            7F032BA42FBA5AC5BD823F491637263302A6C652AD31F401B2331277FCCD4ACF
            020932BCAA9876696BA942019C7DDA9894FA69336CD567E14273B008A3D35D47
            C915897E435A62C3FCC22709AF858FC565612C7E24CB836F4B059FC99918B5E4
            A7130F4E7A7DD5B4A1F737FCC3722196DD5B55A32EB054D2A26C5D932C156BDF
            02D76781DA64376D532B4BDBCCC706B6D3443B03E6E7A595273687156CA7FCC3
            572F6C15141A8527A7A8B57AABA9F9220F6847A0BDE61D5EA3EE37B04CD7F6FC
            2A6E160314F35DCB31859DA59D3587D32BC0509EEF31948F6CD6BE24EA645BF6
            9E8D9637A887467E773E9ECC394C5C8AF313DDED33D171DC186E2BD9A54E394C
            9B180D2CA51187BCCB954D7A132E82FA3B8320D238A4390F61DB88B9E2BEDA8F
            9A2CEC225C7CC3922BD3998972DB58759CA6E7210BFF00103132B5E47DC62370
            62B06772C7D4A1E6C4D6E718BEC959DF73322DF51E6076EF321B5DA5F6F33AF8
            0986FCAB1F1D4B31D1FED1FA7FFD65D8B655F697E52D3F54BFAA72F6A4A9895D
            B4A5014EF3827F12CE9F539D813D0BF17DD4B76FE265DFB4E44779458DBD4B72
            0869B6E3DE107D0DC1FAB5EBEF2EE55D9A30B111FC6C082BDF89554E4CA56BE7
            C4F79457E980042A61D89B5D41DE12165BD452A698F60C8F78FBCBC2D202FF00
            312C2A62DFB8B64372C6B235816AEDF0C243C366675B3CFC7A7DEA0713077F97
            52EC2A2F1A7596F43C761FA6351BA25A0F9DC38FE88D6A69632EBB88C77E6642
            03E4CC743CC98D53D8DED105074394E00D5C62E3049D471496DACFCB9E3EE9E9
            D6835B8B92B5FF00A75F7970C8B5B930981D3787EA4F5154773DE365AFDA0BB9
            4452D1175B9657C84BE90C9C156605652BE1FC4B5B936CFDA327DC4F13999CE0
            604C66DF694A7A8FA109152711329B6FF203A89996A7DE57D4FF00ED15C38E43
            E76AC3798F855B7DA5BD3DBFDB2DC2B1477997571940F74F656371B244367E9E
            C44BCBB6A64566E527713A7BB1EE6374C2B30B156A5F78D996FA284334CBEA14
            05D2F994A5562FA9AF32E7AF7A412B3BF32B62217EDE25AE147BA645B65BDABE
            D3A73D89B527729C64B10ECC5C45238832FA063A1DCADCD8DC54C6A8A76DC5AC
            56BB3E7E1D3A9E3FA865EFB3B12D3B73F3F4EBF90E0608F6FA703EC6E0EFF371
            07CCBB069BBC896F434F354CAE91961B606E5B4BD63DE27FE998A7DE637D0D2C
            CC4C7D6CC7EB55723A95F5576BB913A1333AD5572F0091734D634AB316D6BB18
            15F337E933073DE53DCF69576137C8CCABCFAA4466B6D1FA63B4C12492B1EA6C
            751C7CCFEA1754FC488F9CCC34E2265255DC08B6861CE025BBCA6BF51C087F4A
            BD09916F113CFCF459E936E56E2C0088CA1C68C6AF6BC419A75ABB7994BF25F7
            44B95FB09B1F36A598D55BF52CB3A5A38D0ED1BA25951E4865D8AE951D89957D
            5F495EF1898158C15C5C1C9B7E849D36AB70ABFD411A94C9C8E644538F57B444
            60DF4C6B7D31DE1C736E5F8ED3BE31EDE2630AADB95E5351B2D6623B4B31E8B4
            7BD7C46E97496F69D4B3A456C7BB43895509A12BADACECA26262FA3DCCBDBED2
            E7E6DFB3D3AFD8E07E081D2F3FC195F50B8661C4B7FF00905B586F4CF98B8E16
            CE4B38BA5BB1E25B61A9842C17B99B137F2EA322B0F74CDFC3F879677C746657
            E11B3FFCED2BFC326A1CAF2655858B40ECB2CB15574919D9C68CA176DB33D34D
            6C88343E98403F5441E9DA4B4C8ABD51100C63B595754EDA61132EB697E6D74D
            7CE57725ABCBF999079D9C165140A54467EF335F889E7F66AB0D4FC84AD83A06
            10F9DCBF1C3DA2DD7797520B2D9F783C7C1943F9962735D40A55250E4EC344C8
            0CFC2721E3E5F3350AFF0032DC4AADECE259D1D0FD0659D2AE53DA0C27ABB933
            2949007DA632F06D03B1372F0FAE627E658F68A767BC1DFB4E0410B1B13D45E2
            C6574FA15F99835F36E4613A80ECEE675BCDF5FB7D3EFEDC0FC586C441A1DFE5
            0003B9E80167A8264A582D0CBE25F71A9390955C2C4E716C57FA7E1BF93538C6
            AD5868896F4EA6DEDA87A4FA5F446A5D3C896AF3AC8D4E1EEDC5EF31F89EF2EA
            2C66E42560AA778BC98F19457E9A097B6A645FC7DA27F93FB7539ADB6252E2C4
            D8F813A3158F220FCFF68CA2C1C5A0A95578898D435561DCB6EB2ABB5F68F604
            1B311B98D883E5226A15063E2D6FDB52EE8A8DDD0C1D32DA8F7116BD7622708C
            09EC26262B03C9A7897BF932C6E6DBFDDE9F7F1F61F811B8C0F2FDB35ABF732F
            ABD55D4AEB2B5F1949B459C5BC4B72056FC4CE635B8083F26A719C27BBC42A9F
            713D1ACC5A117B89AD4B0CCC7D0D7EF231460C263DBEAD718EC68457FD389672
            13CF7FDCE237B96D22D3B97A1357159868EA3DF3F35C1B899C86B6603BF1F2EA
            711F032D3A1B97BF27FDFC6C9349D4A9838E42288A9E44A8900A99559CB7B81C
            1EC3F79E9ADCCC9A5AC4D21986B622E9E2E5FEA70226F7F334CFC95038AFF635
            64595789FD49C4AFA8FF00DA55756FDF7157BEC454E2FB9C995F46170A66C7ED
            E597AEE0D0DBE9D7CE517A5C36B0D74B3EFEFF002F286DD4C8CF76F6AC24B776
            FED012255996572BCF0DF54574B7BEE5ABCBC4B49D6E359C5034ADF98DC077FB
            1D4ABB599780960FFC6FF33A53B1DAB462EB947BC53ED1F1307799968443AFEE
            55D97C4AB3DD0FBA266D760D19B4B17422A715D4A4904888FEEE3390F9B23256
            8F315D2D4D8F129A12B2593EF2FC6736F312BFA7E2C7421ECBB9956FA8FAFEF1
            2F6AFC4ABA830FAE559353779ADBF258FD98196B30F72C5B3DBB315F9F8F8E55
            42E1DE528054525278BFA62597F07D453B1B1F0DC6333EEF4ABD4F3DFF00BEEE
            25793624AFA87FDE2E45768D4E238E84AD0A4566E7AF8798044A185BCA657D7B
            951DA8F8B7F332EE373FFC16CCAF2ACAFEF2BEA5F67896D761DEE6C41F05B0F2
            8E507D5175F6F813DA65DDE9A7FC32B32F89566D89E6559EADF545B51FC19C3E
            F321372AECBF066E237326EF51FF00E252D64F12AEA047678968B876306876F8
            6764055E23FE32BB5EB3B532AEA6C069C47EA6BAEC258E6C3B3FF1BAFDFF00FF
            C400411000010303010603060404050402030100010002110312213104101322
            415132617120233042819114405262336072A105245082B13443539273D163A2
            C1F0FFDA0008010100063F02FE7CBEA3A02700659DED2BF8A47FB0A16555870F
            E4FC95CF52170C3B274F805CF7737408CB8B69F41BA1F4E55C0967D511F89B1A
            DCA86D6B9BDE17BD6DCB9E94204BED95CB501583FC8F738C04E14B99C8873ED1
            E4B99C4FA941C3509AE074C7B5C1A7E38992B8B5093E4B4DE00D50739D683DD0
            8A8D4434877A21C71CA50E62D8F3522A54FF00D90B6B38FF00B9002A87AC96C7
            A2F0A87020A018F12B5FE4094EA40DB4DBECBA9B9D0C5CD59BF75E39F45A3D60
            387AAC091E49AED30178B76404D1690A5BD15B2D3EA8175847ED57BC96382BAA
            3D8E6EA117480ADD9DA4BFAF6F63C455A32E2854BE9B5DA80754C0D731454A53
            6FED5FE628BDBE61A87BC027BAC5407FD71CAFEFB802AF68E8A15C0C2CBC9077
            F201F55DFB84C7B7B0DF0D6C95C18B7BCA2ED9DFC52DD44A8D0EEE2161B7D144
            E1765A9583F75D37B36AAF58B5C3A05712EB9986E1161BE3F55A8D4755ABC31A
            35416CB0E72135B418CB884DE1ED6FFBA75B5CB9CDEE57BCA4C81D543DA01F45
            2F36AB59533FEAE511709E9BA51A6798C689D014050E5E49EFDA321A51A941AA
            F18694D8DD14863B959F79B4A7ED8E65955F8552A8F011955769DAF9838E1A8E
            D7485ADA7AB57E1F85FE58E213D8DF0EBEC134DA480B87F37651502E60AE0EB4
            8D14F164A70BBC4B224292D4D3A42F19F310ADF0B572623AA8A950C2069088EA
            9AC2CBA3AAE6C7D161E67D172BD6BF9997185CCFFECA195160CFE525C6158D3C
            57F60B93FCB50EEE46A57DB0547F640B7C2A1898CA986390AB4C72A70239CF54
            41E70531D314E21596DCD7E53A9F0AC6775C2D5C0EE637B9854766D9C5AE78CB
            BBAA6EA866ABB50994290B683170293C170D557E27F0A8831EA8526728AC6610
            A74C7251EA9F5ECB99DD4369146FA45A107369616C96D2F14DCB67DBB64643FA
            841B5E9D840DD3E0A7DD676B692BDDED41CEEC8063C3905CCC958A450365CA2C
            B4297E568B3BB01489583FD973E47A287D32B9B9562A85CAE07F26E713CC3A27
            4986765AA0414DA55B9987083DBA1FC8C930116D33C47F9222EB28FEA885C935
            F691F34C842F36FF004E14EA5005533223B2A2D7C0E1E1B01363384F63B0B2BD
            EC8EA3298EA5CB6A6B89E577650DCCF54CC76408EEA8ED3B68E768E455B68A83
            0D5B55BD8C157537126CBC994FA34FC25F738A14A8E6CE5109B499FF005553C4
            53295CC7939C84EA345AD6B9BA9B554A1B406B9B4C19309C363A6D6D0A7F316A
            0EABCA19AF454F66D8840D27554DFB447E23C94A175514F676FDCAA5C32E25DE
            72BF14F7C3C090254C105685755617C1F35A070510C1EAAE23ECB90CB543B07D
            54EABC2BC2B14E3D42CB1AE1E415A5843FB4AE596FAB97BAAC3EEB95E5DE8A2D
            FECBDE37FF00D545463A578A3D572D56AC19F8855401D226775E8B370A6EF931
            F1C97D660F2945B4C39CE501D633C91DAB6936516E4CE095C1D9B9290EDAA956
            D361723C4A65ADF4DCE3D8A6BF584ED9DC63B2155B89537287A854A710A03723
            AA63BF7207B15B27E19C086B61CD5529020ED1D42A94D8F0D84EA5CAD6F57145
            9444DDF342A75DC38AF776CAA7B5BE99E6E90B68DAF683C3E4E4070B6814E25E
            0E4AACEBDB24E72B8020713AA651682297CC42D859B36B2A8B6EFF00B63080EE
            A8ECED314C745B131DA49419AD3688534F0B96161ACFB2B9F4993E417F0AA7D9
            6595A9BBEC836A5C710A5931E686B3E49CC25DC8264AE578FBAD41591BAE004F
            7461E67D5789175CEC2735D4F03F5051528B3E81406B9A7BAF75587D5CBDD540
            7D0ACF10AE61FF00B05EF1A3E817331FF65E2B7FA962B33EEB0F07DAA8E26202
            7BF593BAC1A7A22FDCE61F9BE24BDC1BEA5547D2707DA1435DC21E4BDE3CBBD7
            73B69DACD949B903BAE133DDD01A01BBAE507BE03C8C946F87B9C396354EBD85
            A0E5B2AAD33A112AA533DD070E85527813BAC29AF7B669A25BE109D5A797B273
            8B794558DC78550807A2E3D73C46BBC52AA6D1B3B9DC470D2139A1D683D95937
            63528F1982ACFEA515B6763E9F409AFF00E1B4645353445A0A0449272553E337
            DDB7B223896D0A9D3B2FC4D4ADC42DE668946A1C326020ED5853EBF6544B7E52
            9AD1ED7330296E16BB9CD3F3082B91C5A54B2A92A225A8E34478A2D002064E56
            A37765D14879575301C7CD7E83E4BDE737AAE6A2D2BF47A2E5ADF75820FD578A
            3D172D77059A85FEAB2C695EF19F641B90E3E481E855A0E49F65A0774CE4D3AA
            1F07DE54CF922DD9991E6A2AD625BD958D710C3AA701D106B184A15F6C87BBA3
            1004DB49BA37731AED0BA152E1B05DADC9FF00B4235AAF359A34A6576E2309A7
            B855074281ECB8674237023440744F66B45DFD9706D8171E64ED92F9A8E7F123
            E04ABAA3AEDC2981CDB8418593B8D276A345B432A3E0B8885C8642CFC6793D15
            4BC4CA8E15CDD11E5869E8BDDF4E8817B24A69389587AC3961CB1CCB9A915969
            1BBC4B267D894D79114C21E48B2795BECC9E883C8CFC10CA0FB69119C22E7BAE
            3BBBAF76DE1FAAE36D9B437FA6355C0FF0CD9CD1675A9AA738FBCDA46AEEEB38
            57D570B599B171F656DA5BF2A146A62A51C14E61D1C9D4A98203CA2E778AC954
            5C35C20E3D56020D760A975503C90C82B3A7AA2263EA855A4FE43AA65660E5E1
            8595812AD6893D907D4A45A0F55C5986C4E8B81F35D0B9DD15C89955986B061A
            7E4B8775F3D7D807B6EE46928430B3CD53FC43E1F1AE89CC6996F743D8D16BEC
            F756399F595CAEFA2CB5490A0606E9060A326495A2CB54345AB1570834E4EED1
            733656697F75EEDD62E5AC0FD1780B943E910A48FA2156B3A183A2B438358139
            8D75CEF22AA3CFCC67D9648C9329A3E0D95B0CD657BC04FF00B9726CEF71FEA5
            1B3D00D1FB84AE6747900854DA89E1F62B874596B4276CB401609CCA2EDAB99E
            EFA20D7E29BDD12AF2790F546BD2F9F27CD5CFF0A0F963BF72FC2D237777054C
            53A65D07A217F4E8A290FAAC9CABAA13F747FF00BDD0E3856837310153998981
            99070135A5973CEA4AA6DA6DE53D3E8A940F9D33FF0089559D186515FE20D3D9
            A8B7F4AC6E018C2E25073C70DA7BB534BE49EAA194C2C2752A9807429ECBAEF3
            43E041590BB7D57BAAA14B1E5D1E457BCA45C3FA5457A2E6FF006501C187CCAF
            775438F915633C4ADA75063C91D9C9E70AD7B4CA2A7BE9F0092539AC68530BC4
            B5DF95E2DD4D9D0943CBE15D086216908C2A4EAB96120655D7B5DD9AD29B55BF
            50BF14DF03CAA6F2711AA961F78CE66908D1A9FC5A6DB7EA9FB16D5E169B438A
            7F12A32C70EE8B293EA39B380171F6C786FED3AAE1EC74C000C5DD55EEF9B3BE
            7AFB1E5B83DA745C37B80ACCFEEB6577FF00ED153F2299FD2B6D7FEE217BCA8D
            A7FD457F88169910DC855A7B6E607786E5B3D4A749B246ABCBD975D943DBE73C
            DD931B49D602873076FD57336573516FD94B416FA2E2D2ABF495272AF0D32AF1
            4ADA9DE10BCB411DD7BB2C327A26C1D3A2D613592092852A74C9F385CE40574E
            3BAE520FA6E23A9F841FD8A8045FF0884E0479A7348E6DE2F717FAAE0BBC0F4E
            644B8642E19C3B2156A35C1B5AE36B8A355BF36A153A822E7CCA6D26B9CF6764
            1A1ADABB4FFC2E7333A353EABF960E0234FA8C6E951385DF78A91CA70BC97725
            31F710B62AACD672A537D16DA7FF00C8A95063CB5A3585B4B9CE2E36F555BD57
            D14A6B1C64B07B26E211B323BFC06FA296B882BF88E3F540546CAE7E55FC450D
            AAD3F55883E889EC9CC6F34E1686165632A61616AB09A29BB9BBA6D19BE7ACA1
            45B8F44DA751C69B8AB8D490EEA5435E0FD558341F0C3D8E84DE6F79D7E15C15
            DD1DEC07B750A9D53E38CAABFA4E8A5D05FF00A53AA0A71574895CC4D47BBFB2
            FC2ECF9DB5C32F09C6A9B9CAE6E084297FDE0D89556A9F1EAB9F558CEE736A34
            3919A6D69EE8B5B5AFF285C19E45652A45C4F542A54E4083AA96D478EE2151AF
            B3E00D5A11B758416D7FFCA9FE4B69CFCAAB9FDC80634A97D32027D1762EEFBB
            261729B9720E1CE8657BDA97F91567C696B882BF8AE2D44546DC0F9AF79B306F
            D57F082F085CAD67AAE5AC27B0585251CA7BA9B388AAED35469909EFABE709B4
            C785A530B3349BA85C5A62D7B354F713D7D98BAD2A4730591ECB5CD7688679C6
            BF0484FF00EDEC427ECD3CA5124E029A46F681D170D8C241EBD91A745C2AED4F
            D4FE94DA8F324940F544809EE230116CC6115AA3B6D37490E82112EA7C577606
            11869D96979E50E135F56EF9E1076D75413FA4850031A47756D164F98525F03B
            261A879C94D1382AD6E90AAB889BDD2AAD41DD6D5FD2AA5577364A69691F647C
            3A750BF10C6D8E6F5469E583BA22E251E2B4C79A151EF123E54C7ECAC2D63354
            1EFDD356A060F3514697E23FA4AFFA3733FDC83A9ECAE7BFB4A2FADB2B9BF55E
            F1BC2F529CE6996FC4264A25C7FBACB826F36100D33289DD7DBCDDD1A83C4510
            CAF0C3D21384C976A8F56BB3ED61CA1ED92B1ECB5C0A6BFB8F825C02708C6F94
            3689F0AE16CB4CD47B84617176A9A4C264829DB2EC54ED6E85EAE73A5C502775
            AE7055EA1CD2270543708872C276CF4CCB5DD136B701CD6772D40BB257CB3E4B
            91858DEEA5EF265604B9096967AA6B66D09969E5055AC326145619EE9E01F787
            A279C8440C4F641AD3011665CEEE9E48C79A6E244E8137814B9B484D356B0A73
            A34A617B897BCF528B5B6825304A9D50B9F6BFA655BC11C2E8E0D53CCA955767
            BCA730B9B7F64185ADB48ECA7E063D87277AAD516CE882B2AE1DEAB15DBF75CA
            E0E1EC381D7A22C3F11B3A26FA7C1211C68B14DC7E8BF80FFB2F7B5594C7EE28
            F16B713FA4A8D9B676FF00516AE6718F67184EA0E32DF34006C1660A2E6B4BBC
            8205CDE133F72BB680D7BBF7E42B2806BBC989D5A2C60E8B895B2C6F755EDA62
            461A004595416B5A24A351A6F658616C4F66319FBA71225B03FE10640D55D4EA
            593D8A04ED06DED72334E5C3E6EA8801DD936A562D33D170A8538F3852037013
            C39BF646BBF24F45C4E1E7D135D4DB16A0EACF71FAA0D74B87EE5025A7C95E4B
            9E3A857D17D9506A250A3B58E2B3BBD0B052637C82C54E4ED2B8DE2779ABDC24
            8FD2A37D9169F34D9AAD78D0DA561BCBE1E64E642FC53F4E8ABD678F9795398D
            6CBAE857E01EC8B2A360A7FA22142F3509D82A44B562BBFEEADA8011DD45DC37
            7EE58328AE5087C36E3C480F845E04C20C66CAC1E6B92A3A94FE9729ADB4547F
            912BBFB107D931864E573318F777704296CCD152A1D1AAEDA2B3A9B7FF001838
            573807B08F9BBA753C67E50BB39CAFBECA950F882A9529F3542D825547B9DCC4
            989ECA935AE0EA8150DA69B6E71C14C7CDAE664A015D74A24A1004A61CBBC90E
            521DE8AC636110ED11B472A21DE20B45A2C958D14296183E4BDFE145079700B8
            359C5A0A86BA7B1444DCBCC9515041285C391A995E900C03C41BD93EAB9DEE88
            90136ABAB3A466C4CA6EA4DBCFCC53A9B40B589963401A2DA2B380E52630AB51
            793C29C09545DF3194537D54CA1B8B885A2D1632BB14249AADEC4A2F6BB9BB22
            E3F0DA10EDF0C829D8F45CDECE3556B8F32B4FDF792539F4FAA9A8F2550AD3CA
            54E0B8E5445A132E54C2A1986B32554A15997D3C80B88C7FE168440682ADA9B4
            4BFD13A9D17712979A2F2754D69ED0B91E88A8F9FAAA62E09B6B8140D4A81A8D
            BB48FB22E6BA588F447AAE612501A059DA0CF68418D7223C45496A2415939511
            07BAE154E6A67BF445CD3AA0E3E06A6ED0C1A6AB82F80D77CC8B0F85C9D46E25
            B380AE148C21B454696B5A53BCDA8B7F4B8AAEDF529F51C7FCC746C21B556F77
            4FFEDB67735C8774D68C92835E2094DDDA6ED148F6B1ED5C4C2018CFAA1F12E3
            AF453ED4F5DF2540D10DD5180FBC6096A149CD3DB29F267AA048D0A6BE9732FC
            335A63AAE23A2AED1D94DD1E8A5E6E5812B895FDDD31D4ABA97F0C7645D3E246
            09424AD5788A689264A652D02B9D8051B063BA973940E88160257330B477439D
            65CB390816FD972F897BDE5779A0D9E89F4BE695529C49441E570401F1B5730E
            50C9FEEA9319481BA3ECB8ACEB9C261F22B6867624FF00742E30C737299B4D4A
            8DE4CCA3C1FF00A5A4603BBA0B2106B3494FA9545C58EB55111AA688DDA6F27E
            119D110D420A6F15BC46A6F06A027B7C32E798015944DC1A75F8325634DF70C8
            4C7F4072995D8069BBC39418CF794FB15CB4C53FA2C65DAE537318CA9AA64A80
            D05E8B6EB698ECAD636E714D6D6696BBCD6774EE6E135ADD19AAA41A7C28F401
            724A9286814B0DC15CFA6E7315AE1EF07459CA960C2BABABA63C82A6F9234109
            AEE870A4755C703DDB959D1C1387CDC3544F4847AE153FF77FCADB69FEDFFF00
            AA9D5E91081B9E00E929AD6F2D16E9E7B8A6BCAAEF7E071256CFE7286FD375B3
            CDB9951E2E71580422681E237B056D46969F3F649EEB5427736A537911D2535D
            F38191F04DC6E7FE908F31653EC0AD563DAC95CAB2774ACA8841D446BA854D9E
            4277952167054970015B44437F5BB45F87A17557F5A874081AC703B2E614D91F
            A826D3A5CD9D512A100373A427550715728B19D13736A1112BC9371B8B5BAA24
            01DE573546831A23C26BAA1FECAEAB56D07A02B32479A6D4A5E0020EEE1B8CD4
            6F74693D710BA7B29386DB6A69BF44ED9C5404344234E275855369A70C73C42B
            AB55BBEABA158E8802A4E8A8C68B69655880E9CABDA3941303D994E8CF45FC27
            7D9539C1ECB216AAF860ABE433ECB59BA37BA9CE1F1EDCBCDA3CD70B65879EE8
            BEAB8B9C774A046ED168B4DD933EC44637C953BB5DFAC2179BC37A1563AA1A2D
            FF00C6DD1412CA43F6A34F62687FEE3214D6AAE8FD32826B0EAA4AC6EA5546AF
            098D70C34227BA950134912D1DD32DA42D3A44AE668FB952DA5FF2A6A3B80DFD
            A7285CE354FEF5149B0A23EA88A8AA327A2842A35078A801EA0A79E30353A009
            D55CE97133846950B8B7EA8973467CD76FAAE679FBACB8AF114D69384D85C38C
            AA13D1C027475CA9054DD3F55FBB7BBF53B44769ACCB983BA814DA02C08DE5F5
            A787D333EC4A3BB083BA9DC1FF00A4843D92FA8EFA22D6BACA3D977DF9563F03
            A29F6F0165606F851D172E51D9AB72D63A2C7337746E91857DE6F458F1B9A023
            3AFB1B3D379D0764D6D244ACEEB9D80A953A4DC3464A352B99F545B404952F2B
            5570CFAACA219247A275CDE5EE8DAB946172BCB55D5AA12B492A28F2A97B964A
            D77829B70D13CD4EFCAA7A0A89AD6443704AE5F08DD66EF242853E60DC26538C
            FB351B562D84F0349DE512770EC328469BBCCA1EC58CE6ABD917D574FB103552
            E2A9B5BDC2859C1585E15A42C95A7B4E9C6EE36D180B95F15468E0AD753FC4D0
            1D42F7E382E58AC3ECB8B49D7377DAD1A6E7D57EB0400AE76AEDD09A4B725060
            3F441E64350EAD5D9AB192A224AD2E784CE23E1BD8268B9797756D26F11EBDF3
            B874FB2B9FCEAC66CF6CE13E9C72BB3EC6BBE3DAA64F55B301D6AA7D2F9DCFD1
            731CEA9E27DE765CBAAE2B05F0ACDAA8169551F4AA73E909D5EA73381408F65B
            4A99F55246ECAB51010C64A07E63B8631B86FA957A846A3CC93EC5ACD5677367
            A6568B45A6FC0F6B2BC95CEFE1A2E7810DEE987F86CCE5B84594A7687F9E54ED
            5B1DA0F5B422E630CC62154D9B6863DB9EAB92B007B4A73A9F3B3C938AB82859
            4420553E56E83A2A755FD7509B569BA693C488E8ACF947757D63A22DA6DB5BDD
            4BAA4FA22D6B5C4ABDE6DFDA89608A7FB971368A8BDCB406A882B9C5AD41C9CE
            35351A7C5652E8A8ED3F2D2371552B1D3A289F3946AB1D0E05063F1B40FEE8A8
            6013DD43DC5C7C8A9A42163216705637FB8178F250FA247AACAE5FEC8B8EA775
            C7C2DDE27C450F60B46E31AA372E5C37D8FA7C4B139B4C4FFCAA9B3D73C2A8D3
            F326B9B5393C9CA870A9DF68CE15E3656B1DFB98BF1151ACB0E034A6D4AD14FC
            B444B831CAEA65ED9EAC2AF0F35E81D438CC2E253F0B86F08D8CC217183EA9B0
            F18F346AD9753EE151771096B9B904E8A24BBD11C5B4FCD63446E2A295336FEA
            5C5DB2A5EF1F2CCAE16CD4C0677B536DDA5D4DFD65D85CFB431C3C9CA2853754
            23C94167D2158E6379BB8459532F732E4E1E7F03585AEE0DD01549CC75E0F54E
            D963C7895A4F44E065AE7227BA6D4A66084C63473441C2C9CEFC2C2D57445CF2
            23C93B58F25069927F7047DD53FF00D540A6D13D82B074DDE67703D06E1EC382
            CEECE0F9286657337EDBA1A98F3A940FC4E253008EA8BDA7835FECA29BC5460D
            25CA36AD95AE1E40A6B6BDF4CF6B70A9BA85A680D0129A36D6F206E8D12AB55A
            26CA0675C2E63CC3C29FC6F0150722708EE0FA9E05C2A0C184CA8EC03DD04F9E
            CABECA4DB71C200C485C3049AD18B501499AF5721576E749EC32B83B1B2C6F75
            7B8171F35E083E883AC9F4403DA70AD65303D53FDD80F0B9CF98546B511F206A
            7DDE2DFAEE05C4AE4A73EA143581A3CBD81C5C37C9002A5ECE97146AB1D31921
            06B7BAA74C62754D7D3CE110579FC020E8888501A8E1152770DC0F53BAE8F609
            47D8822578172208367E1731572B9F86A069DCD23130810FE2357BDA40A6D7A7
            479FC932954A6E640FD254EAEF3C26D3A0F01A0CC04C0EF7A50D9683629B3528
            DDD138A6B50A6CD02C65EA852A4D8E1E6136F6DA9C3C91703699D5511529DEE7
            FCEB8BC317EBAAC4536A87F395C5A94B98E405CACB189C1E25435A8BCB44A63D
            A61AD514DBCC7AABDD92807F30D554AD75ADDD93ECE8B2B0A4A0C8C2E575AAC9
            971EAAE9CEA9D51D9727EC95737689C1674F80571020E45397994104DBBBAF24
            3B203D828FC096951502C3E160CFB3CCE8514840EE8B8E4AB9369BB41D154E23
            6189D4A93A21D11BAD1CCDED0A2B5058E47FAAE2ECAFE2D2EA11A94CFBCD08EC
            B239DD328BBA1D13AA38271233A2FDEE449408413BD13E9BFC4344FA05B3568E
            8AFA9A95EEF9C224B79D02F131A2E510B441A14056BD00ED11152A06D30B83B1
            739FD49F52A986FEA4E6B0C92A2376AB2B89B5BC0776406C8B2A77E136740548
            C84EA4FD0ABD8DE70359550F4DFCCB977E4A9254377169E888DD2D1A2F0C1465
            33D5068409EBEC944FC2C2E57A01F91E8B20CAF75FDD73BDB1E4BA956CA711AA
            17E88540FB0F9A1458F069B9DCC40E8A952D9DBEF4C0B8E553024BC6AFE89EEE
            197ECCC8E640CDB76002B9558FE669550B4101D9856A731B86D3CAA8CA8ECC98
            09848F35E4B2837754EF0A5DE30552AE4723FC4AE9961C8551B50C89C2BC20B3
            E1DD95844B95BB2B09F50AFDADF0DEC30AC1CA75929CC0794696A9F63BAD4FD1
            358E6C91D776A375B4DA65075651693F54FA2072A2E6D33501D2026D0E19603E
            49F55A240D7D812EB4AE57028E51CAD77D4ED08E71B83DB9055F082BCA9E8101
            ED1F8D872CE42FD2BC62541374A0835EF77FB4AE1075FB31132E515048468B2B
            F0DA7E67B953FF000FA38D9FE6A9DD35F4D86951D9F4FDC553AAE6197180D8E8
            839F831255EC32DF246B031E450CCBDC730A4E929B232027374F34D0ECC2B9EB
            95AE8EE8DB45CE1E89CF14C81D70A6086A3B3D7991E146D6B84633BF99C1BEAB
            1518E3D815D879A802EF45CC21BE6A633DD16DE2EF22B801D71D79539BA1F3DD
            D9630B550F950D08CC4A635BDFA2A5607B6E6E6E5A17755C8CFAA6979FB22854
            5912A8D26B00899855A8BC4B5DDD3ABECD96EB6AB5C0B5DE7BB185872CA8DFAA
            7BE75C6E01C607740075ED3D9342010637D10275F6C98448FB7E430B054556E3
            C93AA64BBB4275463D946883A130AB6CCF8F7448BFD10D8B637D949BE3726D2B
            B8810A716419108DFCEF60E55E27079D67484DA5C38A67AAB69884D37150EA84
            A634EABDDB61BDDCAFAC6E0ED11A26982E2354DC79A93FA5553D1EE0B68A5FF6
            C42D99CDFF00C8834B083E8A29D224FA23C2A65ABDF56219D9073B99DE682E89
            D500240F25C4A8EB1A7A35541425CE8CCA38974C65543C2C83D178615D55ED8F
            2298EE30009EE9BC3377752355F8C6383DA351394CDB1925EE995B2ED9B2B49A
            C4E400B65DA5CCB5E201955768A91645A329B73F0DD402A1A0B593825125045F
            D8215FA129AFEE9D6F8A13AF670AB0F9A15D1C46776E56416FB5685C31D3741C
            3D64CB46E2F281F343DB845D4D43E949EEB072B23F23C8E894FA748D9799253D
            B487F983F320FDB1F2FEC85E2C0E3829D59FE1555F5A9FB8F95453E8AD2398A6
            B1F9954C374242607E6A740AD3D13E9BB5A6A9ED0EA82D206144E0615A745651
            6990539D4DB159F02552A8D8E4E639515596D66E102DA63EAB05ADFAAE6A9F64
            5B404FAA9A8E0DA5E49B5473F9A1C1E5675852E373C7541CF321C816370F3722
            DA422ECE543B69B079206B6D4E71F459CAD251B708ECF51C7F0F50642750AD0E
            A6D93FDD585E2C6E617E1A8673299428B48F34DA95DDF494D8C0F25AC04EB7C4
            32850035C4ABBF4A6B9AFE708738FBA735D1F74F653A9736744EE36CD6BBF52F
            7553E854321DF55FC256D99516C27099A8A569285A2C779268EA8041A8043E06
            568B014B57BD64AEDF936B1E65ADD150A559D66CEC8909B4A950F743121C8546
            68573E5AAF6EAA8B3F784D7BCC35AD56526973BBA73AA1B6ED506BEAE3B21685
            FC22EFAA2E6ECC47D5710D321ABADAA9F0CC12AAD3755B58D7109B66D17B4F64
            C7E5C99508FE2670B32079A7D171EA9F4CE65702D313AA654A8F82D33083CB6D
            B7125790EA10652D9DCE3DEF57865B1DF7CAFC3D419216DBB1D7E734C48FAAFF
            00120FA4E3558D36655671A2E0D649FA214E936EAAB8955D940344944BB45501
            D4B30A08D11B44CAB6AD4B49D42F76F87FAAE236B6408425CB2169055C1F1EAB
            96B09ED6AE355A8093D2139CF77BCEC9CFDD91CA55ED6401BAF2375DF13211E5
            09CD8D3F2D0C7E3B2E782140107D551733C77056BDD8ECB9070FFA91B8C9588C
            77DC7128820B5307AA29BEAAB8FDE55E340BCC2A4FD4B14D85A3D15F70DC4FFC
            270A3B35427BABAABF84CED6AA74AA196D9AA71A6E98EAD4E04654A941522B68
            0F21ACA8D6E4FA2773B27AC155696CBB33DC1CD22E190AAB2320A14DAE067B2B
            BAAB9D040CC2258D80AB13DD0A46A35AF3D0AE6B5C7C95DC27FD143E8553F552
            29380F550DC29768A1945CE5C941EAEBB863CC2E7A97BB718D55951A8460941A
            8350F343E317008FB169C84D3DC2B6E13F92C2B8F32760928B8C0953AA11BA15
            31EA9C4FAA6955D9E165E798A75096B9EF8E6478A6F27CD70D8C05BD8A10D0DF
            20B0B55958DD4A06B8947667FBC63BAA7328E0B7A2CD377D94B8168F30A27454
            5E3BAD96BD09B9FDBD132B6DA71AC273E8B1B6811CAABED2302A642A0757C2E1
            86927C94D4A4F3F444B7B689E63ACAA9B4BA786C3D151B1E4107472D1C4A97B2
            7E8B2DD7BA91642C70A16387F44E05CC680880E2EF458DD7B0FD90BDBA2F20AF
            DD79407C6213B191EC070C395AE54EAA61A620C2978C2961FC9DD4CA0DDA1B07
            B85CB533E68863A5B2A993D516F710A997F8653768636E1D61369B196516A686
            E9D578A0AC99F632B0839BF29954EADC0546EA0A0699CF920C7CE55A78967904
            7DDBDC7F735134B676403AAFF0EDAE7C0E7494D61AAE61889553671B55FC43AB
            90A34DDC46C274E09D16B711B896087755B439D89C42A7440CD6E6FB273261B8
            18E89CDA2E710CC422CDB688C755C3672BFD13A81AD047456D1AC0F9287D468F
            AA350BF4D57F95DD1A2161FB2CF88A0106A6B137F21704718F63BA870958384F
            08B1D8CAC2B1EDFAA0415AFE470AE0F2AD78CF745C0DCA9F1198956DA1CC7745
            14E9867A7B193BB016564C221CF00A3C275A10BB251AAEA62B0FD2AFA5418C6F
            F52C6D1C33E49AC1B4BAAB4F9260192D9FF95B3B9B44715DF37D13083CD2B66A
            FF00339B94FAA7C6FD155AF534099519EEF2AC40FCB394EDB69549752116F695
            B46D673D42DBB6D78C912157AB584D300B93DF4F91824A20BED9D5CAE0FE5A7A
            95B56D159F21B36CA99E67BF4F2429F6DDD901BA54ABBA7E4484F1D546E856CF
            2CE89DD07446CE8AD760AC85E4AE6E426CE08E883A99443FC414930B94CFE4B4
            501B705353DD9F32A18E0EFAAE5A7FDD630B98A873C4EF15289EB95B3ED6EDAB
            856B60B774ACE8A1941C4793902ED95EDFF7202F0DC750B6CD95954560D6CDDF
            54ED876981518481250A84870194CA54B461E89D401E56613A994D6870C0CE50
            A4D2099EEAA39CDBC35D16CA7D3A550517BFE5D552A74DB2DEAE547666F89D92
            9D534A8F747D13DFA39C709CEA0C243BAA7BEA0B5D5552A1F3D4726B4E8D669E
            68BBBAB9DE1DE1FD51DC3F245E02D31BC39533D86516DB21C9B547543120A0E8
            C1DF0A66414E0A2F3E9BAC760A90E9FC972BA10CDC10E25282850D818580E253
            6BD7DB0E3E5438955AD213B8755AE8E8AA50A4391AAAD03E261415C55ED4D2EA
            6F8FD5384E175DD919DA29B7D56D542EB9A5BD16DB5595F81C2E6FEEAA9AD5CB
            E8D331EA9C68B8711872171FE57152A0388578271D555BCCF3495C959ACF55EE
            AAF11ABFCD52E20F44CA469BA9B5A23255260DAA9D20C110553D9B64AA0D3A7E
            278EAA9B4ED0D05BD136A56DA586DD027B43AECF4402037009AD1D114D080FC9
            382788F4F62C2839A611374C05E616B31ED48E528041D6932B5570CAE6169583
            F90D7748307C908ACF3EA5075673A3C930D3716D23ACA21AF05953B2ACDF91E0
            C0466A0A51DCA8A9B4CB7FA901B39BC2E1D5A8FA74FC8AE356A86A53E9994EA9
            421AF6F4404EB85B7EC759DC315D900AAF6D411972DB36873A6EE885CD925729
            52F7615ACD02789C38F44C7D1A8413E6B1B4FD2E521C1C15AFA20FA050CA107F
            A54369C4ABDF51AC3E48C8C81A945C7A945E46FB8EFBE3F29700891BA0AB9AB2
            9D49FA27468516AF5F6E080512C10A136E6C377549CD3689CABA216BF1F3EC07
            35C411D936A39E5CE1D4A2F7D2693E6834ECD4FD57F0698F45C6B883DA1358FC
            81D155B713D15333A396C80B8D3E2968B821FE1D576AAAFA31D56D3B1585D484
            B412157D94FCA6022D23716ABA653205D8573B97C8A28E7AA2F63CEAB95C6DF3
            29C0D47C2B187010684D6EE8406E636147E50A70EDA22376B1B8F42BBA989957
            76F8596CEEB58211A6F1D5123A20D7190B2145D9FC9E8A7AAB0BA42C36F0B3EE
            CAA7558FE2E7257F82ED83FF0020FF0084CDAEA70C558D4A354B81ABD602AD56
            94B5AE72F78D0FF346C3940C65382A2E1CCC3AB4A6DED6D077928A2E0FFAA37B
            6657352042B830353D8D8154F6527AAE2F4DF79DD8E6720E70CFE5AF014EF83A
            2989582B494631F19CDEE8399B83875464A970422A00EECA75F8F95AEFC8564E
            152D94B2E6D338726FE33FC42C74787283E8FBFF00395445201BAE07D15B3A6F
            88C2A6745CA50927EEB3CCA2BD303EA8B59587A6538F441BDD01B8041AB1AA15
            1C140FCB109F8F450A377AA3BAC7E0FE4799183CA9C3C911E6A9994DB8482B95
            D07F21CC16ABBEFF007759EDFF0072E33DF7BBF728E11BFAB96B056329C1D40D
            47CE152AAFA5C26C1F6606EE211BEF3B80E880FCC1701953BA5476529C3B2654
            6263FF0027919F441A3408C0D026CE371B97658F8DA95901765820AD1745DBD1
            5CC7924747277B9A4E9F256D76C314B2A34ACC2D776020EA980AD6E9BE375FDF
            F3242776442CA96A3DD4110A62613A9F6FCAF920F8870DDEF091E81398CD0774
            635478A3441C3E3E0ACE7D5738B7D17BB74AFF00E968B2D0B1CBE8B0F72F1B96
            4CAE51EC4EE0101F9A2513D7AEE82148D1688845DAB5DF98CA3023739F183D14
            764453F12E13DB739091056BF1B0B550F609EEA2FB57BB870F50BC23EEB2167D
            BBC8FCD909C630510AE5694D7B34576850CFE7B8A1B32A507236B6F6F75042D7
            E3E1C578D65CB27DA6B50FCE147B84E0A0A28B1DA395CCC382731FAB567F3982
            A4A82B871B9A47853583C3E6B2144E7F2B7469F9D845C02E5D15C0200F65F550
            742B1D4A737AEA9D45E654950D77E7A136A0D06EC121359A85951741F358CFE4
            0043F3C4145C072F55E105A84120AB81CA01CAE09AB88CEA57F505E4A51A6FC3
            A548FCDEB1BF3AA0E69C6E94D0D79F8F2507B828FCF9C27724B56791729C2E66
            8F55E6B1A20E032A3B26D509A4EA85468C4261ED84312D283C7E649060A01C64
            207BAD77E7541C3D9ECB19F6B1BA00929AF78400FF0041C8580B45A290B982E6
            0B97AAB7AA21C30A3AA2C577CCD469C42B874569FCBBF733D1070394195376BF
            032B4DD7755710A0211A205CA00FF45D168B452D0A5A173B579AD75570D116F7
            529CDEE167BA31D42B09E5940F75AFE4E11111EA9A103E69AF0C36F7DCEA86A0
            65BD253581DCB747C20C4020863FD2F211C225A8E1439ABCD4F54255E30537C9
            07F42A994CA8C31251BBC414B8C2C107F200F55CA32500ED4206272BF0ECA78E
            F0826B5A601299EA87C0BBB23B9A4851FE9DA2C052D0B495CE32B2B1A2123445
            8163508D33D5541D426B5C4C69BAD9CFC7EFBAD583210954FD537D537DB08F72
            8B901D103FEA395A2C05C8B2D2A0B64A96EA9C0841C7BA3E61191A3931DDD5D0
            AE4095CA7E272F3297082B1BE0A05A9B3F00310F34D31EAA3FD53211C236846D
            505AA08CA86ABA159D935E3A234FEA8F9276E34DED82A5BF066167BEEF252149
            D14B4C8F812BEA9ADE8103FEB1908E1728581FD9410B032ACD54C2704E05B925
            35DDC2B88C2C2BE9A87360FB6D576E720554F4421C98E3AC7B6635471CC9AE84
            07FAD68BC216023685A1505ABCD5E3280283916A704D91B881A293EC405611B8
            B142ABE9BA9FA7C00EE8863FD7B21784230D0A5A178573B54152D4E0B44D29AE
            02539A708EF92B5C6ECB7288070AA0F25A2A7E9ED868E89A63080FE41C85E10B
            03FB2967FC232095CCDCAF351D1031B88DC1350DD69583BB482AD1ED4ABBCD34
            C7F22E8BC2B014807ECB2D3EAA1D92548D771918DC1377171553B227B22D78B5
            5CD323DAC6A9A48407F24642F0A25A1601596995045C563EC88842421B8A29C7
            CD0F64260EC863F9332D0B0D0A581785447DD41C95214C2338453911ED03080F
            E4EC85E11F6461A3EC8DAA2D8F35A4FAAD20AC651288F6404DFE52C847089684
            6E69705EEC9F456BDB0B95DECB4C60203F954E112D0887B3EAB91D795070B441
            AC6A6FF743F95F211E544B30BC13EA17F0C7D937923D10C67F96B20159A6CFB2
            FE0D3FFD42C5368F41F9BFFFC4002B1001000202020202020103050101000000
            01001121314151617110812091A13040B15060C1D1F0E1F1FFDA000801010001
            3F21FEFAE5FC2C1F93FD957F172E5CBFCD6A2021F7288C6BF722D947FE388664
            5F654B17EDC18DFCAFFD9173518B850401AD7A844E37DA52B3983F8B2458A7B5
            9776221BD5CCEEFB196AFDEA0454885B6E29A26A15C76751106F3B82E7830CA3
            CA4E7594F85CB972FE2EBFD759B4534823A55E3133E0E8B8C6EFECC8AB292EE5
            9211686BE6E5CAD20B11646095ED88A659EE7AA01F515976D04F2648844CAEE6
            9B0E213544A886C45AC201467B1C65BEE5510C4F76CBD9FD08A6BBF7509ED14B
            9A9C5C3ECB1F0CF887FAE315F1C714559136CB361B9C225AA7A80709A163843F
            49658D3B110027A2255E991B87F1250F9FFD935EDFB801B1F72EFF000C808A2E
            5A81576C2CE5BF5BC403D212AD2B4E2591A605263E434A6E32E6262059772DB0
            7A2CD287DC2566204BF0F93CA5400BC5B889C14528A32427C022F94560EA07FA
            A609A6E53F0172FF00BCBF8BFED996A3752D69D639A8CD7963818DAE35CC54BB
            0F325832B6E264F3094E22A2917861672C567C152CDBA82E66590B7854337B11
            C06E37CC11AD0ACCA4E5DAA0D90E9306DAF13720C46975C29BFA312E214E1FD4
            A710238C63C726D31AEE39227AE970FB8BB5B45C9B2574732E3529BC6D9CD64A
            AC96DF3A33E918501D17A9FB7562182373997FEA6B2C26A9EE2CAC5E0E99A176
            70C2B86357402D1CA8F10765BEAA065CE2E5D46A359A12A1E986F11075B819B8
            C626E2856BB4AA948A76EEA157B253C4DD66B3EE1F392FFF0039D3C54EFEE59E
            1C3454C6D2A27BF8E226F799C9212A52E4268589B9449FFD6CB07EB25EF438A2
            0F300C972ACC054B5C6F13276BA2365A9F6252747D4A2BAC2BDE3C42581573AE
            A330162FAA9579490ACBED9A60FDFC2E5CB83FD95FC1A0C1DC5A96FC45EC5F92
            A13643C4B97FD8AC694077F100C9DCAE019B75740CB0271215311595E6304D9F
            64128D4B0981A15675055535D9C473B70371A950B831AC1BAEE273B3D24B03DE
            E595A38F75E5ED528368BBB5D441349B5C5E99428B704A780B748215378819A8
            40BDAC96035803A23C5398FD21CEE34A5D66EA1E66EABAAFFB997857F547D549
            9773FF005C3F1EC70A0E4804DF37300AD7C6A3ED8AF5110CED907CCB4A3D1393
            C8E915180184ADF0976B33FE28800603357B84CFD60418216FF6C28E64FF002E
            900F3F171835FD4751965BD03B97829AA44366380122A8B81E22F961657F5AE5
            C588C41CB29D4D975425505F74D13DE5B77351EBA86725BB6E2F0078851C03CA
            E57C01A0B3DC76DD8AB71006AE2A67D9EB2CBEED60C23C74345C2B7D825403C9
            045C2DB31D4C81313A3D862E353E1E838982635D1E65847E090BD68F8B087B5C
            05EE66F305175C9FE6721485B88CD367AD9D9EF51C68D206C8881919FF00E713
            3ACEA8C99B8BA74C4407A66E634A0E8253D5DB5918E3B5A94072830C17792642
            15F730A1F0A0A8F7152C0B46A812E6BBE553FCAD66155F7454100F998104546A
            D4C6024B4F0CCD07B9FA17487216E8FA2D15FD25999715E66B331E20500ED52B
            6CFBA6EB3EE138601F37F931D4273AA8E192C171362350E02E5B5C440261229D
            9FD90D43FA7703643DCA311C8DCA53DC809FE62CEF541A59CAE65C1CB572978C
            6191E6612DBBB984C1D85CB5ADA5A42A5998123ACC10E96C40B297C758112A95
            C0346125C917AA862723870C35E749715584FE25CDA0639E7B4BA6FC4C0BCC4E
            7718481B172E7A86D38491AF718D8755499F3394324349B8CD03E0948184D824
            C2C31EB61F569572D46A2C671EA55D3BADB202620AA52DCBED508F94515D28B6
            0488F51B42D645B607DA358BC19845FA183D53F78F7B6BDCCB0C1C0E5253F361
            00319B21710F88A10A5B71B532F4C2AFD162AF03C4A421F7035D4A203FB4AC75
            950D5E7EA0FCB70B679C3115DA0EE6B9B38504607D782EB4FDD732C51D0C1165
            1D900021FF00CF32BF33C7FF0050316BF60855FEB67F074C026EFE6B8EE004B0
            FF0012DA696131711FD185622ECE7E03B26B25443F35AF918863C11DF48E1BD4
            CFA8EF4EB07433290CACE1FA40EFAFCA86D8BC6E701B4094C285BFF79969D607
            2B7A8408880AC4A88CA117A4C22FA860F335E832C62B4C31C9D44F2BD2B2BC33
            36B6420311953C12BF8958DD42325EA3A4F4A5F862F5BDB66A5BB61412527721
            E115206ECD425AB0CFA8C684A4897D4A131050CE86A0E3045D2E2A771C8731E8
            F8278999AC58C32E5C6FD9115C37305E2EB2FC17886E72997E16C8C873DC7F08
            CCDA1246A1A5C87709BA4D590683F54B0A207CC5E8BA724B2648688622195D4B
            81F7B306D3EA5975B44C065CC1481D7C53829B66CC758A9D9731753E91905F68
            AA9E28C27E5F1258537501D447261EE92DCC8523A268E98C754CD199316A5D4D
            CEB11C08BC5A7C43F1BA8B00650F716D0F5573F7E8C31F5B63173AA9D32BEA96
            2A35057A8B32CB37997841E2207FD442541AF572AB980EF31B7687D44EAD9709
            20456A90E080D6A898C29194E323973126951383DB32B8E999E0BC8B7C5A65C4
            447EB2B2FCFC38877F18F847C3CCBA3A80441595EF002CB9CF3F2331962FB82C
            3F53D9489B98FF00E063DA3B48606D07C5662B94F923896C351424A755137EA8
            5448AF8C347A37518FA2B47CBD21B0B29442A1BB3E2387C1921E433E61B26B93
            4895607507FE0A138B3DCBFBACB85C9946BB8590149A25830C07702196DC1E63
            87B9E62CDCEB8C8F733784AC07E4C588BE8A151CE62325CAC300199E07C2A04A
            81E9734D6B2BA42BE2056BFA98113D3FA4D7161A6244BD839EE72E5E99582420
            09DDE611F65553A47AAF136472BDD409BC31ED5236C6FE17015DFDA5BD57CD4A
            430535765E7284084A0731E99496F988446F5330A3C10EAFAD188350A0AF3948
            41CECD433429B3104910E5F306E1C7815C4ADDA97E664673A1CCCEE63BD391C5
            E745CA0ED8CF29447BE30D5154BB91837FF7F0825733B907BB9916D41B193AA8
            D1A12A78D877D12CA9FDCA83F64309CC4CA04B09F322B8454152CFB99F0FB62A
            4DE056A32CA0DCBB8F11340882F3F769762F7B65F3E3C90B43BA9EC448E58BF2
            83CB51F30879890791100E70FC25E231A4C6584B4E2CC7E6CCD4E6B064A8F7D9
            936C2BAA918F546A6800344470BBE6160E01DF731B46595CBC34ECA5A3DC6669
            4F0A581C5C3C2A56406A6A3EEB1D54F25E2C43467E49EA08E8AD1705E0E5A304
            2A7A5CB9590B2D838A47E0D57714385959EF264A4F3A84E2F8F52975651C4A44
            DE6665335E36FB41AA85B5E98AE1FF00C2230DFF001692E23A63918288331741
            FE216F84DAE66ACF1446F141CD08086B6618F7A9059431C13F8E384C7A5781D4
            CC8D21017308E516C79D55314DFB9AD55E54664DFB65DF1C5434EFE64BEDC2A3
            D4DAE5BBA7C3247944C672B81FA536D6E2A3C7939986081DC2B298858F88CB8C
            B8FC689805B1FA030A907137EA23155D11B5DA9752EE11B9899E954D40619B84
            2698CCC4EA415FD1271646E116BB80963821419D9572AB684D3728E256326F85
            32B92181A0E0F15290C2AA8E8C8392C9A8FC923BC25A39A2B47B65F4B76AC5B0
            1D85C4C3539BE9FEE1EE6F932220981A4B01375CBFEA5AAA5D891BBDCEFA244C
            08E7017829714D22B57176ED7F89FA37F89E2CFF00025CEEB5860617A92CD4B8
            9781353C461320313CEEDCCCA6AB1C26891ED18A59834D71137643B614038F8A
            8310412B1422CB43CBB4AD4AA91E253D4A4E65514A40F9261192EA8F8D0891E8
            65195433F2E713DC300990C778A5C586ED6E2C0CCD846A10351578B259EC6A5A
            33DEA201557B6A56E9AF687EB776B8C319A8DCB31B918A52DF35F172E8194721
            C5CE21F9A4274DC343DB84C35C0C40A182F08D8CB0AB307425FEE7E894568D94
            1CA6753D57502030532EC66E0D0FEA6BFAAFA253BC5C09C8549A25712CC724B2
            B5F0A7576D4C97F0886B2B9A261B4973F9C774BA3E6604B7C54A395C1B9522F1
            5F5168AD0FA86CB82FF897EF3FF129A5B7FF00104503EC9AAC798B1ADE9312E3
            D2332DC0E3D6E5A44235659632845F734646300F83586BD9F3BA2154D904FB48
            8AE3DD8A633DDCC5AAF51D02BFA87987990F9FB101D6816CA62D2FF08D80FD26
            D28B55A2D0D2C2A65EE449FCA2B22DF58EBBD52E05A69FB419586B72D7D00B2D
            49EA32FD85C6ECB984B9B99BFC11112D512EB996D52982C186BF3364C7F98C2B
            5AA58F8D233CA51DD41519725F88157CA3CC6168C97DCB01F8717F1392C62E12
            50A0C04612C95CAF32FF006F0CD8AB1EF3C4D4C6A6B6AD8D574116DE61456DDF
            A9660FAEBF98593C7A4CFEE153309B798031615F949919B5FF00D8967044266A
            F87EA643B2C7F50C2A33A55FC139D80CAE7B7F98F0DC4C20C8EAEB5A30817CB7
            18E6D9CE1DD608E3B8E945F65E19B946E52D41B0F836BDCC58660CCB3F50AEA2
            8E7E0BEB12FDB3CF9A208AEBAE5671D23FFC4FBE5369C4BEE67E370E2947AC89
            4B8E4CB63B96A681319E573553301B032E1A8721E62919857A65B5A581F32CEB
            0C08F696E7F30D7C542C85C102FF001535670A315441972E5C7398B98B641974
            803159A7E6EA1A19B225759C693FE3466897F2622B04ACCA4866B94174AAAC19
            D68B4C7941AB98F97A8CE2F15956ECC4485AE09A801B9B90AC2C10B9B583A0A6
            822C7C46FA8B5D04FA5B9B434316446DDAD68FF9953CBB8B4E92D96B0D36ADD8
            5811B7F344C559AA727B705FFF00C083974E17FB9B8DB6BCC25182622D4D2905
            E876BCCA63A038D857881D95BD674A31C5135256EEE5FCCBC30976545A379D3F
            F12E3F60402E1B1AC0D52E1819B5E49D318637CC4A97195F02E1152EA08838D5
            EE2F0DF31407F6A3503CA38F73350F0B7504A50467B505FD5B133B755E397F94
            4B4DB1956330CF30972E1FB4D8E4C73EC226E12E5FC42A73880DC30B81FE8262
            6E225896B4CCD30F32A426E71469B3F6E9899741B58943ED837F71373E2C53EE
            A07EA3A2D78CC3D6CA826DA0587985EE2711A53571D96DC98B97C28C6F69C4AD
            555A369994F1622FDE0DB1E8EA8398979D2A9B82AD00DFA8FAED0C4A9B2D6AE3
            710CD310B6307390477CC6F94092BF2B07527465FDBEE894D3D79484D5520007
            11532B4467054C1D864370540F986E01CE661B637C2E5E9E02D90A25AFA612A8
            56071B5B1EE0F905044F0F7C4C799BFC732FE5156D129AE7E7EA12C8E946769F
            71D5E0F8C2C805B58C185E9836FC42738CC31650CAC4CA6E5C80CBF9632BE2E5
            CB5C6ECC2CA87041AFCD84D16D460CCDD9E654293A8E08F2C7F0772610DD1232
            810F42E28FA4BD4ADF7CC3A087ACF0413B3B27641842ADB5823631C03139F60A
            854BF36485BB1AACA8455C66196CF5B326D5B722C441067D60612916B6731B3A
            B84E61F60515DC273CB20937F9E04A48F942962EE82E2AABE5A87C8E68903C29
            0F2AB6773F53645394EDC4B2087388575C2D46308D9D27ED69A52127301F949C
            92DC2A693F51E075192A1670BA08699417C04D43415C661AF3B892E56E8EE612
            CE39941722014D5A3312A3966436B30FB494544448AE9F7191FCC7317F6A025A
            8D6BB6E519A7AF8F32FE58F55AB796546FF5E6152C4A00DE48EB6D2AAAF8BD40
            A35F684D0E4154B999BAB26819941BAB2CD66E502E0FF40A647CF94632E21FD0
            348606D43E150679B8CD81A126EE1190694A38F8274C7638F8D772AE59BD4D36
            2AFCC1D77E359384D0344A4D7D983CC23842CED6C642515722CF70CD8E7641DC
            A1267CC4B6F802842FE669F32C0D913C3516DA2BBE21169C977012FD903E0653
            592E4963E88E0B0C458CE39656DAC32CB9E043FAB47999B46675C19AB0404768
            52061E65228B70A00BD6EB98B8829D4A0C2D5B9CBB981969F72D59770CD20827
            8825893736591458D02AC4A64AEC62E31D6070BE20C32E4B241440B00886A158
            2156B01DAE3AE5D9D442A5161AE751D9764BD3CC0A585402843C89CB24AEE3FA
            800D0FD4BFB3E1331B2D24FD69A535F4FEF2AEE5CCB74C33CB93693440302CB9
            789C423185E732BB562619527F45F8C8A55AB63CC6472EA06A415F23383C2727
            1699CC95CA61CC5478512EB32BDC0F986AE1EC61772F307AD79976E770C5B4CA
            F3005AA23317167D4E5990B993B102C9EA64D3F763954D1845EF7B7983401202
            2A638D54A10A70C21A85653ED2A41A4C8E2B88E932F171DE3A45A8ED1C109287
            8C6EE53C1280CBC90CDC3C4CDC24C46A01764E07FB97A18AC85CA2D030583899
            37B6FC9983A634095F70394CAC1D5919E64567272B51267DC00CC98A3A8E7FC8
            81DC5A3B94A24EDE5F732F4AD36B310D83BE225534C7BBC2A28E74C3E3EE2D49
            07840A8C109BBFE116650E2640B26BE2A3761398F8E04A20883A67E10F5882F5
            32C30B8C7334FE925931D2FF00CA7B4658822426A52B2C43471538A975B3046E
            9A6D25952F5D4D0D13DB2E9EBC94BF6E520A68C1CB5A800F72EF23E91CDA7F59
            6EB23830A80DEA1E1DCA7087B2FF0052E179F95332290EC21F32DC59DCFEE68B
            F6468903171CD6930452C4D8D2106ED7894C0D636330057886333BB241580F38
            9879EEA3945578770E6D86A5216AB819609D7B09EAA514DCDFD137A1C9F504B5
            7A9BE378FAB87DB0723CE15B8A85C45229C3333E5DC3EAB1014F384F16CE0E47
            3F71495D05A0D7FD4CF0B848D330E68EA6A21773B1A62782109C425C05B10338
            834198840AF861F0CAC44AFC5C7A398CD6A3A55E6E1B0DB97551728193788FFA
            17180EBBCB0CE68748312A57C5A540CCB2CCF31A4C3E0CC3B948FD52D2E82678
            A2E0E67088C5E1E10F1776C972B759E6CDBE859CE587FEE27E888C24E1B12D61
            B032C31BF10A5781823404D040E1B10DD071288D4F14B2EC08C46052ABC4B861
            6B9784D8BB3D41296A596DC1C47B5AF53620689AEBB2F922D09D10978568D78F
            82070298221DB305F88626B33EE55E604675E935E265C4A15F7348EDFE639FB2
            FB862FFE5667BC21FDA3A17484FB825999432DD4D918C5AB6A0C23CCB4BC4CC5
            6895C8B52AE3EA2AFB33CDE68588E2253536511431148D99804BD130DC58F455
            FA87FDEDFC21C1C9DF1157F2CEE310AAF69A0A663772C54B3A12061248B4BFC5
            888C223E563B6537C9B6B0C1079425D3AF8B8663AE4B0066582CF8C6499BD2E5
            DC5B3A8DCF3A3504A6D5BDAA2566085B096F2CCDA03A60F5322ECD58BB623379
            FB47368EF878660C756CBE6638036430925535C6E021C8F307BCC04E056C8FC4
            19CC662B394A817CAC8C0A6612F0C12771041B0F0E669C586E5014F50082F822
            AA7E12113BEAD599D524E63CCB4C7F10C142E612D8881EE3B630EE57EA8A5788
            5A14EB1A85E9B5C5A965AFDC49506363C4403354E7FF00665DBD5D1E614C21D3
            53234BC5B48323DD11313A1369D15433E6179E48886041BD4163C304B50AA840
            086C20A05788F5BD01311BC80C0E3CBD452A9AFAA91920F480BF030A81E732F1
            29F68D63713E258CE2D5FB8ACB1F9B8C3B28434F687654DAD495B8A8844A7297
            23895320FB94F09E888D0FDCE42BD336C46A6794F260BB0921B8E0CAE2D6731B
            83F88C6EC892F4871C5C40799E2584ABC6C11E302F2A7B17D994DBB19C891BF2
            522E2DDEE65AB83082EA7629CF547D36665EE139673F6DA00AD5C7C031EE1A36
            6AD2A2A1B21DE2E882F96F10A57DB1586EDA083505CD13283C6518E68C8C3436
            C99566352E61161A1DB15FE61A69E99798AC31ECA32C3956A3118EF6B97A947A
            CBCA6F042F168018E855DCBB0BB95D996082914A11D3377C21E48AF71612F060
            8ECA1B262A56A55498A8FB86010D03714F14255E87443A6F371D38BF3004AEAA
            273F265E51F2ECC4D12F5E4C348C770DC4E291FE63CBEBF05835C78DA6790607
            30346DDB18CBF0A1557898B56650AA224BF83E18E8961CC52B1F72811FCC0880
            1A88D1A8030E39971F554B06C5C11C8E4373FE63AA74370EA6EE58EC2C0E3CC4
            25B1CC7D55B81C460027C14179251B4E89737F181B97A00048638D4538196E13
            6CBEC80E8425F4F356C9CB28C541850E52AA28A15E26C17D10209DA33695D198
            203A168A14811B40066DD698C4812531C6E2F65F71CBFB72F865E225917F043B
            5A05C4312A1E1848A807FCC486AAA2B9B963B59B0604DC08DD3921661326D2E2
            3CF500CBED134B7AF330B95B60A83349A2EA3B0B52CD04907CDCF52EC5DC10D1
            B4C0130138995868535435E9F9C08B12D3E91F3F84C143170B706727596A9EA6
            7817FCD0400D7B95A10BB4B9A2512A960FE995DFCEE7177086BF52AE204231AE
            150AAF7DC6E8E2AA04738EC8E6AD38950059885054308F425FF886D1B58CA35E
            5972C8797895E17CC3719D732D3E2CBBE25AABF89406D877CD1CCCAD1FE734AC
            5DDCF3EB98C0AF24D5FCD29F1FC75120D155712ECEFE88611492C0C0A3C2B1C4
            51F6C8F65A717B9621676CC36783F3326F982CD41BAC4AB71531989C357C0B77
            17820BDB11C6000EBFE6161466A9BD388389C6EAAFCC658B62A314A8403CB68A
            9580B6DC01AF044A8ACF00F364D2D4B25FC690DA05E0D422C85E7333EA218426
            C10B4895C8992548A116E58EE5006B10FCAF42811CDB39624B35C33780F3082B
            7DA2955BF022160FF222502B3FC603705D107C44307EA57583E4465A3FBD461C
            845D2B0DDC556060370AC2B2CD57F50A2EA28EBF700A97C16F88CCCC8522F888
            667A50C91150CFA80582343103A9826788ACF1305647A997EC11B6DF50CC19B4
            4614812BE68D03E9529DBBE46367DA7183290F0670B6C6074E18B4ABDD0E27B3
            4D371CA3D7172F7FE2E59ABBC54CC6168DCD4B15292604B1368E4F804B208CA6
            10899BEEE0DF7F0796F19A1B8B88718388833175162D0A81B6CC7C5B3497E972
            C2B58B98CFD92E0B5016CE5DBEE3B6F72C14D5645AB7CD21755399703C5510BB
            8796599750DEE463A0E22886E5E056C961F3050F86204D35FE62DB7141A38862
            DAAEE5898115BF26ABFF00B72B8832EE2543E30813113316504235E7F73043AC
            545842CE0352C8AF4D6265F2A771CC2B597444BADC9FF12C365C4A90F1968B27
            444801FE23A61922A38B2BF7528D7C20B25B15B4D62635E2E903914E65A541E5
            D41204737EA7A605AE5F14575DE134D8E187820B01ED0C005CEC31C338D10A69
            022BB4C1B3C5AC00E4C1625802DE4FFEE2744AC5B89A3357A62BFB29142F0C64
            892F74C89479100794C655C77362AFA89299B46133468D44138BEECE6A93D118
            C38850EFBDCA7CD4B05176295B0A999D797A882E317622D4B5F32921FBA3F525
            8B115AD3BB612D8E50B0AAD129B4C1F7B01068CB0E6220E49A012C0EAA623E1D
            4A556E2595692830E655DE786940F2CCD5842964656CCCF06C7F72E562A1FC03
            E254BF919C32B500AF0F3CC7FD84DC7C6B8F2FDC07DED51E791D44AF9FAC7180
            617C0CC1BB0506E3DE101598E4D079D5C5FA57B65FA361B4652A05D253DC2152
            BB46C4E7399075078CB4C611ACE2A175DBEE3610C02CB968E3C0A8CDC7378226
            169A08CB34DC883A8F920D8919A873EBB151BF44A55CACB5848F6B68A06E580F
            29E6121A4DB2AAE20DA26CFF0094FF00F121114EAA17857691E442F6AC24371F
            CC35B5F98C223D0B118C4391FE20E5816AF337B467F738865C33C7304F88704F
            2CD799886E56DC775FC21576A05D919A86D085D42761F1051155D2CA39D4758C
            B0D8193DDC1081ED50F9158E231EAA596182F3038E2504099A4DCCB8AB8A3E60
            28CA0166024B3E7CE01F15A4B1FE884976BB943EDEAE3761605B9E336623904E
            79844ECED3DC762D0E4CC329EBAB0441E0A46CDEFEA6EB6755CD48D205266B98
            0A2CB16532EC97C54A2C36208A396687C145DC65AB2A7110314C14E173326E4B
            423F50DC5A2AF4730A1F4BB8C52EAA815245477DB0FE6047F78947371D9C185E
            F70B52A5C70F1003096D0DCB385C7443B3315E666371F8DCA696994C48760670
            B38D89B604AAB11441A1E5798876C97498075AC304D399A548746A38C6AC03F1
            7C902B7098B513811CC311D9C4DA6A3316CBC43DB040751AF825A1A220D44280
            317305C530FC1BACC1F2526B4CB7104C7C11D983DC34C8EA19887894C2FCC2DC
            CB873D3E1233D7E7886ED7708A67B47329D0D7F51A6BA53772B09B99446FC12C
            2DFDD45ACBC4DE176F5B7885F39B2D52F01B498EEF4A3FFA2D03D4DEE5495057
            9E36C33773113D7DCCDF7507B506B60CEA54D3FF0026709BE389730F444A8970
            C7D916D4A350A97B5F69C4776CB24E2A3F4B38612463FB9DFC9A2F04DD73FE65
            F98B5502C59003C0E639A699F6E6CF3CFF001292B95B6AC6F8B8FD1501DC6364
            9B0732DF29E280CCB8E4C82A7711D7E46C4B4DA66C4169A8496094872F88B8CE
            22978613832C5D44B0EA2B794BF52A472C56E614E6138176195C19806705FE62
            E48B8867645C147E29C21994352BF1A27221376AF514B4FBCCC09F14014FE750
            9D4F220AFA5C264B2796E2D803D11CA08B20F7CD43CFD8B72C0D6CB7DA141CD1
            520FA018E29A0AC0FF0098032959732CD2AF2663C2A548E63963C8E26B9C1C4A
            83A0F3C465C1E038A98F7634DC4B7300C4037DB884088959FB94E92AA311CB57
            310D75264A8D03589A3706F70D823A744A720F888D1F71517A38A941CAFB96DD
            BB80A0FDC6E31D4CCA1E49BBBF9E0155C86E52EDD430B990CBEAA663FB970F73
            92FEE6549364C7D28A72CB8434A57B95E5716FD45D993964C3A312D3C4CB0A63
            7ACCEFBB022930E6E9145F359F0E8831E25403C8C48E0388A80B2BCA54FBA324
            1B0C413443199CEC87171D156CEBCCC5566627CD4368CF884715443F0BA26567
            B993053F2FE1A84B614804C823D4CE479E1607065F13DD6673FC30D22F8A7530
            54646849D975153EE6ED6C26C967285D277DC08B9CB5CB728C60E348E10EE1FD
            8C2EBCEA1D5308EA34A172AE10A069205429DBA42DEAB31F0588C6C8B1A8C225
            C996333D901AEF04C094E2F046E6AD5A96281C56A1F5B09E7C472B95A91C6255
            1A97E20ED07851C358095B3242852F0979F0114A9217A3E818818D467932A0A4
            C19DB2626BED1AB645C86DEA1A157DB03599530A60E5F754DE09562D1CCA1F80
            26641EB06EABC28D0E8F3296D24368FB4A9FEB84303AC5729B2F5ABABFE23C0A
            D82A388EED41D4B5D2CAED66FE57B9E59573320D20194D3112E57E1880BBFB12
            63CA613CC5973B22A2927B4307E2E6149B1084BCC51C57B254ACCA952BF01891
            227C20310CAA575AB14ADF345C09EB9870F04464A35D5E11F69CA702D16662AE
            A195770F67ED0982952B6E352E69F5815D8452D65E313A872D4AFB2329C165B0
            FA6E047EBC625A70519805009ED296AAC78E09814D4A04B3BA71E3535DC641D4
            1082663D5D79CCB9D3532D26C3FF00C8ED5EE8B71C1FA8D9197898C08434E02D
            9035B2A8E6A0AE03AFBCA9AB83485A997578948017196262A0445CC55702231C
            5023B1707D4280B801D31F0CFD05CD4E8A53A98254ECCADD4489662F95820270
            B518A3DD435F3BDCCFAF6C466C7F882CC15975CF5C4CBB502831813C316E33CC
            CFC5DCB2239CB8EDC1BE530895DE2EA7A724964541CD4B13FF002E51FC7E5512
            3217D4B3EEC083DBE151DE0EE2CD951231F83F26F88A279418402369C1A997A2
            1EDBDCA63D4F7B969B7B5B43D5A47E63A254B17998736A5BF895BF3A47747145
            1D49215083BB2BC04D1230A2291553FB95A040BC421AAA4CEDC2B5150162EA62
            30A7A42B6C18B9540E55DB396A7DE4AA605863C20786FACA62C76AF09EDF5095
            92506012D5ABFB46E6D240818269FC35ACB04355755426AAF1460C82C54BDA75
            8E2AF7B8FCC0D4410759DD466B10AF6A12CA237099314A10F1532ED453CB067A
            DE7926624EAE104827C92D676A5B92901C1A593B8324DA456912F03C9A40E1DC
            F12A0478AB1135F82A005946FBF583C83AC1AC409FF568CCB6B021710E49CCF4
            B20EA7DA7F21C2038977983FCCA3F32A0542E12E32D593C26CF1167AAD40A5C1
            D457111EA352FF0017E50CAD401A83652CC0B835F1D5CBC5BB01A95FE3679AF3
            121C419B2BC66EA5C07AE1E2A11F60B97EE6236170AF9652F1CA5259C7176EE6
            5071B16246457405E61B788A65E9588C17A25D695C1DCB70DB8A454470CF07ED
            15A1D2CA32EC636F44A89004BF73314382225E81606B62A9D4189660B365CDD0
            1B0CE60ECB80EA786965648E339237AC45213E953B4CA7D3B337899BAA29C26B
            85ABAD43D7F7D54C4B49696BA0276F0A7D4599CE2D5239A95049CD7A8071CE32
            CCADE3B0DCBF37EA32CB9A8B13EEB385FE8B0A2D255207B88D50E6AB4788EEE7
            E14ABCF2546124CC713BBC57F309A798854D415FD1544C681624964D1073B890
            B733D299E98FD8958F8BBFCAEA62A512747C163C9F05825C7502383AE130CE2D
            C4B3C7EC4A05C8B99DE2D0399A07D196342D9C30E0C14BFB4095D712C57814A6
            65C2D2FF00D67F253106A2F37FFA7C74AFC65D04BFE2123DD2E1F790C80C7750
            7A6BB42340845932503C862500AEDEEE6AA0EECC6800EFDC1159256E5151B1CC
            31C4D9FB86CD1B3C2665D70CB8DBD25390AE232A0CBB35F1D0CA6A3DE620A7B2
            39C964E45E66ADD6F155781C182A09F29812198E88C5C5097D983720F30FB6F0
            92E20EACB22C675C1D7B619772AD982E18BA250542411205B58241822082ED54
            4CEF75FD534A99548C8AA1CD7CA0A81A8C737DCA3B982B80EB7164AF8AFCD994
            DE598E6E01C43990305556AA11CE3570F1C0F13C0488C1AE98FBF8C1BA092DDD
            420BFF009530314319F28B9898DC49175890B8C4316EB4369824100AB5F0EDC7
            298F0A826AE71592E3CC2F2DD88B964816BCCFAC9B443CC8A23122BCE1B42839
            95387AEED080D3F36C61192973D421B45078C4E7688654968CBDA3CAD423BE9D
            C3A50964D2A9FDE29281532DC097DD0622851E6B28D2BCD8A6A597F32C46A7DA
            7F20A353C998C36EF2C455400EBE032CAF1BCFBA8A66575150C664A8BD46ABC1
            4FF30C4E3FAB571445E257BB1F52C3718ACC54E89B528E27528E42729844F63B
            480F1BCC57DFCD7E07E00C7AE25FC197B00CA50374311484850574EA4328DCCC
            507CA68150AD888661E6BC6BB6E2FBB22A55C20BEC8E54BC518193DC3ED2DE20
            E12CA614DC14F357EB0C00A9905FD7BFA4E204752D3072B376B332A71A329235
            A12B1C7119812A87FDCA4191B412CA8444504F4C9B826F7AC97F691E186BE9B1
            DC1E688E92C1B9EC011D61E0188B3AFEB08440E39678AF17854B384C8A996271
            72D8498F54B87B90E452CB20D9B4A625DADCA6BE5DC1DC0F32AAF9918BCE4842
            710905DB998EB352BFAC66997635DC5419350448833AF33C5FA4A12129710E21
            6C5A9808AD63094EA0788B594A6B5C6BA12C6FE6B12FF0AC7C20C272BE03BE3B
            70639240D84988C2517B626307151C11A6EE58C06D7DC31B84188CB1987E14D3
            E674B4CB2C44624554C0F50B5BA88C776E58328D166A728EAEB89C621540666A
            D4C9EC82FEF1024D103B849000407CC6995746A69BCB17A8105ADD2EF311DF11
            9B945E59A5EE56AD3C47B980262B5F6400EC78655929B7BB8722AC757351C8AE
            22481668D512F5C768FD4BCB0F9198D5EB53D84609C1CCDB537AD3D42EE7CD45
            0CBAECD4B1E1199E698FDC1ACFEC0E8B351E93C25D72825DF78CFB40B463264C
            206CDF4095511E122B86528A86F9CE2BE128903332A10FD9B65011B444DFC1F1
            7F0FCA47E15F01440B289185261A3FAC61C43A617942EA3FED23B88C85B0B0AB
            8582689A8F42AA0F104B804176C250C8F30C5C6AF3558873BFA0A80A6E09A7B0
            B754A250E0DAA6A33A5C643351E2E53EBEE24A6330A50BA9F44110ABB8542C0A
            C80188B3E341488CBB6D1EAE6AB9311360ABF091A1418BEC4C3552DB919D0496
            386C60FB9AE172AB8670C90F8271D5A74DA15002A51C41436652D0B54732F1CB
            9FE61FD85D64FB9088A991C411DCABAEDC3E5A852C69C6A56DC6F0607D48CD40
            4A601A20DB69889514EECA975053B33097243FEC4C35F1F130E232E3F3B954FC
            6D8B3594905077870A8B9694FB46640F0CA05B91B271A926E1EE1E4FFB856400
            DB1090E262DD2FB2AF511873C39C1296B9848DAE2578AAACC2BCA938E2F2CD44
            AB6F03328605D3A6E6DB1B6EA12EB2E2D5199B73939C4B1A379FE098464617F9
            0439B8CF28B64D85C3F6559B416BC4EC95651942650DCB2904692B5802A2B4E3
            93ACE32A88160C4A994ACFB4069B613CF85844E8481740164E67A4BFB2521764
            C68545B4764496AD6495DF2CB2843949C8152D97D34BB22E7B04197C463082F9
            878471CA724555B495277010101B974C39A6EA2F4A9D92E821C7CDA062388CAF
            825CA125A38872AE55BC40855E4956E3E61AA61C2CED6C0E50200BE1F8C6AD8C
            B1B4F9D4F32F4975AA2628F50824C2E9BE238B0F14470D7A304DB689060A669F
            287BC5635B654E584AEDA9988EA7D253095A53242E8F9608E13389663582E25F
            C0900746F306D93EC8AF64958B30ED9A72C2B21CD519E95248C17BAA01CC4236
            6597684E18048C4C75965F58C5E5E0FD20A0FEC859501332510C31CCA11D0CB0
            642688A8026DE3311B92932931A9CFC65F292BE0C7EACC83853C04BFE4711590
            18C4EAC151174A3164ECAC4BF17B89F7F0C37F2E255C372A3F273250C5EC32C9
            873599ACBB2A6A84E93EE1B106C5DE54A1FDE4230E60D12F970DCB658570F505
            7A9CC7BB07BF44A4BCD79DD6A1ADAB50E2361AFF00E9FDCD303982C49E41155E
            2EEA51CD722F310D9815B407710AB8D67B2B976104B6895D0429350AC9CF9828
            6E08866B31A7105921D26A603EA57787329A9FD9B0089789B34CB496E6C9528C
            BC906F6B3DC555BE294C5C2835F84260D327C57E152A316220550E5D4AE2E4A7
            328D089B99C839091A65DCB11A245E40386659327895FD2AB26B5056E21B2E27
            C4D0233C7FA9E75DCAC31DE59E704CBB5739975753AE22B735531515E82F5F51
            75145B0B226B994ADFEA0FB67E4E0EE57401D267189C151978A0CB3D3B7059CC
            BD895FEF8D7FE2677831A47ACB6AE58AE1ACACA742BBF3050C5D2D663BB6D6B1
            6D18E3334096C259055EA06DDCA2D5675D4D9BBB828AFED0D92E728B62293DC4
            CCB879254ED47A5820B793A861903CC11194ACCAF854A8CAF8DFC2AA0A7A8ACF
            1098D0A8A56CB8725E18EC25B89985AED97DA0430728858460F312557CD4489F
            8DCB9A9B7CC770A9C73EA00B0C4F09FB94EC5E2654837CE6226B0BB51E3041FF
            00E73089F267F72F56A12D400190CC30FC61981016A71299A59BD6398282B4E2
            58737BFF00F10CC5AC1FFE235EADB1183E5287D63FE255882970C48C536435CB
            30C07F6A918C5E231D014BED19DE11821E0C1FBA7E921750D4C3AC292F558E19
            86FBFE8B13E152A660BCCA0C2EF02600BB4409295C26606B9975B553519A0E86
            29ACCEE2BF0A952B12A3F3CC11DCC2DD9E62D17F528D811418FD238D9324CA17
            AA0552EF3EC59628376428892E95B27192104B65C4095D47AC7282BE0283689A
            513D67885FA96E1BA9CD1A8ACC3710FED925265063A537B8D252F16791460D30
            EE792AA25FC56D8AEED29891257E09F954495F049551E5276F80388AB1448607
            6D4B873B8B10978A87B2E21B3E2A3F1571FC8B9A5FDD2A661E60FE1352B19B0C
            23C6BED0CCE5055C3B312DB9EBBDE0C65CF7441A93A585B27D258DE914E0996C
            BE261036E1810F08C3801297C66A00119ED0312BFB71AEBB265652B8EAEF52A0
            62D4DEC9D8A2EC84D69A205AB3D44F8AFC6BE38FC2A24E3E153D224D14B8A79E
            454C89C4DF920255AB2259FAE13734557963A4833130DCA7AFC2A315F8308B36
            084AC30F4A54013C89FF00356217ABF6B9B247B9944FA8720FA252C2FA22CDBF
            C536AFB546F0FD917A307C732A0BA814CA64C1B86575FDCA5C2599331E931628
            7B84D5888E71066DBBDC1EDA373D861F9544952BE4FE954636F850942E60DA65
            6E5316C2C558A8ED15C4E2C3346730CD28B6A01AB4A657C54495F8D4A951ECAA
            73487129750065A7A23B6BBC9461BABC19C1FF00715BA45E4C18553312E8A271
            EC40A2BFBA50177348999D4898407B979B364D825B25F229AB261CCEA29B33F1
            5F152A732A12BE2A57E15F0CAF8A9513E019993A7EA62C00F53C3710F6FD47B2
            0BA94F8AEA33FF000540B50896C466273F911F9AF8B7B6648CFB81ABFC601577
            D45A0B5B84A3E2C172A5DB00A15FDDA620E397318D5B6C147AC4A4ECA86638C9
            334C98589198509BE499C5570356E54332A54AF8AFC8FC6BE6BF0204B47F34E7
            44019EB51C2BAEC266FA995073A9B2E542DE4F10581A713A352A57C0547F27F1
            9F03986A145E11561FDE1BACC6C1D9E23245F22258B026706E673A8466A3898E
            58CD710A6A946260A5ED8C6D44A32BEAE24A95F0C7E6A262544F8A955F3518A9
            52A546544951B1B899CC2E1454828432D561D31C944EE1C4FD42E3F9506CEBE2
            256F1FD22108270C5355AB50EC9995FDE5424AEC8FA95FC2654D7F12D7802A0E
            EB853012C9CC420F3051E299A4D918EB5D431B7419863366217C4F0C712A6D86
            3F01F0254A951254A8913F3657C25CAC4A8C32D3DA012AD95A88B520F32A948A
            8BA18BA980059865AAC9F6278317D47E2A54A9507C023A2A12D5C4F4608640FE
            F9210B65253DE140AA2DD0466E4745DED28777D61423B4CD403316C59893906C
            E2E1CCD218CC1E4327C22C71D5DDC4FCDF94951FC184595F82A55FAE67153B30
            4FC52E28A60CC27113333E22F6E07FE608496226C5CC8B28A5B07F315E44F909
            E09A846CC57B951F03D81A40D4ACFF007E970A7925AB2B4AB4369421163EB588
            294DC18E8F08E59E129594C464B21970EE32905017445C5FC11B45CE0B966B11
            DF89B378F73EBE1892A3F297F17F090257E58E658091BDE92878123A6B7BA9FC
            68A53561D5FD44E657C951EB1CC7B097730B18994EFA433F42100CA20FACA516
            C034A07FA0D4CA29C45384AC2602E31D43AE2204471B97D4A40914AC522898CA
            5BFACA021A18081230698FD5CA279552CEE00530CFA8BC14BEA56624B8FE0CAF
            CAE54A8CD6ED789B45DDC64DC04B223E70E93D38250A65DA8CB29A1DB99B2E54
            489F0A84659512BAEA0EFAA520597141A303481FE8F51DC2178609DBE6580BFB
            FF00E479093EE5DB2FD4C346BACA0E89557B989BB012C3BB706151F2E2000DA0
            EE3691074C9261E1E60F7EB1952BE189F0FC54AF8ACC7E0C4069F28F40BB388B
            55C138C011B16EEB9C7E525CB8500FEA3A6E8CC9FC7CABE2BE0CF2C56B297474
            388F21DE26A0DB610F87FA6542324482614A771B637EB2C222340B6B897BECA6
            67E31A856A30D2ED60D38139E4160E55F09539CE25494F2898B3513E3989F0FC
            3F904CFD25F8C435759967F413B52059B7FEB3F8383F4CAF8E254A87E18BD122
            64DCA0967FCC1A4A815FE9D52A0D85C31B32E938991588C667949F630835F2E2
            337018E3B5D22B9251B25E3D4739B164B5387509CC33B53A955F152A26224A95
            352A5A9A80D66C6A15CFAA23A84A9311940F59229D60DC436C1F092A54ACCC92
            D8B41C4600675974F9DA009E3FD4DB429C93000B25A7F8588518F5021DBDD42B
            37B4C6935C4562FDCC6586722CC5C5BA85A9BCA573A6A6E914003BB8279BE412
            54AC4A89F1300651CEC2282E5FAC0E66EC906CEA04A1272E6544F9ACCD308B34
            46AF869292311FB952B3440A3FD56A06E43A8653825A287A2381DFB44EF9DA91
            72646D97782601BAAAB12EED10C8886FEC436D82E3F6F2EC64725443627732D7
            F12BE2A31D4B469196765C75997A1A8DB673FE67988E59185EA64517CAA57C03
            5283B0978B748A961B6E1998FF00594B84D3696F70BDA66711BD46DE2F0CDC5E
            D98918C2670F3A4955BD435E39C9C99824A9311FB44CED32CB8A4E91A958BE22
            1EE554CEC61BCCC317998DFA6013572C1C8FFB82CBCFE64AEA55C6543998D0CA
            576C1C4576965FF1028FF5C6C4D58C2B3643D5CF51F697D4B4B4C455FC137689
            9E6C7A89604B3984FCAE64C9923288E1B933338B16E20295CC00C172DA5A153A
            8E123BCB0A2D4A14DB88AD00CBBC1093537F025C91CD5B16BCD4113A95FEC06A
            080BB3D4BE448490A85FF4484AA003607AC5106114EB532E7156415EA9FB18AC
            CFA97181BC3C434FA8A8EBCCB22EE650089633687D5085AC3F1194AEA44B6584
            3868D41FEC24BF8621B45D87EA0ABFA88A349DC5F8E7C261864B6881352D2C63
            583CE11353EE53EC84E5BCCC604B71E131804B706AD60EB8F3F3502672157928
            8C813704CFF63A762601B006867C4C7FA1224FB51AC4ED509504EA11AEFA4529
            5F133B764ED1820E1261B12CFC4A90BB85B92BE45BF1C724B3696968C15FECAD
            E84B7FE04BB7F4A3181E882A59F3508E6EE42A3D319C82744223494320FF0018
            37B39678C1F861F08A8C4470B20906A1FECAA952A1B81843701CBF511258FA21
            0D996842D0F958D8798CB5D547A8682C7319A2B31F8099A188B2CE2205668828
            FF0068590BA0FD4C61FD410A2F444408EC97AB06DE2A7EC019E70F10ED4BF518
            C0CCAB046E343A822621FED2A9504B8549CCE277C46C23A3ACBFA8E02A5A4FD5
            8377794F2BE7A8228A62076B8818FF006AD4680373002D8313E9144FB2C9FF00
            CE25F40DEC545B6143FDB153F93426C57B3F15276FF848075FDD7FFFDA000C03
            01000200030000001080000000000010C304030FAB47B83C3204008000000000
            000002000000000000000000004009102101009BBC25464A040B98D7BC586C00
            0000000000000000000000000000000000020C20C101A099AA060AE08F1148ED
            A566F2CB793CA80000000400800000877800000100704B183840EAAF875DFC63
            1D9C55A43983853D06D4E1C3C61042000007BAFAB500000B16F5BF11B57EFE91
            976DE867AB39CF0317E549AD88CD9319319CAB451BBCD50CD00058DFE3256FD4
            D196A10CFE47D7ECE97B282F2C47D5DA52728AFF0036D25DBBB1FE9E140503E8
            8E014975FF008D6AC295283C182EB33C170EB9DE8F2066B40D7469242B26B930
            8000442BCE5DA976DA239B42E91242A523035DC9060A8B77E369EB2670E65E41
            CF679F5A8000C523CA35F9A05262DB83671A5AD52BB26386C381F811B2F198B2
            5D0CBC493C72045010020F94C446E118A0269F20FA949A114647482141D33B1B
            AFE24FBD27B18C8D12B0868030A2D726D6F1732C57680E1D78C054314218B079
            96186AF1614450421DB336FABA8600000CDE6E87954AE98955EC370C02FD4DDB
            569D54610732E48043294572E82207CA798252078CBAB9F3C5A5858A4B99E7E7
            4E4F0EAA87E5FD136E2665A4DA58379668A414A50F7C1ED5A31D6922C8162B0B
            4DC907A3EE2C736A8F2721BAAD17548EB2C6A623E1192A78A9E4DBDAF0A1E110
            17B51770481F500367265A1E1A4B7ECBB173BF7B81A403FEAFBC8E5934AF613A
            4D6AD0ED0781190E040D3F5A884A91E0D3DC4917068A85C58D191767524940BD
            2E6E0B3AD746483AC2D29A33FB7ACABC8B524D88581B34F8DF75882F5F55DD8F
            83CE1CB28C7992E8532666CBD539B6761007843E77891A6412DAFA04F58BF054
            F10B470FF0401E537D86CDF73E71292649D811AF983F843DF64AA2393730F65A
            BB74A06A9B9E0940800500A2D9E4B57CB85ECC816CA0495FC217CCC84CBEEE8F
            69ABE7DB6F49044EC8BB791800000EF4F4109714C27013B87DCA626C87A2E172
            2716D10385D57DCD193EF4B7D6A88900400820EAD47451A305570861F52D4342
            56D014CC4B97739DB788671E9836FF00571442800422841FD983A3F2591A3FE7
            517A7A0DA9BF4437BE5D213BC160A8413FCB9C798830C00000000F44D83469E0
            E0E785F0EDE2392391877444183E6B7A10F26CD88DA0E431C32C010820410FDF
            C2B8408F6F267688D56AB217FCDAC4EFE19BF461E3B8C63F9182081002000000
            000046A3F093C714DAF974FCEA645650BF1EA439B188444DEDAF4C0390430420
            C0000000000322C60D5D4258BC557392C6D3C9E653297BA8D883522D18AE24E0
            0000008000000002004574FB585022D2A20C5190383C9F9215C6800D6D06E985
            24D526108140380000000000009117D1445E4FC7A0B44F1725BB3AF37D0C08DE
            269CB62CE6E20000000100000000000010C2001C36A51C15DF6C7E2C3D1EB0DD
            D77C32BCD7670E44008108300200000000000000000004380A2D210F396AED20
            F83B325C885552E3A377404408018100600000000000010000000818D348CA41
            CFDC4D6C47B179A051BBB7190328400C10010020000000000000000000020400
            814836A2825E8C1371B8AB1F6ADAF89E3B10224020500E000000000000000000
            00204000910020C2418D40E69C235321ABF21E20C10830020400C00000000000
            0400800020000008110028000C3878CC4D2F6F6198CC00810810420400800000
            00000000400800020000000000000400853003843BA758B9834838420C108100
            3800000000000000000003020480001012020001420C228379A1B68C108B0430
            410830030000000000000000000081C00000000081C020700800000F027DC81C
            020700000000020FFFC4002A1101010100020202010402020301010000010011
            213141511061712030819150A140D1B1C1E1F0F1FFDA0008010301013F10FDFE
            F11D5109D377FE14481AD8EE84E53C44975F1B168399BA5C8766E0E0BA0F114E
            3F0DDD3218AFC7F80451DDEA08230B683ED67983E23B897F1057450E9B1A7538
            466B0BED15A7E8631C3FC7760C31B03C427A8B174F10E4B07EA35C59746FEFEE
            776FEDEB1E42FF0023DF572008B06878C988FA5C8585C4F867311477736D8E0B
            C31BF78440789BD5CFA03993CC2C0D13AA9868E76611CFE605C6526C54B76E14
            C6EFF5158BA2C3C696FCEC0E4368FECEEDFCBEE5B207FA4D0B8F0FEB53B41AC3
            E1FE6D59B0F574CF5282B8254EF7C453F7C41BE027CE064CEF6CB0E78116E92C
            DDF24772180D89B03DFF00E89F6404C3FF0073B6C1C62769E6E7C03ABDB3F1F0
            E7319CB3F160F096F8301C07F115FDBF8203C05CBB8DEB971CCB6756DE07995D
            D30DE61BA611F8631E7232BF7F88B831D4EC0C75FA774613F875BB9E7D46ED0A
            0F3EE3DBE6D10E100F89E782D43CBABCAF6EC1E6C7263C5EAD2B6C2BC4A28A77
            DCFE558AF02E4ED3AFADB7BC5B8787CCD4F471230E98B08A393489A0CCE8B4AA
            1687F87302C6B705236BE47E523C181620FE2F0D97715EDD86986F4777072E79
            AFF820C3E573CDB5E335EE5F89CFE71B087716EA5EAD8C64C09817919EC1844E
            74B35240968B90D7E0C9817B398AC49402DC76FA983B8F7FFD9B763F1D751C18
            03993EE04939ACF363050E5275E08F00300F8400CBB40C3651DED138B735A31C
            011ECF24FF00F228293C78B9537F4BBBB10451BCC98EEAE657BAEC2770EDB0AF
            076FB22189E3092C70488D6622F4D82D873607AA30F14FCCC6300E1606AD9E3F
            84679D59274785F139C4240BD3CC9E2C7798F3B38420E4B12B00583B38644419
            AB2B395DC275715326D1E64DB07BDA73E6C81F3D4187BFD273A322170C379B72
            70CBE9679E63D7DDAE583D59F7360391722D9CDD18D94A1ECC6EF49910E5C6E2
            5F566754EAF65B0F99B6E4D8C18DBD3DE1BC2EA4880EC9E23B1817AFF509893F
            13FF008121B48FE61AB7C06677161C47884CFC4E560F9962AF94F9896842712C
            0AEA435BF8DFD3A086A4138EB69D5F5690FAA4E3487FFBD42347BF9B05E3F992
            F713A73A6540DBCB1EE458BC1392F0719D6F89403EB276875DBFF9462EE3035B
            11E895418EC0B61044BE5C1030E3264B9FF566BED9BAD604C90675938B6723BA
            582F16D06E93DD9398899C89788BE209E21384CB2709263A94C2327DFE9F65B4
            F3C9829EBDBDC1CEF990F8400895E0EE2044AFDF33D4969C7FD970782E8BCB69
            8AA3CA9901C9DFE88F731FC43ADD5C9AD4E43BCDB59B67158B9B97F6DD612931
            1A663F51BD427F19038D9C7DCCA4C1BCF1BF52ADE509EB90CE79EDBD08B2530B
            439B2E172A75395D12D02F70B9F1E077E21B4EA0B204E8FD38E4D9739396576F
            76E7509694F54814378F078B997386C8D0EF53E2C3FF00B7AFEAFEBD4713C087
            217320EB89EEAC008C19097A8DD7973646E6C43D4FB78D8DB77CFF003798039F
            E26B793337227B94E44E01C7BE2591BBD751B3C0C36E64E276730F8771869266
            0E4E51E6DE27113919048CD7527D37D233831FD0D95B9E6E6187568E61AF0C0B
            5F13F42250EA623827704F00DB59D62C8D62DC8BC4FA9C5ACB656D9A8DF33085
            D16CE3C5C626CD69E2538F2102CCE0CF5CC2A40E72D187623DC9E9BFFF002110
            4DF3E67CA771802BB3ACEA3D2168D9BB305B233638800421115BDCD3E4EF765C
            D7A987722E91E1E365ABE57615E03EA574D9C69274B74273AEF5EA4C8E3D44F5
            D7765AC4D92EB611202F416F12CB9E656D40B0D82587E2E9096A1D6DF7581D5C
            CE27C479731C5B09A383EEC9F2B40B117A8CE03A21843A167DDFE887E28C04C8
            7C4A0FE104B890F061E443CCBF1B7F156E96AF2DBA91BE3DD3CDD6F521C5CF6B
            DDA03E7E24F9B78E3DDCAEA3A81704063C44135B01E770482FC6243B98BA3EA5
            FCA36C2E3FA1BE523C5E84ED26F9CE03DCAF9DF4B8987119D8D58DAC093E06E0
            A03EAFE524D2E9FC6AD663D45878974903A4130CBE5F05C9ED19CE6FC2A9A267
            06F2E7F530BA78339872D2D28B8C3661DDB2D6C87222E3429A3891EAB3CA1B0C
            A0135922F1B3E994214D2C478EDCB772CC71DAEEC07FB5D28D9D30FC706E6D3C
            D8190100EE002389EA3D3CD875F8F7698124F378125DE97585821C6C5A367A5D
            DB17B5278E4EE074EDDB10709C481D113A1CB689D44E97B6C70CEE39EE6278BB
            B29B83C0EA337893B6AB1FE169E230E60C21C4A0C4BF6CFB93C48C3E09632C9D
            2DBB1B42B8950A0C18FA5A3CD21B7F470B6C860CB33E5E190B09DC9EE12F1DAC
            F9DED19DAD506398EA881D963704DDBF649DDEFCE42149BE6DC0EBD7F12083C4
            66FA895E4CB78BEA3D1501DF61FC8231C9CDF5421DE5D444F06D076CFF001CB2
            C4F68A632190E6F1B05EE78DED3441E5033B6DC207E8C74913C9109257A2CF8C
            E2CDB274DA3AB9ADBC9C4F5BB74E23F1645381C9782FFA124397C92D9CBABB98
            8A7F7F99270BD41DDB4EBDB1F896A2B6CBC4DC791DD51ECE7B8CF463374E6FEF
            DAF74ADEF61C5D578B7AE832D19704BC4716A7A5F5681ECF7CC10EFEAFA8B813
            3919DCB97B97CE63DD9EE47C1F808E668890798D103D4EBA4FF720FF00324A59
            C94EE93751AC9CFC7A039AA13CF7BBF7D7E20079D8035E12001D56C28CD26E60
            0FB6E41E25840264714A70576DC2DA6CC97A3E128BE0A0CBEBF58BA913ABE14B
            2ED5A0EC4D83E1EA3C7D4AED30FC7396752C7936E79C830EC2707C6C88E5A59C
            E633A6DBF464F0EBBC8887F90BFD98A1FCB9D70855FE218E61C5C796BFD41974
            3A66F211B8A00C5D0176DE2D472FAD0120087ECB693AA89FF7592DB9DC0793B4
            D91C91E3C27AFA4B01D4BE24753F09A65D61428AC9D0364C371FC48671FCC860
            95F5FF00C8C14ED7959B84E87A6205E721E5B0EEBFD485E379FF00A9B1375CDA
            1135B265C7115C7C4F65C26C959634DEB62CC2FEDC175398DCB4F39F8BC29863
            9EAEE7320E18C3E2EB4190F5C309813D7C61647A5CF69171C41102410FA334EE
            249983FB9715D7E603198E04800672BA603DC1E3A8D91A33D1037B228E4F3720
            39B58E44743784A0599BFB4A9D4EA2470CDF2E2705E6C75B27EA57DD86ECA18B
            67C49F16556F2F7BD818E24CEE7EACF2DBB3C218E90065E2C8D69C9239DBA132
            36BE3A9175C58838119C0752DAE475219E2538B483C13F2627F4B8383F6F6E70
            25A2259820A56E9BF396161E615F2E2474E601D93CEE3E20E8B21E32278B6396
            C433AB5F3732921FD7F77F5268E16A242ECAEB22102D9CDC216202CF9FBB9D58
            1A757453D7259CEFEBCCB3601CF99C793E1438FABC8CB4B7F10326B23863751C
            3E0013B0BB9E3AE2F2458319C4C3E5E6E5D62E1FDE0D52FD520A386C07432E59
            11C611EAC8E7F4659F2EA5CF2E2C33AB1BAD8C09F92CE85CAE3AB9312ED96B60
            5C4049D77091102963FEF379404801D58CF62FA0BB9C9E684AF289C388D66CB2
            CFD0FC24EE616E32C5BA95E7B9F10DA2E514DF9025E25B728495D19FBE71D5D4
            B99DB54C42B07C021C93887B2C3BB254F8468BEBE1F84FD3C0D8D69CC68718D8
            26C484E5CB68F164819DC902991C90030FF8807046E05865B02970C3D598E836
            E9C5B0C13B80CC9B659326F0CF8C8D3BC2C6F9D653D220044397BA58025D93AB
            81FF001CE20705CE71F87098CC8D26CA0F861310D8752258E6B3D7C65AC99623
            A20BE18D266407A864F810E22CEF27FE58E5C6988CEF712EC67373069523D7C4
            97633DD93EA33E7B5D4F2166E63090478C9F81D7FCFC1EEEC8976D72CE6228C6
            1C9CB6147365E634D2443645DCC25F085DA1C017F2DFE0B8784BBB2EF283D1C4
            F9200E5C066227204C76B2E533BC2EB8FF000AF517D2CC4E2C753C8D839D8E0F
            96E57FC4F166E66A0E3E29CF890197467F8A2E14EDD2866375FF001C3327F7BF
            FFC4002811010101000202020201050003010000000100112131104151612071
            3040508191A1B1C1F0E1FFDA0008010201013F10FE6DB96DA67167B45D7AFECD
            EDE6621134F18C8744C33904B070D55EE4CCF2DF120B7863572C1FD7A098BCEE
            3DDD86A12B830B471F1DDDE72DD13D8B401CCBAC26263DE733924F430E3A6324
            48CDE443F330776C7F2E7F17B97C64B6B81F8269D03C42DCEA667510C0F65961
            CBB8FC19746079B3F385CF3E099C0FD43F134E6C20AB9030100CFD4F80FF00C8
            5F07FE4730E4EF36D9DAD14FA16E4B95DBD2F68D7E7EFC0D2F5F998D8E782ED9
            6EB83E26835BBACA71426EFBBA886C9B2396ACFF0077B0B711DC087593D5DF70
            846929CB721C2F4F88EF64F8F52F4E73B9A9755E64895FF37208C08D304D9468
            E7E194C0BF0EDC141FDC862DFDC710131FFE08E3F4CB782F466EE596C55D7769
            67B9FE14C13BC67F075218EB2FEA4C602FDCB5104F532166FCFA95848E5A2011
            1328F6789D46E77262383C423E4641DBDCE8372EC623E010C6E16EFF008B0471
            D2719CA5E8BA82038C3F090F2C3918E69671984632F1FAB228FF00846183E7DC
            0CCFD472FEA4693F8E1FBE2C3741FB22F80FB732061B7775E7740EDBD246E713
            F0D3D41C339817CB8F76F6E66D3E88D8F488F8B20081719364EAD3ACB0DA3681
            7AB181D479EDB724FAF1568C0A0172418E2BEB98AF6BA9E4FBA2373965806EC8
            BECBFE251C8CEE4AFAF7B6DD1F8FFF007B89D707C33CCEFD8D9ADD6B2DFEC0CC
            0BBFB813EB88D67F5B9FC09B72AF85A39349437F10BC2DE970700BF57085C4D8
            48F95D8D64784E965493B78039ADC33AB319F76176DEE4C2705A1B41B4B52F70
            9171678CEC27B8BBEEF8CAE3439DB1ED12FE8DCC2B09C3498F51F1774F74A59B
            BF3FB8D6F4171AF7CFEA117A85C49BDCF884810FC3D65C85F0B52307DA138D20
            DEECAD3CD8688D480044BAE23EB221C170D480665C8EF29DE3C821E6F71F43BB
            F0240AF57B4B96CAD3200687199FD596A62D8991A10DB9AB5ECEA3861F563C03
            9DF9853E85A71BE06A5C6787E1755D3F8F688E141653C07CB142B52C3CFB65CF
            7FF1FEEC5E83FF00DF376336135DC834A1CE5C86960C9B6E3E6E4383181F07BB
            D289B8B4BDE6DA4249C4E54CF8DB5CBB98DB8508C772161C84259DC7CB86C1B6
            1D4E7C49AFE7FD2C99CFECE5B9B5A7BEE1D397E6F6F00F4DC1F18CD7D5C39EBF
            133DDC74BD4ED63E05A8E9DC0E45CFC30EBF68CC1CC72161F11E7C010379D5B7
            AE3E2D1B9930B97E5EEEEBB7D073726C3A5E248E46B83665805C9D4926C1EC08
            118C72008BC417FC6C217307157B94E51FDD9A87C0F31872BAC7C38247ABC68D
            E971920F7951FBFC42B83598E8FD439CF5161D4AF083399A6E71063EC81011E4
            799BF486E9C11D59F3321C1CB2CA17B84B9BB382372195863DE1184C488948B6
            974C47399B719A5A8F863E5EE1F08C973010E2500E5996760E7FF522C7044E28
            AF52DC658F27B84CAAFB34CDF2183FCD9C7B702F2F70B9B56AC3C1876388CC08
            A310E7C60007CC3F013DA3639F562C9B6D26DBD2C52B779767A31B3BE6C9C712
            3FB4035C30E1DC915905819926180CDAE936F25A4E996215DB8218795842E98C
            1F21674385A2BEA435E36DD6F078649A7868F196EE8C631C7898CF364CC71B0D
            5D601819012D048D6D5EA53853DFB9D0543F31A3DBB0EED86B7BB7DBC4F6DDC7
            21BF484D89E5B29F2FBB1BBCFF0053C2E2CBC6C03893A2DF26EE3A23E1581ECF
            FC48B01F1743BBC586BC9D4C9F705BA4182642826EF00425FDA225ED8C043A6C
            0CDC427FA7325D78B431D669C96182196673068DDFD1EA601C087320AA733223
            0F4F4DACCEC9D9F0BE610C1CD907C3D41744AE4BE177B88C5FB186CC1036E6D8
            13DF8D86509E15C9B65FA1EEC6AF5112DA18CC224421CD9AE595DC876D17DC78
            CC8BE517A92E5A4A15D25544F4593C4BCAF4FDDA2C0FFB3A02268907D6CF781F
            506DB83F37B5F137264BC919C00B3EEBF734D111BCCA61903E6BFF0027CBA9DF
            8F0C772767D911CA85C848BCEBB2D0F6388139EEE1913A7337AF1236B853A23C
            BE519D757D50F0B11F8B4D7DC192175B97668EDE48D13F851FBB4E7CCB9797E6
            1CCDB89B107EA1437EE978D633FCCA0FB261CF3771F2CDC19EA98D92BEC9685C
            AB9FAB8071FB94936B180C81CEC3B21F977652C3BCC3B45CB0FAE6ADF04FB0C5
            DAC8F70BD36E172CEF7ED8068B50EEDECF9DFF00CD91A3E047C20F721312C127
            FC5C6A5FABA58484F19260BDCC6B2FA4F2E9E14CDE8C72E39396EA6B46121ACB
            0E03720D7D7A89C27E5DC0706C0B5DF66FCC18163BB672D90F33DCD8F4CFAAF1
            26D4BEE2099CF1A23FD44FC6C2AB1E98A4826C552A210EFF00822D38B34345D7
            88FF00BAD2DB7C673BB38FAB8305F06BA1106257C96453ABB871B0E2690A3825
            80EA12E32EDD91881CFF00C9A01006C0217823E20AB68D6DBE8C4FD233925187
            7B51D7E23DE1DD84BB8DF918973A027AFCC4706DC176DADB946F0BEE0D76968F
            416F3F2F59723732F56EE48747523A792D9064D837C0C074CFAB83246B41D80F
            F4843659E2CD866BC5C613FF006448CF99A01DF9F18101269B3B72969B0B00E2
            03DE0B54F883063F700BE46B3BD359ABDDFA98E2BF773BF3726EA422C156C9ED
            85E4FE4CA47D5EDA8F1603D4A5823B4724829D4274F8DF2C84E637019B246BA2
            1E7D66EE6FB4D78364B12139757E0E6EEECFB90143B10F70BEC3EAE8FC371876
            61FB24D87F4FB94A7EC3E6C050C0D9F01F6B78A279B25F1CE62803DF7333623F
            37A62F6843C64F4F25FEA27387B438B17721EB6754E50C7CD889DC2725CBC961
            21B0276D6F47B8BD3FE6DE727C5B8CFEDF167E594B8175959C7FE27F0F3EAF95
            DC4642E10C5E6626144E0B407DC0C3C4C0E98A3396E817EDDB7B7F077104F080
            3AA0D707BB1E70EE7A4B3ADB9C1CC24784B0C777B70483DEC1D3CC3B3E5E9B3B
            7885339117C0FD4FEB5C81C5BC8968A7B3368BEC903B903A7CCF2D26D1643CB1
            A462CAFB0836F4EA47388EB1AB78872BFC59AE44A49E798E2E124CA6F9DE32C0
            08F6A3E12400AF80EE3D6B0F1BEEC4BCC1926CF0B5EEE48A258C3BD677926E11
            8CA108E38EE21C39B604D47CC85BD220672C230EE7DBF33ABECFE3034229EFC6
            3A2EADB7CEF16BC1BD54909F0CB5D18CE79781A65D52D34B7E7C2D9032489C48
            A5F68D70368B83C5001E18163224B9DBB17A913F96CB5E27AD880C6085AF1B6F
            8C8EBC6C36E725CF633477C1F46C55E6D13931CF70C7D63346D3C60F862E4F72
            767278F3CF0B8735B036CCE2441DB7DFF2A01D5CA1DDA69C93697B20D587188E
            3BB6DFC36DF1B0E3E00B2EE73DA4DE39FD8E5904C1806C119F1921EC8B00EAEB
            B1EE99BF9CCFACB3976D444903C1208C7A4AC0C7E43E363C1912D7922FC82769
            A972B14602479CB2C06B6A3E65D75FE83857C41B1217A5C2B0D9B5EE47F9C7AC
            201BEE4386DCE3C1E4FC38858F0C82EFF6AADF1E1001C785B7399E710675E190
            D35FE8CE0C95D190E5E274E9611E5223E1109F5708730C0B59F89E53B40B021C
            E24C99926BC36DE077C2E361A5604ED77CFF0050A8BCB01C8B4565C8DB3AB983
            6BA4F4FBB4B4EBC6DB1237DB477311090716F30DBE231B2D81D1FD5E4D6AB8AE
            525CB183A4678AFC21239A21B0F0241D5E94424939334807D9E1C16C4243B4B7
            FC9FD6B0F45C48DA60219D275A771490746E59318C4096EFD5D134D6CFCCC1DF
            A9873C175FD871E9CBA1D5CC76C14F286EE5B3C1B702CC0C18DEBE309C41DB73
            AAFF006456ED576ADBE3D0B18104C4482278255714747F69EDF31E98AA592C62
            F326EDB5797FB5F025663335F75A3BFB626B8C00B2F79FCBFFC4002A10010002
            0201040104030101010101000001001121314110516171812091A1B130C1D1E1
            40F0F150FFDA0008010100013F10EB7D6FA6A5F5BE972E732E5F4B972E5CBFA1
            4837CC6A8731EE497288972F1FC4B9CF4BFA38EA751EB79EB79EB7D6FADFD1C7
            53A8F5BCF5BCF5BFFC57D0BE21D46906FE8AE9C0CD7042B8B6BFE2294580DABE
            01DEC82869E18500D65BFB408C0EB198D178C3706CB18AB6DCA5CB832FABFC87
            5E7A7139FA4EBCFF0019D79E9C4E7E93F82BAE3AD755A62AF1515F4E93431F2C
            AE0178B3FA946FD346A4C12C8586A567A77985714356665D2CCA15A9AFCC5BA4
            29693E4820A28DC00A228A30B530A6E26BA138B8201869DCC098E2B42FCC28DF
            2CC7E2568A7F529DA4184CCBDAABBA1836998969F626FE3CCC7CCFB606C97DA3
            03259FFF003ABA5DCA9CF5FC74DBD2FABA635A3BA836D655666E586F48D4B104
            2A047C311FB2DFB45B6680D243A0682DB604AB625B2D3A5B1728F56768BA37E2
            35B1BA24FA15948E46C65964AB4E6E10270EDCCB32B82B71FF00E6024564BEAC
            C747614BDA60BD215B3DFB94384C6CA95578B00211CA969867DC222376E9FCC1
            9CFBB8FDC06354D007EE543CDE01100AAB5910F89323320427C0EF160EBDBEAD
            9FCECE7AF6FAB67FE2F89F1D3E27C7D06E59CE0388E659834739BCE63EC456EF
            CCA0C5A563309D62EF506C2BFB41D28382BE608EC755478ADDAF7F70B22722FF
            0070BB274887EE26547BB58F702C34C154EE0CA0D3DF1C144ADDB881C6B21961
            1D42CA62ED107175F3035F29083F32D24709BFDCC89A1402DD555C76365093EF
            3C46F1F771A947AF4A2F85129358BEC554056A9AB66B878197CDB71A419D7C85
            77DA624C5698341B8D4D2E16D3B97067809235E6E5F4EA0DFB8B31166024EFB9
            60F56B3160AB883731277624E3F100CA4A2D4D4B25FD3F3F4FDBAFDBAFDBAEBE
            9BF318B94965D74F9EA7F01D4CFD3A5C6D61846C59BD3D41139731A3A08B7087
            C048CB1DD894343CABC1E22226ED6A5E22E92B484682EB2C58577372F2A3B00C
            D6250E7DB1CC46DBB6343757AB8251B5947E21CA640A82D59643486B6506451E
            A3115748D88C02D8680CEF53DB1B2096915BCB4C2E76E6F997E5FF00284F1772
            A6688778196D8F1320706862F021F8E2E937B810160AE09972F885517CB6430E
            472016869A562610CE730BC479E3502DF6DE1830A0CADEC56254720308BC464E
            22212FCD8CA4A8BB07E5624352FCFF0030A667B41FB83883A4770A1332E818DF
            FE8771420F997898BB86BEAAFAEBAD751F999660D0336A95B7211BECCCCEC7B6
            1DA3EB46F31DCF049A8502CAD4C6E606D360C26605E0B254B18A5B4E2091595A
            573EA2E2C743CBB30D26C286CBAB618B244AEF9816EEFC4CE88AAC7DC5410396
            3904B6566B55076DEFDB5635A2E58820E0294B3B6A5977C56D5EB0BC31D189C2
            5EC415F5A86AB39DC218206DD02CDFB862D8D97BC3DA5136B438C828A1F7A946
            6290AFD666206E55DDC6D5AE2B0F1F172C189B1B11EAC052C9F352BF2D18596D
            CA7B304BCE237122995A1953558F2D2EF13EDB700DC71A7B02D0FF00E21D672B
            880E01695AF881F996ADB93BCA9F5A06E64D1E44580F81552F6255E03FB9F80E
            0C2C58DFAE9F795963F42D4BBFAFB7D2B137013697CB66313C35BBFB96404818
            9F761761E55C3CE560DFF07CF5BE8C597E6530AAF3962561DA97D22712F680B4
            C44C5576FEE0AE98A2DE49959291BC769E3C2150CDD142D1213F6C76875CDB94
            25360C24246B2BD65C5C14E0121932D9DB4AB24DFB24056251476460F70B2DFE
            080E0BB37556CDF1062B0584CEBBC2B067C3412F443E229651EE6AFC99B5C39F
            75294E5CB08D815DF533DA50AB44FE263C21DAA2FEE077C654510AF064FF0057
            1EF1A59CBED18BF2EC2F3FA97D7A81B0B53F68E7E9901C9D90FA2ADF710C1974
            D0214612B875DE3D62E4711868AA55DF6809D2F1F6A222AECA474B5B75504208
            2D83D2A0EBAF986C1CC365CB4119AB49E063082A05BCB0359F74385080854C88
            D9139EB4D8EE5314F710E53AF21060B6E10CBED784CC61388AAA19F32EF5AF13
            1809B8EC461965D4B3A7C75F8E9A8B262ACE7040204A465E12E7D35707B23257
            EF71E045DDCA55BD519A16DC297782B219086BAB1E9C4673D3E7A34E81A83312
            EDAD45339828F92E503FB180D9B460B9AD621CDA60025600CB5B0C445DD8A998
            15217D6952A5F1A4FB9337CD01585AC123E41B4FF510E18CAACB61408735B310
            D3D61A85DA3A451F917EE51072291C3DE565872183E628ECA4E728DFEA5F60C0
            D91C62291C1194AB9470E61D2040AC4386A07D800E599994DCCCB0C8A305B2A0
            61296092B4BB4CC0ADE1E6679A2AA05D19D607DA03D43C268E6F528D04200174
            B8E252BAAAAA177DE545826369AF9836395282DCD54152707C514F3E23AF3535
            162652320B2CED70445C42DA14C9EA5095ADE456AEBBCC2905D5DA9309D9816F
            3CCB17C44F3002C89450DE44CF9CABF99E49A8A57CC210732AEA12CD8E68FB31
            350039DE18CB73BA7154496B84A00732DE016004BD623421509C05AA7DD5059B
            4A6AF6873A48C917103BA7EA5D103367F6432A9995DA0F72A948D20139118000
            FCC395FF0067FD8403AD0160C6CBB32C61CCB2198C0DCBFA1446139C735EA664
            D0306B82222CD3C5F995304F2EF5DA2BECBADC6314094D533125C0ADB97D03D4
            7E86FA5CB666D5C2ACD39544748EE1AF8B8BEB5A7E02AED8CCD61A59569CA2E9
            8A29535E631171A81E52F308E465432BE6589752BA5FA3C474AE2CCFB2E2AA35
            B28A80E4067C5477AB42F1B94610801A6EAD86A841785B15133C5E206180C071
            1B09380B8908811767A9CED0A2D75CC604B17DD598030101AB3B4ABC38A48EAC
            B6AE33D84D8B1698DE99646A9C4A1A5CC85F8FCAD214D66233E0A5287021AFD2
            2160CF6D435694C0040C9F13BDDE13860F341195666640799678AD936843EF28
            3F3405A5B6DF9825D218B6477AF51C45688473518E098D1E911CA289C3E222B6
            D106925C274CF9ED5FE4385EEE6007F516DB1915AFD4302FC083F52ABAB77732
            EC68C8CA146E42C57DA5D1E3261FC4B9ABC1B6BBEF71B5FB76105912D4132F4F
            8D1B5544967575AEBBC600B17CA2EC0798530256418DF37AB47E11C43B580FD4
            B6AF2F29B96DA4BC8BF8A804B197F3BFF23C63722D4E5ABCC19080B0AA7BA26C
            8F011F811F96AE7932EF0C7FAA1638688FDC1C3199AC23FF00BC136E19647466
            FDCA6A4EE2CC40F9139EA66F138E62B15290432B5A6CDEE20CA8B4C70CC903B8
            79BEF11952EF5572907BE3DCCB210C1896234CD087D37005C691CF3AF70AB95D
            80FCCC15AD21A2F0F8976D5AEE33E23BDDEB40A045B5416B2B2DECE1AD82ABC5
            47D07D700E6B31C100A588565855D615C40853BF25429D7B6EA6831362804B70
            D30DC5F143551C537909AA8A00051BD1CFC42633711CD102E5D0EA23448E4153
            6582E8E14C45609142BAC931A5A7718771796C266D3FD8D9319565CE7110511F
            570527000EDE26840C408A7BDCA28487011CC196633431862C768C82BC477605
            36DEFB87C1AE3C70E3CFB9884202B1F2B08ABB3E2E184CF112C7C3CC3B213004
            BB6AF1983CF3A97C850DC24D2BB22E3F102CC097F10C5B251C5B2C8F4AE143B9
            4F2051DF98ED5950071F78536A8B45EBD443E424CC8302332AC5378312C814EE
            CAD987866A8673444DE315A60A8070C1CF1114AF2B7F50E090E6B6FB13CED144
            0ED415C1EFDA5DF977160C8F34485B1162A6DA98BAA95DE659935EB509D31915
            17375479344AA1B6EC445CB0AEFF0072C4D2DD38222CCAC021078CE46BFE413B
            030331C0BC09FE4D47756FF841FE5AB985AE2B975F9816514080FDC14B760855
            07D166C6CDC7116A8D85D9125A2A6F6C75EE09D77C37772EBE6EA583BF57A256
            604BB1BDD511D12B827DD4C3940B4543F6966A5860E3B84C520B1BA06E1762A7
            726021CC83EF33D4238CACB47CCB5335754D076BE0950B10328CACB74B294D84
            A1D098B756EDCD4C8A41054BA62BD43495F968E770A3145E9E18219629DED839
            D2E030646FCDCBD70479538852C2F79A0249EEC6DE3A839898BA680DBD42A10C
            DCB7054C47D14D585FE216397139F10D84BB3935120A5F875055CB78BB859411
            42DA8647B1CC16158D8364BE2495F0146A6D2073066D28EE596C7BE7BC167B03
            2077A833022F291F64413DD0D31B9A03C884148C8335637EE579BAA5B330347B
            120D08C3DA11561528C4ACB122BD8856AE5F133B1705363339A68F10EEEEA61C
            A1E59C93F24A36985AAB852D4E6A150B0400E58946B75BE91E4A5DE38C465F30
            2B5CEA2AF88C169CC44143C2CCA5D460A37045CB8A0A849CB593FC8F33CABCFF
            00A80E69E1FF0098F0157607F53321BC6277332E29005C24D2A3A9755E2662D7
            DE30BB2ED7500D8A36BC11D70E9B60167F71E53A17016FA35DB6100B8AB3C848
            0C0015EF38201A84D4D463C412AB4AE7740591569716AFDA71F68D948EAA2162
            5E6CCC324FF6A57B265854CEC79AA966D36E4C64459CFDA3A578BA8C942CD15F
            D44B19730BA4C47F0A242183838B89E91DFA8DDDDCD2813A6CBFC4CBCA6BD7FC
            860AF92A5AE331C494D9C5D57898AC022F11AABCB298E9BFD47229C52E651133
            C9122F42805F98348DBB1880411632197F3030FE51DE9CD43757517281BC3701
            413B8D449FF00658E23562174BFD42BDE75B6C0BDC41312A5CA1FDC11C5359C5
            01069E3EF1E9C8B4B6C730FF00838421FEE2D0A2E6A2A66E10862340A02677B8
            500146EA325B7059989E4B2DA236606309B1765CB6C512CA69EEC7DB986E8056
            583DD438B43DDBC1D003BAB85C04BEF39317414BEF0623F7656EB8561861F3ED
            88D55C10DF5D1CD400351817304657354BA9B5715BB4D64F794618A3E28C12DD
            F06841DF134398554F844CA40EEEBFCC268317F0FBCACC1092AFE2005A5D77DC
            CA2DEC182A3CE0C44F45B87FA4AFFBB1FED946486C9FDC5560F0AC795233C7F5
            36D5D2A33303E1D7ED28DE05B68DFEA182DF99788202B6D5EA10C3731ADCDD78
            886839BE266F86F8A9FEC03CC295F53B3A0D33752C072428DB8B8B6C4C944FB4
            0BB742462CA0B340BF31903C5017D54C65B112C4717F24BC48CD5D6D72C6A769
            C329B2B265804B46EC26D7B2A33CAEAAA9DAEF12C673CC500EBC6DCC03183D53
            3347DEFE6054C0BC95F31A3F45252EE9E22F2713007C4BFBB9AD06602F41B05B
            266EC7D4CC170204CB6A0B2C97751E32C6EEA94060DD961B2A8D818C4307CB1A
            20FB81794C417EAE2792AFC46CBE0CE1634F71569C95A3745AF786E0FF003F46
            F68FEA0120FF00EBFA99D757D90EAA13FB3FC8BC2C1C4A0D76DCAC7551DB98F2
            007C4B4DA1002D7683E85721FCC050816054B65019515BE3CC10E883EC72B1BF
            64A23908B399638949C4A6AF112F0D4AC1B99D9A822D6729752D685C61434AB4
            0BA8DEE2546A245850C3D3BA56BE495999534111AE34D8FEE57042D04484D319
            8CC2712DDF8C4504A28D29B12815116E15CAB5130E0B5CB00675E667CCB4602D
            88186030F1BD4B41758E2241E42393DC6CC5F854C180C2144A74CF19DC26543C
            AC42FEA41C40EEC32C378950012FBC5107E4E6128E8099D0C20068D7D1BEAEA5
            F151C01D439A2299351EFE98F9BD89DC5349E2C6A8D56B7E2E06106B37586AF5
            2938C386C5290D4C32596E2906780C09415B620A4874B02A0E48840D76BCE605
            A5C4A07A3BC22515263AD37B83EA0386D828C6A233831254E08A46A0301E4DCC
            FBA6D895356AE1F328041BA6A048BEE45EC83C7821F099252B2364374B1AECC0
            8D4433424038A83836D179DC5572D839D2371785F7943E64BABBDC3B2C510378
            E634C58043C8C472C81FB09BA4BBD43F412AF165C0A0B4776798150A300207B2
            898ADEA52372DC0D5314990E0888902443237336D84E13247B7F528CB1022FC4
            4F89DB8330E64B55DC48C65DC8655CF72A5893B10F88F5D05AB3B411583C8543
            2D56695A0BFEA19EF3297F329DA7A8A65E071FE5C37F7868A566B3C17731B151
            A4FCCAC2B635082ED08EE5B7AAA36EA0B1C8E57C908720AD01789F737033302F
            E02283AA87741466305B5AAB0D32462EB51BCD381711CBDE3A7A5184A902056B
            8613A09755C19D21D18F50461C268F1E26C8004715788613D531516599D06086
            997A491F3F04A00E6D9C1A3E58C541B064BCBF8A8EC6CEDB4284B29FAD66C81A
            ED1AC6CB302735064203D2DDEC5CC57A0053734631A898CE6A1BFC31E9F6DB6B
            8080B5BF00AAEC6A220E0AEAA64782DD76B9A49E5287018A38D4A90E62C88C09
            DD2FA51A5E711D5668354DE60FB7941B05825B0C9C8C6EA0F5770AE6E88C2D42
            8B4B2A9AF884065FF2C671BA0844294EFE22DB8E5651490B54856B717344A63E
            22B539C2250DE04EE4A15077A0ABFC8278A788A6EE66A8B96A7E58EF49B1CA58
            EC0234C758C6A640D328C59B8C9986BD40158837F173161A6B5E580C1E9A9830
            14CE2FF27060156617347D3FD8C0AF82E9FDC696DAA0252837C91A9B997883CD
            B80BAB47F7175E1CD294B044CDEC97841EC5C10A2E3920D630D950FB3CCD5C04
            496D2371ACF183DAB7FB95FA5B4261F1E25F55673B42F88E7C7B39F7BB831DC2
            289321F7202C1B0F20F2C4579DACB5F68596B8894F116B8CCB14BAF12ABCCE21
            61092E2F9D5655046984458835ADCE018AE0CCBFA3BC1CD15441456B359586CB
            CAF040DC68AC28E58D54BC4D1815B1ACEE162525EEDA2FEC460D8B070255FDC5
            3C6A54BD781ACC2C5BCBB9B1EC9A77141BAA9AC54C7D3D016446D3962528BE4A
            5B260E6A9352E1232DCAACBA97F8B41EEF3711D46DAB7716191911CD44ACCAD9
            04C2A02F01FEE2951E96BF9403C170601EC58B8ADF952F241B66E303F1038F08
            650FB928C8290B8E7D212B954580157B8162E1E0DA57850018F3D53F7086CF24
            5F17FED39EA17F797915AC7E52E038529CC7F6695075F68EFD171850DE3E4824
            76BBBDCA8585A22130E31B3FAB8696340B7D122468226EE53909A076600D6310
            BBE9A1589840722553379D312EAB5C4A902A98275D30AF734BBE61155F861324
            3E08D169F094147C0C0240DD998A420C547F516AEA6690644DE4DBF12A83F616
            665FC51A835812871F98DCC6BA55ED77098CC6A15681C41ADD5B8E6585599EC1
            89ECACD74DAE18CC048351C33175E02C949C7A843409545D2B044CFB0B4AB83B
            F98AAB085C85B12808525C03B81A8039B9EF0F1201438B09B20912D5254498DB
            CD42DC42AF682996EE07AC69095B4F6C5BB7FE4567EF02BE826BA433641F899C
            695034C66507C2A1C6A66EF72EDD3920196A0A326969CAB8F98A70EA7EA23193
            2F0A47B4AAB446F791A955283692C2396EFF00139D014B3730A436732E2C2966
            228609AF27114C16B1BC30DC3255B3370F50B4A58289635E802B77E667FA8EB2
            0E47B4B3FBA4D2ABC503CC7530B842AEF1703F1C6573BB42CBE0A8AEBBFA8B0F
            B8083F150F7854B06582486950AB374C6818151E20354F11E4B26BAA3FF88DB4
            1C41B81E51007B6D8EE73DA06598519E692B3DE1C9B3A02D9755064AB568F88D
            0A81F38E6AA5A25A01AB2581442AAE38459B559930C27306E8AD95B980A21C19
            E203C3456E2EEC0E9FB4795868A0FCC5BC2061CEFC45F78875ABF51CA0306CEB
            9A97764D8FF8A0766285C31CE573008D8F304C618F7078D9DA51C4073982AB79
            F728F289E636180C5CA82ED6CBB8A8A1B374C312E3E10F2672D26F5999EFB8FE
            99C60FDCA410110E266CB8ADADB18C20F7A7B85C0F482BEC9933106B916BE220
            956DC751ECC42ED39891635DC351F120D0964A4F0D44BC0076253553D251EBBC
            11971CC4F943028229B97286217C4E3ABD599C20D90CDDA61AD62989BB62130A
            C498E2B8658057C2027858DC6A2ACA2D5CB420AD042B50FC20141768373150ED
            AE1B297F98F6D1605579FD12AAC7745CA9578DC5FDCD6E53A6F5223A84E0C0F8
            17057222AF0D24438572C234C8228DF89DFAA19D83728AD964F67689D21D5215
            E3B4716FA29D99E6219150A8660A7F00B60A7CB00C2F8819F2F55C57F3284B17
            1A0A83514B17098655AB6853ED103260395AE227EEDC79CAC2AD624AB6959CA4
            EADFB846BACC8CD3182F830126C30305EE0BDA80069FB4726E226BD730761836
            5CD388221EF09C8CE20F211C9D12FA95B160F73040A15BF02A11BB256E450D9E
            095D8105351EA019D4E7587BCD4295ECBAC4B0355936A7698C4C57D9F682D236
            543351CD2A217792095664BDC502E6C27845B181C328EF12B5996A700E29EE69
            57B8A1DFD10F45A059864B499825BC6123C3FBDE430E5CBB9EC5E216E50977DA
            0F2516991805E7417B5D402CD4A19BC4010CC30CCA6F92E51F1051996E1C2E30
            29E65BE69F00C5E0C07A2642FEB0B32FA9FA85AC2616EC4E05E5B31D282E9610
            41E44592360183F6A8C787AE06B70D932BA7055E8406CDABB2BB65C5BD79866C
            F81151517E49A8D9AC291ADF725E62231C0D58CA756DF1FB47015152EAB88973
            AC4983570E8DA0AEBAD01DA326C0CB5319316BE438B264ED8B0555D1DF12839F
            9A0012FE609B93613623D52DC53219983DBEDDA171F7780D68B885802646ADE7
            88F9CBB3FF0031FB81AA98EEE659F376AA6D0E2A5E05FCCB25083CCAE20B7A95
            99F78FACBA2F925672A995A5C4581C43862D86B7D02995D0442AF422CB5ECB50
            A873C212BE611AFBAA4A5F4A14DDE04B763AAD582D63CBB9CDBEC45B0C4B6663
            F3548D11899A59555EC6BD42510F472860CE7B43002DAAA625D049AC3CC29C1B
            679525CF5A1D8E13EF384E41178CC1EB2504C94955709EC0CC25376AA5F00A46
            BD2A3DC58B51755FEC651BB4A51CBBF31A696AD041202896E9040323B44A61A5
            B21E3DD024B21073FC494664102AA2A5186E0AD2FD8D0F62F318AD873F2CB0D9
            A23CB088414C8C30637C418A66F99A37172F44A8C36421EEF519CEA721AA5825
            528150507F00A8F2430644136D66069EC285E588D1554B01F10DB065624BA3C0
            9428254B2DD4A06DE26FC9C2BB8146A895D0801A82C393353B090651F4EE22BF
            14325571EE1E0A5051B8C9EA144F39551AC3DE5228E0009C1F894AF11443352B
            59F28D349FEA380F262B6F71A54C68DAB4A6D7129D7F5ECEE4BB4EADC866967C
            CCA1F42A0965F4447B49055A3BC161042E986148B70C25418BB976E9199650E5
            95CC554591970E2E4E66045C429A86D002A76E634317D8724102E5814C3BCC4B
            CAA58BE21780350A901BAE6709ED5C43707BD03344495B28F73791575BF1190D
            F6F5463728EDBC6DD9A8292BBDAF1194FCC25A81AC163C4448307610CA94E813
            6BF884B35873C98FBC29A5845467F2216393799BBBB805C80E9B6E2E0552AB4D
            C5F2252C50237F1288F6B20C56252A7735E489A2B668D017175990225961CCCE
            2E8C4B4312A8799997CC255FDF103BF3A2A260E151528F8B8457910456BFFE3C
            C631572BD66E3B404C3512314699892952A72B8167735CCABA6168BDA6453A8F
            E856D5A2E13AB4DA39B608C551C74FC74654632B332218C5A31B98050CD5A894
            EC65418F112AAAB1713CA64F69844F6781837348C352A281859B858224826EE1
            B806D53738F0598100D1D6883909898981BCC679AD6B7D98B88A8372E5B3D914
            2D1AAA606FB7F2425F4882AB04CBE666BB00B16EB409F98CD39453D724753090
            2EF00F6290D80BC2DB767DE5060F270EDF10721545CD71895201B4B0AEF97298
            7CD755744AC802E5CEA5B0C03575925940302E58C231643C95C4A55B6A1F70C1
            DAB50DECA2DCC195DC5001F2CC03135B9F71965E355671E204058E537FB967A5
            861CC219550E25C99AE8431C00968FF60265318FCB1EA5675E021113EF106025
            A0A6A0658D90088E56AFF335F264AC56F34778D99EA426E6375836168542002C
            28DD10BA0FD42EC448824464BA8DD52E83CCFEA0089BA6B67705EBE138B5450A
            CB0B35208172DE78E7BC50C5BA726B10466ECC10106432836CE8379B8E4D1613
            238A5C72BB44AAC7C4355947648FA13CD3FD8542AC280E40391D302982AF9EF2
            AA245209E659526340DAC2D78825AA3DAA0EB1B8ED2620F8409ADBAA13FB9840
            C0B8372D0952E95CB29A6A6FA6FAF7EAE2E5D60A9586FD79518B5546763A92A3
            2666994656FC45778F955198A2B6570C1B64C443080B63AA226C852A02E75006
            15A9514B0A2616428F896ED8223418EF1F45AA80C78DCC6ED29439DC775CC1E0
            5EEB8B892EB8B293F3DC9DD29965556D326199F9663071A8004E2D63D2668DC6
            2A6B6833BD2665D2904A2866989C443CEB10888629042077342EA560D6774430
            3D381F2053E58038867BD3FF00654D81BBCEA6215A9B6A5CCE2DD2A547074906
            9D8772FCA45F5B43B457B63256F56D9839D1B0610E842EAB04CA5CD96114AA26
            07315568C2346350921DF86D855C335768E0B221F48035759731D91D161DDFF5
            34CD015BA007ED28576D85583CC6B00A0161A5C92EC507608FEA3AF8A7D94834
            B16DECAA37697040668F985C02120BA7806752F5AD8712986AB2BED19F8E92D3
            7B64807210418CF962D45262B2EAA5A1DD8DEEB4C726942C9619B2A0E242438F
            A95B07DA61DF83F30CB25FBC0BDDE3B105225A7A814BA9444C4B911F2C336257
            851B430286696E6E5D7200717EA01F403686F7825117D26D5C5A1DA586350FA3
            7388B44C6098BCC094D7A52911CC702C62278A8A603B44561B88AED133D625D5
            1F30BC07B246AD581C598388C1CA42198BD26AAE55EE13CADA31F27314397932
            916FEE6436AE1C47A46F69897CC8D2B83DAE2B98E00D7C24E53F3346B50A743C
            A41C33228D0CFE30F63261F15350F7270A70819A9DACB28A827DDD105C0A1A87
            781947F8FCA6ECDCD5CB395CB2F4CA0C4130134928E328359AFF002602E43455
            9296CCC2AB23FBC2D1DE5C0181B189AA57A9519536F2C0D7DE1888130BD843D7
            358A482F5D225847CAA5BB30FC450362D42174D7783D5822A497692CFA69E320
            BFC43A3AF9ABBC47945C74A402FDE2964B4B6647131F58B5A6A917176A8BBACA
            68AC91BED0C8B90465317F53EEB2292BF7074A5D5F3764542BDE8CBC95026390
            9C85D379BFBC3DDE15897928D988600690F32BDC095AEC545842B7178A3FE42F
            180FC4517208AD8E3031ACA53B4302723EE530A1AA85F72C0C286A332D785019
            C91E095AF995666C467ECC60E1AE994A04AA98882E5B1012C2D3370A83C5B8A5
            E2C82C725C68E23764CD7F5D35FB75A8C74435DF1014058D9531883F4AD4BAAA
            C83502D41839DB7B63543B6236BCC56C41BE2A6313C880280379CC7AD74B4CC4
            08B6696C22D1D8941380713095D1412B01A113987440E08054C6984A5D522403
            86F330BC6298CB000A29C4096DB955FB4777733A254595942FD471A81489E072
            C07472C3BCDC70D7C4C3171820C344E598BDC6DCC70D43F68D0137C189499670
            C4AD3AD876954CA33DE17626725C1D50020DD45A6B25ECC414DBF2D95154C03A
            8469402B4473DD003CA65CE8504C2C4DE5E0B05D86CE0CC1F0A3CE3E5ED30696
            C365C41B4ED584BCD4044B0D50370DB030023F3505BE1B6066522E8AB5D66E00
            CE0909B6622A8B7A5C0AAD340BABC62A52C46C606B04F129CC72FF007F682F6C
            46CA29FA4CDFED645ADC9F3100E5B13D9A4ED16D32C407DD8E5529903FB9A26D
            03A97FC69F32E381CAED04331F3E6A1E8B820F419845600A11ED0A5B01506B25
            C5805440A5FC4591C2AA236B8BA0E62E540C22AD46DC2F4F8C04EBEE10F29E62
            E8FB4299B9E03CD5B89C477D0C458F80940F882708C4850E1B8FBA93F13384A7
            994114CBD39BD4202E931D0B2C8D6079FB4C8969550FDE32891199856122370C
            9D28A2AFD43444ADB70ACC87886AD91A0880C147E658303F79FDFC4B2ACA5648
            0D95BDCBA9401C54C2A6DECCD07D107A03B8A49603B4358FA8CB7958D1F707AA
            0D654D4EA5247C02DD56261000EF5B99C0A1CDC677436A8AC7C42BCDA96F3814
            011C5DC04DE529639D77CCA5C8D3A7C31560C14DFBB2CCAA9AB663876888E539
            B8A04DFBCB8D57CD9118B59AA1839D248DE5A8DA8C84B6C40CD362F52A3AB612
            2115014824DA4576FC30033E9921F30614C6C5FDC7E0D68AFF0071806105BF62
            C75C80E91B876B7AB01F89711672300EF65853B6E0E3A6F862826288A356E752
            A15C8806F0EA61C11807A8F935794E223C32B50AD9509E6356946013EEDED6B1
            CCA9DBC904427729299507170ADEF0B96906BB4681EB01E22FD9DAB62C0EEE08
            CF68C0B4501DDB9C69268AC316DFB551800940B98A940A8E498F6DCA6B7181A8
            122E779E60F0800271081CB5A8882C9C89550D2CB55BC7E608734151C6FC6258
            2CF172C94D5D443E830A9AA20ECD41D86E060A928254D2C2FDC35ED0A765BF5C
            C2AB6A5FDA2474C5099086E91402969AC1EA30B0A250DB39F70905A728DAC62E
            0ED09DA9037005A6D8B597411CEA0CE1B4C42DC4D87898F12EE1A0F64C81406A
            25A47D2377D59545CBAD03B85C203F8C081FE10ABCD1469690D74D53BB8C98F6
            9440CF643E0B2C455418C4F1588DA41085E79317F6D7E9193C431162B98BD932
            B91F98E9BC2CB09064F17053D5403A23B8DCDC468811CCA5EBE24BB98A5DDA58
            FE7DC3E70B1B73287538A225859D04A2924015AC2D425B425E41883D9BA25B89
            C3B618F9335D72B947DA5D22AAC59132819AAA617421BA55F894F32EA097CACA
            C6A0AD63103419528A844C051966448E09B4DC9636B8A820D216050A14D651EA
            7765A8A5C0B0EA96304B88C770CFDBFDD15B2210DDBFE25954FCB8C082DA0E46
            007710F88A36C8F3358F3F88A159ABCB3C4985EE3AB520E618E125A3612F6094
            58C8631C3D93C84A853880167DA5734CCB0253720C0F06C92C42661ECAD80C28
            D370B5AE209EDAA8633225B8BA2C250D22276693FC986A14047406C04A16037C
            6EBF7102BA1FA8B71D4458EA1E5131BDF4CB8B4D6741B4C732A42BB6D2C4978A
            DC2B5B909C065E988F101C01966C1907354B8F28734DB1052CBCC1D98789B6DF
            24B4AAEF8672A79D2154C1F211C1AAEF4540989F84341801DA60057A8B78636C
            AD0092D18104FC1285E4AD82214C18BA841A36F199911F150E2ED9582D85D4FC
            A25035A65FC41F24601CE2E0D95C0D24381A77846D717B6778AD141AA602D241
            6E997DFF00512AB2ABB544A8445A50475F94AAE14972D0BBECF6F70B70726F87
            C5FA97A949C193116D5778E23EDC29558856055BC206C101802C38A8096D55C0
            3CD30C18B6A5AE0ED033B4A2EB51BDA0D96DF315B28355FC625200565810B1A0
            0A12D6C81C10C80202512D68BBF72A06C798182A7886333E2E5CCDA5730B575C
            40AA15E653BC3DB566A58BCC6BAEF825E30CDE6662D917C31C5B53012C7FB813
            6C2822177317B0070AE2E15748C6E86E0D8F16A895883C61FB859B19C5767031
            C563385BF72FD19592899CC05AC01555C408A3114988855B2F6871CD47830D33
            097D11028ABEE254396A5C05132F859CE20397AD2C4CC942563CE5AD0E6540C4
            00A2FE5FE4309B13EEC519D8E8AD6211E8988376D7F71FD12AC68B68CFB8FD2E
            B31B29BF7996923CDAA96D45A446CE9CADC1C4AA80645EA08E85BCD4BC034F65
            C38507D11EC5F68BE6FF0012CD69DA8802DF010C03153B2414622EE82AC5301E
            E60CA573CC2C1C01FAB600596AC34631A8BA442A82E1AF946EFA8E4FE60B154A
            17E54CBED79B4B6782017923A53151E1982821C645AFED71D090C2B8A86C160C
            07B8B3BE892E990B3398EDDEC7A94E846836E6170DA0D57886528EFB801C7A9B
            A5E5D62031441B002F0EE3FBB665DD71550364D5446BD9109BD5246DAE8A76B5
            DE39A639B5EACC75B06527EE377CED4BF6A650D2992A8DEC8FB6D2AC2FA805AA
            C14598886DD1377EBB465E65E53814F6B8E4A94035EA01947C4AAE2A6ED97D95
            F711586481977895995CC4A92A336B1D90BB5A8F75042CC6E372C1A9C20CC0E2
            9F6C58CACD4E8E11C3074C90D07BF30C60C5532A759F12B2A9101E0F2405DA77
            072F6819F61525FDA274330737F621A166B550915BB1EF28C5538943970C46A7
            D388D52541BAC4604ADBC17033768950921B01739FF931369DB32D1D5AD7E617
            8A02F483042406946A1A76D0098CD669EFFD9CE781F96546B8254D18020972F1
            0005B994405047AB3712097BCD5AB8EAADBDE72F4B5D4AB7E91533DC4A2831D0
            1F686988350C68963510B2EC195152DF308D18B23A7A99A8550286F9A809AE4A
            9005E7D4AD906005BD5768B894C04BE5DE3DC875A7575048AC4EBA2F17E494FC
            E1412261078966B41AB3CA8C62F73FBCE217130391FB07DA5AE162844159D799
            55B647F139887AEA1D269B55B1DE2E545BB59F2404B95783E258499A1060DDD4
            C99A082E68158D2CC5681015AE626D82C4236D6A9DB0EDA9E5CA46CEC030CDF3
            F1015D1CFB5549DD8F0DB24507B1AFC44DF341264083C1B294855408754B41BD
            D8C4DC962D0F885F509C8391B96ACAD9A131B86D6752BCC4A2BBC56B3733DB0D
            A2D4B15C6EE6650B38B8B382B128F10B1A085044B5DC62EA2DB6B2E66B5824D5
            17BF98109335907CC0A8AD5659C2C1106F67C0455108A2F3091BB145D7A8CF2C
            9A0BA3236F6843792BE60CACBE66283B4BD6DB90A0853B6E0D0AFB29AFDCB411
            E439FCC4100528AFDA6A96595FB9769352833541A697FB8DCB44852128EFE70C
            A7B530A1BF1081D9F05DCEE1598ADADB3C4C0C0300705CC31DCFBB0C18E819B8
            0FBCB92C161D9570841191785CA0FAE111FD4095D994592AC27C952B81F26036
            CC66B3221FACAC42D9E214054B4A805129C468C7942F508B5C1CC885A1377086
            099CD87A21CF8A2559BEE76C0DAB8685568A94647FF4189269C40F6CBDE22821
            70359584682A8E1AC3F13126C2D14E0607452A1C9E4B073A012DA6398712403A
            17133509FA87C8CD6A0BE19E84CFDE61688B62B0731749154151D1706E957B30
            FCC180B510ED51BBBC4CA071F983C6565CBF662A0919F3DEA17FA777E6F29008
            B9603C6A182B6926B5CFB8DAEC2A5ACCCCE56C2462D0CA1300BC28D707C4B197
            94EA313E15DABB76F10D5D3064ED8995E830985DCC1D54772F3BB7389604BE61
            D8FE0304815F25A1A21BCB1814EAFF00A90678C108FEE5891E165750B2EF51BA
            CAA70A6CAFFA9553E1048E68084AD5E0B54E8110C465A79E267322814D196E0A
            002C0B57DF11A132F05CC4192F10536ED2EE321558A7240596866573B8453979
            25F21F68D6099196D60CB515DB030B0431F88D023541E62045B6D652C304C424
            5B24A685AA808050179F709DD1A398F08022FDB35AAE8854B1A1C3E630766BE5
            890B0C001C3BDD46D1FBB32C98ECAA811E702C4690CB112A2D047B64981502AF
            DCB4F73BC1B4DB2E6FF107DE0432E62794A0CC1D0E63D20DF78FF74E1705ACB4
            F7EAA673C39CA7E217B580EC729A865281152BC608DC5A590B11E187C050E218
            AD505281B807400C37C65230A640A45CDEF492B4A4A7C6ED28DC6A095E342DF3
            E651410A0F35114AEEBE1179233D8BCC4A3AC1843813C855143C78A83F04155C
            057DC95F4845754AE83405AE225C6C6A718E62B524507159C620AA4E0B23E4B9
            AB584AD5718E205C6A066FE103AC4534EF354015175BE635A1516AABED2FE4AB
            55D7DE24A21C1E20A73B8F2430D76CF35E712BB1DAC307638884080A8986B1DA
            132B1121CD15F12C2F985E898707A89693116BF33C11601A7B0B0BC03AC8C772
            6CB6655FDCA4C0E6A050C1A7896C98CD0CB7AFE047C2B737DD1FED966B5707CC
            B75404DC51806970CD6CAA897372516C25C9E2374679CBC4C66DB8AB4E30A5E5
            A82C1058B2D86214E662424DC5D355EFD328C65209583A1512825AE920386D4D
            479F81C9E495D40854BEB1EFC33030B47523442B05B46238B0A0C46CC1472C13
            9CC57853D42E34C1BBA802914E583520E4A1B3E628B4EC5128752B3803D8172D
            52D4B5CBC4D005F68FC484A8F60CC6EC6A5D3F89DF75B543E226172C3C7DA2D7
            0CB689096F1554ABEC4979C5E34B058DC6C7BC4CEE3987500A1A94535B3BE227
            546F42FC40666932BBF2F823E0BC3D0F0FB89D8514DE2DADC346F8A76BB87881
            89502A62FC025AEF5FDDC4CA028E4544A848C9BBFF00E2549B28E10E2589B630
            182B7EA2705BD2B0CCACF650A5B6E3D11E22A16D8F0A976782CBA23D0DC65CFC
            E22482932007C4CD8544BC4E083944354298389A62507C302E93DAA2516DF14A
            4239CC29BFBCA3391C1E44AF498F8C250635440C0BBBDC29259B335DC62EE036
            05DEAA01623B00DC1F59D8936F685E89845B1D9F719AA8E1DE251065063E157A
            8E1F952DA880CCCD6F7055F3080D662F68A1EDDB5988506D060BAECC725853F3
            2980072244AEC3A202135AE60CA0ED71B340A23B11F2816AB0AB9743CD406345
            8D25C372566D9896E3C58A8377BF7EE31535DB95990CC58D47661C2826C43AB2
            0637655DA9020B74F4CC482ACBBB95A7698255C7528956D4B2F335117CA2463D
            02CB625D66A23BB67344A8D19F72A72FCAA1B16A0FA0EE6BB65455E6C33F789E
            B6E69BFDCB198702A35AF8D2564269E980E9D6E6C61930A6F11814A0C3152CAD
            E065D94D32D16C01170B9CDE2396C892736FAC4AAD98D6D70FDCD457323628ED
            5B9505D0B2C5CBBF807CB1CC05D2E40071F10820B1D29E7CC09810FAB191F761
            9F4363304A19DBE421CA9029A1A8E24352BDE08CF81D3B30AA81897CC3E7B52C
            BA6A069104AAE229ABF582A57ED8356CBB14708D8EC21F04FDA814374CEDE625
            A6B5E98A858C1DAD6A0CBD79B30409C1CA600C7865F59849A694CD882AC4890F
            D1220A71499F501847B68D586E2B257C8A87E60EBE46D8C9129B943727B6A1F6
            93023CCA0BB3A07DA3B0D05769BACFDA3922EA1A04038AA8C87EC880179DA584
            721E85CB7C6A1F008A28E7E218025DEC85D1996D7245008145103A51EE1E0345
            5A2F9885132AEE29C36F0101259D90B0DF15DCF3A30B956703B11E54BF686200
            7BC429DAA562615334CC25055F685C4155986C78610DC54C802F08D10D1A612D
            A362CE23E24BE092CACEC409BE951D475CC388D5CD070956CC2CC244B655622C
            57137350332CD2A2B95B88A88C19943AD34A1EB1702DFDCB1A92AC2ABF301DEB
            6E782A311856620C28B87E66219696FB80401CD8ECAE340C54258A1A38BB32C2
            61A8AB20D331CD64C7A0571C39212C8735A5E6BBA50C4AC8B22FC25C0CCAD50E
            602AC43613810B05B54FF702D7AC5A5687DC88120D46DDC41B0CD15788952F34
            A41269DD96DD10E9520A870CEE9B8B9F89934FB570977D908935469ED2EFE94B
            AEB5E3988FA60B59AD05DEA2BF930D920AA806AE3F60AE8DCDAE72D5FB83AD0A
            FED08F3416535F780C8EB24AD3B34D3E23410DA7041453ED1F2738207442E141
            C7E65A316A94B1FA586706D8502ADA0616C9294B095EE2B9BFE43B82AE0DCCFD
            7A5A4819ACD421881AD771C301D3503CA2615CB1AD06D68818071930FD47B0B8
            5DBF115A0C8318B096D34E6E1C08000F1510EE2AE6EACB4F997C00B3532F698C
            6FC90AF01E51A5825930D731BB9887EF3BCBE3F789997BE6BFECADE33B7A4180
            2018382A11C120DA9962AF6EED865DB05A81E2FC444F18B34B0D834AEB9BBFEE
            6F7C3E4CB03C82AEF750EF1416B736219EAE99A9CCAC27840F12B0EB605BB971
            17F019BF99DC8CFA46CC4AA9B8153BF0CCE22058CB65D4793716AB968B1B1835
            29AB668B5168869DD707775C32BDFE5AD3BA7C3F88A2A2451661C833190B5064
            7A5391B3CCD601B2BE5EE1A8119D53F7299A84A000838592B8711F52F06A6D16
            8C76E48EF25514AC67F3014F35D1AF32C90C41D732D6941ACD19957D7D2789DA
            5C7C9C18C1E78EC44D3962DBC8E7CC302AD63B24A535AC3BD0CCCA2B761A8303
            3DEEFF0052D49550BB1C403FC52F2FDE0362D58CB220E4405FC409A878580C6D
            DAF9BFB432642AA13760E6CA58C2146571144DC1C35BAC930BC382C7FEC502CF
            6059FEA2A42E090388CCCE5CBCBD4715CE81AFA8D16005F64C7DE28BB7982505
            69DC4CC6366579053431A970B1234A1FD4709AB8A255F98C972709566EE12AA0
            F046E912EC00986CC7CC36C851B5DDEE263B5A5CA004B04B1C4670A75F0309E6
            D05F6218562CF7C33141067A5C4BE1230F255F32A9D6ECBF9A20A801AA28FD98
            0779F33252970BBB4F357B81609C620C49B5E23902218EF5999D6197B5FB63E5
            1F06BB12C7D43C1803041A1110BEF640CC44D5FA42383D254A9513CF46D08536
            724EDC800A3137BAACFBC768BDDA04C1936036A426DBE1512F75023BB9A45A88
            49612D7A558902F1731B2AAE226730276478663978F5C436B003B5DD4B073299
            393DCB23D6A363CE5EDFA800481A925E312A70ECAB404E7E12D566FC444C76E3
            782D55EE300E01068BE1F52C2E1B1786F11D632EDCD5C1FE102722B885EF21B4
            27302EA4320C38CB0129CA254D086105CCEDE301486388FF007C74F50511F200
            04C658A1AB1BA602D8EA2DA2F106E41ADDD357CCB3AC36FF00B27E1115F765E1
            56C016FCCCFEB27AF685F41A2BFEC6A5329CDA42369C40E22CA08CEBC5DA3550
            03F61C0B96BF51D7A1AB60762FF9C7278E4801328073F1196B2190C412925CAA
            662D931C25A9692CCD594C38F59C16FB562B231C0CEC66ECB8B46A1962A8E657
            F56C13606E53700B68B57F137FA2C678D90A0C42FC09514B870B8CC342873445
            F88100D699641598DE587A51C5C38E65BD7C0F60ED7185CCD8386E60A1571453
            5704B2EAC1CEF72AEEB42837E596A2B804A65D3BA596C2AD52E2E45B555B00B9
            4D95D39B6D135BB59DC4FA29A2ECE6607A8096F336141BA677189CE94F687E85
            330B6D818F0946EDD2BE96D286FE112F3A79954F7E9FF65A0461B3179EF80AD4
            A0946C7680DC71DE1B6A35AE8B89E619F12AB98AB52E34F1362116A554469DF4
            E1868C7B759E7994A2A930954C3707C2AAB64C4D5A46E2B4A7247C53002AAEAF
            276969E54A5784BCA06DA55C2BA4B16DA8F56B43E2096236E06B24632B64D3F7
            2623149C8146A52624341F74556B0C05C31243422E676F96F0973DAAACC57FFB
            1ED0D614A48E8052ECBBED312600415E93240C9C4330D37D856F654618D49820
            9CBE624D4D7098D7AE2F10C30FCAD0B10B154103578FC41A36BAC71AC306B685
            2A5ADCC4AD80502D63133902154016E1F984BE7EB43350DB72DEC8FAC5DA1815
            4C4A0C2299630AAF32E7C70A09A6FB2440E926828A6733C075BC2EFE23B22DB5
            2BBF247358A860D768932E52EE538E6913C62653B11377DD340AF1F0E11F03FB
            87961AA1CACCC602AAB7AD8B98FE001574F702485E69C420CC2DEF98FE1D6908
            BF863C92EBFF00A12BDD086DE399A02422DCC2813682EC5460FB697B4C9F318B
            EAE9363D948C631916FE60901A6898C8612F7FFF0012A24141EA310D529F9FF9
            2A0EDFC1C4F29BEC9064F612B4C16618812E25C5388B29AF1DA664C894631D9D
            1B8A034A7211D8E3C4AA811165CBE8A91EF46CB1B9EFA0D65998372789905110
            2C1BDDB0A00AD684DBACCC88D6DA680C7CC4C09D508BED0A2D9861F7DF064F62
            5951708B83866EBC9A7ED0B3C9D437E12C799B01AA94C6068DCD321879C46BD0
            A479CD25095C9FC4B6020A3AE6343677CB0B1058BA2AAF56C14554E133B22BA8
            7401B40010A05D09783B11FD6C403695CC1834C55B2D328BAA16113380FBA34E
            50E9DB9A2325AF6017036C1045001646727B80B99B0B6F71036ADC778A53A904
            E11DB72F70F2D5E04110DE90D36D859A759B9BCCA3441684CBE44A043421C2EC
            99640E420547D0E5A95A8494021A8652C69BC54BC3245319D423E5CA63789A38
            1A22B40DED5FAA832EA10E3716E47C3712D790AA1EF32222D01925033D5C2F77
            E6885301BCD54A2677BCDC4FCCB62D5DDC406E015B997644CFB1B9BAACAA87E3
            90BDA164007DCB1E4E864CEE61EAAADA815D29951BFE0357A4A9A8E16D1B29C4
            0226D29A25470AC71D5CBA952B11F35974EE8988323E9B9526CEE2E706EAEEA1
            F76E6F10CBCC2A54693702F9810DC18D111B150CD4C710B515349DF5738C7A48
            63D6ED70992496383DE332D18A59842EEDDA3091C4A97F78180004A5096D3861
            A57C4E2E52001A07920D8CC3D434821AEFB806D61BB7BC19AC90472A6530CD54
            43EF1E13BB0BE6150EAE9AA65D053E65136F51B4B17BC4E92F666BEA3586E12D
            39018558B8FC9279400C5BEA39C396C529755021BFB049C008AABF6949355834
            CAB0810959482804B9AA571B25D55A6E9CF37E225C9E2591396F789A03E610D0
            FD456F2F6EB3CFE22DB686D6E5C35A758EC98EC89A30F64A299C71A23C0D05E3
            5401F64A85C99018C7DE5B5F2F304E3C30587A8EB6460C07DE661DCA0A209505
            592384B2AEC95A809B82B7B230DCD91603B5BD3705B32DE99EC9EA02126DC424
            B6D8281E6558D382E105801CF7831AF09020000A21FC155D6A2609435613C441
            2A8DAB85C518CDE260985BB42D7B3E62B3A011DA193C1239C936469561C41E95
            685D18FF0065821EBB2597471888DB654ADF89B43C41AE8BBF4E5A81CB962462
            0D5DBD270A0B9B86170BA7500E34F3169B94DF14372949C131FF0025D79556C9
            F799E1C52DF68DB1CC15AA0DC306025087A4646B7CC47668747DE985D694684C
            5E3C4C83AE7E929EF71A43EC06D1D02BD2280C21B831DE62095E608856EE042B
            5F9D2B6254BD693BA7C4782857312010C0956453DCAFF3A4BDCB5DE15015A216
            73CC6E189B20712E70AC840E9F697612A8DE07709411DB69401F329E4528E2F9
            AF70A85813A1EFD710A2248961C9C311E51BE29705E09A7B81F16165DAAAF32C
            89436EF26EB5B99AE00E16A7CC4B49B384497412EB1005A9C66A3306CC10BB2E
            E63CDD867E5480385E86F41715B772C0FC5C7005A680ED9835404534BF98A5C9
            EF3117B8AA5BCD685B1BEEC08DB151E6034B7F6103B04F1F7800855CA1154DFF
            00780C74B97D2FF854E41226AD70D99B94985E152DF0F696D90DBA1370B5110F
            6470F1ABE237D80100A16766FF00FAA2CAC4DCE22CE258CC5CFBFF00E854A2E7
            3A4961109E73F68FFC48D04A5A94E819718844B8618B588237894E98ACA59505
            E2506537ABC54227AD65C78AE983AF106A5D66ABC40C6162A662D940C6B3158B
            242986E1862991C857F734EB6F715AF5C622ED884607E66368BB1996020B5706
            6A6D51AC838F51DE0EF05D3DC63196D7C450EC47B04140455DFDF68B92DA06EE
            E4875D84E86733194968183C0CC8FB76DC83DA1117546B6DDF78E2D10DAD3129
            722AC957BC4A42EA2201BAFC4B91DF1EB1FD456D7A248119174D9C11BA43D248
            1940BB548F2AD768DFDD99C9B473F245870DCE9F07E61876076866AFE610C5CE
            EC46438A973C9DB161ABBE6A26BA80379FF118C350588D0A4EEC40A24DFDCF52
            F47547999AAB3C462DCBDA0956336F3F7294E60505829E35337569F8862523C2
            C80015454A7A6667A37FC0C4D47F86CCFC33292338F152F81A398A10D2C067CB
            670B63074B2762274433737AFD45C04CD487EE572150AB8B631B824A8B467DE3
            A05652B6C2FD3271643A6E3765625646B9D2518E2CA81E09E221575F7836CAF3
            2C3AB83610D30310330B9993446C370590B70CF8C29C466977E617C60DCBE0B7
            635A7BC008F0842BE65F8357E4F11BE1523FE4B2CF450DC7FA24976C0E755FDC
            C88200DBF9838ABB7A800C141DA0B85F01651BFD45CB31F2EF6276A8805A6B82
            557F5104CD291958EB5F644D1DB585ACA0800692DE67341617398995ABA9001E
            E1C456422AF5EA63EA2D4ADB36BB40AE232BD23551D229969CBE4F994A5A0ABB
            CDC12910347046B7080DEFD40E6E1D85BED0F9AB46A8EB3A85C1AEBE66854C68
            18466834FDA2D6B83A50E8993D4814D61CC68881C78C573E265BD3CA542DC162
            AA85146F240602B06B226BE22D32AC48F445F81E61F3C5609C217C6204D85427
            889A7C24254B590D528D80A3EBAEB5D6BA8942EC839CE9B1DAA3DC1F6EE54B60
            A8C2148047366A0B1F9E17988802D53143FEC1CF9A63923EF20AEE81F8143C4A
            0E11D8902683D4685AF0CC2FD71DE522DDC9281072C648CA57182E52AA11B878
            A2AAE2859E11029659BA87087334625DC70A6763889D994D1738A01B5E6711D4
            0C9DA41B0D3E225433C3183BBE154DC60037184E1808FD466914030BDE3C4738
            3791B1D9584C61AEB6C0B7F104FB2EC353B8E4BCB45FCC415BA385CC2085D9AB
            83204516A96207917A8C1B81080B01034EC4082DAD1BA3C412E0301E4B8F920D
            E0D942857A7E7E61B7007264E7B401725E819375E088225E8D187FA62238ABC4
            5E9ABA184308C10B7BDC493689A2E3BB19D1F22DCA726AC977796295860001C5
            C2A4EB104E711BB37ACA7310CE416EC27E08B7E55777DF72DBFF005A6418FB43
            58594C19623D75C9E651890B43BC05C3F784F3179651E064094361BDC211B786
            E01C000FD43E8BE97F45DCBE9772E5CDCC8D44B8EB6C9E42E2E158519436C518
            3AA0DB142C8DAC69555010D565B4D46077B0265B0282DF11D2AAB524B2051564
            645A6B8655BB0ECEF08BB57A98CB0157B9448ED6221DC4AC854169A56B2B0917
            AC2AB8D8410704CFDABBDE258E34F68D8C14C45C96069997236A8886234BB89D
            304B88E4895050C1D98C881D665E62620A78C315402C4A48B5DB12FDC080217F
            DA07363319E7111988014E6B22241820CD8288D554068B9BFCCA32CA268F7848
            88AC1768EF20CF05B5AB8DB602E0DEB0C3AA17DF86A665C7344B6552B3516EFE
            E549FD9BBCD1DF506E65D65B6144214304723FF228E3E06894965B0B644A713D
            C62DA6D8AA1C41897780165757784AFEE5666C80B19B974296C442160559135E
            1670FB85A0852B1CC5D275C94ED1F88C61582798CB095D3C540D8CF6975AB782
            3EC635718F5C1FDC23802DC2423C89420D1D497D08B5C7F03D7C71B847536B8C
            5554D98696728402D54DBCD91A442E8ED129910B26B2DABC54616981EDC44775
            BD750B625222A22A7694426258DA121DC87C6776D536A09A07982F16CA53788B
            E91CAF30171AD61085C16094ADEA5425B2422282DA7945305790C4A33478B9A6
            B3022B3150957375172B931D612977CC1728A704A46F89A850981F310B93CCA6
            2257B8883A77C411E2E09E989F24D8D0DD47C076D92CA4B0B42CB9804A1DC227
            03B278AE1F8835071C82F3C47B338D2607FB37C80B6E7339D498660EF43EE147
            92B4C0B9A95C01AD1B8FB14E5E0107E21558BAA0A316F29F388E5C0AF5CCBE72
            1F122798402439862C52B07EE032B8CA4ACA054DE02E3B68B960A78892E604AA
            08B6C8F9660E6B121E514D4750A8F8213968B566E6C340E25EBCB1844A572110
            8EF85415AB2283D427C0F83ADCBE972FF84EA3137660AAB888816779A8D36279
            CC4D768BD45141DC2140C1653980FE34A574477995659188A8A842AA614ED1A2
            B09F1F8951CFA5EF042CB5F895D51DE321AA5CB9C155290C5AE40B923D009E03
            0B1965A3DA97C0806652159707EE0DD855CAFF005103A48056118D6B171A36C0
            B5889298EA361172C762060AA7C4254AA28153BB28ED1F7A666AD3BB31681E57
            0CAD9C8887FBE4A9D0D8A0AC47E6631A63BCB51CD5E4F966072A0D411B071C2B
            1397E2200112A846F71AADD955AD8666BEA23A002008A2075902270DB039C210
            1003B88A3B547C4CF7151157A873050CC71E69142FD409F88EB82B6481F10910
            21EC255552E2BC37079367141823EA26AB7467798F959C237A65940A219AD31A
            C558F832CC1A6B504D8044EE88B1895104C141C7F25DF5BEB7D2E8ADCCA81A79
            C45760B1A15290D388CE9D0DCC2096CE081E86AB9756A706DD55A0DC688AD442
            4729840DC08F88066A3C2229B89D8B226B797110002C704060BBE56957132105
            C1DFDCB50E1AFC4A4E60AAB825DE34F24124A654C5135920177F7A94C63B2029
            E6B70AFCFA96B0479E9C2C08EA3EA5590C31641F693E67603CCA77CF7100173C
            066EC1CC4141B7C08E6AD395417256ADBD462EB28332AC3D411A540B76ADA29D
            4E794F50712A2AC0A5D7B60804D588A3F107B2185CB11A8C96FCEFC90544B54A
            547AC7164A86218DB0FEA054A0AD76F1152CFD85DDEE0B177CDE2F10BD5761C4
            AD7545F74971496FA2C33290BFBC03934C5C68ADA1DC60B22B1AAEB7D6FAB5FC
            0F4E7A60845D28CC63808A80076D1CD74665F860318C73C32C565D6A25A3222F
            A80814944150DD85A3863D16A5597B96DEA63B433A833D070878C6A951A39CCB
            FDC37287A0644DDCAAE75AF370FF00C722626ED9546DC072BDC70B6E95513B2E
            1DD10ADBDA2AD99DA088E6E2DDF68933638460BB829959B9CC14DAE51D21F0CC
            FBC4CA0DBB6104A68364183135EF0D0959ACC790D67B7E61C23B143E062BCC2B
            50885EFD131DA0154FA86A14323B850A5E95CC7BB43789EEE642D04585EC806F
            164410CF221D6410EF380AF702FF00498965C5CC1EC15501214FB4E6058205D9
            C134666DF985D4A3B4C9972FA5CBE972FF0096A026B705B8F6BC438D94B8E9A9
            DF76594E258DC44B19F5051E1D5255A132CED19661405EE43135D7C4AD987A2B
            1152ABA271095640C446994CC235B0771840C6A0304C3B976251481FBC74AECA
            980670398909A32C4CE4EB0B71055B9C5658C951E71305FA04DB27B80444295D
            136B2648C2542EA25CAA821B147B902CC3B2AA22BDC994CCD7E1E08671C585DB
            3128D7610AB4DE042C1BB056A1DDC2395F172E6652171F313C8A28A17C5B4469
            48B6C2457115CA8E52381175A2E9253953584E0600D41920340F9C4B36584D8D
            8AC108ABBC96AA5B80BBC5136011C3C90007694EDD39EBCF4E7A6FF952C9484A
            9CC7B6DB006DE25DFA5B5FA8B2C1AD5CC004D51550E9613012F10956F2C746D0
            2F98D08AA879CC275A223338972AB98F4CE53C9D5C4239DF11F702E11135DE20
            E10502AA28ED6A732C0C2C1B54B6E52E05858A9A3A5147D8BA2CBF9133ED1EA0
            EF80E614A71AA8AB405F2C50CAB1625D3503112E3BCBCB98CD75165662AC7EE2
            D4F8E910F4D5A4513C859095ECCF66181069D989F884E6797096744C5B067DBC
            8C520F3B043CB3E61AC99C044B22DAD8914640C55CA1CAFDE0082AE562CDAA64
            0C92F6313D8CC7250C0435D2BF82BE9BFAB1D6C6ACA8A5D2457787B56695CCA0
            2B299858164BF9780824E5C3771DA6B550A95F6A18991454B46AA34199497E66
            51A308E482E24A9B751239A2A554C7694768988D9C102150785546B14285EECB
            C6E14815C2EE632634319E48165500D26E7401CE206520B2DC71A0C02D5CCB10
            78711214CA349159C5472468CAD96A97D52E52AA08BB85316D7B829B44399F21
            0684E68B6C182B7E4F6C5427A68FC5CF9C39FF00731B64F06510D3BCB983E618
            D36F89DBD2DBDB876A60B267AE541C27FB9580A0FAF5D75F5EBEBE654AD3024A
            40649E6328E495CC2AE73843D196D03D0BE5971745C96C16231326F98E0D48BE
            D2B2DEE3694C55416623696870DC69923965A6F1418965C0B8895E202A5225CF
            48E112FC47C2296D32DB61BA6D2C1A38292C2B5BB45C1F2F27C250010BF12D95
            01B1CDC2C524B0D46A0BBBE230079C1732028BA1EF12D0DE21CC4A5BFA04D239
            9751B36C30DCA5B01EE3551104BBA61F18799A9D3DAB1B28DF8993A61AFF00B2
            D188EC3C4D072CCDA73D04E5EAB655FD043A69EBAFFC166998803014BEF092EE
            EE1D4A8C553E0C4D4F24C3335A3B54BF0B4D828C40440B65E6D3B4A011BB6E04
            56ADB0BD4F0C70DC5DDF78D3C46EB2874C8880712FA26599AA8F0F4556370CC6
            1DCDC628983B47501752BFF92EC07CAA8AD73DD4C329583BF79D98333EBCB2E9
            DACE63A6CA6549494E90563814CF228FDC3A6D9CA3AD8BEE26BA98C46F12A665
            2FA6FAB57369886C86602F3015826484B6BBE65535C90C4208350CD507695D6B
            AD40EA1FC3AEBAFA44AA2554D88490DB52C915A064899A8CA5730624603930E8
            94D07DE12B6BAF499E5603C8A58941281CEA2B5931BB558850A5375B2E22F2F8
            567BE0359B3C445C404830543986E566BA8118654CBA0E8957D361295D2098EA
            67D5DEA601963368A85B70DD4B140197010EEF175C4A8705DA4C0982EEFF0070
            162C997BA2201190229049CC2340A3BCCA6058E58E8E8C72F4ACC5A48AE1B97B
            99062B20BC4B490804B702B6B50A0568E97D372FADD75D7D3C743A939E9539E8
            911798065217175B3967F03CC54D86D96EDCCB950B38418C061D0FF3297970C7
            8489FC7F7092E025E82537C807B2CD9D72FDA1B44C576CC57829FCAAE3B6C2D7
            A7433335056312F3AEF10AC6A5930CC19CC6B3280258415C7CE50F796977502A
            30C912A5430E62130C3BE3875D0355D06E6F58E2D5020BC77398241BF71FC34A
            BF110E64691627CFDA3B88DBE09548A177926352407593B097A504ED70187282
            B179ED123975772E618499B505065ED0A56CD030AFA820AAEC0EA62DC106B1F4
            90FF00C8CAE8576970DA206A5C03DBB56E2C805A4EEE3CFBA97F9820E9EF3E20
            3778C2E227029416BB8B4A1141F372DB26E0DE676D80A7887BD007602A66B324
            2EED650CC42C51486FD4B81702F54D7F5286DC073DE2FC929DC468E95E6A53AD
            CC25AC4D46F88636C01A9AD446E51B9A479961E6098E1CF4708D38B883836478
            58C6A12983681995D0A1E39F705E5953F3E250AF2C31CAE99ADF4A3E9196C575
            7731E963814EE2CA32B667B8FC2231038460FF00F54BBD415CDC0EE9C987A611
            803CAA2660368A2EA0616B436514416205D2C06928E9C7D0743E8F9AFE1DFD47
            4A84326207934F99CD42BB7BC3DF7A2C35A15E58F16991CB060938A9781AD391
            96E465A74B070D391C42FC9450A8768F6061D0ADAEE054BD5C01F3359AAF039B
            8F15B170BC768298C94E73550015D0C678ADC02CA7626D12B97CB28E425065B0
            6306A67BC3053B9F652EA2180DCB1F104963899E2674C7172D7980E639834800
            E617B111DB332B27EA8D2AA07E7FA85D1DA0536F8856EC8494B0CEDE660B04AE
            4370DBA6FA6D225470C3982EB8D5CC557D0A89458FB97352F1B812D42C4DCCD4
            9A44CAB0AB0E803B123DA11CAF884E2857E08237003ADF5BEB7D6EA5FD474DFD
            3CFD29674276C9DAA2D69FB45ADFB51E21717E95E25C68F23FE44104D5DE3F12
            9D6B57680259D67899C0C4A38B81241443750CAA934F212D14A9F0CBCE192FCC
            BF95541A29988D4D5E52671B82BBBAE7E610B4563F10B4538DB337DE0ED289B6
            A2B98899BA8D9009D032ED8EE3A8E08D9D4454A541533E654A111816A906982D
            A471A25505B42E342F142AABFF00930ACA3567BD6A5920EE928CC69B782B61A4
            12862E52054B61622197E6137A8583641479A63B4EC300DFA878A60A97E50FEA
            1E502A51F51D0FA8FF00C1F32BA7CCAE9F3D12E55BE273246864735122B7A387
            F528108D8101979C5DBFA81DB18CBA221794C8D466A0AD3DA35642B21B85CB20
            7BBB9735204C5C3B85F6FF0091BB8C419DD67ED2BAF8A1C602533BD69C90E919
            ABE1060D690B148A364A40949692B35053D1B30C331212458989AC0682FA989B
            B185555E197B21561080AC055F794F0ABC266F77E65ED281DCDA4F2BC268C773
            D7F6467B60655C6DC4C764AA1AE9C13171B61E3190B13365DBC5C0A099525CC1
            B5061C42001435EA1FCFBFFC07F131C928C505D72F547B92E584AEA27658CA50
            B94609B15B1283E65E3DC29610AB4B2C0E266D67759825BA5D8C2C0A62FA94BF
            0D766D20985295DEA197193A88666AB8F316D1DA4750299169353EE42C2A54E6
            895D06BC740E6273163A8D442CAE7B4A6DBBA982543005C10D4A696D5798CEF2
            DD6447F1CB98D723245D571790F73EDDFEE548951A63D23A4CB2D00C5FF50CAD
            0295F1055F35A7CB0DB6190DB150A9ADBE25486BEABEB7D6FADFD550E9BEBBE9
            CFFE0CE637717021F133106F887E6476F11C3BEC18A4A1DA120431368A083B2E
            C8966E498D5C512219ECBB9533847E662D0111AA277FA86FC151819000ED8983
            34FC25C8F96622CE7699839E63579C402D1136C0B4097B96AA880A662CDE42E8
            B9875242731BE2606574543899F3EC48EDC15E21F02DECF501C074F0370C6AAA
            902E0C0CACA402210DF73F50962D0B07C4D57205731A84B4A1CD401000608157
            FC3A8426BE8F72BF8EBAB33D73D73D1995FE048069CFB834162B32B477617FB8
            E097584FF68D69E17811959608A720B603404E288B8B6B0F50A11C3A4EECCC5B
            44AE28FF0061E1360182C2D8D3B425146D788A087167DA2AA883B0E5E2BC45FB
            0B988E9CAF680B9875177D0BCC92D66AD21519405A591C9821AA977D1258AA82
            D52F519327866BC173DA5CCC2F64BDA2A9713C31D2CF697D2458301795FB4AB9
            B603EF1AE732F8A47913FA903575F8FE13EAF8FE73FF001B1CB50A406FC448BF
            999633AA2737F65585A239604D35D2751DC1A2C132910D58A663B6FD88C54C89
            870196002A3A28636240688E6F8B03179815D47ECC4AA9AC25996C38C80351E6
            161ACA09BBE3752EF530E9CC9C9984E22A5F3B8634B591F0CB3E19944AD28CC5
            D362EF9AB4558E5CAE310C84E49F31C10254E7701898CC7A93AD37718EE915B8
            21152CF2B7111282B69A2E009400AFAB8EB7D6FADF5FC7D550E9BEBBEB7FC9EA
            63F880810D856EF001987243392E08AB53B0F88282995DDFD4149ABB0D7DE3FB
            5DFB95948AD39A6238C5D3A80D07168A3398A7B8CF1C03E25B763A56651F6C55
            E498BFD0CB703EA14222B7AD26F0D3BC2E54AA352B4F1A385806862E1293C931
            6072FB41434BFB4F277EB96AF9FEE15F27FB9E058D98828D432D444622B81DCB
            F30EC1E663DE88357012205EE9280D4E3A57D15D2A54D40E9AFA372BE8AEB52B
            AD7D19EDD73DBAE7B7D5BFE54B3B4C03981200F7224CA7887654C54343557629
            41A03386996837ED886287D15A83806C820A1087D9534F0E2EA5CF6502FF0012
            A84B876AB98F50A0EF28E6C147E205221A465CC5523AF6756CB924FC5C361B5E
            2AB88FB8EE9CC2B5669DB2B1961A07DA19D08C9039D41FB802FDA2C2C1997D35
            3C8D671E70039B99F6770E5330BFAA057C4C0FE53F8F9FE23EA3E8D74F8E97FC
            D56443B2108BC5649675E2B97F71E6EAE17FB1146DA512C90C410F331B1CF6B4
            B9F7204B444AF12FA66EE3D8D89FC45701EC9EFA66E1FF00C12CC54AB388E636
            480550D4D44D411DA6242223076E8DD96E2573094D54ABB588542AA216AA5A1E
            2139DCA80F440ADD5C3A159A0F1283C47A7C74B9F138971F538FA8EA4BA9F1F4
            9AEB7D372FFF004FE7A7E3EB059CC4A67981520F8870DAC0CF1BBDAFEE7679D6
            3FDC06C7B963FB8574B815551574486344438BA976A4D95C4B85817271985572
            0AD202AFFF00DA329B08FE651CD32AC36EE003E659EB68B88693FE22D40B4410
            EA5DC61D1DF82E238C207B823839D771839682FEC4A955D6BA712BA6A575AEB5
            7D2A6FE9AEB5027E7A54FCCA8CBBE8CBF137D2FC4DF4BFA6FE8DF5DF5DFD57D6
            FA1080C5C7C04B8E3D9A45B50EC6169ECF0CC643576C083302946A07164F24BB
            1034850BA54FCC6D5AEC398E3CB892A4360BF79E7253256644CD4144A15B80A2
            B551298196563CC203AB8905D42AEC87A80E358803138FFC4FF0DCBEB7F41F45
            F43ADCD7D1735D2FADF9EB737D2FADF5BEBAE897314AF64B532FC61461A65C23
            260625F36DCCC90EC5C4AD932EC5842DB4BC91D558C9CB37B20DC19039B5C3D3
            951702B4A0C1EE6809BC05CB18804AE1829D2975E1944201357A3D5EBC746712
            FE93A935FC37D6FF009FE7AFCFD7F3D7E7AFCF5F9EBF3F4B4884942F6E5C36B8
            9AA42265E4BA1EEB2DD11C02DAD3351AF28977B2D744540E0DE552E299C8D4F1
            18127F6A884BD97918EB5721DD1FA2E8D94CA52557D7C7F16FAEFF0082A1D2A1
            D39E97D6E6FA5937D2E6FE8D47AB9FAB7FF8A883B831A2578E53622F8C5AAB29
            5FFB1F89D1415012498D820AE030A66507BD20021E723C37035C8F150AFE1430
            EED798ED7885DF10B000769A7FE03E87F8AFE9BFE03F979FFC5F3F471D53B452
            6E30161C92CC0F02323D43680BFCCE40E81F80C302816E22038031B59681A3B4
            CDDCAA23ED045E526ABF72A7C6A609A0CD74F98F4F9FA38FE13A9D6FA12E1AE9
            AFFC3B9A997A54DF4AEB5D6A7AE9535D2A6BA54D4CFF002B7E60947B888C522E
            03139B5B6E98A525BC24CBD6CBD6098725B0AAF8879E816A6D802183B43FF37A
            FA78E9AE8753A73F4E3EAC75DF4D47A6A39FA35F56A6FAEFF878FA88F9882F12
            EB21DA67E6D77F53FF00B4FEA5394D2B7E0862801E2243F8B8FA8E8CE7A3D373
            FFD9}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 238.110390000000000000
          Top = 41.574830000000000000
          Width = 275.905690000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -20
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'RELATORIO DE PRODUTOS')
          ParentFont = False
        end
      end
    end
  end
  object rel_DS_Prod: TfrxDBDataset
    UserName = 'DS_Produtos'
    CloseDataSource = False
    DataSet = query_produtos
    BCDToCurrency = False
    Left = 528
    Top = 736
  end
  object query_caixa_coringa: TFDQuery
    Connection = fd
    SQL.Strings = (
      'select * from caixa')
    Left = 512
    Top = 40
    object query_caixa_coringadata_abertura: TDateField
      DisplayLabel = 'Data Abertura'
      DisplayWidth = 15
      FieldName = 'data_abertura'
      Origin = 'data_abertura'
      Required = True
    end
    object query_caixa_coringahora_abertura: TTimeField
      DisplayLabel = 'Hora da Abertura'
      DisplayWidth = 15
      FieldName = 'hora_abertura'
      Origin = 'hora_abertura'
      Required = True
    end
    object query_caixa_coringavalor_abertura: TBCDField
      DisplayLabel = 'Valor da Abertura'
      DisplayWidth = 15
      FieldName = 'valor_abertura'
      Origin = 'valor_abertura'
      Required = True
      Precision = 10
      Size = 2
    end
    object query_caixa_coringafuncionario_abertura: TStringField
      DisplayLabel = 'Funcion'#225'rio Abertura'
      DisplayWidth = 18
      FieldName = 'funcionario_abertura'
      Origin = 'funcionario_abertura'
      Required = True
      Size = 30
    end
    object query_caixa_coringadata_fechamento: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'data_fechamento'
      Origin = 'data_fechamento'
      Visible = False
    end
    object query_caixa_coringahora_fechamento: TTimeField
      AutoGenerateValue = arDefault
      FieldName = 'hora_fechamento'
      Origin = 'hora_fechamento'
      Visible = False
    end
    object query_caixa_coringavalor_fechamento: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valor_fechamento'
      Origin = 'valor_fechamento'
      Visible = False
      Precision = 10
      Size = 2
    end
    object query_caixa_coringavalor_vendido: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valor_vendido'
      Origin = 'valor_vendido'
      Visible = False
      Precision = 10
      Size = 2
    end
    object query_caixa_coringavalor_quebra: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'valor_quebra'
      Origin = 'valor_quebra'
      Visible = False
      Precision = 10
      Size = 2
    end
    object query_caixa_coringafuncionario_fechamento: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'funcionario_fechamento'
      Origin = 'funcionario_fechamento'
      Visible = False
      Size = 30
    end
    object query_caixa_coringanum_caixa: TIntegerField
      DisplayLabel = 'Num Caixa'
      DisplayWidth = 15
      FieldName = 'num_caixa'
      Origin = 'num_caixa'
      Required = True
    end
    object query_caixa_coringaoperador: TStringField
      FieldName = 'operador'
      Origin = 'operador'
      Required = True
      Visible = False
      Size = 30
    end
    object query_caixa_coringastatus: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 20
      FieldName = 'status'
      Origin = 'status'
      Required = True
    end
    object query_caixa_coringaid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      Visible = False
    end
  end
  object DSCaixaCoringa: TDataSource
    DataSet = query_caixa_coringa
    Left = 408
    Top = 48
  end
  object rel_mov_vendas: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44107.524417893500000000
    ReportOptions.LastChange = 44107.606203356480000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 32
    Top = 827
    Datasets = <
      item
        DataSet = rel_DS_Mov_Vendas
        DataSetName = 'RelMovVendas'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'status'
        Value = Null
      end
      item
        Name = 'datainicial'
        Value = Null
      end
      item
        Name = 'datafinal'
        Value = ''
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      BackPicture.Data = {
        0A544A504547496D616765C9890000FFD8FFE106BA4578696600004D4D002A00
        0000080007011200030000000100010000011A00050000000100000062011B00
        05000000010000006A0128000300000001000200000131000200000022000000
        720132000200000014000000948769000400000001000000A8000000D4000AFC
        8000002710000AFC800000271041646F62652050686F746F73686F7020434320
        32303137202857696E646F77732900323031393A30333A31322031363A31373A
        3232000003A001000300000001FFFF0000A00200040000000100000253A00300
        04000000010000034A0000000000000006010300030000000100060000011A00
        050000000100000122011B0005000000010000012A0128000300000001000200
        0002010004000000010000013202020004000000010000058000000000000000
        48000000010000004800000001FFD8FFED000C41646F62655F434D0002FFEE00
        0E41646F626500648000000001FFDB0084000C08080809080C09090C110B0A0B
        11150F0C0C0F1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E
        0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC000110800A0007103012200
        021101031101FFDD00040008FFC4013F00000105010101010101000000000000
        00030001020405060708090A0B01000105010101010101000000000000000100
        02030405060708090A0B1000010401030204020507060805030C330100021103
        04211231054151611322718132061491A1B14223241552C16233347282D14307
        259253F0E1F163733516A2B283264493546445C2A3743617D255E265F2B384C3
        D375E3F3462794A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F6
        37475767778797A7B7C7D7E7F711000202010204040304050607070605350100
        021103213112044151617122130532819114A1B14223C152D1F0332462E17282
        92435315637334F1250616A2B283072635C2D2449354A317644555367465E2F2
        B384C3D375E3F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6
        E6F62737475767778797A7B7C7FFDA000C03010002110311003F00F414924948
        85249249294924924A5249249294924924A5249249294A8F52E6AFED7FDF55E5
        47A97357F6BFEFA90534D24924E43FFFD0F4AFB11FF49FF47FF324BEC47F7C7D
        DFED56924788A1ABF623FE907DDFED4DF623FE907DDFED56924ACA9ABF623FE9
        07DDFED4BEC47FD20FBBFDAAD249595357EC47FD20FBBFDA97D88FFA4FFA3FED
        569246CA9ABF623FE907DDFED4FF00623FE907DDFED565242CA9ADF623FBE3EE
        FF00CC92FB11FDFF00C3FF00325653A5654D5FB11FF49FF47FF32599D669F49D
        47BB76E0FED1C6C5BAB1FAFF00D2C7F83FFF0045A3126D45CA492494887FFFD1
        F530653A82903292174C9D2492B249248A1492499252E92694A5252E92694A52
        53258FD7FE963FC1FF00F7C5AFB96475F3EEC7F83FFEF88C770A72924925221F
        FFD2F538F24BE497C928F2450BA49BE49D05293274924AC924922858CA5253A6
        D5252B54B54B5F14B5F1494AD564F5F9DD8F3E0FFF00BE2D6D7C564F5EFA58FF
        0007FF00DF118EEA72924925221FFFD3F52DC96E5182941450CB725B9460A509
        2996E4B728A492996E4A5452494CA5295149252E9264A1252EB27AF7D2C7F83F
        FEF8B5564F5DFA58FF0007FF00DF118EEA73124925221FFFD4F5191E0948F04C
        92285E4782523C1324929791E0948F04C924A5E4782523C1324929791E0948F0
        4C924A5F4F04A4782649252F23C164F5EFA58FF07FFDF16AACAEBBF4B1FE0FFF
        00BE231DD4E5A4924A443FFFD5F50493A48A16493A49296493A49296493A4929
        6493A49296493A49296595D77E963FC1FF00F7C5ACB27AF7D2C7F83FFEF88C77
        539692492910FF00FFD6F53D12D132708A15A7825ED48A8A4A652D4B44C02749
        4AD12D3C1327494A81E09E0264E82950128092492550163F5FFA58FF0007FF00
        DF16C2C7EBFF004B1FE0FF00FBE231DC20B9492492950FFFD7F5209D249142C9
        25AF9A7494A4C927494A4E9248294924924A5249249254B1FAFF00D2C7F83FFE
        F8B6163F5FFA58FF0007FF00DF118EE145CA492494AB5FFFD0F5320A6DA567EF
        B3F7DDF794B7D9FBEEFBCA7521D18849676FB3F7DDF794B7D9FBEEFBCA5C2A74
        613ACDDF67EFBBEF296FB3F7DDF794B854E924B377D9FBEEFBCA5BECFDF77DE5
        2E153A492CDDF67EFBBEF296FB3F7DDF794B854E924B377D9FBEEFBCA5BECFDF
        77DE52E153A4B1FAFF00D2C7F83FFEF88DBECFDF77DE551EA6E71356E24E8EE4
        CFEEA206AA69249249E87FFFD9FFED0F1A50686F746F73686F7020332E300038
        42494D0425000000000010000000000000000000000000000000003842494D04
        3A000000000125000000100000000100000000000B7072696E744F7574707574
        000000050000000050737453626F6F6C0100000000496E7465656E756D000000
        00496E746500000000436C726D0000000F7072696E745369787465656E426974
        626F6F6C000000000B7072696E7465724E616D65544558540000001700480050
        0020004400650073006B006A0065007400200033003500310030002000730065
        007200690065007300000000000F7072696E7450726F6F6653657475704F626A
        63000000160043006F006E00660069006700750072006100E700E3006F002000
        640065002000500072006F0076006100000000000A70726F6F66536574757000
        00000100000000426C746E656E756D0000000C6275696C74696E50726F6F6600
        00000970726F6F66434D594B003842494D043B00000000022D00000010000000
        010000000000127072696E744F75747075744F7074696F6E7300000017000000
        004370746E626F6F6C0000000000436C6272626F6F6C00000000005267734D62
        6F6F6C000000000043726E43626F6F6C0000000000436E7443626F6F6C000000
        00004C626C73626F6F6C00000000004E677476626F6F6C0000000000456D6C44
        626F6F6C0000000000496E7472626F6F6C000000000042636B674F626A630000
        000100000000000052474243000000030000000052642020646F7562406FE000
        000000000000000047726E20646F7562406FE0000000000000000000426C2020
        646F7562406FE000000000000000000042726454556E744623526C7400000000
        0000000000000000426C6420556E744623526C74000000000000000000000000
        52736C74556E74462350786C40520000000000000000000A766563746F724461
        7461626F6F6C010000000050675073656E756D00000000506750730000000050
        675043000000004C656674556E744623526C7400000000000000000000000054
        6F7020556E744623526C7400000000000000000000000053636C20556E744623
        50726340590000000000000000001063726F705768656E5072696E74696E6762
        6F6F6C000000000E63726F7052656374426F74746F6D6C6F6E67000000000000
        000C63726F70526563744C6566746C6F6E67000000000000000D63726F705265
        637452696768746C6F6E67000000000000000B63726F7052656374546F706C6F
        6E6700000000003842494D03ED00000000001000480000000100020048000000
        0100023842494D042600000000000E000000000000000000003F800000384249
        4D040D0000000000040000005A3842494D04190000000000040000001E384249
        4D03F3000000000009000000000000000001003842494D271000000000000A00
        0100000000000000023842494D03F5000000000048002F66660001006C666600
        06000000000001002F6666000100A1999A000600000000000100320000000100
        5A00000006000000000001003500000001002D00000006000000000001384249
        4D03F80000000000700000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800
        000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800003842494D040000
        000000000200023842494D04020000000000060000000000003842494D043000
        0000000003010101003842494D042D0000000000060001000000033842494D04
        08000000000010000000010000024000000240000000003842494D041E000000
        000004000000003842494D041A00000000035900000006000000000000000000
        00034A000002530000001200460055004E0044004F002000520045004C004100
        54004F00520049004F0020004100340000000100000000000000000000000000
        000000000000010000000000000000000002530000034A000000000000000000
        0000000000000001000000000000000000000000000000000000001000000001
        0000000000006E756C6C0000000200000006626F756E64734F626A6300000001
        000000000000526374310000000400000000546F70206C6F6E67000000000000
        00004C6566746C6F6E67000000000000000042746F6D6C6F6E670000034A0000
        0000526768746C6F6E670000025300000006736C69636573566C4C7300000001
        4F626A6300000001000000000005736C6963650000001200000007736C696365
        49446C6F6E67000000000000000767726F757049446C6F6E6700000000000000
        066F726967696E656E756D0000000C45536C6963654F726967696E0000000D61
        75746F47656E6572617465640000000054797065656E756D0000000A45536C69
        63655479706500000000496D672000000006626F756E64734F626A6300000001
        000000000000526374310000000400000000546F70206C6F6E67000000000000
        00004C6566746C6F6E67000000000000000042746F6D6C6F6E670000034A0000
        0000526768746C6F6E67000002530000000375726C5445585400000001000000
        0000006E756C6C54455854000000010000000000004D73676554455854000000
        01000000000006616C74546167544558540000000100000000000E63656C6C54
        657874497348544D4C626F6F6C010000000863656C6C54657874544558540000
        0001000000000009686F727A416C69676E656E756D0000000F45536C69636548
        6F727A416C69676E0000000764656661756C740000000976657274416C69676E
        656E756D0000000F45536C69636556657274416C69676E000000076465666175
        6C740000000B6267436F6C6F7254797065656E756D0000001145536C69636542
        47436F6C6F7254797065000000004E6F6E6500000009746F704F75747365746C
        6F6E67000000000000000A6C6566744F75747365746C6F6E6700000000000000
        0C626F74746F6D4F75747365746C6F6E67000000000000000B72696768744F75
        747365746C6F6E6700000000003842494D042800000000000C000000023FF000
        00000000003842494D041100000000000101003842494D041400000000000400
        0000083842494D040C00000000059C0000000100000071000000A00000015400
        00D4800000058000180001FFD8FFED000C41646F62655F434D0002FFEE000E41
        646F626500648000000001FFDB0084000C08080809080C09090C110B0A0B1115
        0F0C0C0F1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14
        140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC000110800A00071030122000211
        01031101FFDD00040008FFC4013F000001050101010101010000000000000003
        0001020405060708090A0B010001050101010101010000000000000001000203
        0405060708090A0B1000010401030204020507060805030C3301000211030421
        1231054151611322718132061491A1B14223241552C16233347282D143072592
        53F0E1F163733516A2B283264493546445C2A3743617D255E265F2B384C3D375
        E3F3462794A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F63747
        5767778797A7B7C7D7E7F7110002020102040403040506070706053501000211
        03213112044151617122130532819114A1B14223C152D1F0332462E172829243
        5315637334F1250616A2B283072635C2D2449354A317644555367465E2F2B384
        C3D375E3F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F6
        2737475767778797A7B7C7FFDA000C03010002110311003F00F4149249488524
        9249294924924A5249249294924924A5249249294A8F52E6AFED7FDF55E547A9
        7357F6BFEFA90534D24924E43FFFD0F4AFB11FF49FF47FF324BEC47F7C7DDFED
        56924788A1ABF623FE907DDFED4DF623FE907DDFED56924ACA9ABF623FE907DD
        FED4BEC47FD20FBBFDAAD249595357EC47FD20FBBFDA97D88FFA4FFA3FED5692
        46CA9ABF623FE907DDFED4FF00623FE907DDFED565242CA9ADF623FBE3EEFF00
        CC92FB11FDFF00C3FF00325653A5654D5FB11FF49FF47FF32599D669F49D47BB
        76E0FED1C6C5BAB1FAFF00D2C7F83FFF0045A3126D45CA492494887FFFD1F530
        653A82903292174C9D2492B249248A1492499252E92694A5252E92694A525325
        8FD7FE963FC1FF00F7C5AFB96475F3EEC7F83FFEF88C770A72924925221FFFD2
        F538F24BE497C928F2450BA49BE49D05293274924AC924922858CA5253A6D525
        2B54B54B5F14B5F1494AD564F5F9DD8F3E0FFF00BE2D6D7C564F5EFA58FF0007
        FF00DF118EEA72924925221FFFD3F52DC96E5182941450CB725B9460A5092996
        E4B728A492996E4A5452494CA5295149252E9264A1252EB27AF7D2C7F83FFEF8
        B5564F5DFA58FF0007FF00DF118EEA73124925221FFFD4F5191E0948F04C9228
        5E4782523C1324929791E0948F04C924A5E4782523C1324929791E0948F04C92
        4A5F4F04A4782649252F23C164F5EFA58FF07FFDF16AACAEBBF4B1FE0FFF00BE
        231DD4E5A4924A443FFFD5F50493A48A16493A49296493A49296493A49296493
        A49296493A49296595D77E963FC1FF00F7C5ACB27AF7D2C7F83FFEF88C775396
        92492910FF00FFD6F53D12D132708A15A7825ED48A8A4A652D4B44C027494AD1
        2D3C1327494A81E09E0264E82950128092492550163F5FFA58FF0007FF00DF16
        C2C7EBFF004B1FE0FF00FBE231DC20B9492492950FFFD7F5209D249142C925AF
        9A7494A4C927494A4E9248294924924A5249249254B1FAFF00D2C7F83FFEF8B6
        163F5FFA58FF0007FF00DF118EE145CA492494AB5FFFD0F5320A6DA567EFB3F7
        DDF794B7D9FBEEFBCA7521D18849676FB3F7DDF794B7D9FBEEFBCA5C2A74613A
        CDDF67EFBBEF296FB3F7DDF794B854E924B377D9FBEEFBCA5BECFDF77DE52E15
        3A492CDDF67EFBBEF296FB3F7DDF794B854E924B377D9FBEEFBCA5BECFDF77DE
        52E153A4B1FAFF00D2C7F83FFEF88DBECFDF77DE551EA6E71356E24E8EE4CFEE
        A206AA69249249E87FFFD93842494D042100000000005D00000001010000000F
        00410064006F00620065002000500068006F0074006F00730068006F00700000
        001700410064006F00620065002000500068006F0074006F00730068006F0070
        0020004300430020003200300031003700000001003842494D04060000000000
        070007010100010100FFE1120D687474703A2F2F6E732E61646F62652E636F6D
        2F7861702F312E302F003C3F787061636B657420626567696E3D22EFBBBF2220
        69643D2257354D304D7043656869487A7265537A4E54637A6B633964223F3E20
        3C783A786D706D65746120786D6C6E733A783D2261646F62653A6E733A6D6574
        612F2220783A786D70746B3D2241646F626520584D5020436F726520352E362D
        633133382037392E3135393832342C20323031362F30392F31342D30313A3039
        3A30312020202020202020223E203C7264663A52444620786D6C6E733A726466
        3D22687474703A2F2F7777772E77332E6F72672F313939392F30322F32322D72
        64662D73796E7461782D6E7323223E203C7264663A4465736372697074696F6E
        207264663A61626F75743D222220786D6C6E733A786D703D22687474703A2F2F
        6E732E61646F62652E636F6D2F7861702F312E302F2220786D6C6E733A64633D
        22687474703A2F2F7075726C2E6F72672F64632F656C656D656E74732F312E31
        2F2220786D6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E
        636F6D2F7861702F312E302F6D6D2F2220786D6C6E733A73744576743D226874
        74703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970652F
        5265736F757263654576656E74232220786D6C6E733A73745265663D22687474
        703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970652F52
        65736F75726365526566232220786D6C6E733A70686F746F73686F703D226874
        74703A2F2F6E732E61646F62652E636F6D2F70686F746F73686F702F312E302F
        2220786D703A43726561746F72546F6F6C3D2241646F62652050686F746F7368
        6F702043432032303137202857696E646F7773292220786D703A437265617465
        446174653D22323031392D30332D31325431363A31303A35392D30333A303022
        20786D703A4D65746164617461446174653D22323031392D30332D3132543136
        3A31373A32322D30333A30302220786D703A4D6F64696679446174653D223230
        31392D30332D31325431363A31373A32322D30333A3030222064633A666F726D
        61743D22696D6167652F6A7065672220786D704D4D3A496E7374616E63654944
        3D22786D702E6969643A62363966383932382D393063382D383934352D613530
        312D3862613432396534356232312220786D704D4D3A446F63756D656E744944
        3D2261646F62653A646F6369643A70686F746F73686F703A3665626435353434
        2D343466622D313165392D613635342D6335636565343334373364662220786D
        704D4D3A4F726967696E616C446F63756D656E7449443D22786D702E6469643A
        34316464636231302D613935342D373234322D616633642D6635663335396264
        66626233222070686F746F73686F703A436F6C6F724D6F64653D2233223E203C
        786D704D4D3A486973746F72793E203C7264663A5365713E203C7264663A6C69
        2073744576743A616374696F6E3D2263726561746564222073744576743A696E
        7374616E636549443D22786D702E6969643A34316464636231302D613935342D
        373234322D616633642D663566333539626466626233222073744576743A7768
        656E3D22323031392D30332D31325431363A31303A35392D30333A3030222073
        744576743A736F6674776172654167656E743D2241646F62652050686F746F73
        686F702043432032303137202857696E646F777329222F3E203C7264663A6C69
        2073744576743A616374696F6E3D227361766564222073744576743A696E7374
        616E636549443D22786D702E6969643A66313461373734302D396136622D3434
        34372D613462352D303737383032663837336362222073744576743A7768656E
        3D22323031392D30332D31325431363A31373A30392D30333A30302220737445
        76743A736F6674776172654167656E743D2241646F62652050686F746F73686F
        702043432032303137202857696E646F777329222073744576743A6368616E67
        65643D222F222F3E203C7264663A6C692073744576743A616374696F6E3D2273
        61766564222073744576743A696E7374616E636549443D22786D702E6969643A
        30393063613532612D396433612D626534392D623635632D6235363861333161
        36326530222073744576743A7768656E3D22323031392D30332D31325431363A
        31373A32322D30333A3030222073744576743A736F6674776172654167656E74
        3D2241646F62652050686F746F73686F702043432032303137202857696E646F
        777329222073744576743A6368616E6765643D222F222F3E203C7264663A6C69
        2073744576743A616374696F6E3D22636F6E766572746564222073744576743A
        706172616D65746572733D2266726F6D206170706C69636174696F6E2F766E64
        2E61646F62652E70686F746F73686F7020746F20696D6167652F6A706567222F
        3E203C7264663A6C692073744576743A616374696F6E3D226465726976656422
        2073744576743A706172616D65746572733D22636F6E7665727465642066726F
        6D206170706C69636174696F6E2F766E642E61646F62652E70686F746F73686F
        7020746F20696D6167652F6A706567222F3E203C7264663A6C69207374457674
        3A616374696F6E3D227361766564222073744576743A696E7374616E63654944
        3D22786D702E6969643A62363966383932382D393063382D383934352D613530
        312D386261343239653435623231222073744576743A7768656E3D2232303139
        2D30332D31325431363A31373A32322D30333A3030222073744576743A736F66
        74776172654167656E743D2241646F62652050686F746F73686F702043432032
        303137202857696E646F777329222073744576743A6368616E6765643D222F22
        2F3E203C2F7264663A5365713E203C2F786D704D4D3A486973746F72793E203C
        786D704D4D3A4465726976656446726F6D2073745265663A696E7374616E6365
        49443D22786D702E6969643A30393063613532612D396433612D626534392D62
        3635632D623536386133316136326530222073745265663A646F63756D656E74
        49443D22786D702E6469643A34316464636231302D613935342D373234322D61
        6633642D663566333539626466626233222073745265663A6F726967696E616C
        446F63756D656E7449443D22786D702E6469643A34316464636231302D613935
        342D373234322D616633642D663566333539626466626233222F3E203C70686F
        746F73686F703A446F63756D656E74416E636573746F72733E203C7264663A42
        61673E203C7264663A6C693E61646F62653A646F6369643A70686F746F73686F
        703A63383837363862342D336162612D313165392D396266372D626532623861
        3737326435633C2F7264663A6C693E203C2F7264663A4261673E203C2F70686F
        746F73686F703A446F63756D656E74416E636573746F72733E203C2F7264663A
        4465736372697074696F6E3E203C2F7264663A5244463E203C2F783A786D706D
        6574613E20202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        20202020203C3F787061636B657420656E643D2277223F3EFFEE002141646F62
        650064400000000103001003020306000000000000000000000000FFDB008400
        0101010101010101010102010101020201010101020202020202020203020303
        0303020303040404040403050505050505070707070708080808080808080808
        0101010102020204030304070504050708080808080808080808080808080808
        0808080808080808080808080808080808080808080808080808080808080808
        08FFC2001108034A025303011100021101031101FFC400CE0001010100020301
        010000000000000000000102030904070A060501010101010101010100000000
        0000000000010203060405071000020103020405040301000301000000000111
        0212131003203021144031041517330607375060323641220523110001020106
        070D06050204050500000001003111214191A1023220305161D133A41040B112
        4203D3E30405B536077181E135757660C122B4065013F0F16214A2247495A552
        921585161200010403010002030100000000000000006001310271A1B1322080
        40A05190FFDA000C03010102110311000000FB0AF59F98000000000000000000
        000000000000000000000000000000000075D9FAB8FCBEC07677F8FB00000000
        000000000000000000000000000000000000000000003AECFD5C7E5F603B3BFC
        7D80000000000000000000000000000000000000000000000000001D767EAE3F
        2FB01D9DFE3EC000000000000000000000000000000000000000000000000000
        0EBB3F571F97D80ECEFF001F6000000000000000000000000000000000000000
        000000000000075D9FAB8FCBEC07677F8FB00000000000000000000000000000
        000000000000000000000003AECFD5C7E5F603B3BFC7D8000000000000000000
        0000000000000000000000000000000001D767EAE3F2FB01D9DFE3EC00000000
        00000000000000000000000000000000000000000000EBB3F571F97D80ECEFF1
        F6000000000000000000000000000000000000000000000000000075D9FAB8FC
        BEC07677F8FB0000000000000000000000000000000000000000000000000000
        3AECFD5C7E5F603B3BFC7D800000000000000000000000000000000000000000
        00000000001D767EAE3F2FB01D9DFE3EC0000000000000000000000000000000
        000000000000000000000EBB3F571F97D80ECEFF001F60000000000000000000
        00000000000000000000000000000000075D9FAB8FCBEC077CDE1FEE0056B8B5
        9C6B000022D40000000000000059B025C0B340A012596680008014800882A81C
        F9E8C801480E957D97C1F82EF903E87FF9E7E90002B8379C6B24022D0800E2A0
        00A002000AA2255000214042B9337535400002805894956585A359BCB8D80001
        D117BCFCBF5DFD1903E87FF9E7E90000B75E36F9E759245A1000335C5B850000
        00000000002428896DB973635B9A00012BC8C6B774240A485B20881699A001D1
        17BCFCBF5DFD1903E87FF9E7E9000019B78378C59AB90000066B86CBAA000000
        0000001001168172E6C6B535400012C110000004DE7A7918D950259D11FBBFCC
        F5DFD1903E87FF009E7E90000545278FD312E400000335C5B000000000000099
        5A014032A73635B9A00019B9DCD6A68500080069778D0523A22F79F97EBBFA32
        07D0FF00F3CFD2000504095E3F4C4B9000000CD70EA5B4000000000224975409
        2555002C7373D6A6A800039F3A5A1900042821A5B9A3A22F79F97EBBFA3207D0
        FF00F3CFD200282001357C7DF39720000019AE2D8000000001248BAA001332DA
        A005CB9B3ADE74000066E753433723534258204D4BE4E7AB17A22F79F97EBBFA
        3207D0FF00F3CFD20141000026AF8DBC2E4800000C5716A5B400000022497540
        000490B6802C7373D6A6A80010E696CD0001424034B65E88BDDFE5FAEFE8C81F
        43FF00CF3F48290000029136F1B585840000062B8F60000004492EA800000224
        97540172E6C6B7340000724D000022550217A27F71F9DEBBFA3207D0FF00F3CF
        D252000000056F3BC78FAE79AA800000C5716A5B400842C9175400000001332D
        AA02C73F3D59AA000012C4B4C5CD00D4D429D157B7F83D79F4640FA1EFE7BFA5
        600000000559ACEA78DBE52AA00000315C7B002E521A2800000000020280B973
        635B9A0000B3C9C749282001681D11FB9FCCF5DFD1903E82FC27D65F379F4E7C
        6900000003537C7D39F8FAC4AA100000C570EB2CDD154B2E5AA0000000000224
        97540B1CDCF5A9AA003373C99DF3E365400001D117BCFCBF5DFD1903E813C3FD
        229FD3E3DF9F968000000568B8D63C7E9CC02000018AC994AB29A00000000000
        009996D50B973E35A9A000CDCF2675CF8E8940000E88BDE7E5FAEFE8C81F409E
        1FE9029FD4E3DF9B9E900000002B78DE3C7D7350202E2C08D2E2B29351680000
        0000000002495542C7373D6A6A8337356272677CF8E810001D117BCFCBF5DFD1
        903E813C3FD200B1FD4E5DB9B96C00000059BA7174C706F902887159A548519B
        26C0000000000000001124BAA2E5CF8D6A6B373A9A19B91CB9DF363A20003A22
        F79F97EBBFA3207D02787FA40029FD4E1DF9B1A40000000D37C3BE7C3BE6004D
        4AE3B988B0456A8000084405D40014202824821692C72E75652669608BCB9D72
        677598BB97933BE88FDDFE5FAEBE8C81F409E1FE9000165FEA71EBCDCF600000
        02DD55E1DF3E1BCCB5512B16096042B1B000211C7ACF8FBE79BA2405812AA422
        824B51A922AC1C990160A2ACB2CA2AFF005787D1D14FB7FCFF005DFD1903E813
        C3FD2000058FEA71EFCDCF640000000AE2DE784A5258B9E133B9562112ACB740
        00386E7C4E98D482000025A00B1A44B2CCDB64E4CB5340002168597A3CF63F37
        AF7BC03E813C3FD200000B2FF578F6E5E7A00000015A9670EA71DCB592010C51
        2AC4CDB34000124E2B38772A580005B6282255405B4458E6CDAD24145A8E6C6B
        95B47451EE3F3BD77F4640FA08F0BF50A0012A89A97FA5CBB6A56400002AA962
        70EF1C7AC08B5218A5225019A500000190902E8A02665D5002249755172E7CEE
        A80489579F1BE4CEBA22F77F99EBAFA3207D0C780FD1012800691036BAC80002
        ADA94335A9E3EF963590520E331A85B0A94A0000249E3EF9C582DA9010B10580
        149951516F2628325A44CAEE5E8EBD97CDEBEEF00FA04F0FF480000001A8FEA7
        1EFCB8D20142ADA9249A9D06758E0DF3C6B20B003082D23358DCAA00038D9F13
        A73CDA00000B20968000153979D0285113A3DF63C3D7DDE01F425E0BEF160290
        8A833ABA9059BF2716C05BA5952422353A089358F1F78CEB20A09C1A8A0866DD
        2680001971EB3E2EF0A8551A90010D012904B51691CD9A8AA42C4E8E3D9FCDEB
        DEF00FA0DF07F658540500AA02053CACF4E5C52DA922000353A133BC78FBC66E
        4028200071D6351680001249269A50400000005925B570E79BD4B2883A2BF6DF
        0FAF3E8C81F40FE1BEA804102A0028406A5FEA70FA39705A900006A7412E66A7
        8FBE59B000000071D6360000892716A67524514428000008322B79BB96CA64BD
        1B7B3F97D7BDE01F431E03F42C45D848B5742412DB150B8AD46A02000001A9D0
        6779F1B5CA6B2002900038EB1A8B404492DB867C4EBCF16800000000002C8397
        16A8E8F3D8FCFEBEEF00FA04F0FF004810A0080A416A4294B2FF004F8F7E5C50
        00006A7404C6F1E3EF9CB0005200071D63608925D508C33E275C44CDA00D4822
        8025002C0D49C99D17A3CF63F37AFBBC03E84BC17DE22DB2466C2EA494922D32
        8B4CD8559AF3B9F4B900001A9D0019DE3C6DF296000A0800E3AE3D445D500004
        13341001540500008CEE6B9B1AE8B3DB7C3EBCFA201F435FCFFF0054000262B5
        2DDE732D89A854586A4A962140001A9D000B31BCF8FBE510000A400715674500
        0018673480A000080000A65A5E8DBD9FC9EBDEF00FA1EFE7BFA400000290042A
        C0000000000D4E800C74C78FBE510000A08071D629A0000CC9E274E5C7AA0000
        00000001D217ADE1EBFEF00FA1FF00E7BFA4000042C280000000000000D4D800
        71EF1E3EF9900186EA6990071D63600008CA787D39E340000000000379747FEB
        F87AFF00BC03E82BC2FD600E3B38F59B28291400000000000000B1CD9D846779
        C2008AA40A090634CD116D800433600010011400017A41F5DC3D7FDE01F409E1
        FE9000E2DE78F50021410440001A6C0000000B97366D94442AAC010A01104B33
        650B650204A40A00000025511D1FFB0E1EBEEF00FA04F0FF0048000E2DE7152C
        1490AB2CB080005B29400000068E5C2CA000000000A2652CB54000000000019B
        2C551D1E7B1F9FD7DDE01DF6F87FA40CD962AC1400492ACAA040014000000008
        216168000204B45012D8D00000000000085003A50F5BC3F03DE01DF6787FA442
        80000002522800000000000020AB000000021400351A0000000000428003A51F
        5BC3F03DE01DF6787FA400000000008500000000000101400000000405000000
        0000010255000E947D8FCFF81EF00EFB3C3FD440000000000214000000000101
        40000000001014000000000D4D66C200001D28FB1F9FF03DE01DFB788FAB8AE4
        000000000010588000000002D320A80000000160B352C4000002A89672E7496D
        9C3720000749BEBF8FE07BC03BF8F17F4000000000000138AE4B400000400D4D
        40500000000101412C45500019B8DCD7262AB2716F3A9A00003A49F5DC3F01DA
        01DFDF89FA400000000000010B24B4000062CE2D66CD80000000000000292C45
        580A42B3C99D58C59C7B965280001D257AEE1F80ED00FA0EFE7FFA0000000000
        000001116D8004B2CA0000000000000000024B6C0A42ACAD44B240000007467E
        E3E1F5EFD1903E807C37D7400000000000000085008500000000000000000000
        03971AB5C361028000000747DECBE5F5F778077E9E2FBD5000000000000000CD
        CEA544D44B54000000000000000003373A9752D814E3D42800000003A49F5DC3
        F01DA01DFA78BEF54000000000000003373AC8B2CAD0000000000000000000CD
        CEE5DE2DAD4BC1ACAD000000000E927D770FC0768077E9E2FBD5000000000000
        0044966A6866E753400000000000000000009C99BA978F59C5168000000001D2
        4FAEE1F80ED00EFD3C5F7AA00000000000004B11540110550000000000000000
        227366C33671EB3A9B88AB2800000003A49F5DC3F01DA01DFA78BEF540000000
        000004B986A680004B05940000000000000CDCD379BACDD1C7A98B4500CDCD96
        A8000000E927D770FC0768077E9E2FBD500000000000097296A80000222ACA00
        0000000001139212EA2D7156358B3740009725B28000007493EBB87E03B403BF
        4F17F450000000000012C4550000000337365AA0000000003373A979B1752E6B
        8ECCE90A000019B9A59A000007493EBB87E03B403BF3F17DB4D000000000012E
        52D50000000009730D4D00000000066E772F262CAE3D3371A9B00000011259A9
        A00003A49F5DC3F01DA01DFA78CEF12CB5400000001966AD500000000002584B
        340000000088525500000000002588AA001D24FAEE1F80ED00EFD3C5FD149725
        B28000000CDCEA6800000000000044966A6800000066E6CB540000000000004B
        226A6801D24FAEE1F80ED00EFD3C5F7AA337365AA00000CDCEA6800000000000
        0002588AA00004415400000000000001105503A49F5DC3F01DA01DFA78BEF540
        892CD4D0000CDCEA68000002148500000000960B28004B115400000000000000
        00CDCD96AF493EBB87E03B403BF4F17DAA800440B02696594000000445B96373
        60000000082CB28102550014100000000000000895AE927D770FC0768077F1E2
        7A94000096EA4CDB6400000000BC7B89AE4CE0A000000000B5209560012B16D5
        DE72000000000000001D237AFE5F80EF00EFE7C4F51680089756245D64000000
        0048B0D2140000002512CDCDC230A001065695014000000000009443A46F5FCB
        D7FDE01DFE78CEE0002259A32550000000010005000000011059A22800000000
        000000000001194D7489EB787AFF00B80EFF003C5F7AB100960D4D0CDC92CD00
        0000000000000000290055CDC8B28000000000000000004B1157A43F5DC7D7FD
        A01F405E27E84000000085000000000000000002C4A000428000000000000000
        00000E8FBD870F5F77807D06F84FB00850000002140000000000000042800000
        10A00000000000000042800E8D3DA7C9EBDEF00FA1FF00E79FA4255100000012
        8580005000001000128580000001285800000000000012A88007449EEFF3FD77
        F4640FA1FF00E79FA59B752000000002545D480294000004204A028020000002
        50B00000000000095600007449EEFF003FD77F4640FA11F05F6D0000002D6B3A
        D000C94F1F78E1D60000003CBE7D779D0ABC7738DE5007367540000073E37602
        02928005000A44AAA80A201D11FBAFCEF5DFD1903E82FC1FD2000000391BE694
        0011C1B9E0F5E566400001E4E3BF95CF60B9B386F344D652F335C928000039B1
        D3931400001A9D000005466CD0BD20000E88BDC7E67AEBE8C81F417E0FE90000
        00D5D73E77500030781DB966E22D9000072E7AF9BCFA2325AE1D7396149BCEB9
        66824B6D2141BCEB9F1B812A8010353A00005912CD017A40001D117B8FCCF5D7
        D1903E82FC1FD200000B6F919DD000965781D7971DE6066DD2200D4DF9FCBB12
        04E2D670C6A685396DB1532D724D6359C5BBCE6CBE4F3D802AEB3B0A080353A0
        0B2259A000BD20007445EE3F33D75F4640FA0BF07F480000AE7CF4D800097C3E
        98F1F7C40025A4B15BF3F8F6A133666E38D986A695CD2D02B79D645C0E39D3CB
        E7740035376501410353A09722CD000017A4007445EE3F33D75F4640FA0BF07F
        4800069CB9DF2CA0028E0D67C2E9C4800000F2F1F473F3B8B1666CE399A08725
        D72CC896EB3A96E6E2C439F1D3932006A6ACD000050D67A4B91668000002F480
        7445EE3F33D75F4640FA0BF07F48000DB5CF340008C69FCFEBC632000146FC9E
        7D3C9E7D32CE759B6713280356DBBE5CF306ACD6359A88DE77CF8A00B2EA6C00
        00504B5AB28000000BD201D117B8FCCF5D7D1903E82FC1FD20069737C89BA000
        23C4E99C6B2000044DCDF95CBA66C8CB6E39890055E4D6B368DE33C937C7732C
        1BCEBC9E7400353A5800001402353A000000017A41D117B8FCCF5D7D1903E82F
        C1FD202AE9CFCFA680001C1A440A000B26B3BDCD66E66B0309862CD09672DDCB
        A49A4E4C6A8055F239EEE68805580000A2A4015ACF4000000005E93A22F71F99
        EBAFA3207D05F83FA4361CD8DF24A0008F1B73C5E9C400010D6F3AF231D3926B
        3BC6A4CA70A0D44396EA6B4359CEB376A0179F1BDE2800000001480028A9353A
        00000001D11FBCFCBF5D7D1903E82FC2FD2C9B6F1BE7940004250002150D4D40
        71EF1A9331C57165CD0E595BD8D4CD9AE4C801CB9E9CBCE80000000148000015
        66ACD0000000E88FDE7E5FAEBE8C81F417E13E946B579F1D2A000653F9FDB397
        35A00D4D25A72E75E573DE6F3CEE8E398400AE46E6A8D49CB8A00DE75CFCF600
        0000005200000000D4E8000001D117BCFCBF5DFD1903E82FC27D34E7CF4D0000
        38EB3400011A9656A25CCB25B8989002B99ACDACA69CD8B402CBE473E9600000
        000520000000015AB3400000E88BDE7E5FAEFE8C81F415E13EAE7CEB91400078
        BBCF0EB200006A5AD7938D5678F7522678E66A85723535A164DE6EA5A8266F93
        9DEB3400000000000000000353A4B916680007445EF3F2FD77F4640FA0FF0007
        F66E6F49500195F1778200009565E4979A5E3D496DCE78E6401BB574B472626E
        58B0D272E3A72E280000008500000000000D4E825C8B34001D117BCFCBF5DFD1
        903E857C17DA228A838CE1DE41002C22D39737965E3D633AD6B39E2990259B6A
        DD2D1A9397140171BF233AB00000012AC0000000000000D4E92E459A007445EF
        3F2FD77F4640FA15F05F681161A4F0778C6F12D08115572D1E772E99D31A5931
        33962CD0572DD66E926A4E4CEA8026BC9E7B292C0000128580000000000001A9
        D0446A336A8E88BDE7E5FAEFE8C81F42BE0BED000E1AA94000C9A11C8B8B25CE
        A4E2B712085392EE5A3526F2D28097C8C74D64250B0000255800000000000000
        0D4E825C96CBD117BCFCBF5DFD1903E857C17DA00F1F53C4E9C336D0044B7532
        5F2F9F6E6CDCEB14B262D96865E4635A9445D5BBC5956017500084AD40105580
        000000000000001A9D009723A23F77F9BEBBFA3207D0AF82FB40E3B3C0EDC648
        2B711512C839F3D7CCE7BCEB1C7AD8006B33979DE7CD0235C99D000000003342
        C2AC00000000000000001A9D0012E7A23F77F9BEBBFA3207D0AF82FB40F0F79C
        DC80585082B5E673DE2E71BA001ACCDE2F938A00D4E96000000001C7AA393300
        0000000000000000353A0026B3D11FBAFCDF5DFD1903E857C17DA00032B402A0
        18B38F7400127261E4F3D500D4DD94000000094850B000000000000000000006
        A749724E88FDDFE77AEFE8C81F42BE0BED000CB5A4202E574CCB38B4968006B3
        3C9E5ADC006F79A00000004A4500942C0000000000000000005692D5E88BDE7E
        5FAEFE8C81DD4794FA0012DB20000CDB2C00003797266812B534000000008500
        00000000000000000000002CD750FEA3E3FC4F6807677F8FB000000000000000
        00000000000000000000000000000000000003AECFD5C7E5F603B3BFC7D80000
        000000000000000000000000000000000000000000000001D767EAE3F2FB01D9
        DFE3EC0000000000000000000000000000000000000000000000000000EBB3F5
        71F97D80ECEFF1F6000000000000000000000000000000000000000000000000
        000075D9FAB8FCBEC07677F8FB00000000000000000000000000000000000000
        000000000000003AECFD5C7E5F603FFFDA0008010200010500FE8FB7FE7FA56D
        FF009FE95B7FE7FA56DFF9FE95B7FE7FA56DFF009FE95B7FE7FA56DFF9FE95B7
        FE7FA56DFF009FE95B7FE7FA56DFF9FE95B7FE75EFB74EFB74EFB74EFB747EB7
        745EB770EF370EF370EF370EF370EF370EF370EF370EF370EF370EF370EF370E
        F370EF370EF370EF370EF370EF370EF370EF370EF370EF370EF370EF370EF370
        EF370EF370EF370EF370EF370EF370EF370EF370EF374EF374EF370EF370EF37
        0EF374EF370EF370EF370EF370EF370EF370EF370EF374EF374EF374EF374EF3
        74EF374EF374EF374EF374EF370EF370EF3747EB774EFB74EFB74EFB74EFB74E
        FB74EFB74EFB74F4B537B5C94F97041041041041041041041041041041041041
        0411CAB8924B892492E2492791E8FE8F297293F0D248DEAD0F911AC11A24410C
        B48208E2F47F479484C9E4A6353E0D8C5C2C8E4469041041041041040D09F07A
        3FA3CC5CA4FC32E06343E4492492CB8B8B892E2E2E1BE1F47F479B3CA4C6A79E
        DF32391041690416969690410411AFA3FA3CD4C5CA4FC2C09F0B43F0703D3D1F
        D1E727CB4CF3F091CF6CB892492492492492493D1FD1E6B5A2722E527E2DA1F1
        B45A5A8B516A2D45A8B4B4B4B4B4B4F49F4BC5A679F0B291F3A09E0688E4CF04
        924F07A4FA5CF6313917293E17E0609E0687C6C6CB8B8B8B8B8B8B8B8B8F49F4
        B5B0B074C7393E5267993C0BC03E28E2631A1723D1FD1E16A4AA98E5B114BE5A
        7C097876B8E0688E47A3FA3C75531E1208D234425E1589F29150D09F17A3FA3C
        6D49528E6A7C53A493A27E1DA275687C6D0D717A3FA3C974C731F4170CF05A5B
        C9F32D2D2DE6753A9D482D2082082D2D1523A0B0B0B074E9E8FE9725A92A51CB
        A8A593C324E924E93C74E905A884416905A411A41047022081F29A2AA4F47F47
        94D0E98E6262279108845C4AE34F49249249249278FF00F2F4688E438140E993
        D2FD2E5B454A398842E2B4B48208E37D05517171797179797979717171717990
        559717978EA2E2E2E2E2E2E2F1D4C92E83D27D2D6E2E2E2E2E2E2F2E2F436344
        2E627C525C49717170B932492C964F2635688E381A7A7A3FA3AC104104104105
        A432D2DE4C93A27C882D2D65A2E4C169616969696A2D2D2D2D20821102A48442
        2D2358208D2D47A5FA5CE6874F31313E3924927934D5CA927C07A5FA5AE43217
        9797B2F65ECBCBCBD8F705B837C73C5227C524925C88278FC855124925C5C892
        4924B8B8B8B8924B8B8B87521D45C5C5C5E5E7A5FA5AE33198CB0B0C6632C319
        8CC6633198C74C13CB4C5CB4C6A790CB89D649249249249249192344717A4FA5
        ADC5C4971717124925CB49D5A92A51CC9E627C95496961616169696969696969
        6969696969696169696969E97E96B0C820B59D7586433A9D74EA753AE902E9CB
        427CB4C6A78E927C135C1E97E96B0410410410411A4105A8820843A4AA9E5A27
        989F1B62A89E64924924E8F5F4BF4B5BCBCBCBCBCBCBCC86432190C85E643219
        0C83A87CC5CC4C7CA75171717171717171771C11A7A4FA5CC83AEB0493CF4C9E
        627CA82C2C2D2D2C2D2D2D2C2C2C2C2C2C2D63A0C6CF4BF4BF829297CC4CF3E3
        42F05E9BE9F1C104704104104104104104104104104104104104409F313E4489
        F80A8F4DF4F5B4B4B4B4B0C6633198CC6633198CC6633198CC6633198CC66331
        98CC6633198CC6622C2C2C4585A5A8B4B4B4B4B4820B4B482D2082C2C2C2C238
        A0820820820820820F4DF4F909F8A688E19E5492492492492492492492492492
        4924925C49E9BE9F253E19D649F02C8E74788F4BF4B9524924F0492492492492
        4924924924924924F0492492493C3249226410410410410410410410411A4104
        107A6FA7FCAA64924924924924924924924924924927A6FA7FD2BD2FD2FE82C5
        C8F4BF4B82D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2
        D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2
        DD2048B4B4B4B4B4B4B4F4DF4F5820820820820820820820820823973E3DEA90
        B91E9BE9EB0410410410410410410410410416905A5A5A5A5A5A5A5A27E39888
        122393E9BE9EB9D99D99D99D99D99D99D99D99D99D99D99D99D99D99D99D99D9
        9D99D99D99D99CCECCECCECCECCECCECCECCECCECCECCECCECCECCECCECCECCE
        CCECCECCECCECCECCECCECCECCECCECCECCECCECEE199D99D99D99D999999999
        99D99CCECCECCECCECCECCECCECCECCECF48E76B5C48C48C48C48C48C48C48C4
        8C48C48C48C48C48C48C48C48C48C48C48C48C48C48C46246246246231189189
        1891891891891891891891891891891891891891891891891891891891891891
        8918918918918918D18D188C4623123123123123123123123123123123D2AFFF
        002F12FC73D3C87D443E77A6FA7E25F8E63D3CB45CEF4DF4FF009791B244BC07
        A6FA7FCC40A9F03E9BE9FF0026864E902F05E9BE9FF27237AA5E0FD37D3FE45F
        0411E13D37D3FE458F48F0DE9BE9FF004AF4DF4FFA57A6FA7FD2BD37D3FE95E9
        BE9EB24924924924924E924924924924924924EB2492492492492492493A4924
        E92492493AC92492492492492492492492492493A7A6FA7ABE54F313F0689E19
        F0F27A6FA7AC1041041046B0410410410410410411A433AE9041041041041041
        0468C488208208D7A90F582082082082082082082082082047A6FA7C12492493
        AC6924924924924924924F0C924924924924924F0C9249249249249249249249
        2492492492492492493AFA6FA7FD2234F4DF4F592E2592C92492492592CB8925
        92C964B2592C964B2592C964B2592C964B2592C964B2592C924B8964B2E2E249
        2592C964B2592C964B2592C964B2592C964B2592C964B2592C964925C4B3D2FD
        3D6F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F
        2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F
        2F2F2F2F2F2F2F2F3D2FD2F0F041041041047147F0DE8FE978682592C964B259
        2C964BE38208FE0FD1FD2D6C2C4588B11622C4588B11622C43A4B4B4B4B4B482
        0A682C2C4588B11622C4588B51622A42A4820815258584104104104104103238
        238A492492395E93E973678994D3CAA993AAD6091F25BF00B95E93E9783484B9
        353D208D11248DEB04F137C73E13D27D2E5B7C53A534F25B2758D172A746FC67
        A4FA5E060A572AA7AA5A473193E33D27D2E4A637C6972AAAB58E4CE890F56F98
        84FC07A4FA5CF6CA57264AAAE17C084F856ADF8EF49F4B8EAE44099722E45C8B
        91722E44A2E43AB9AF482082A7E3FD27D2E37C8B4B4B4B4B4B4B4B0B4B74489E
        521BE16FC7FA4FA5C2941237C4D1493C725C3625C086B8A389BFE03D27D2E1AB
        C043D1B12D18B54C6B810DF0B7FC0FA4FA5AFF00E46F8D212E26488AB85F0CEB
        E5C2FF0082F47F475FFCF2131D42A8B8B99732E65C4924E887C88247C0C9FE0B
        D1FD1D50F8E9A47496969696969696168C4B8DF03E16C6FF0083F47F4756F917
        17979797979797978EA122796DF0D4FF0084F47F479291696161616161696160
        D11C688E07C2DFF0BE8FE8F25124924924A24B912362E05C723E06362FE13D1F
        D1E45A5A5A41041043208D121F22491F0C8FF86F47F478E95AB5AC7054C489E2
        6C7512C964B249249249FE1FD1FD1E24B9553E4B7C13CD823C7FA3FA5C499717
        1722F2E2F2E2E1D648B890DF8262F1FE8FE97804B8EA7C2F9D24F8FF0047F479
        E909F13637C0DFF1FE8FE8EBEDC7B71EDC7B71EDC7B71EDC7B71EDC7B71EDC7B
        71EDE7607607607607607603FF00E71ED87B61ED87B69ED87B61ED87B61ED87B
        61ED87B61ED87B61ED87B61ED87B61ED87B61ED87B61ED87B61ED87B61ED87B6
        1ED87B61ED87B61ED87B61ED87B61ED87B61ED87B61ED87B61ED87B61ED87B61
        ED87B61ED87B61ED67A7A6DDBFE95B7FE7FA56DFF9FE95B7FE7FA56DFF009FE9
        5B7FE75FFFDA0008010300010500FE8EFF00A5BFE96FFA5BFE96FF00A5BFE96F
        FA5BFE96FF00A5BFE96FFA5BFE96F8315262A4C5498A916D523DA4588B11622C
        4588B11622C4588B11622C4588B11622C4588B11622C4588B11622C4588B1162
        31D263A4C749622C463A4C7498E931D263A4C7498D18E931D263A4C7498E916D
        A1D1498E931D263A4B292CA4B2931A31A31231A15148B6A930D261A4C3498693
        0D261A4C3495A87C96B973E0249249249D249249279369690416969616160A81
        53C8DCFF005CAA972A3C4C6AB8E04F592492759249278B73FD7290D0F94DF865
        C33C8924B8B8B8B8B8B8B8B891313E066E7FAE527A55FC32E34882C2C2D2D2D2
        D2D2C2C2D12E1DCFF5CD6B97E5E03CF973C8B8B8B8B8B8B8B8B8B8B8B8B89D77
        3FD739AFE1972275964BD64920913169B9FEBC4B5E3279091696969696904169
        69691A6E7FAE7B43FE1971A65C5C5C5C5C5C5C5C5E5E5E5C57FEB9E864729A3C
        BC5CF26DE0B4B4B782BF3F014952FE1D71A122D20B4B4B4B4B4B4B4DCFF5ADEC
        BD94D53CD6B99E42F153C54E93C9DCFF005C2994D53CBA468A97F0EB8A44C5C8
        DCFF005C74D53CB9132A5CA9249F173C305452F91B9FEB8D329AA796969553C5
        02A48208F1AB87CC4CA5F1EE7FAE4D354F310D70C12497171772E49249249E39
        2513A49249717176B714D66445E5E2AB4DCFF5C94E0A6A9E5D23435A411A470C
        7259248DEB3A4F0C6BD783A9D4EA753A89E89EA994D46E7FAE5262AA44F98D11
        ABD6DD3A9D4EA75E36B49249249249278A5923D193CA4E0ABCF969C14B9E5F4D
        1A1F1CE92895C687496969696B2D2D20B4B4B4B482D2D2D2D2D2D2D2D2D2C2C2
        C2D2C152588B0AFCF5B596B2D65A5A5A5ACB596B1213E6B5C4F58208F113C0A0
        9249211D0915449B9FEB5B8B8B8B8B8B8B8B8B894362AB9703435C725C493CAB
        8B9925C5C5CCBCB8B8B8964925C5C5C3A8B8965C5C49248C551732AF3E726535
        7318D731AE3A972208249E4412470A1F9EB8CC66331988C6632C2C3198CB0547
        1413C2D1035C505A432394E923582D2D65A5A4696B2D65A5A5A5A5A5A582A0B0
        B19616161579EB7979797979797991990C86432B323320AA9E5BD2A5E1639D1C
        13A410415F9EB696B20B590410410411A41027052E79690D0D78382E2E2E2E2E
        24B8B8B8B8B8B8B8B8BCB892E2F2E2F2E2E2AF3D6F44A2E44A25128944A25128
        84743A1D0E84A131F2D8D783635E0A04F5ABCF952492492C924924B8A5F2DA1A
        1F836881E92493AC10411C51A410CABCF5C66231188C43DB3118CC4CC6633198
        CC658636631524732A435CCF2238E082082082082082393257E7CC83AE9E6412
        493CE68A973239324971717171717171717171717171717171795F9EB2492492
        493C33E16AA7C231AF04FCFC7C924924C9553C4D8B9B6F827E7ADC5C5C5C5ECC
        86466432190C86432190C86432190C86432190C86432190C86432190C8642F65
        E5C5E642F2F2F2F2F2F2F2F2F2492492E2E2E2E249E182082082082082347E7C
        86883A1D3450743A1D38D41D0E8743A1D0E8743A1D08279D041075D3A1041041
        0410410410410410411AC0FCF9304104104104169690410411A4104104104104
        11AC6B0410411AC1046AD13E096B579F2638A08FE0649F10FCFC027E15BFE15F
        9FF4AABCF56BC7C78F81AE455E7AB249249249249249249249249D27993A493C
        D9249279324899248DF21F9EB24924924924924924924924925CC86753A9D4EA
        753A9D4EA752D248F09027C7E62E0AB90FCF5B91722E45C8B91722E45C8B9172
        2E45C8B91722E45C8B912892492492492492746BC33427C2C5AC971E7C87E7AE
        0460460460460460460460460460460460460460460460460460460460460460
        3023023023023023018118118118118118118118118118118118118118118118
        1181181181181181181181181181180C08C08C28C28C28C28C28C28C08C08C08
        C08C08C08C08C08C08AD43D72332332332332332332332332332332332332332
        3323323323323323323323323323323323323329919919919919919919919919
        9199199199199199199199199199199199199199199199199199199199199199
        197B3233233233233233233233233233233233233232AF3D5786A49D18978AA7
        5F2F00FCF55E1A910DF8CA74F2D5F39F9EABC2B625AB7E2DA168DF807E7AAF08
        D8970C09F8A91B129D1A279AFCF55E0DB12E3689F09514E923E3F213E5BF3D57
        82912E4B44F826411A468DF1B427CA7E7AAF03225CCF213E7D3C1237CA813E4B
        F3D67C0A5CE689E75232757CB68F2E43F3E0F213E779780684F9AD888F01027C
        4FCF55A409F2FCFC1B47972DB12F06D09F0BF3D56B027E3E04F90D89785689E0
        7E7AAE068F2F1ED09F13625E2204F47E7C98208208E6F973BCF8978A6B47E7AB
        E4C13CD6BC0C0993C33E21F9F0C92493C324924924924924924E924E92492492
        49249249248B8249249D649D649249249249249249249249249D1F9EB05A5A5A
        5A5BAC105A5A5A5A5A5A5A5A5A5A5A5A4104105A5A5A5A5A5A5A5A5A5A5A3425
        ADA5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A35A3F3D
        6749249D2756C9249249249249249249249249249249249249246C4493A32492
        49249249249249249249249249249249249249247E7C10410410410410411A41
        0410410410410410410410410410411A41041041041041041041041041041041
        041041041041041041041579EB616161616161616161616161618CB0B0B0B0B0
        B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0C65858585858
        585858585858585858585858585858585858585855E7FD2ABFF5FD2ABFF5ADE5
        E5E5E5E5E5E5E5E5E2AC5512492497125558B70C8CC8CC8CC8CC8CC8CC82AD97
        17124923A8BCBC550AA249249249249E382082082D2D2D2D20B448B4B4B4B4B4
        B4B4AFFD7352E248A9F2A94411A3D234812E4A5E07CF93B9FEB98971B654C5C8
        A56924923AB8249244F824929249279B3CBDCFF5CB4B91555C13C2A92092746C
        AB544EAB59D12E14B96D91CBDCFF005E0AA7C49EA8A50DEAD97094F174121EAB
        892F0FB9FEB94971B63E4245348F491BE15AB625A31890970A5E2373FD7252E3
        63AB9105348F4918B817025A2D570A5CBE9CEDCFF5C84B90D161616161616169
        60A9D1BD27931A345A5A25E3F73FD71AE43A855171717171717A2E2E5A3245A5
        4F542D57125E3F73FD71A5C7510C86432190C86416B2D121B1F147040B852FE0
        373FD7125CDE9A4224824918C6F542D57125E1BCF97B9FEB852E36C91B2592C9
        64BD5A29431F1A42E425FC16E7FAE18E368820820820B448B74A9948C6F86390
        97F07B9FEB5812E375179797979797978AB2747AC8F5485AB42235484BF83DCF
        F5AA5C8748A82C4588B11622C4582A11031BD678172578E9E2DCFF005C3235AB
        65C5E8BD17A2F45E8B8B8B89E4342E4AF1F04F0EE7FAE4B20820820B4B482048
        9E0A9EB491ACF0A5A4F8F8D275DCFF005C87512492492497124EAF47ACF0B447
        02FE1674DCFF005C753244C65CCB9923649225A4EAC82048820820B48208208F
        E1609373FD71363D5245A5BC14D3C8812E05FC6366E7FAE268C6633196161698
        CC625C8425FC8A2BFF005CA9E6A5C297F1DB9FEB9EC4F8D702FE3634DCFF005A
        E432190C86532190C86432190CA2DC32190C864321905B86532994CA673399CC
        E673399CCE673399CCE673399CCE673399CCE673399CCE673399CCE673399CCE
        673399CCE673399CCE673399CCE67339DC15397FD29FF4B7FD2DFF004B7FD2DF
        07FFDA0008010100010500FE8FF7BFFD9FF4AFBDFF00ECFF00A57DEFFF0067FD
        2BEF7FFB3FE95F7BFF00D9FF004AFBDFFECFFA57DEFF00F67FD2BEF7FF00B3FE
        95F7BFFD9FF4AFBDFF00ECFF00A57DEFFF0067FD2BEF7FFB3FE95F7BFF00D9EB
        F1B7D947C6DF651F1B7D947C6DF651F1B7D9457F8DFECDA4F8E7ECD3E39FB34F
        8E7ECD3E39FB34F8E7ECD3E39FB347F8E7ECD3E39FB34F8E7ECD3E39FB34F8E7
        ECD3E39FB34F8E7ECD3E39FB34F8E7ECD3E39FB34F8E7ECD3E39FB34F8E7ECD3
        E39FB34F8E7ECD3E39FB34F8E7ECD3E39FB34F8E7ECD3E39FB34F8E7ECD3E38F
        B30F8E3ECC3E38FB30F8E7ECD3E39FB30F8E7ECC3E39FB30F8E3ECC3E38FB30F
        8E3ECC3E39FB305F8E7ECD3E38FB30F8E3ECC3E38FB30F8E3ECC3E38FB30F8E3
        ECC3E39FB30F8E7ECC3E39FB30F8E7ECC3E39FB30F8E7ECC3E39FB30F8E7ECC3
        E39FB30F8E3ECC3E38FB305F8E7ECB95F8DBEC96BE35FB28F8D7ECA3E35FB28F
        8D7ECA3E35FB28F8D7ECA3E35FB28FCA9E9B63D17E50E4D745BC2E785CC5ECBD
        97B2F65ECBD97B2F65ECBD97B2F65ECBD97B2F66466466466465ECC8CBD99199
        199197B1549AE3892CA8B2A2CA8C7598EA31D463A8C5518EA31D4534D74BE3FC
        BDFB6793D0AA8B5EBE5C55533E2D369D2D35C4BA14D772D3A1D0E87425128BA9
        2EA4BA93A3E2FCBDFB6795575556DDA53C9AA991F865E5AA6D35526B8E512892
        4924924924928A9D2D435AB3F2F7ED9E53523529D163E4D54CF83F3E426D14B4
        F8D229A2E31331331331188C46231188C4534BA787F2F7ED9E6352AAA5D2F935
        533E07CF949B42A935C49B4D6E52D64A4BE92FA4BE82FA0BE92FA0BE92FA4BE9
        2FA44D3D7F2F7ED9E6D54AA934E97C9AA99E7F9F31368A5A7C89D7A9D759248D
        28A9D2D35523F2F7ED9E7554AA93A5D2F935533E1609E14DA1549F229A29A963
        A4C7498E931D263A4C7498E91EDD22DBA116522A552CFCBDFB679F552AA5552E
        97C9AA99E54C733CB85369D2D3E3A6A74BCA6532994CA653375CA6532994CA7E
        5E73F9639E8AE955269A27935533E2D369AA935C88E08208E0FCBBFB5F54D3E6
        A2BA5549A3CB935533C294B87E15382969AE2A5C34A86ADA4B692DA48A48A48A
        4B692DA4B693F2F7ED9D7B9DD4775BC6CEF2DD5CCAE8B8F2E5554C9E47412509
        52CA5B9F03E5C09B4D549AE14515DAD43E4FE5EFDB3C34D4E97B3BCB757290D1
        5D12B955D32269A50D28A7C2791E7AA6D09A6B8A8AEDE4FE5EFDB3C54D4E97B3
        BD4EEAE5A65744E913C0DC2BD17A2F45D4A2B74B1BA5F868E04DA69A6B5F3D19
        4576F23F2F7ED9E3A6A74BD9DEA77572A34AE89E17D56363DB6DE392C70E9716
        D5E2D382969A3CF5F324A2B8E3FCBDFB67914D4E97B3BB4EED3CCAE89E26DD25
        553464AA2FA8C8C6E7C4CA2EA455A4D6E50D64A0C941976CCBB665DB33ED147A
        ADB4773B2773B0773B06DEF6DEE33F2F7ED9E4D353A1ECEF53BB4F29695D1AB5
        047489150A2DA0B682DA0B291D1C8AEF325664ACBEB664ACC9597D65F517545C
        C9649249D04A5B490E981C09C34E4EA753A9D49E14DA7B1BEB757E5EFDB3CAA6
        A7455B3BCB769E66E510252293AD23F31F9DBA753A92C97C7B9B7710D3B4B482
        0B4B4B4B78544B83A5AA20A5C133CA4DD2FF002DB757E56E5D353A2AD9DEA776
        9E574D2BA14B7C2DC2BCC85E64A46D37C75EDDC60ACC15982A305460A8C0CC0C
        EDD981980EDD1811811811DBA305260A4C140B66942D8DB676D41DBD076F41DB
        D076FB676FB66DECECB3B6D93B7D83F2F24BF2C6B8774C3BA60DE306E98374C1
        BA60DE306F18378A76B7E8AA875554F32AA1D3AF968D4AB19632C658CB18E869
        781F3E4D2ED134F83A1D094515DC433F2FFED9D726D9936CC9B665DB32ED9976
        CCBB665DB32ED99768CBB6535D15723C89D2082BA2DD7AEB5B69CB2E65D5173E
        4B98CB5A79EA33B33D667A8CD599B70CBB8CCBB866DC32D665ACCB5197707B95
        9937117EE32FDC16EEE216E56CBF70C95992B2FAC75564D5392B3F2D75FCABCE
        A2BAA8AB6B769DDA787A42FF00DB85A2BA6D7AC8D265B49FFE67FF0099141141
        5243E3AF6D569A74BE2964B2110B909B5A470F43F2CFED4D7B4DB3B4DB3B5DB3
        B5DB3B6DA3B5DA3B5DA3B4DB3B4DB3B5DB3B5DA6769B653B14D1579F07467FEB
        1FF9E0686A4AA974BD7CB4B6A2D65B511516B21F22BDB55AB2B459598EB31D66
        2ACC7598EB315662ACC3598AB315661DC316E18B70C3B862ACC358B6AB42D8AD
        98370EDEB3B7ACEDEB3B7ACFCB4ADFCABAAF5559DDD6777B877551DD5477759D
        DD677551DDD4776CEED9DDB3BB6776D1B5BB4EED3CB84D554BA5F2AAA793D3C0
        79694D4E9134F482083F2EFED7D716E18F711656595965659596565B516D45AC
        B6A21EB45555156D6F53BAB9486935552E97CAAA9E479956EDA6746746747708
        CE8EE11DC23B847708EE11DC23B846793399D99DA33B29F51552D7A9677151DC
        5477159F969CFE55D6EA055D25D4A1574B528913489E0EBAF98940B99524D34E
        97CAAA9E198D6BA154AAA5D0FC07989C3D7F2CFED4E28E44B45CC9A855548BEB
        29DDDCA6ADADDA7769E5D54AA934D3E5554EB3025C1550AA5552E96886C86432
        190C86432190C86432190C86410C52886D4547E59FDA9AF6DB676DB676D41DB6
        D8FD2D076B4A7DAD27688ED51DA1DA33B36768D9DA5476959DA567695947A7DD
        A2A4E572EAA5549A69F2AAA639BD0E8743A72BC8A6AB44E4FCB9FB5F93D69254
        1723FF0053CC9549722D65AC8E7D74A6351CBAA88E4BAE9A4CB4196832ED9976
        CCBB666DB336D99B6CCDB665DB32ED9976CCBB665DB32ED99B6CCB414FA8A293
        F2DB557E56D6110884422110884744743A32085E16BA1549A8E2F2E1AA9E4554
        AA9574BA1A71E07F2C7ED3E57FE7C4D7426B869498FA70D54C721D29AAE87435
        D79F41F963F69EBDC6E9DC6E9DC6E9DC6E956FFA84775BE775BE777BE777BE77
        7BE775BE777BE777BE777BE777BE777BE777BE775BE775BE775BE775BE775BE7
        75BE775BE775EA0EEB7CEEB7CEEB7CEEB7CEEB7C5EAF7D35EA775AEE374EE378
        AB7B76A32EE19770CBB885BDB864ACCBB865DC9CDB866DC335666AC75D664DC3
        25664DC325664ACC95992B1D75B44924B2597171717125CCB99732491368FCB1
        FB4F915D30743A1D0E8283A1D0E9C6A0E8743A1D0E8743A1D0E840AA869CAD60
        853C8843A4B510422D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D1D2A6C45A7E59F
        DA9C9AA9D20823482082086432190C8E626D09CAD6190C864321EB0C8643D234
        EBE05B128D7F2CFED4D6592C965CD92D12CB99D4EA753A92C96896CEA753A9D4
        EA753A9D4EA753A9D4EA753A9D4EA753A89B2E67526A26A26A26A26A26A258DB
        2EA91351351351D4BAA2592C964B2592C964B2592C964B2592C964B2592C964B
        259F957F68F0CCF2DAF09E425CBF2F15F957F687F07E5CFF003F11F957F686AE
        9AA9F01E5CF6E08E7F992B9D452AD69AE47E55FDA1AD54D2A8C68C68C68C68C6
        8C68C68C68C68C68C68C68C68C68C68C68C68B2931A31A31A31A31A31A31A31A
        31A31A31A2C42DB48B116231A31A31A31A31A31A31A31A31A31A31A31A2C4588
        C68C6918D18D18D18D18D18D18D18D18D18D32C462DBA13A12A6AA29B31A31A3
        1A31A31A31A31A3F2B74FCA3AE6DC336E19B70CDB866DC336E19B70CDB866DC3
        36E19B70CDB866DC336E19B70CDB866DC1EF6E33A9D4EA753A9D4EA753A9D48F
        0E9F1F994BB6ADC54C34B70AADA697C8FCAFFB4B5CBB665DB32ED9976CCBB665
        DB32ED9976CCBB665DB32ED9976CCBB665DB32ED9976CCBB665DB32D065A0CBB
        68CB4196832D065A0CB4196832D0575D152F0F3C54ABAA75529B6A8753A19279
        F23F2BFED2D7DB364F6CD93DB364F6CD93DB364F6CD93DB364F6CD93DB364F6C
        D93DB364F6CD93DB364F6CD93DB364F6CD93DB364F6CD93DB364F6CD93DB364F
        6CDA17FF0037659ED9B27B66C9ED9B27B66C9EDBB33ED9B27B66C9ED9B27B66C
        9ED9B27B66C9ED9B27B66C9ED9B27B66C9ED9B27B66C9ED9B27B66C9ED9B27B6
        6C9ED9B27B66C9ED9B27B66C9ED9B27B66C9ED9B27B66C9ED9B27B6ECA3DB364
        F6CD917FF3B651EDBB285FFCEDA4DFFF003B62A6FF00F9FB551ED9B27B66C9ED
        9B27B66C9ED9B27B66C9ED9B27B66C9ED9B27B66C9F96E9547E56D7DC3D49EE1
        EA0F70F507B87A83DC3D41EE1EA0F70F507B87A83DC3D41EE1EA0F70F507B87A
        83DC3D41EE1EA0F70F507B87A83DC3D41EE1EA0F70F507B87A83DC3D41EE1EA0
        F70F507B87A93DC3D41EE1EA0F70F527B87A83DC3D41EE1EA0F70F507B87A83D
        C3D41EE1EA0F70F507B87A83DC3D41EE1EA0F70F507B87A83DC3D41EE1EA0F70
        F507B87A83DC3D41EE1EA0F70F507B87A83DC3D41EE1EA0F70F507B87A83DC3D
        41EE1EA0F70F507B87A93BCDF477BBF0FD7FA94DFF00F47D437EE1EA4F70F507
        B87A83DC3D41EE1EA0F70F507B87A83DC3D41EE1EA0F70F507B87A83F2CD4EBF
        CA9AAF2F0A84BA7418BC52126CA69BC854555D355D57FEB45553A9F33F2BFED2
        D57978544A85E6FC5A29BA6D8A632AA5BA4AA53E6FE57FDA5AAF2F0A96ADF8B5
        4BA8A3FF0054BFF52B74AAB9FF0095FF00696ABCBC225E3EB6E9537EDBAFFF00
        5F3D1AE77E57FDA5AAF2F05225E3188DBA555565735D54A75572B87CB99F95FF
        00696ABCBC5B5E0D8E84E9A55293A9535BA36E92AA9D4DBF05F95FF697855CCF
        2F0085D44E9DA6D50E86E855535BA572A793F95FF697F228A5C3AB6EAA9D714D
        1CDF2E47E57FDA5C1E5CEF33CBF804DAF029F17E57FDA5E07CFC27972DBF091C
        5F95FF00696ABCB99E7E1D3E437E2FF2BFED2D579707971F9F888FE03CB5FCAF
        FB4B586432190C86432189496B2D6410D90C86432190C86432190C86433C910C
        86432190C86432190C86432190432190C86410C86432190F586432190C864321
        90C86432190C86432190C86432196BD3F2BFED2D52850C86432190C87A742191
        D6190C86432190C86432190C8634E1AD2190C86432190C86432190C86432190C
        54B218D74B486432190C869690C86432190C86432190C86432190C86432190C8
        64321907E57FDA5C524EB56889249249249249249D6116AD6492492492492757
        E4C5AC93C16A21704924924924924924924924EB5797E58FDA7AC10410411A42
        3A1088208208208208208208442211088208208208208208204B582082082082
        082082082082082082082082082082083A1F963F69F0F53A9D74E9AB6893A9D4
        EA753A9D4EA753A9D4EA753A9D4EA753A9D4EA753A9D4EA753A9223A9D7593A9
        D4EA753A9D4EA753A9D4EA753A9D4EA753A9D4EA753A9D4EA753AEBD4FCB1FB4
        F5B692CA4B692DA4B292CA4B292CA4B292CA4B692CA4B692DA4B692DA4B692DA
        4B692DA4B692DA4B692DA4B692DA4B692DA4B692DA4B692DA4B692DA4B692DA4
        B292CA4B692DA4B292CA4B292DA4B692DA4B692DA4B692DA4B692DA4B692DA4B
        692DA4B692DA4B692DA4B692DA4B692DA4B692DA4B692CA4B292CA4B693F2CFE
        D4D7B4DD3B4DD3B4DD3B5DD6FB4DD3B4DD3B4DD3B4DD3B4DD3B4DD3B4DD3B4DD
        3B5DD3B5DD3B4DD3B4DD3B4DD3B4DD3B4DD3B4DD3B4DD3B4DD3B4DD3B4DD3B4D
        D3B4DD3B4DD3B4DD3B4DD3B4DD3B4DD3B4DD3B4DD3B4DD1FA5DD42F49BA769BA
        769BA769BA769BA769BA769BA769BA769BA3F4BBC8ED774ED374ED374ED374ED
        374ED374ED374ED374ED374ED374ED374ED374ED374ED374ED374ED374ED374E
        D374ED374ED374ED374ED775BED374ED374ED374ED374FCB69D3F95B87CF993E
        0DB12E6273E0FCF8BF2F7ED9E0F3E77978094F44B9D3E07CF8FF002F7ED9D73D
        4CCF519EA33D467A8CF519EA33D467A8CF519EA16E56D64ACC95992B32565D5A
        3256CDEF515D2FB9DF3B9DF3B9DF3B9DF3B9DF3B9DF3B9DF3B9DF3B9DF28AF76
        D75D62AEA9756E4D5BB5A59B74CDBA66DD16EEEB6AADC8BEB2FACBEB2FACBEB2
        FACBEB1555CA4D2E182190C8643208208219044904104104107E5EFDB3CDA299
        E3DDAD514A7C9D9DB244FA4B6E5524BA9C6B4531C9DBA5AF03E7C9FCBFFB6799
        4D373885C3554A8A6AA9D4DA4CEAB8F6B6EFA9B4855175A5D45255537A492505
        E8B8BA04E74944A2514529B9F01E7CAFCBFF00B6796BABA55AB86616EEE64AB5
        8684E7828A1D55529509B85FE92A995391EB4A92235EAC4A07D4B58E0A55CD28
        F01E7CBFCBFF00B67974530B8B7F72789A139D14B746DA49BA5910A545754127
        9E8BA94A54AD3FF610DCEAA9753A6954AE04A1786FCBFF00B6795453C4D49BBB
        962E4ECED5ABA1524C86371C34D31AA50529A553829F243706DD16AE05C89F01
        F97FF6CF268A65F16E56A8A5B753E263A5D251B499E74FF9122552A67829479E
        ABA8DC27D47D046DD13C2972FA73BF2FFED9E4252D285C5B946ED6F06E98374C
        1BA60DD306E98374C3B861DD28F4ED35FF00E638436989153B9EB4AB9FFE745D
        5F449B6DDC5C50AE7D2383CBC4FE5FFDB3C8A69B57167A13EE283B8A0EE283B8
        A0EE283B8A0EE2817A8A1B55A9FF00D1BA9968FCABAA47AA4D9D16886E44A16A
        94B4952BC77E5FFDB3C7453C7BFB9690753A9D4EA75204AA652AA54EC6DD83AA
        1A527FE6A7034E539D6951ADC52B868A6D5E0BCB9BF97FF6CF1514CF1CA4743A
        1D0E8742693A17286E1A6EDAAA70948941368DB91A913295AD4534CF0EDD3E1B
        CF97F97FF6CF0D2AE710B86AA9534D753AEAE1A1D25915BAA69DAA3236C5FF00
        B1E6FAC373C14D2AA7D56A93AB868A6E7FC0FE5EFDB3C094BA69B571574535AC
        1B660DB30ED9876CC3B661DB16CED42DBA1BC7B4C487353A85E75552F54A5AE8
        79BEA85D44A16B4AB9A50BF81FCBDFB6759828A61716EEF34F2EE19B70CDB866
        DC336E19B70CDB82DDA9A5BB5D250AA54D5569E656E13D521285A2702A44F5F3
        74D36AF15E5C8FCBDFB675A29970D09A7C355D6F6F59DBD676F59DBD676F59DB
        D676F58BD3D6CEDAB36B66C6DC24A74A9C2E0A547052B469325AD36E8B7F84FC
        BDFB6785A13D6BA96DD3DC1DC9DC9DC9DC9DC9DC23B893B946DEE641B84DF525
        24DCBD194A2754A5F06DD1E3E09E1FCBDFB6789A4C96B4DCBF72AC7598EB31EE
        18F70C7B8595A31D6CB2B29DAAAA74D34D29BBB4892A72DEB4A9138D111D5285
        AD14BA9F911CA8F0DE5C1F97BF6CF21EE514BCDB666DB336D99B6CCDB666DB32
        EDB79B6C5B9B6D95329F22A7C090946AAA84970436E9A552B553FC04CE9F97BF
        6CF1EF6E5886BAA724104C289724B3676ED553856A3C90A9A5914914908A36A9
        4ACA0B281D14229A292DA4B282DA4B691534AE2EABF81FCBDFB678B73716DD2D
        B6F5871E4253AECEDDC3690BABE1B8DBA38129E6DC8552D174F1BF97BF6CF157
        46ED7560DC305660DC16C6E2787725EC6E3305660ACA7D3D6EA4924DDCF86A36
        E9B9EBE6251CDA20ABC723F2F7ED9E4CB9820885AD5571212BDA492D2509473A
        110BC7FE5EFDB3C899128D5A925AD2A709A8E248A29B56B4AE637FC079EBF97B
        F6CEBF319F319F319F318FF3149F319F319F319F319F319F319F31437F9824F9
        80F980F980F980F980F980A7F312A5FCCC7CCC7CCC2FCCB07CCE7CCE7CCE7CCE
        7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE
        7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE
        7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CCE7CD07CCE7CD07E4AF5BEE5F91BFA57DE
        FF00F67FD2BEF7FF00B3FE95F7BFFD9FF4AFBDFF00ECFF00A57DEFFF0067AFFF
        DA0008010202063F0043B22D916C8B645B22D916C8B645B22D916C8B645B7C27
        84F09E13C2784924924924924924924924924924924924924924924924924924
        92492492492492492492493C2784F09E12492493C2784F09E13C278493C27855
        DFF8C8BAE1B88BAE1B88BAE1B88BAE1B88BAE1B88BAE1B88BAE1B88BAE1B88BA
        E1B88BAE1B88BAE1B88BAE1B88BAE1B88BAE1B88BAE1B88BAE1B88BAE1B88BAE
        1B88BAE1B88BAE19175C322EB8645D70DC45D70C8BAE19175C322EB86E22EB86
        45D70C8BAE19175C322EB8645D70C8BAE19175C322EB8645D70C8BAE19175C32
        2EB8645D70DC45D70C8BAE19175C322EB8645D70C8BAE19175C322EB8645D70C
        8BAE19175C322EB8645D70C8BAE19175C322EB8645D70C8BAE19175C322EB864
        5D70DC45D70DC45D70DC45D70DC45D70DC45D70DC45D70DC45D70DC45D70DC45
        D70DC45D70DC45D70DC45D70DC45D70DC45D70DC45D70DC45D70DC45D70DC45D
        70DC45D70DC45D70DC45D70DC45D70DC45D70DC45D70DCF84924924924924924
        9249249249249EB47AD1EB47AD1EB47AD1EB47AD1EB47AD1EB47AD1EB47AD1EB
        47AD1EB47AD1EB47AD1EB47AD1EB47AD1EB47AD1EB47AD1EB47AD1EB47AD1EB4
        7AD1EB47AD1EB47AD1EB47AD1EB47AD1EB47AD1EB47AD1EB47AD1EB47AD1EB47
        AD156FE3322D916C8B645B22DBE1FFDA0008010302063F00FD03A08208208208
        1D16E8B745BA2DD16E8B745BA2DD16E8B745BA2DD16E8B745BA2DD16E8B745BF
        D2C7FA58E8B7FF0073DFF627745BA2DD16E8B745BA2DD16E8B745BA2DD16E8B7
        45BA2DD16E8B745BA2DD16E8B745BA2DD16E8B7FCC8208208208208208208208
        208208208208208208208208208208208208208208208208FAF9FFDA00080101
        01063F00FC0FFCBBEA9DBFF77CE7E0BFE5DF54EDFF00BBE73F05FF002EFAA76F
        FDDF39F82FF977D53B7FEEF9CFC17FCBBEA9DBFF0077CE7E0BFE5DF54EDFFBBE
        73F05FF2EFAA76FF00DDF39F82FF00977D53B7FEEF9CFC17FCBBEA9DBFF77CE7
        E0BFE5DF54EDFF00BBE73F05FF002EFAA76FFDDF39F82FF977D53B7FEEF9CFC1
        7FCBBEA9DBFF0077CE607C9769ED7D2AF92ED3DAFA55F25DA7B5F4ABE4BB4F6B
        E957C9769ED7D2A8FF00F0D27FD476AE957C9B68ED5D2AF936D1DABA55F26DA3
        B574ABE4DB476AE957C9B68ED5D2AF936D1DABA5501DCDB476AE957C9B68ED5D
        2AF936D1DABA55F26DA3B574ABE4DB476AE957C9B68ED5D2AF936D1DABA55F26
        DA3B574ABE4DB476AE957C9B68ED5D2AF936D1DABA55F26DA3B574ABE4DB476A
        E957C9B68ED5D2AF936D1DABA55F26DA3B574ABE4DB476AE957C9B68ED5D2AF9
        36D1DABA55F26DA3B574ABE4DB476AE957C9B68ED7D2AF936D1DAFA55F26DA3B
        5F4ABE4DB476BE957C9B68ED7D2AF93ED1DABA55F27DA3B574ABE4DB476BE957
        C9B68ED7D2AF936D1DAFA55F26DA3B5F4ABE4CF37FB8ED5D2AF936D1DAFA55F2
        6DA3B5F4ABE4DB476BE957C9B68ED7D2AF936D1DAFA55F26DA3B574ABE4DB476
        BE957C9B68ED7D2AF936D1DAFA55F27DA3B574ABE4DB476AE957C9B68ED5D2AF
        936D1DABA55F26DA7B574ABE4DB4F6AE957C9F68ED5D2AF936D1DABA552F7347
        37FB8ED7D2A88EE593FEA7B5F4ABE4BB4F6BE957C9769ED7D2AF92ED3DAFA55F
        25DA7B5F4ABE4BB4F6BE957C9769ED7D2AF92ED3DAFA55EA4763ECD63FB7D9BB
        277F77C766ECFCDC49E2D8E6FBC39EB36446D124C009F13C2A22E9AB064A7064
        7DC64C993264C993264C993264C993264C9934A993264C99328D231122BA6857
        4A65755DE04DC09AB09AB09AB4CA462F2E23D50FB8BBEFC4B9EC57B6651174F0
        EEF09C3887DF31DC88511EF18881BC2BDD74E9D3A714A70AF0A55E14ABC29510
        6385EA87DC5DF7E25CF62E0E0B8460C5BFC654464C4C43EFB8851A779E69C288
        310707D50FB8BBEFC4B9EC57E5B902C8CB1067C5443EF3E0C444288F78C44844
        9314E1384E2B4E9D3A74E9EA57AA57A42E307D50FB8BBEFC4B9EC5709DD8382A
        07DD8A887DE3F962A2149EF18608994A6072417F9A74F527A93D49D39A13A74E
        9D444BBBEA87DC5DF7E25CF63A07DC542D7B88C5443E3F34C30A4A30A214463D
        9327DC88972833A88DCF543EE2EFBF12E7B11C3864169910E3F2CD8A8879F1B1
        3EE189817C19144622209CE1394E5394E53953A9D4E9A59C9299446E7AA1F717
        7DF8973DBC20694431134D8A887C5C4FB862FF003C188F785118711EF0AED6AE
        D6AED6AED6AED6AED6A4B3416577DF14D5A6AD3569AB5EA81CBFC8BBECFF00E4
        B9EDE390CC510642A071310F9313C031B2518311EF5263201E73930FD4FF00B8
        7BEBC4B9EC0931D9E6502B362621E7C18292CC00DEB11EF0A230E51113C5022C
        829930F6ABA15D0AE8574264C997AA1F7177DF8973D812103DCAF0A028192D87
        18DCE18A815251898879C6E694496120032A801C522E90A36ADC26E2AC91961B
        C65A70223DE14461E5138524A32E27D50FB8BBEFC4B9EC216818112C540C96C5
        E18D887DCCF9567C4443CE14C6D8108146C992704E5512624301BD3F2C08D214
        66C2CCA1C99C28C6319F11EA87DC5DF7E25CF618B564C0862B25A0E31B117B87
        765A7762A753EE09224CBEE46D59FD3684A649913C5FD464CDBDA33E07085113
        E0C9B9032D9C47AA1F7177DF8973D8816AC9811282B25B17ACE3621F26090866
        960A366102EBF49973A02D484480E5500231739936F8969DDFC9472EE66DDC9B
        902DC187EA87DC5DF7E25CF6245AB260431592D8BD671A4D912CE32E0C6640D9
        311389D3FE92C5432E697718289C53A7C738578529C6795478C21ED0AF0A42BE
        290AF8A55F14ABE15F15A85AB724C6557EA3A15EA8ABC682B8B62D7EA78110DC
        F543EE2EFBF12E7B142D5930227592D0BD671BC61EF1F9EE4B27B5466C884265
        122400840549EB57AB57AB4F5A925CC7111B260722BD50578ABC55E2AF157AB0
        AF1A55F34957CD253D69CD29CD2A7A7720A597D8A2E3D9B92290EEBA7C204181
        1282140C9CE07197D8BD50FB8BBEFC4B9EC58B564C08C8B25B17ACE3499A70A5
        888B45716D52A318E50818C416CDB8705B111B3219F3AC89D3A74E9D3A74F820
        CCB4414232AD3BB2628106044A17A9B68BDAFE43DF44FBFBCB9EC60B564C0851
        6B42F59C6F185AF6013220DE124306299326DC88F7E2222F6E384E138AD5EE15
        7856AF0AD5E57EA57AA0AF2BCAF2BCAF2BC6A4E6A4E6A4E5441268D09CD2A7A5
        4F4A634A63494C692A16ACCB34A55CACAD5D76B4AF53C0900FE45DF600FF00EC
        B9EC0D595AB2AE1A95CE0573815CE05AB2AE15AB35216ACD92086281B567896A
        718A2770C99A289174BFB7773706E413EE3A994CB2E61BCB36273288C3817E14
        CBD50FB8BBEFC4B9EC0BD6691A15EB348D0AF59A46857ECD2342BF6691A15FB3
        48D0AF8A46857C5216B05216B054AF887B57E9B42D7B311C2570A9043732E651
        0DBBF96E8814E53A74F89307CEA0408870629856AE84C1327142F82CDEC4F527
        15274FC09EA57B814B6B815EF7ABC55E2AF957CD2AF9A55F349578D255E34957
        8D255E34952DB3495EA61CBFC83BE7C4B9EC78B564C0851125A17ACE070284E8
        C0640B3B152339F6E040CEEB28DDFCD4AA50997F9AFF0035352A6A5441F76232
        10C542D4D361BA74E9F787A99F7077CF88F3D80F6A9F827B54FC139A7E09CD3F
        04E691A15E348D0AF1A4684E691A139A468578FF008F7292D1AB427348D085AB
        36AD023D943604B2059D3BCAA4F60C294485669B099315F04C684C98E233862A
        E9F72BA55D2AEABAAE702B9C0AEF026E04C9B81370261526AD3569AB4C01F6A6
        14A614A04112E7F827149D09C57A138AF42BC2B57856BD4D05C7F21EFA1FF92E
        7B02E598E68ABA15C14957056AE057456AE8A4AB82B5705255CACAB9595AB14A
        D58A55CAD444845EB266DCCE26513898162B80E049461C47BC62BF2C7CBB99A7
        0A49F07D4FFB87BEBC4B9EC0D59A0AB87DB0570D0AE1A15C341570D055D34157
        4D0AE9A131A15D3426DD16ACC84288908BD64CD8C81503EEC5923DF888D08836
        7815D2AE9A95D5755D5755D5755D5755D5755D576B576B5764C9157692AE884F
        2ABA295745255D0AE8A4AF534973FC87BE89FF00B973D81785215E1EF2149681
        192215E1484F595785255E09EB4C9D356A6DC65003DA5087BF1B03EE2A069C5C
        47BC6144FB86E40D2A07FCF78E7C8B3607A99F7077CF88F3D8F73494E69578D2
        A4B4692AF9A4A1685A324C4A8871786320540B8C5C47BC6044FB86040FB8A81F
        7109AADC64C993549AA4D526A93549AA4C993264C684D5263051164D098D057A
        99F7077CF88F3D80E69F82E552342BC6AD0AF1A94968D4A5B66196015F3405AC
        3405ACABE2AFFF00C3F157E3EC1F157EA5273926581525B10F6157856AF057C2
        16ACDBB31F7CAA579E18C95D40BE2E23DE3733E29B1F9A70A2258AF53BEE1EFA
        F12E7B159464C8A224381FE9E150C0931F90CCA070A5A7078C3DE3132986457B
        855EE157AA2AF5455EA8ABD5157AA2AF5455EA8ABD5157AA2AF5455EA8ABD515
        7AA2AF54548639A055E927102BD4E218FF0021EFA23FEE5CF603264C993264CB
        228C37088489B7AE433152E2E21A718881956505AD268EF1F52FEE0EF9F11E7B
        FA2C43E14AA419B0623DE311033ACA32EF02BD4BFB83BE7C479EC0BE6A57CD4A
        F9A95F35288E70C3248B58681A16B4D4B5A680B59C0B5A680B5A680B58680B58
        680B58680B5A680B5A680B58680B5A681A16B4D0342D69A0685AD340D0B5A681
        A16B8D0342D71A0685AE340D0B5A681A16B4D0342D69A0685AD340D0B5A681A1
        4BCE139A4D0A22D9A95F352BE6A51E3CAAF9A16B0D014B6CD4AF1A95F352BE6A
        D0AF157D5F578ABC5445AA60AF702BD5057B815FE057B815EE057F8140DA8839
        60BE014D40535015D142BB52715A715A715A715A6180C134BB9EA5FDC1DF3E23
        CF626207B77D669C288C18D18B65F14E5394E5394E5394E9D394E5394E5394E5
        394E5394E5403EE395EA5FDC1DF3E23CF62A207BB072E29B17C2A2378326DE30
        0FC181EA67DC1DF3E23CF60394E5395089AD39A4A729CD69CD2539A4A73494E6
        929CD25484FB22539A4A73494E6929CD2539A4A73494E6929CD2539A4A73494E
        6929CD2539A4A73494E6929CD2539A4A73494E6929CD2539A4A735A73494E692
        9CD2539A4A73494E6929CD2539A4A73494E7DB129CD2539A4A73494E6929CD29
        CA729CA729CA729CA729CA729CA729CA729CA729CA729CA729CAF523EBFDF1E2
        3CF61494E2E21D427DE912F8BCDBEBD48FAFF7C788F3DBCE5A77944BE373EF29
        29C3F523EBFDF1E23CF604A200FB28DE19B7844BEF08638DB364DA31E28B2265
        2D9364168E23D48FAFF7C788F3D806CF1CDB2658E44E5394E5394E5394E5394E
        5394E5394E5394E5394E5394E5394E5394E5394E5394E5394E5394E5394E5394
        E5394E5394E5394E5394E5394E5394E5394E5394E5394E5394E5394E5394E7DC
        9D016BF5DA7CC171F9B240325AB2608D936F8E498C42729CA729CA729CA72BD4
        9193BFFBE3C479EC0BD57C15EABE0AF55F057AAF82BD57C15EABE0AF55F057AA
        F82BD57C15EABE0AF55F057AAF82BD57C15EABE0AF55F057AAF82BD57C140DA7
        9186320B3EF4FCB120E440D91FA4F2865408B50B4C415C4B262498DA2313EA57
        D7FBE7C479EC0D48A56A452B52295A914AD48A56A452B52295A914AD48A56A45
        2B52295A914AD48A56A452B52295A914AD48A56A452B53656A42D48A56A6CAD4
        D95A9B2B53656A6CAD4D95A9B2A1679B160BC41DEF9F0C5968BA80B008139518
        46C5B11E2A02C8694938AF52BEBFDF3E23CF606B2D55A16B2D55A16B2D55A16B
        2D55A16B2D55A16B2D55A16B2D55A16B2D55A16B2D55A16B2D55A16B2D55A16B
        2D55A16B2D55A16B2D55A16B2D55A16B2D55A16B2D55A16B2D55A16B2D55A16B
        2D55A16B2D55A15FB5568527396AAD0B596AAD0B596AAD0B596AAD0B596AAD0A
        1C7B55685ACB55685ACB55685ACB55685ACB55685ACB55685ACB55685ACB5568
        5ACB55685ACB55685ACB55685ACB55685ACB55685ACB55685ACB55685ACB5568
        5ACB55685ACB55685ACB55685ACB55685ACB55685ACB55685ACB55685ACB5568
        5ACB55685ACB55685ACB50CB2685ACB55685ACB55685036AD1E3491934231B76
        B336842D59E72D187B3428FF0076D08CB09342BF6801206D0B596AAD0B596AAD
        0B596AAD0B596AAD0B596AAD0B596AAD0B596AAD0B596AAD0B596AAD0B596AAD
        0BD4DB025163F90F7D5904E6EF2E78603D9FFDBF15C9A172685C9A172685C9A1
        72685C9A172685C9A172685C9A172685C9A172685C9A172685C9A172685C9A17
        2685C9A147F4FB609ECD0B9342E4D09ECD1F15C9A172685C9A172685C9A17268
        5C9A172685C9A172685C9A172685C9A172685C9A172685C9A172685C9A172685
        C9A172685C9A172685C9A172685C9A172685C995A4F8A85BB7641C90F8A81366
        5BB6A1270A20F141F67C57244D20F8AE4D0B9342E4D0B9342E4D0B9342E4D0B9
        342E4D0B9342E4D0BD4CB65ED7F20EF9B46194F78F3C77D839660A45ECDF9002
        2720444605C2B11319CC26448110588566C9BD1E3289F6637D4AFAFF007CF88F
        3DBEC08B4C9F811DF9FA5F32E358278C24B40BE791445F0E32AFEDDA3026E913
        2209899F1DEA57D7FBE7C479EFEB1FA447D8AD59278969C13911B766D71BFF00
        5E751B25E592482FCF1FEA57D7FBE7C479EDFDF96FAB366CC8211F6A26D4A6C9
        90D0B8A2CF162F0C0FCF1BEA57D7FBE7C479EDEF26FF009584A46552002CE4CC
        8036636611080038A04C30B3633D4AFAFF007CF88F3DBDA4C5CB4EF3E358960E
        11B76844300AC9E2C0112819D0B529B2E0289C4442CF8AF52BEBFDF3E23CF6F5
        863728DE200F628131B53C194230B36A5198A36A3C6B4D640951044419B159D4
        B89F52BEBFDF3E23CF607E7BC3F3C7C42CF8F0724AB8D64C41962ACD88C4DE30
        FF0019F1D9B11EA57D7FBE7C479EC00B28C7426CBBC73A81C7C86148DE1F961F
        A95F5FEF9F11E7B0A459F179BFAA4B83EA57D7FBE7C479EC3CFF00D03F2FE81F
        9E07A95F5FEF9F11E7B139BFA367DF9EA57D7FBE7C479EC01229D4EA753A9D49
        46E3264EB329D4EA753A9D4EA753A9D4EA7C09D4EA753A9D4EA753A9D4EA74CB
        F353A9D4E9A54CA753A9D4FBB3A9D4EA753A9D4EA753A9D4EA753A9D4EA753A9
        D4E9B73D49FAFF007CF88F3D82E9D3A74E9D64F6A7F7C24518C7D8A51009D3A7
        4E9D3A74E9D3A7463BAE9D3A74E9D3A74E9D3A74E9D343DA9A3EC2A01674E9D3
        A7453EE3A74E9D3A74E9D3A74E9D3A74E9D3A74E9D44C9ED5EA57D7FBE7C479E
        C264C9936E0932AE04646907B13264C993264C993264C9B75B7193264C993264
        C993264C8C8994A37193264DBAC9B7593264C993264C993264C993264C993212
        457A95F7077CF88F3D8A852B2A6E14DFD7732F52FEE0EF9F11E7B0993265C384
        C993264C993264C993264C993264C993264C993264DBAC9B77F24C993264C993
        264C993264C993264C993264C993264CBF352265EA5FDC1DF3E23CF603264C99
        3264C993264DB8C993264C993264C993264C993264C993264C993264C993264C
        993264C993264C993264C993264C993264C993264C993264C9932F52FEE0EF9F
        11E7B026A54D4A9A952421398A9A95352A6A54D4A9A95352A6A54D4A9BD91534
        72454D4A9A95352A6A54D4A9A95352A6A54D4A9A95352A6A54D4A9A95352A6A5
        4D4A9A95352A6A54D198454B0A54D4A9A95352A6A54D4A9A95352A6A530232C5
        4D4A9A95352A6A54D4A9A95352A6A54D4A9A95352A6A54D4A9A95352A6A54D4A
        9A95352A6A54D4A92109CC54D4A9A95352A6A57A9B64BD9FE43DF40FBBBCB9EC
        2CD8C817DE79E618C928526F3FCF0BD50FB8BBEFC4B9EC1CD8ECD977848B2ACF
        39DFF9B2E1FAA1F7177DF8973D819BDD2E2B4C1024C233489F813F027E04FC0A
        4B5EE91486A0B8B66D40B93250B59559D0B59559D0B59559D0B59559D0B59559
        D0B59559D0B59559D0B59559D0A4B64FBACE85FAED46D3969332BD5043F5C685
        188C83FC414232FB95FA82BD5057AA0AF4A732BFEF82BD52BD52BD52BD52BD52
        BD52BD5290C72040131339DE39B11EA87DC5DF7E25CF63A25B0E4BE58FF8994B
        29329267C48B644BC9078533CA11B508C240142D07C88931244408224CF294FB
        B12F89897C9BC73627D50FB8BBEFC4B9EC6C29524984496E146D196356652A95
        B2E1C4DD0F09CE45087B00950B328394A811ED2A23F5648CCA2536EC48902629
        8A651DC74E9D44B0619D3EF0CD9315EA87DC5DF7E25CF6320A184F084E57FA45
        D1F9E048D93078B4E619D7143597421213292AD03C9962B3B44A8061819A7500
        D3EE90A01664CB2414260E5406FBF543EE2EFBF12E7B1919CE19B0185E861443
        AC877042532421957FA8DF8284200480850238D6728500200B99D407BF0009CA
        03766DC86E800C62A14EF0E0C67AA1F7177DF8973D8B89F761C05E2D986559E7
        C4F1EDCF25913A301FAB215C60D3ACC5C059CB60E7321C095D403E044DE356F0
        97DD8DF543EE2EFBF12E7B159861C4CA580CE89B4E5F10232878665C72C20409
        A2A13D998A249CC0297DA724513919470227DD811994548A40A2D95718B4C378
        7B31DEA87DC5DF7E25CF62A187187E96128902BB58576B0AED615DAC2BB58574
        5215D1484CEC22142D8005A9220C501C960A22D7B02043990852ACD930333AFD
        3BB184AB32804C997FA44CB363E18FF543EE2EFBF12E7B139CB9C3225C910245
        CAA172A85CAA172A85CAA172A853D0A001A159803688C8254D18CE8D978314E8
        162A01B2E0410130DD0A18100A01863736F2F543EE2EFBF12E7B1119CB61F12C
        DE37889826C39013056E485A9BD881E517CDED46072A82B2A1397510F9167C9B
        BC270225F07FD45CEF3CD971BEA87DC5DF7E25CF61C4B09F2E1BD2AF702BDC0A
        F702BDC0AF702BC2A57B8165E042C83002599120CA18A7847DCA44E892E5673B
        990E5502EA27DD8119B078C5E6FE83EA87DC5DF7E25CF61429425801844960B8
        D6A8C8371AA4D526A935488B424B53C2A42C9110FED0ADE41201EF405B120941
        CA14210166580A944EE44991669B02244814B28CB888961FD0BD50FB8BBEFC4B
        9EC186550A4E18E333C2298D2531A4A63494C69298D2531A4A89B318C8012540
        D9842510251FD0EE25752084180FF0EA561221B900C1F024F794042033EE4436
        4522860001A7391406F981C4FAA1F7177DF8973D819B2A8CE70F8B61C5E2AFD4
        AF1A95E352BC6A578D4AF1A95E352E2DAB7C522506447F5F1ED1900004E871CF
        1AD3C7F2500FBB00FC1819CA8527022C540C8774012C54279CFF0043F543EE2E
        FBF12E7B038C42886C8A4C13C572CAF034ABC2B57856AF0AD5E15ABC2B57856A
        22D0AD5E15AE35A2090D059F7419E618312FC18113B92A816CBB91378EFD9164
        C2F543EE2EFBF12E7B0A2242A0643BA6D1F70CEAE1A55CAD5CAD5CAD5CAD5CAD
        5DFF00895C30F6AB869448B3002494CEA2819B70C583295E6C0896189E338174
        6FFF00CD4B83EA87DC5DF7E25CF61CAA05B2EE4788602402069574D6AE9A0E95
        74D074ABA683A55D341D2AE9F7C5478861EC2AEDAAF4A8104672182003090291
        84FBB09860669D4BBB050C0CC2F1500A224389CF9167CBBEBD50FB8BBEFC4B9E
        C4DF1908C8AF857C2BE15F0AF857C289B608982BE1002D024B01B901BBC5133E
        0003D880CB812E040280A7025A77FC8BF2DCF543EE2EFBF12E7B11C5B378CF90
        6E443E04AA27DC3778D6AF160660B3E032FF0035FE6A0044A96CCA55DA95C575
        44D90322BA15D0AE857429043D985946FF00C9B9EA87DC5DF7E25CF61C4CA587
        B51265267DD90473ACF914A20A27DDBBC7224174652A25470A5A571AD0979230
        3364C6C92FB164390EFED0BD50FB8BBEFC4B9EC38F1601808891356135615DAC
        23256137BA210FD3ED64D584D585FAA41398CA800C0420B365C2072A89BB6702
        0A18DE159346FF00F543EE2EFBF12E7B1500C1CA787B13A94C7DB8107C3007BC
        A80DE1F96E326DFB22C8BD50FB8BBEFC4B9EC4C034E54376054B28CBB99F0C00
        224ACA673811A3199E61839F7F7AA1F7177DF8973D81E5CDB3A85E5CDB3A85E5
        CDB3A85E5CDB3A85E5DF6FFCDF50BCB9B6750BCB9B6750BCB9B6750BCB9B6750
        BCB9B6750BCB9B6750A4FE3B0193FDDF52BCBBB5F52BCBDB5F52BCBBB5F52BCB
        BB5F52BCBBB5F52BCBBB5F52BCBBB5F52A3FFE72266FF9CEA1796F6CEA1796F6
        CEA1796F6CEA1796E4FF00ACEA1796F6CEA1796F6CEA1796F6CEA1796F6CEA17
        96F6CEA1796F6CEA1796F6CEA1796F6CEA1796F6CEA1796F6CEA1796F6CEA179
        6F6CEA1796E5CBFEF3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A
        85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A8
        5E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85
        E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E
        5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5BDB3A85E5
        ADB3A85FCFFBC7FB5FD9FF007FDF7DEBDB7FB3C6E3713FBBDBF9DE738B1808C2
        2F0FC17FCBBEA9DBFF0077CE7E0BFE5DF54EDFFBBE73F05FF2EFAA76FF00DDF3
        9F82FF00977D53B7FEEF9CFC17FCBBEA9DBFF77CE607FFD9}
      Frame.Typ = []
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 143.622140000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 26.456710000000000000
          Top = 26.456710000000000000
          Width = 317.480520000000000000
          Height = 68.031540000000000000
          Frame.Typ = []
          Picture.Data = {
            0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000011200
            0000170806000000C78DC024000001266943435041646F626520524742202831
            39393829000028CF636060327074717265126060C8CD2B290A72775288888C52
            603FCFC0C6C0CC000689C9C5058E01013E20765E7E5E2A0306F8768D8111445F
            D60599C5401AE04A2E282A01D27F80D82825B538998181D100C8CE2E2F29008A
            33CE01B24592B2C1EC0D207651489033907D04C8E64B87B0AF80D84910F61310
            BB08E80920FB0B487D3A98CDC4013607C29601B14B522B40F63238E717541665
            A6679428185A5A5A2A38A6E427A52A04571697A4E6162B78E625E71715E41725
            96A4A600D542DC0706821085A010D3006AB4D064A03200C50384F539101CBE8C
            6267106208905C5A54066532321913E623CC9823C1C0E0BF948181E50F42CCA4
            978161810E0303FF5484989A210383803E03C3BE3900C0C64FFD193A365C0000
            00097048597300000B1300000B1301009A9C18000006C969545874584D4C3A63
            6F6D2E61646F62652E786D7000000000003C3F787061636B657420626567696E
            3D22EFBBBF222069643D2257354D304D7043656869487A7265537A4E54637A6B
            633964223F3E203C783A786D706D65746120786D6C6E733A783D2261646F6265
            3A6E733A6D6574612F2220783A786D70746B3D2241646F626520584D5020436F
            726520352E362D633134352037392E3136333439392C20323031382F30382F31
            332D31363A34303A32322020202020202020223E203C7264663A52444620786D
            6C6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F
            30322F32322D7264662D73796E7461782D6E7323223E203C7264663A44657363
            72697074696F6E207264663A61626F75743D222220786D6C6E733A786D703D22
            687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F2220786D
            6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F78
            61702F312E302F6D6D2F2220786D6C6E733A73744576743D22687474703A2F2F
            6E732E61646F62652E636F6D2F7861702F312E302F73547970652F5265736F75
            7263654576656E74232220786D6C6E733A70686F746F73686F703D2268747470
            3A2F2F6E732E61646F62652E636F6D2F70686F746F73686F702F312E302F2220
            786D6C6E733A64633D22687474703A2F2F7075726C2E6F72672F64632F656C65
            6D656E74732F312E312F2220786D703A43726561746F72546F6F6C3D2241646F
            62652050686F746F73686F702043432032303139202857696E646F7773292220
            786D703A437265617465446174653D22323032302D30372D30365432333A3334
            3A33382D30333A30302220786D703A4D65746164617461446174653D22323032
            302D30372D30365432333A33363A30312D30333A30302220786D703A4D6F6469
            6679446174653D22323032302D30372D30365432333A33363A30312D30333A30
            302220786D704D4D3A496E7374616E636549443D22786D702E6969643A306666
            37383631612D316465612D323734662D383439632D6536313961303761633065
            642220786D704D4D3A446F63756D656E7449443D2261646F62653A646F636964
            3A70686F746F73686F703A39383735313939622D333533362D646634372D3834
            34632D3236623165613138376434622220786D704D4D3A4F726967696E616C44
            6F63756D656E7449443D22786D702E6469643A64343838323733382D64383938
            2D653434662D623635332D643738336564373861353064222070686F746F7368
            6F703A436F6C6F724D6F64653D2233222070686F746F73686F703A4943435072
            6F66696C653D2241646F62652052474220283139393829222064633A666F726D
            61743D22696D6167652F706E67223E203C786D704D4D3A486973746F72793E20
            3C7264663A5365713E203C7264663A6C692073744576743A616374696F6E3D22
            63726561746564222073744576743A696E7374616E636549443D22786D702E69
            69643A64343838323733382D643839382D653434662D623635332D6437383365
            64373861353064222073744576743A7768656E3D22323032302D30372D303654
            32333A33343A33382D30333A3030222073744576743A736F6674776172654167
            656E743D2241646F62652050686F746F73686F70204343203230313920285769
            6E646F777329222F3E203C7264663A6C692073744576743A616374696F6E3D22
            7361766564222073744576743A696E7374616E636549443D22786D702E696964
            3A38336438623264642D313861632D336634312D623435652D65666431306137
            3061323934222073744576743A7768656E3D22323032302D30372D3036543233
            3A33343A33382D30333A3030222073744576743A736F6674776172654167656E
            743D2241646F62652050686F746F73686F702043432032303139202857696E64
            6F777329222073744576743A6368616E6765643D222F222F3E203C7264663A6C
            692073744576743A616374696F6E3D227361766564222073744576743A696E73
            74616E636549443D22786D702E6969643A30666637383631612D316465612D32
            3734662D383439632D653631396130376163306564222073744576743A776865
            6E3D22323032302D30372D30365432333A33363A30312D30333A303022207374
            4576743A736F6674776172654167656E743D2241646F62652050686F746F7368
            6F702043432032303139202857696E646F777329222073744576743A6368616E
            6765643D222F222F3E203C2F7264663A5365713E203C2F786D704D4D3A486973
            746F72793E203C2F7264663A4465736372697074696F6E3E203C2F7264663A52
            44463E203C2F783A786D706D6574613E203C3F787061636B657420656E643D22
            72223F3E1B552C82000005644944415478DAED9B5F68544714C6276F42BB7DA8
            5831A5B1AD8981842579289816454B935AB1A089AD8A4411D95090A5B04D63A0
            124A597C8871BBA52CC5E222456310894904415B23BA2815C1878425FEA9D850
            4B28FAD087A601DFD299C05DEE9DCC9C3B67E6C698EDF9BD98DD9DD93933F3CD
            3733E7AE15B3B3B38C2008C2850A321282205C21232108C219321282209C2919
            C9F973E75AB195D7D6D6DE893734FC099591BF77C7CE9DC39836E4FAB158ECEF
            0FB76C2998968762F497352D17D67E18C5F1F1377E7BF0E09DA8C6035BDF168C
            3E743161FBFECBA54B1BA7A7A75FB56D0F3366726C61DA368D2D2C46536D61D7
            676565E5EFEFAE5F3F8EA9633A562A4A46B27AD932F4D1E4DB53A7DAA0867ECA
            E7135F27932730756454715D9F9878E5AD356BA65583F0C5BE7D4326ED09E17C
            BC6EDD636CB94F1289FE4C2EB7173B56BA182FDEBE5D1566C61EB76EDE6CD8DD
            DC3CE67F2FD1D575AC279DEEB28DC784F7E2F17FA71E3E7CC9B4BCAE4F98BEAB
            B4A3E3F59A9A99332323AB549A10C81AFAE3D9B38AB0D8209D626283DA946383
            B465B33E4F0C0F6FC26C7A2EFA5A3023997CF428B6A9BEFE1FF97D31E9BF168B
            2F9BB6A18AEB83B6B69F4F0E0C7C24BFAF127C3919C9B6969689B11B37EAE4F7
            31DF81E5FB4CE650E6F0E15E4C9D288C04AB4748F0511B89CD5A590C23C1AE35
            177D698D8457D6D5A9F2FE80BEBC33993C3D98CFB72B3F3B72A4FBF3CECEA326
            9DD30DA03CD13AC1978B91A84E5B1E8D1B36DCBD70E54ABD6D4C10B23903BA10
            CC6903BA229AF45D2EC7F5C2DE6F6E9EF77D7C5E4A7F438B264A23318D8DF9D6
            0934263646C2375296EAEE564EC0C8E020CBF7F5955E3F2F7D698D84774A5961
            F3D6ADA1C725717FEC686DBDEEBDE693CCB81803654C3BA83312BF7074A71F41
            B918893C0EF29862AF8CA61CD8B3E7F2D5A1A1CDBEFE6BCBC61B1B3BF6271279
            D7BE2B16B5B8ABABC624F0DA64D7D795B33512BEC858756DADAA59239DD81889
            9883642AC572D9ECBC72B70A85802E746980B031C2EA0B7DB53111ACBC8B0921
            DC2D16034E69BA8B427179C759E8F4530E4622F78FF79BD5C5E38C7F4FA09C6E
            21B900ED542AA02B868B91AC9516EBDBD5D5AC6EF972A3FE2FA4914098CC87AD
            91ECEFE8089CC854986A350A7D456E2472224A1CC34E0E0CB0999919D6D2D484
            DE45FD7109F7E777B8C0E742B8DCA0BEC4C6BB548C444E80899D62647494BDB6
            72A51000E3022895758D4D07364F629A0CC718492C1663FC945B2A2374C54F4A
            817AFF2323E9E746F2955F9732A65A884A5F508EA44A550112BDEA8AC145C5B8
            A8BCA0D96EDF7DD22419240F203F3E17A08CF937B91CE39F975E2F7523911360
            FE63FED3274FD8763E9E7E733E3B3ADA68F3D8CF043116FC9F79E2CDF6F60616
            B5E922C45E6D78FBECB3F6F679D7648FC53012284782BDB2628C44945319BC30
            821FFBFBAD13F8B6FAD21A89CD31593E2289EB8B2A0BEC276C61AA0650975D56
            3975D446624A144F2E54F771F9442683CDD487015D1B75E8C466DA77D563C830
            744FF204729EC7A50F36B109A27C6AE32FA73A214163E1274A7D456624F2007B
            39109349847651D500EA2653C46C6B102FA291C8B9267165285CBBB62BEC370C
            FC5406263D31608D04CA7D61FAAEDB2C6CFA2C27FF5DFA60139B60A18C44D73F
            61263DE9F4A750A2354A7D456624F2E07AE6003D51F180264E3780B2C03D2328
            172349F7F4F4F9733FFEC93311B269B63E0C8C918879FCEEF8F1265DBB182311
            BAC965B33F604C0C3213D176269D3E1DF6C33AA1B1642A75101A3B9BD816D248
            042A33817EA817B5BEE8FFDA1004E1CC9C918C8F8DBDF97872127554230882F0
            983392FBF7EEADF86B6AAA66B1832108626942571B82209C21232108C2193212
            82209C21232108C219321282209CF90F88611FF9E4DA81680000000049454E44
            AE426082}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 604.724800000000000000
          Top = 15.118120000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date]')
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 98.267780000000000000
        Top = 222.992270000000000000
        Width = 740.409927000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 222.992270000000000000
          Top = 22.677180000000000000
          Width = 389.291590000000000000
          Height = 41.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Relat'#243'rio de Vendas [status]')
          ParentFont = False
        end
        object Picture2: TfrxPictureView
          AllowVectorExport = True
          Left = 45.354360000000000000
          Width = 181.417440000000000000
          Height = 98.267780000000000000
          Frame.Typ = []
          Picture.Data = {
            0A544A504547496D616765831C0000FFD8FFE000104A46494600010100000100
            010000FFDB008400090607141312151313131616121717151715151817171A1A
            181D1517171D15151717181D2820181D251D151521312125292B2E2E2E171F33
            38332D37282D2E2B010A0A0A0E0D0E1B10101A2D251F252D2E2D2D2B2D2D2D2D
            2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2B2D2D2D2D2D352D2D2D2D2D
            2D2D2D2D2D2D2D2D2DFFC000110800AB012803012200021101031101FFC4001C
            0000020203010100000000000000000000010200030405060708FFC4003C1000
            0103030203070105080202030100000100021103213112410405610613225171
            81A1324291B1C1E1142352627282D1F092F133A216B2B307FFC4001801010101
            010100000000000000000000000002010304FFC4001D11010100030003010100
            0000000000000000010211210312314161FFDA000C03010002110311003F00F6
            C7BC10403755D11064D941488B9D933DDAAC3D500AF788BA6A4E0041B14AC3A3
            3BF920E6175C6102961998B4CABAAB81102E50EF4446F848DA65B738080D1106
            F642B0936BA679D761F2A31DA6C7E10353700209BAA5AC3331694CEA65D71829
            CD506DBE104AAE9102E52D0B4CD906B34DCA2FF1E36F3EA805612645C2B58F00
            013748C7E9B14A69137D8DD02D36104122CACAC6440BA2EAA1C206EBCF3B6FDB
            66510EA749C0E43DC0FD44669B4F97F11F653965318D936C9ED77690B41A549D
            0DFB6F1F80201F6F3F4CF37C8FB6B56990D97561246889766D11675A2EDF95C0
            FEDEFAD521F5034BC92F79366B4024DB7300C0F40B77D95ED0329778C0D0C04F
            82A182E222035CEDA489F2B95E6CAE5F5D66BE3D9FFF0094D16D36BAAEAA5222
            1D163E563D0AB79573AA158CD3AAD766D3071E472BC7F9E7332693813243DD92
            0EE6049F5CAE72971970E692D20D9CD3F044907D2CAA797265C23E917714CA96
            63DAE23203813F72BA898106CBC068530F1ADAEEEEA0C96921A4F9C6D7217A17
            FF00CCF8BAA59569577CBDAE6B985C47883810749DE0B7D6EAF0F37B5D54E586
            9DC546124902CAE7BC1044DD015436C72120A445F6175D909444193608D7BC45
            D17BF55820CF0677F2E881A8BA041B1553986662D299CCD57184E2A816DF080D
            47822065574441BD946D32DB9C04CF76AB0F9402B09C5D3D270020D8A561D363
            F095D4CBAE30502861998B4AB6AB81102E54354446F848D616DCE101A1699B21
            584991745FE3C6DE68B1DA6C7D503537800026EA2ACD226E375101EFA6D1950B
            745F3B267530048C8494DDA8C1C20206BE90A779A6D952A7871BA66303849CA0
            1DCEF3D50EF355B1294D4331B6158FA61A24650291A2F9950375DF1B294CEAB1
            52A1D3608277BA6D1847B98BCF54594C11272AB150931B610307EAB6143E0EB3
            F97FDA2F606891954BB896FDB70B6DBFDC137A14F3527B97BDA48206DD089BFA
            4AE12AF6AAA025B15CC18904C13205AF7CE33D1751CCB9ED32D7D364BB535CD3
            A46A224113698F785C4D4E50C973DCC266E4D5A862D17EED96DB73B2F37932DD
            E2E4E2BADDB375C697EE0835237820FCAD655E7CD8B70F4F78BB4E0F969B2C2E
            3399359519A0D1EE8B9B25B4434C1710E0751276CF55A2E338879351CC92CD4E
            2D88FA649B0173653EACDD74D53B43A448A744589F3C0062C337DD60768F8EA7
            51ECD6C2E8691E131922D1BFE8B91355F53E9F2F4589C555ACD702E0E68B0D47
            E9B9DDD80157A425AE8F9DD4A6683453D405C3B51939969CF95BD82D0F02F2D7
            CC822E0F59E8B7FCCEBBB86E1E934863DEF04D4B97069D474B4B700C09FF002B
            5FCBB9E8046AA14C8DE1AD9F6F349BD722FF007ADDF2F78305A6FE2B6C4E8744
            F9AD872BAE40654A4F3DD92258EBC6A23076849C3F1F4F539B14C39A5CD2DD01
            AE0E163BFAAD5F05C255A4E76921F424B8C1FF00C6478B4907165C2F57791EC1
            CBB9C32950372E7EA240D8081727CAC6C13F66FB42EAB59CD7BF50A9E11E4D2D
            C003C8827EE0BCEE9F30D6F634B88693116C8C4E64182AEE57C61A7545CEA26E
            EBC6B6C1044FE1FCA3CD75C73BCFE3957B51669BE541E3E91F9AC6E57C6F7F4D
            AFD9C248F222C47B190B26A7871BAF5A135E9B651EE66F3D54A6C0E127290D42
            0C6D840DDEEAB46542DD17CEC99F4C012329699D5628201AEF853BCD3689852A
            1D3609994C3849CA01DCEF3D50EF355B09454331B6158F606891940A468EB2A0
            6EBBE36529F8B3B2151DA4C0C203DF45A30A266D30449C945052C2644CC2B6B6
            2D9E88BEA0220655749BA4C9B040D4779F9FD5255266D31D1355F162FF00EF54
            D4DE1A20E5010046D30AAA44C8998EAA1A66662D32ACA8F0440CA015BA7C7E8A
            51C5FE50A434E6C8551AAE2E8054264C4C7456B808DA6106540041CAAC5320CC
            5B2825299BE3AAE0B98D3D3C696D579752871A74EFA6C2E481677D2720E42EEB
            98F141B4DC45C8C03693B2F3AE6C5EC60A85DE263CB9C60F88174EE49BB8013B
            6B5C7CB7E4546E5D59BA65B11E58F3911ECB9DE7DCCC35A7ADBEF58557980A6F
            7807C3A658368BB9B7EA0B8FBDBA711C6F37ABC43BBB6789CF2431AD1E5975F6
            EA570D755B6AF8CAF2417998261B27CE7C44DFDBD16E7957672B3DC2A0A868E0
            B03984B81DB3006DEAB7BC83B2D4E80EF6BE97550353A4FEEE9C5C92E393D4FB
            0DD6979FF6E002E67096C835C8FF00F269B0FEA3F76EABDAE5CC498EBEA9E63C
            B9BC1F10D69730B1EEB31BABF76E2012D22200BF844CC4794ADF54E760533006
            9000D361A89C34920F919B111B15E692E871713E33A8924976A0643C9379927E
            F2BD0381ECAF10EE0BBDA834D6FAD944E4881F579388161F7C4DB72C7F495CFF
            00194490E26830537DA296AF09FB2E0C3691FCA07A25EC572FA678973AB107B9
            01ED67F1907C27D1A60FA96F55D2722AA2693C8B078CFF00BE6B90E77CC5C78E
            E22A0B3855A8206ED0623EE0154B6C64D6D6F30351FC4BAA31AE70A8FB434904
            B888688DCC85E81CA7B0D5DAEEF6B710DA25C1BAA981DE12034021D70D18EB95
            CDF67F8F7F0DC400D6BAA697B8E81921CC23604C8225765539CD5A8437F62699
            9710F973A06F06FF001B853F4B5A1ED551A546BB1944C8D21E4DBEB0E74E3E9F
            08C755B3E1384E21FE3606B698FADF55AED207F29DCDB016CB86AC5F50470BC3
            87B44B496324006E6EE91E20765B5AB45EE0E7D5797FF0FF00032D0480603A06
            A381EF94F59BDB36D772DED91A4E2C65377772EBB20CC1D3244589806015D6F2
            4ED5B6B9D21A4BA24870208C79C8DC5A579D70B4807BB581FBB6D57693041B02
            C01BB7880237FBD6D3B3D5FB8A156B005C5A58C6003C8DE009DDDF0BAEF5F18F
            53AB336C7456B408DA61721CBBB65022A37A9D88F58902F6BC616F796F1CDAE0
            BE983A67368BF91060AB99CA69994C991331D5595B16F845EF0440CA4A434DCD
            9530D47AFCFEA92A933698E89AA8D58BA6A6F0041CA02408DA61554899BCC755
            053333169956547870819402B6D1F1FA234717CF54B4BC39B7FBD10AADD4645C
            2057932626145732A0020E544158A517F24C5DAAC2DBA51549B79A67374DC7A2
            00D3A337950B355C28D1AF3B7928E7E9B0407BDDBD9014F4DFC91EE867DD28A9
            AAC77405C75D85946BB458DF745C345C7CA8D6EBB9F4B200696ABF9A26B4DBD9
            29A9A6C3658FCD3886D0A4EAAE9F08903324FD2D03A9841A8E7DC500ED1A85B3
            7DCFFBF2BCFB9B71CF6D421F2195039A4C584D9827A403EE53F33E39CE0EA8F6
            550E209D46D933110236DF65CC71FC63EFA4924CF847C7877C8F3F55E6BDBB53
            0A936AD6716B351D2E879130D323206E6D6FE513E6BA2E069D1E05A4BE03DCD1
            613DE3A37267C0CF21037DF3AEE0C712C12DAC2930804B480E8245ECEB34EFE7
            26EB1E8F0747512EAA6A38DDCE71D5EE4E3F1517AE9269B1141DC6D2A8FAF50D
            3A26D429B7C3045CD423ED795FAE2CB8CADC92A309860741B1D4C13D5A1C42EB
            D9CD787659B2E75A09123A403FE02C4AD4F87E22BF7AF7D5D440045365CE9DE6
            0EC40C6216CBA4F19DD9EE4B478463789E24B6A5775E9B010E0CF4FE27F9BB03
            6F32FCC7B42F915B5CB6082C00C093F4DE2F8F11593CFB931AC291E1E91A6C6B
            45387F87C22FA8EA3727FED6BC7659A61B538865F48D3DE1249D84003E16FB44
            DDD6B781AAEAB51C28B5CFD5E2F08274999D463171BEF2A56ECEE8E30F1558B4
            33C2FEEE64EB007D5168044E56CF957346B299E169B870E1AF70738532F2E3AA
            0837999B49DA16AF9FB787A7773EAF11536D4E0182FB358493E85C3653BBF8AD
            452C2D7553DD17BEABDC4374C65D68076CF9AEEB9372C32DA4CAAE61690EAD59
            A635B8EAF0309CB4126063EA24602E4FB31C116015EA436AD41149921A295274
            EAA9FCAE709022FA67772EA796F336308D36A4C10D248971DDD02D27CE71000F
            2A934CAEADF45E331540DCC32A7DE3C2EFB9AB1EA57A6618F769B88153C26644
            413E171B0C1D96838CED83448124F90049F602E569389E2B89E241EF08651241
            734992D0DBEC3C2713A88C7459B34DAF6AA9FEF412E024581C784132E9C8902E
            AE7B9ECE1A8B69C99D4F7100490418969B190EC740B5038DE1C91A58EABDDB40
            B071A6D03FA243B1895BD7D77D40DA8D67EEECD634020926C00691B98FB92E57
            5AD1245BCA39754AAE6D1101D996480D60905C4601B90223257A5703459458DA
            4C6C0688FD56B7B39CB0F0D4FC506ABE1CF3E5E4D1D02DC8A40DFDD77F1E3A9B
            A9B4052D37F251CED7616DD0157558EE99CDD171E975D180D3A2C6EA1A7AAFE6
            8B46BB9F84A6A69B0D90377BB7B2029E9B947BA19F741AFD5628238EBC5A110E
            D363EA83868C6FE68B5BAAE7D1029A537F35143548B792882C7D300481755D27
            6A306E12B0191330ADAC645AE7A205ADE1C5935368224E50A1699B7AA4AA0936
            C74400D4331369856D4600246510E11B4C2AA902089C7540D48EACDD0AA74981
            64D5CCE2FE8A51302F6F540D4D80893958AE6EA78D505A3008193BFB0FC4AB2A
            0326263A2BDCE119130839AEDD51D3458E60876B0357902D767A480BC7F8AAF5
            03DC2A1D2E93A83748F43A8DCCF485EC5DB32470754C1FB316C789B75E53DA16
            6BA02A81E302C475C8B642F3F93993AE1F1814E9D3738FDA7030751248B4FDA5
            7F1FCA80D22A38B46904B1AD0725D72F74307D3D49D385395700FA741C5F48BA
            BBD843748D420E1B2319B98F4C29DA17543C253A976D4A6743EF7B7D24C6F21A
            7FB8A9D7597255C170348D40C6318E3692F26A103CCB44345BA2DAB3983BBC75
            2A4D6B6937704B311265A2326000B5BCB086517F11F6EB696B07908B91F3F704
            7836814F4B675388D4760037C2333825D1E6567AEFEA76E83F679176EA9C38BC
            B8FA8D4D8583C4728D513AF580035E594C96E932D234386FD2EB3E954EEDAD6B
            89981203498F26C016810AD3C60027231D67CA0EE9268DB9FE3792543C4BF886
            BDB0E248A6FA7500137209D241BC95894B941ADC417BCD17B580F7741951BE37
            8C35E0C10D1049FE985B5E6BCC7555025CD65312E8244BADA408205C90D93395
            AC22A77752A323BE7CB03CD83664D6AD7BDC9D22063685BA36D5732E64F75473
            019A80CBDD3007BC446DE9E780FC3F07AF41ACE780EFA49616B3FB5CE1F8F598
            587C0F24A959DDD538D00CD7AC416B5A3AB8DCCF964FA6369C3734FD9AA52A54
            E9BABD0ACE731F462EE6B481DE536FD870B907A5CF95FD63AEE5FD9D6C02D83E
            843A6330E32D3ECD0B6D5781A603416EB77D961138E86C16570FC2B8540DA60B
            99A1BA5F6D0036403D48F2B16C102C44673B837005B47FF23BEAACE131FD2DDF
            D31EAA3D2456ED73DCC6A32840A8054AE47EEF876FD23CA63FDF21BADE764780
            A86A1ADC4802B01FBB6ECD07EA21BB663CE15DCBF93B289351C4D4AEE001A8E8
            9B0C00000D1E99DD6EF90C12F79FE91F89FC95618F7A5F8DAD268709372AA350
            CC4DA611AA0936C7456B5C2322617A1095180091955D23A8C1BA5A60C8998EAA
            CAC645AFE880553A7164D4D808939428DB36F54954124C63A2082A1989B4C2B2
            A340122C512E11B4C2AA9020DF1D50351F166E855769302C1357BC45FD11A260
            5F3D5016530449175152F064C4C2882D7550440C94AC6E9B953B98BCE14D5AED
            8DD04A9E2C6C8B1E1A20E509D1D654EEF55F0814D2333B6558FA81C2064A5EFB
            ECC7453BAD3799841298D372A541AAE149D76C429AB45B3BA066D40D10721562
            910676CA6EEB55E6254EFA6D19B20AB98F0ECAF4DD49C25AE1076F707CF75E4F
            5B8034DCFE1EA65A48F5F223A1041F75EBBA34DF2B95ED9F2A2F1FB4D36F8982
            2A0F36DFC5EADBFB7A2E7E4C7736BC2EB8F24E17B3B51C6B7EF2A52A34E704DF
            78001BFEA11E1795F1069398CA8345890F045C4693D1D66F491D0AEA78F654AB
            4432944EA25E098240980D9B79663015DC1C358C6BC6979BB854F0CB80C35D04
            3BC526C7ED13D17132AE1F99F2FE258699AC298A2D1E1631C418689362D11B4F
            92CCE4F58B9E25AE39206662E45BAC4F40BBAE3F94B6BB1A1E61C2E1C00B4E41
            182313E9B2C5E17B3CDA1E39D4FC3006E96B4BAD3124CC123309BE274E238DE1
            5EE739C7C5A893A9C6E3A609B7459F4B8C0D63586A49636E6F73B66F65BAE7C0
            0696B5A0832C0649B322488FB449C1F758FC8B94D314CBDF4DAE2F2400E00D9B
            9E9991FDA16EF9D64C7AE3F81E67A6AD5D220B80F186B5C5864DC076F7CF55B8
            E5FCB8553FBCE2389ADB9636298F774C81D442EA29F67F849D4386603E6D96FF
            00F53E8B6DC0F2EA4D32DA427A9246F3626373F7ADE2F4D4D3E174B34B290786
            93A285310D07F99C4DCCDCB9DD6255BCABB22F1A9EF786D4A93DED4025F04CF7
            74A6D4D83DC9DFC9755449C0000E8AF6519C94D374A795F054E85314D85C5A09
            3724DCE73F86165F78AA2D841AE5A2AE36B405BBE59C3452637ED5CBBD5D78FC
            BD969783E1FBEAC07D96F89DED81EE63E574DF4759FC974C27EA72163C3441CA
            4348933B65368D57C29DF45A31656933EA07081929698D372A775A6F330A6AD7
            6C6E82541AAE1332A0688394B3A2D953BBD5798940052333B653BDE1C20652F7
            DF663A29DDE9BE504A634E7741EDD4646119D7D214D5A2D9DD0336A8020E4229
            3B9D579CA88036A93638299EDD3709EA3400605D5544C9BDC754059E2CEC83DE
            5B61846BDA22DE89A9341126E50414844EF948DA85C60E0A52E331B4ABAAB401
            232815E34DC28C1AAE52D1B9BDFD54AC60DADE8823AA16D86027348013BE51A6
            D0449CAA5AE33136940CC7EAB1C2955A1A2320D883FEF54F58002D629685E66F
            EA83CBB8BE1BBAA8FA7FC2E207A7D93F74140718F0227537C9C242DCF6E386D1
            C4B5E31519FF00B32C7E347DCB9FAAE8F45E6B355DA762FA35E98FA75D13FC97
            67FC0D87B01EAB399C5BE30DAADCCB0E977A9638C7FECB4F9B8591C256D25633
            D634FCF6A9A9569B594DE040641638364124413EB73D174BC3F0D01ADD9A0007
            D373D4DCFBACE654044C26708000DD6DA49A2D0E1B7C05954AC51EF80B26680B
            60B5B5958CAEB11CE0836AEC2FE975A32AA5690B19D5602867C88F5B7EAB2393
            70C2ABDFA84B18DC79938F5C15B26C6E39470BDDD20EFB6F827D0E07DDF8959C
            CF16764289930708D7B445BD175934E40F7E9B0C27148113BE54A201126E554E
            71989B4AD0CDA85D638299E34DC26A8D00481755D1326F7F540CC1AAE52BAA16
            981852B58DADE8ACA4D0449CA0069089DF2918F2EB1C250E331B4AB6AB4016B1
            40AFF0E37458DD572850BCCDFD50AC60DAC3A208EAA4586028ACA6D040917510
            52C610648B2B2ABB508172A1AA0D84DD06B74DCFA5904A3E1CD92D5692645C26
            7F8F1B79A2D7E9B140C1E2226F10AAA6C20C91647BA39DB299D503AC32504AC7
            562EA513A45EC83468B9F851CDD771E9740B51849902CAD73C444DE212B6A86D
            8E4251488BDA3280526C193609AB78A22E8B9FAAC3E5067833BF97441CFF006D
            3830EE1B561F49C1E3A83E170F99FED0B872242F48ED0D035387ABA7F80DB73A
            6F1F0BCE698B2E3E49D74C3E31DAC856913851C506BAF2B9ADB2E11E602CD7D4
            8730199718688C9E9F7AE5F8CE7EEA43BBA660EEEDC0D805AE6F1B51CE69739E
            49FA492E27FB4FF85A9B5E84787330607CA8EA7D4AE4785E7F529B86A25ECC10
            4C91D4137F65D677E0DC5D6826885B0E0E940958549CB29D5E0405B057C6D45B
            3ECCD0229EB8FA9C4CF4161F81FBD73BC5B89B0C9B0F5380BB6E1C06B1B4C6CD
            0D1EC2174C62725B55D2205CA5A3E199B28D669B9F851FE3C6DE7D55A0B55B26
            45C2B5AF11137884AD7E9B1F84A69137DB280536104122C9EB1D42D751D543AC
            32506B745CFA5901A274E6C92A309320484CE1AEE3E516D4D36390818BC444DE
            215549A4193608F7473B6533AA6AB0CF5402B78B174693B48836419E0CEFE4A3
            9BAAE3D2E811EC24920594560AA058CD91400D18BCE100ED76C6E95B50930705
            3D46E91232801F07594453D5742978B37842A3CB4C0C203DEED1D1134F4DFC93
            0A62277CAA98F2E30708181D76C285DA2D9DD1AA34E2CA521AAE6E820A5AAFE6
            877D368E895EF20C0C2B4D3004EF940A59A6F94078FA47E7FF00485371718384
            6AF87169410BF4DB2BCDF9AF0FDDD47B6234B8C7F49BB7E085E934DBA849CAE2
            7B60E02BCF40D27A8C4FB10B9F93E2B0FAE69CB1DF3B2C9AB62B1EA2E6B72FCE
            0C5677B1F80B79C47161D5387734F865F11FD2207455F30E5E2AC1C3861DF91F
            35A8ABCB6A31ED0082E33A74983E113BE16B1D1F13CA5D56A17EB0D6989B1271
            72BA3E1069635B33A406CFA0895C7F29E6D50546D3A86413A6E208381F3E6BB2
            A0120BD853BEAA68B242150CEE43483AAC9BE91A80EB300FB2EA8D18BCE2EB93
            E42ED0F7176E23D2FF00A2EA595498BC82AF1BC4E5F4C1FAAD850F83ACFE48D4
            686891942978B37854910CD57C21DF45A3A2151C5A6061582982277CA0534B4D
            FC900ED76C6E958F24C1C27AA34DC59002745B288A7AAFE6A521AB3748F79060
            610377BB47444D3D374C69889DF2ABA6F2E30708083AFA4285DA2D9DD4ABE1C5
            A51A6DD424E5041466F395123AA1060602882D7C4188955D1CDF1D506D320C9C
            04F51DA840CA015F68F8FD135288BE7AA5A5E1CEE854617191840A6677895755
            88B44F44054111BE156C61699384068F5F9FD54AD9B7C26AA75614A474D8A06A
            711789EAA96CCEF128BE99264615A6A02237C2015622D9E89686FABE7F5429B4
            B4C9C2357C58D9062F34E30526EA38C08DCAF3EE6BC5778E71FB44CFAFE8BBFE
            65C18A94F41CE63FDF45C3738E4555AED4DF6D8FEAB9E78DABC6C8D2B9D1638D
            8F974295D23215EF6DA1C20F5FC95629988C8D973D58AE349CE786A861F48BA4
            082D0483D0803392B1DBCCC97522EA6ED6CD523F8A5B122CB7E699F2419C3F88
            3A2E0103DE27F00A98C1E53CBAA54ADDF546E96EAD507248FA44663175DBF0E4
            0175A7A4E859AD7141986A4A76BD554987D4ACDE1B97BDF602656EAD37231297
            10413BCFC0D96FFB3F59E75023C116F5DA3E53705C918D3350C9F2FF00256D69
            D1D3168015638E9372D9A8E6F8EA8D7DB4FC7E88D476A1032852F0E775693528
            8BE7AAA9D33BC4A6A8D2E3230AC150011BE104A911689E8ABA39BFCA0CA64193
            84F54EAB040B5BA7C7E8ACA511789EA9691D3948F61719184004CEF12ADAB116
            CF444D4111BE1574D85A64E101A1BCFCFEA856CDB1D11ABE2C6C8D3769107281
            991026254553A9926460A881CD59B46500DD17CECAAA590AFE271EE8148D7D21
            11534D94E17755F11F5207EEB79EA89A9AADE6AC6FD3EDF92C6A1F50FF007641
            601A2F950B75DF1B23C56023C2E0FAA002AE9B7921DCC5E7AAAEBFD4564BFE93
            E9F920ACBF55B080F0759FCBFED270F94FC56DEFF920859AAF841EE11A4898B2
            B386C2C7A993EA83178AE474DC248FB96ADDD94A6E3E1B7C7E0BA8ADF495470D
            9F6FF08396ABD928FB5F2520EC938E09FF0097EABADE2B215BC3FD21071ACECB
            DF27FE4B3E8F66836E4FC92B75F6BDFF003593C47D27DBF141ADE1795B36CF55
            9CD865A3AD94E1774BC4E7DBFCA0634B55FCD135A6D19B2B28FD2162D3C8F541
            68669BE543E3E91F9A7E2709385DFD9010FD36CA1DCCDE7AA4E23EA590CFA47A
            7E482B35755BCD00DD17CECABA1F505771581EA8148D77C222A69B7923C2E0AA
            6BFD47FDD9059DD6F3D5135355958EFA7DBF258FC3FD481C0D1D6542DD77C6C8
            F15B23C363DD001562D1851535725441FFD9}
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 226.771800000000000000
          Top = 60.472480000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Data Inicial: ')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 404.409710000000000000
          Top = 60.472480000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Data Inicial: ')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 309.921460000000000000
          Top = 60.472480000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[datainicial]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 487.559370000000000000
          Top = 60.472480000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[datafinal]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 60.472480000000000000
        Top = 343.937230000000000000
        Width = 740.409927000000000000
        DataSet = rel_DS_Mov_Vendas
        DataSetName = 'RelMovVendas'
        RowCount = 0
        object RelMovVendasvalor: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 60.472480000000000000
          Top = 30.236240000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataField = 'valor'
          DataSet = rel_DS_Mov_Vendas
          DataSetName = 'RelMovVendas'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[RelMovVendas."valor"]')
        end
        object RelMovVendasfuncionario: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 268.346630000000000000
          Top = 34.015770000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'funcionario'
          DataSet = rel_DS_Mov_Vendas
          DataSetName = 'RelMovVendas'
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[RelMovVendas."funcionario"]')
        end
        object RelMovVendasdata: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 449.764070000000000000
          Top = 30.236240000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'data'
          DataSet = rel_DS_Mov_Vendas
          DataSetName = 'RelMovVendas'
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[RelMovVendas."data"]')
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 79.370130000000000000
          Top = 11.338590000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 226.771800000000000000
          Top = 11.338590000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Funcion'#225'rio')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 457.323130000000000000
          Top = 11.338590000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 597.165740000000000000
          Top = 11.338590000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Hora')
          ParentFont = False
        end
        object RelMovVendashora: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 589.606680000000000000
          Top = 30.236240000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'hora'
          DataSet = rel_DS_Mov_Vendas
          DataSetName = 'RelMovVendas'
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[RelMovVendas."hora"]')
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 30.236240000000000000
          Top = 49.133890000000000000
          Width = 665.197280000000000000
          Height = 15.118120000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            
              '----------------------------------------------------------------' +
              '----------------------------------------------------------------' +
              '------------')
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 49.133890000000000000
        Top = 540.472790000000000000
        Width = 740.409927000000000000
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 188.976500000000000000
          Top = 22.677180000000000000
          Width = 366.614410000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Desenvolvido por Bruno dos Santos -  (21) 97021-7483')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 619.842920000000000000
          Top = 22.677180000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Pagina [Page]')
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 52.913420000000000000
        Top = 427.086890000000000000
        Width = 740.409927000000000000
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 555.590910000000000000
          Top = 22.677180000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 604.724800000000000000
          Top = 22.677180000000000000
          Width = 94.488250000000000000
          Height = 30.236240000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          Memo.UTF8W = (
            '[SUM(<RelMovVendas."valor">,MasterData1)]')
        end
      end
    end
  end
  object rel_DS_Mov_Vendas: TfrxDBDataset
    UserName = 'RelMovVendas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=id'
      'tipo=tipo'
      'movimento=movimento'
      'desconto=desconto'
      'valor=valor'
      'metodo=metodo'
      'status=status'
      'valor_pago=valor_pago'
      'troco=troco'
      'funcionario=funcionario'
      'data=data'
      'hora=hora'
      'id_movimento=id_movimento')
    DataSet = query_mov
    BCDToCurrency = False
    Left = 104
    Top = 840
  end
  object query_cor_mov: TFDQuery
    Connection = fd
    Left = 680
    Top = 376
  end
  object query_cor_caixa: TFDQuery
    Connection = fd
    SQL.Strings = (
      'select * from caixa')
    Left = 680
    Top = 320
  end
  object query_cor_ent: TFDQuery
    Connection = fd
    Left = 672
    Top = 264
  end
  object query_cor_resolv: TFDQuery
    Connection = fd
    Left = 672
    Top = 216
  end
  object query_gaveta: TFDQuery
    Connection = fd
    SQL.Strings = (
      'select * from gaveta')
    Left = 336
    Top = 32
    object query_gavetaid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object query_gavetanome_pc: TStringField
      FieldName = 'nome_pc'
      Origin = 'nome_pc'
      Required = True
      Size = 50
    end
    object query_gavetanome_compartilhamento: TStringField
      FieldName = 'nome_compartilhamento'
      Origin = 'nome_compartilhamento'
      Required = True
      Size = 50
    end
  end
  object tb_gaveta: TFDTable
    Connection = fd
    UpdateOptions.UpdateTableName = 'pdv.gaveta'
    TableName = 'pdv.gaveta'
    Left = 280
    Top = 32
  end
  object DSGaveta: TDataSource
    DataSet = query_gaveta
    Left = 376
    Top = 8
  end
  object tb_registro: TFDTable
    CachedUpdates = True
    IndexFieldNames = 'cod_liberacao'
    Connection = fd
    UpdateOptions.UpdateTableName = 'pdv.registro'
    TableName = 'pdv.registro'
    Left = 648
    Top = 40
    object tb_registrocod_liberacao: TStringField
      FieldName = 'cod_liberacao'
      Origin = 'cod_liberacao'
      Required = True
      Size = 40
    end
    object tb_registrodata_vencimento: TDateField
      FieldName = 'data_vencimento'
      Origin = 'data_vencimento'
      Required = True
    end
    object tb_registroultimo_acesso: TDateField
      FieldName = 'ultimo_acesso'
      Origin = 'ultimo_acesso'
      Required = True
    end
    object tb_registrocodigo: TStringField
      FieldName = 'codigo'
      Origin = 'codigo'
      Required = True
      Size = 50
    end
  end
  object DSRegistro: TDataSource
    DataSet = tb_registro
    Left = 680
    Top = 96
  end
  object DS_Rel_Canc: TfrxDBDataset
    UserName = 'CANC'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=id'
      'tipo=tipo'
      'movimento=movimento'
      'desconto=desconto'
      'valor=valor'
      'metodo=metodo'
      'status=status'
      'valor_pago=valor_pago'
      'troco=troco'
      'funcionario=funcionario'
      'data=data'
      'hora=hora'
      'id_movimento=id_movimento')
    DataSet = query_canc2
    BCDToCurrency = False
    Left = 624
    Top = 656
  end
  object rel_comprovante_canc: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44114.945500428200000000
    ReportOptions.LastChange = 44116.594572303240000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 552
    Top = 664
    Datasets = <
      item
        DataSet = DS_Rel_Canc
        DataSetName = 'CANC'
      end
      item
        DataSet = Rel_Dados_Comprovante
        DataSetName = 'Rel_Dados_Comprovante'
      end
      item
        DataSet = rel_DS_Mov_Vendas
        DataSetName = 'RelMovVendas'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'canc'
        Value = Null
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 100.000000000000000000
      PaperHeight = 130.000000000000000000
      PaperSize = 256
      BackPicture.Data = {
        0A544A504547496D61676592220000FFD8FFE104C44578696600004D4D002A00
        0000080007011200030000000100010000011A00050000000100000062011B00
        05000000010000006A0128000300000001000200000131000200000022000000
        720132000200000014000000948769000400000001000000A8000000D4000AFC
        8000002710000AFC800000271041646F62652050686F746F73686F7020434320
        32303137202857696E646F77732900323031393A30333A31332032313A30313A
        3237000003A001000300000001FFFF0000A0020004000000010000011BA00300
        0400000001000001710000000000000006010300030000000100060000011A00
        050000000100000122011B0005000000010000012A0128000300000001000200
        0002010004000000010000013202020004000000010000038A00000000000000
        48000000010000004800000001FFD8FFED000C41646F62655F434D0002FFEE00
        0E41646F626500648000000001FFDB0084000C08080809080C09090C110B0A0B
        11150F0C0C0F1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E
        0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC000110800A0007B03012200
        021101031101FFDD00040008FFC4013F00000105010101010101000000000000
        00030001020405060708090A0B01000105010101010101000000000000000100
        02030405060708090A0B1000010401030204020507060805030C330100021103
        04211231054151611322718132061491A1B14223241552C16233347282D14307
        259253F0E1F163733516A2B283264493546445C2A3743617D255E265F2B384C3
        D375E3F3462794A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F6
        37475767778797A7B7C7D7E7F711000202010204040304050607070605350100
        021103213112044151617122130532819114A1B14223C152D1F0332462E17282
        92435315637334F1250616A2B283072635C2D2449354A317644555367465E2F2
        B384C3D375E3F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6
        E6F62737475767778797A7B7C7FFDA000C03010002110311003F00F504924950
        4A92492494A4924925292492494A4924925292492494A4924925292492494FFF
        D0F5049249504A92492494A4924925292492494A4924925292492494A4924925
        292492494FFFD1F5049249504A92492494A4924925292492494A492492529249
        2494A4924925292492494FFFD2F5049249504A92492494A4924925292492494A
        4924925292492494A4924925292492494FFFD3F5049249504A92492494A49249
        25292492494A4924925292492494A4924925292492494FFFD4F5049249504A92
        492494A4924925292492494A4924925292492494A4924925292492494FFFD5F5
        049249504A92492494A4924925292492494A4924925292492494A49249252924
        92494FFFD6F5049249504A92492494A4924925292492494A4924925292492494
        A4924925292492494FFFD7F5049249504A92492494A4924925292492494A4924
        925292492494A4924925292492494FFFD0F5049249504A92492494A492492529
        2492494A4924925292492494A4924925292492494FFFD9FFED0CD650686F746F
        73686F7020332E30003842494D04250000000000100000000000000000000000
        00000000003842494D043A000000000125000000100000000100000000000B70
        72696E744F7574707574000000050000000050737453626F6F6C010000000049
        6E7465656E756D00000000496E746500000000436C726D0000000F7072696E74
        5369787465656E426974626F6F6C000000000B7072696E7465724E616D655445
        585400000017004800500020004400650073006B006A00650074002000330035
        00310030002000730065007200690065007300000000000F7072696E7450726F
        6F6653657475704F626A63000000160043006F006E0066006900670075007200
        6100E700E3006F002000640065002000500072006F0076006100000000000A70
        726F6F6653657475700000000100000000426C746E656E756D0000000C627569
        6C74696E50726F6F660000000970726F6F66434D594B003842494D043B000000
        00022D00000010000000010000000000127072696E744F75747075744F707469
        6F6E7300000017000000004370746E626F6F6C0000000000436C6272626F6F6C
        00000000005267734D626F6F6C000000000043726E43626F6F6C000000000043
        6E7443626F6F6C00000000004C626C73626F6F6C00000000004E677476626F6F
        6C0000000000456D6C44626F6F6C0000000000496E7472626F6F6C0000000000
        42636B674F626A63000000010000000000005247424300000003000000005264
        2020646F7562406FE000000000000000000047726E20646F7562406FE0000000
        000000000000426C2020646F7562406FE000000000000000000042726454556E
        744623526C74000000000000000000000000426C6420556E744623526C740000
        0000000000000000000052736C74556E74462350786C40520000000000000000
        000A766563746F7244617461626F6F6C010000000050675073656E756D000000
        00506750730000000050675043000000004C656674556E744623526C74000000
        000000000000000000546F7020556E744623526C740000000000000000000000
        0053636C20556E74462350726340590000000000000000001063726F70576865
        6E5072696E74696E67626F6F6C000000000E63726F7052656374426F74746F6D
        6C6F6E67000000000000000C63726F70526563744C6566746C6F6E6700000000
        0000000D63726F705265637452696768746C6F6E67000000000000000B63726F
        7052656374546F706C6F6E6700000000003842494D03ED000000000010004800
        000001000200480000000100023842494D042600000000000E00000000000000
        0000003F8000003842494D040D0000000000040000005A3842494D0419000000
        0000040000001E3842494D03F300000000000900000000000000000100384249
        4D271000000000000A000100000000000000023842494D03F500000000004800
        2F66660001006C66660006000000000001002F6666000100A1999A0006000000
        000001003200000001005A00000006000000000001003500000001002D000000
        060000000000013842494D03F80000000000700000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03
        E800003842494D04080000000000100000000100000240000002400000000038
        42494D041E000000000004000000003842494D041A00000000034D0000000600
        00000000000000000001710000011B0000000C00530065006D0020005400ED00
        740075006C006F002D0031000000010000000000000000000000000000000000
        00000100000000000000000000011B0000017100000000000000000000000000
        0000000100000000000000000000000000000000000000100000000100000000
        00006E756C6C0000000200000006626F756E64734F626A630000000100000000
        0000526374310000000400000000546F70206C6F6E6700000000000000004C65
        66746C6F6E67000000000000000042746F6D6C6F6E6700000171000000005267
        68746C6F6E670000011B00000006736C69636573566C4C73000000014F626A63
        00000001000000000005736C6963650000001200000007736C69636549446C6F
        6E67000000000000000767726F757049446C6F6E6700000000000000066F7269
        67696E656E756D0000000C45536C6963654F726967696E0000000D6175746F47
        656E6572617465640000000054797065656E756D0000000A45536C6963655479
        706500000000496D672000000006626F756E64734F626A630000000100000000
        0000526374310000000400000000546F70206C6F6E6700000000000000004C65
        66746C6F6E67000000000000000042746F6D6C6F6E6700000171000000005267
        68746C6F6E670000011B0000000375726C54455854000000010000000000006E
        756C6C54455854000000010000000000004D7367655445585400000001000000
        000006616C74546167544558540000000100000000000E63656C6C5465787449
        7348544D4C626F6F6C010000000863656C6C5465787454455854000000010000
        00000009686F727A416C69676E656E756D0000000F45536C696365486F727A41
        6C69676E0000000764656661756C740000000976657274416C69676E656E756D
        0000000F45536C69636556657274416C69676E0000000764656661756C740000
        000B6267436F6C6F7254797065656E756D0000001145536C6963654247436F6C
        6F7254797065000000004E6F6E6500000009746F704F75747365746C6F6E6700
        0000000000000A6C6566744F75747365746C6F6E67000000000000000C626F74
        746F6D4F75747365746C6F6E67000000000000000B72696768744F7574736574
        6C6F6E6700000000003842494D042800000000000C000000023FF00000000000
        003842494D041100000000000101003842494D04140000000000040000000138
        42494D040C0000000003A6000000010000007B000000A0000001740000E88000
        00038A00180001FFD8FFED000C41646F62655F434D0002FFEE000E41646F6265
        00648000000001FFDB0084000C08080809080C09090C110B0A0B11150F0C0C0F
        1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E
        0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0CFFC000110800A0007B03012200021101031101
        FFDD00040008FFC4013F00000105010101010101000000000000000300010204
        05060708090A0B01000105010101010101000000000000000100020304050607
        08090A0B1000010401030204020507060805030C330100021103042112310541
        51611322718132061491A1B14223241552C16233347282D14307259253F0E1F1
        63733516A2B283264493546445C2A3743617D255E265F2B384C3D375E3F34627
        94A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F6374757677787
        97A7B7C7D7E7F711000202010204040304050607070605350100021103213112
        044151617122130532819114A1B14223C152D1F0332462E17282924353156373
        34F1250616A2B283072635C2D2449354A317644555367465E2F2B384C3D375E3
        F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F627374757
        67778797A7B7C7FFDA000C03010002110311003F00F5049249504A92492494A4
        924925292492494A4924925292492494A4924925292492494FFFD0F504924950
        4A92492494A4924925292492494A4924925292492494A4924925292492494FFF
        D1F5049249504A92492494A4924925292492494A4924925292492494A4924925
        292492494FFFD2F5049249504A92492494A4924925292492494A492492529249
        2494A4924925292492494FFFD3F5049249504A92492494A4924925292492494A
        4924925292492494A4924925292492494FFFD4F5049249504A92492494A49249
        25292492494A4924925292492494A4924925292492494FFFD5F5049249504A92
        492494A4924925292492494A4924925292492494A4924925292492494FFFD6F5
        049249504A92492494A4924925292492494A4924925292492494A49249252924
        92494FFFD7F5049249504A92492494A4924925292492494A4924925292492494
        A4924925292492494FFFD0F5049249504A92492494A4924925292492494A4924
        925292492494A4924925292492494FFFD93842494D042100000000005D000000
        01010000000F00410064006F00620065002000500068006F0074006F00730068
        006F00700000001700410064006F00620065002000500068006F0074006F0073
        0068006F00700020004300430020003200300031003700000001003842494D04
        060000000000070007010100010100FFE10CFD687474703A2F2F6E732E61646F
        62652E636F6D2F7861702F312E302F003C3F787061636B657420626567696E3D
        22EFBBBF222069643D2257354D304D7043656869487A7265537A4E54637A6B63
        3964223F3E203C783A786D706D65746120786D6C6E733A783D2261646F62653A
        6E733A6D6574612F2220783A786D70746B3D2241646F626520584D5020436F72
        6520352E362D633133382037392E3135393832342C20323031362F30392F3134
        2D30313A30393A30312020202020202020223E203C7264663A52444620786D6C
        6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F30
        322F32322D7264662D73796E7461782D6E7323223E203C7264663A4465736372
        697074696F6E207264663A61626F75743D222220786D6C6E733A786D703D2268
        7474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F2220786D6C
        6E733A64633D22687474703A2F2F7075726C2E6F72672F64632F656C656D656E
        74732F312E312F2220786D6C6E733A786D704D4D3D22687474703A2F2F6E732E
        61646F62652E636F6D2F7861702F312E302F6D6D2F2220786D6C6E733A737445
        76743D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F
        73547970652F5265736F757263654576656E74232220786D6C6E733A70686F74
        6F73686F703D22687474703A2F2F6E732E61646F62652E636F6D2F70686F746F
        73686F702F312E302F2220786D703A43726561746F72546F6F6C3D2241646F62
        652050686F746F73686F702043432032303137202857696E646F777329222078
        6D703A437265617465446174653D22323031392D30332D31335432313A30313A
        32372D30333A30302220786D703A4D65746164617461446174653D2232303139
        2D30332D31335432313A30313A32372D30333A30302220786D703A4D6F646966
        79446174653D22323031392D30332D31335432313A30313A32372D30333A3030
        222064633A666F726D61743D22696D6167652F6A7065672220786D704D4D3A49
        6E7374616E636549443D22786D702E6969643A62316535623364622D65343935
        2D393234302D386134312D6466356163313930646432362220786D704D4D3A44
        6F63756D656E7449443D22786D702E6469643A62316535623364622D65343935
        2D393234302D386134312D6466356163313930646432362220786D704D4D3A4F
        726967696E616C446F63756D656E7449443D22786D702E6469643A6231653562
        3364622D653439352D393234302D386134312D64663561633139306464323622
        2070686F746F73686F703A436F6C6F724D6F64653D2233223E203C786D704D4D
        3A486973746F72793E203C7264663A5365713E203C7264663A6C692073744576
        743A616374696F6E3D2263726561746564222073744576743A696E7374616E63
        6549443D22786D702E6969643A62316535623364622D653439352D393234302D
        386134312D646635616331393064643236222073744576743A7768656E3D2232
        3031392D30332D31335432313A30313A32372D30333A3030222073744576743A
        736F6674776172654167656E743D2241646F62652050686F746F73686F702043
        432032303137202857696E646F777329222F3E203C2F7264663A5365713E203C
        2F786D704D4D3A486973746F72793E203C2F7264663A4465736372697074696F
        6E3E203C2F7264663A5244463E203C2F783A786D706D6574613E202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020203C3F787061
        636B657420656E643D2277223F3EFFEE002141646F6265006440000000010300
        1003020306000000000000000000000000FFDB00840001010101010101010101
        0201010102020101010102020202020202020302030303030203030404040404
        0305050505050507070707070808080808080808080801010101020202040303
        0407050405070808080808080808080808080808080808080808080808080808
        0808080808080808080808080808080808080808080808FFC20011080171011B
        03011100021101031101FFC4005F000101000000000000000000000000000000
        0A01010101000000000000000000000000000005081001000000000000000000
        000000000000A01101000000000000000000000000000000A012010000000000
        00000000000000000000A0FFDA000C03010102110311000000BC2C8140000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000001FFDA00080102000105
        00539FFFDA0008010300010500539FFFDA0008010100010500539FFFDA000801
        0202063F00539FFFDA0008010302063F00539FFFDA0008010101063F00539FFF
        D9}
      Frame.Typ = []
      object Header1: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 170.078850000000000000
        Top = 18.897650000000000000
        Width = 377.953000000000000000
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 59.212636670000000000
          Top = 11.338590000000000000
          Width = 265.826943330000000000
          Height = 20.157493330000000000
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'RELAT'#211'RIO DO DIA [Date]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 20.157493330000000000
          Width = 379.212843330000000000
          Height = 17.637806670000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ' +
              '- - - - - - - - - - - - - - - - -')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 57.952793340000000000
          Top = 95.748093330000000000
          Width = 262.047413330000000000
          Height = 25.196866670000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              'CNPJ:  [Rel_Dados_Comprovante."cnpj"]    IE: [Rel_Dados_Comprova' +
              'nte."ie"]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 71.811070000000000000
          Top = 122.204803330000000000
          Width = 59.212636670000000000
          Height = 12.598433330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 137.322923340000000000
          Top = 122.078776770000000000
          Width = 52.913420000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Time]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 210.393836670000000000
          Top = 122.204803330000000000
          Width = 110.866213330000000000
          Height = 12.598433330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Tel: [Rel_Dados_Comprovante."tel"]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Top = 128.504020000000000000
          Width = 386.771903330000000000
          Height = 17.637806670000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ' +
              '- - - - - - - - - - - - - - - - - - - - ')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 59.212636670000000000
          Top = 60.472480000000000000
          Width = 260.787570000000000000
          Height = 39.055143330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[<Rel_Dados_Comprovante."endereco">] - [Rel_Dados_Comprovante."n' +
              'um"] - [Rel_Dados_Comprovante."bairro"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 60.472480000000000000
          Top = 44.094516670000000000
          Width = 262.047413330000000000
          Height = 16.377963330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'LOJA')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 90.708720000000000000
          Top = 147.401670000000000000
          Width = 205.354463330000000000
          Height = 16.377963330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'VENDAS DO DIA')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          AllowVectorExport = True
          Left = -3.779530000000000000
          Top = 336.378170000000000000
          Width = 381.732530000000000000
          Height = 11.338590000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            
              '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ' +
              '- - - - - - - - - - - - - - - - - - - ')
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 45.354360000000000000
        Top = 211.653680000000000000
        Width = 377.953000000000000000
        DataSet = rel_DS_Mov_Vendas
        DataSetName = 'RelMovVendas'
        RowCount = 0
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 52.913420000000000000
          Top = 3.779534880000000000
          Width = 32.755926670000000000
          Height = 13.858276670000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'VALOR TOTAL')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 105.826840000000000000
          Top = 3.779534880000000000
          Width = 32.755926670000000000
          Height = 13.858276670000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'MOV')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Left = 154.960730000000000000
          Top = 3.779534880000000000
          Width = 44.094516670000000000
          Height = 13.858276670000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'METODO')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          AllowVectorExport = True
          Top = 34.015770000000000000
          Width = 381.732530000000000000
          Height = 11.338590000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            
              '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ' +
              '- - - - - - - - - - - - - - - - - - - ')
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 207.874150000000000000
          Top = 3.779530000000000000
          Width = 32.755926670000000000
          Height = 13.858276670000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'FUNC')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 253.228510000000000000
          Top = 3.779530000000000000
          Width = 32.755926670000000000
          Height = 13.858276670000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'HORA')
          ParentFont = False
        end
        object RelMovVendasvalor: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 45.354360000000000000
          Top = 18.897650000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataField = 'valor'
          DataSet = rel_DS_Mov_Vendas
          DataSetName = 'RelMovVendas'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[RelMovVendas."valor"]')
          ParentFont = False
        end
        object RelMovVendasmovimento: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 90.708720000000000000
          Top = 18.897650000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataField = 'movimento'
          DataSet = rel_DS_Mov_Vendas
          DataSetName = 'RelMovVendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[RelMovVendas."movimento"]')
          ParentFont = False
        end
        object RelMovVendasmetodo: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 154.960730000000000000
          Top = 18.897650000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataField = 'metodo'
          DataSet = rel_DS_Mov_Vendas
          DataSetName = 'RelMovVendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[RelMovVendas."metodo"]')
          ParentFont = False
        end
        object RelMovVendasfuncionario: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 196.535560000000000000
          Top = 18.897650000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataField = 'funcionario'
          DataSet = rel_DS_Mov_Vendas
          DataSetName = 'RelMovVendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[RelMovVendas."funcionario"]')
          ParentFont = False
        end
        object RelMovVendashora: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 249.448980000000000000
          Top = 18.897650000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DataField = 'hora'
          DataSet = rel_DS_Mov_Vendas
          DataSetName = 'RelMovVendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[RelMovVendas."hora"]')
          ParentFont = False
        end
        object RelMovVendastroco: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 291.023810000000000000
          Top = 3.779530000000000000
          Width = 30.236240000000000000
          Height = 15.118120000000000000
          DataSet = rel_DS_Mov_Vendas
          DataSetName = 'RelMovVendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Troco')
          ParentFont = False
        end
        object RelMovVendastroco1: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 291.023810000000000000
          Top = 18.897650000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataField = 'troco'
          DataSet = rel_DS_Mov_Vendas
          DataSetName = 'RelMovVendas'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[RelMovVendas."troco"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 90.708720000000000000
        Top = 404.409710000000000000
        Width = 377.953000000000000000
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Left = 60.472480000000000000
          Top = 4.229474050000000000
          Width = 170.618782860000000000
          Height = 13.498321420000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'VALOR TOTAL CANCELAMENTO:')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          AllowVectorExport = True
          Left = 56.692950000000000000
          Top = 22.677180000000000000
          Width = 275.905690000000000000
          Height = 35.275613330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[<Rel_Dados_Comprovante."endereco">] - [Rel_Dados_Comprovante."n' +
              'um"] - [Rel_Dados_Comprovante."bairro"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Memo44: TfrxMemoView
          AllowVectorExport = True
          Left = 75.590600000000000000
          Top = 60.472480000000000000
          Width = 238.110390000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'AT'#201' AQUI NOS AJUDOU O SENHOR.  1 Samuel 7:12')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Left = 68.031540000000000000
          Top = 75.590600000000000000
          Width = 238.110390000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Desenvolvido por Bruno dos Santos - (21) 97021-7483')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          AllowVectorExport = True
          Left = 230.551330000000000000
          Top = 3.779530000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          Memo.UTF8W = (
            '[SUM(<CANC."valor">,MasterData2)]')
        end
      end
      object MasterData2: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 343.937230000000000000
        Width = 377.953000000000000000
        DataSet = DS_Rel_Canc
        DataSetName = 'CANC'
        RowCount = 0
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 52.913420000000000000
          Top = 0.000004880000000013
          Width = 32.755926670000000000
          Height = 13.858276670000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'VALOR TOTAL')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 105.826840000000000000
          Top = 0.000004880000000013
          Width = 32.755926670000000000
          Height = 13.858276670000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'MOV')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 154.960730000000000000
          Top = 0.000004880000000013
          Width = 44.094516670000000000
          Height = 13.858276670000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'METODO')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 207.874150000000000000
          Width = 32.755926670000000000
          Height = 13.858276670000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'FUNC')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Left = 253.228510000000000000
          Width = 32.755926670000000000
          Height = 13.858276670000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'HORA')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 291.023810000000000000
          Width = 30.236240000000000000
          Height = 15.118120000000000000
          DataSet = rel_DS_Mov_Vendas
          DataSetName = 'RelMovVendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Troco')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          AllowVectorExport = True
          Top = 30.236240000000000000
          Width = 393.071120000000000000
          Height = 11.338590000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            
              '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ' +
              '- - - - - - - - - - - - - - - - - - - ')
        end
        object CANCvalor: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 49.133890000000000000
          Top = 18.897650000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DataField = 'valor'
          DataSet = DS_Rel_Canc
          DataSetName = 'CANC'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[CANC."valor"]')
          ParentFont = False
        end
        object CANCmovimento: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 90.708720000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'movimento'
          DataSet = DS_Rel_Canc
          DataSetName = 'CANC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[CANC."movimento"]')
          ParentFont = False
        end
        object CANCmetodo: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 154.960730000000000000
          Top = 18.897650000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataField = 'metodo'
          DataSet = DS_Rel_Canc
          DataSetName = 'CANC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[CANC."metodo"]')
          ParentFont = False
        end
        object CANCfuncionario: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 200.315090000000000000
          Top = 18.897650000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataField = 'funcionario'
          DataSet = DS_Rel_Canc
          DataSetName = 'CANC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[CANC."funcionario"]')
          ParentFont = False
        end
        object CANChora: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 249.448980000000000000
          Top = 18.897650000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DataField = 'hora'
          DataSet = DS_Rel_Canc
          DataSetName = 'CANC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[CANC."hora"]')
          ParentFont = False
        end
        object CANCtroco: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 291.023810000000000000
          Top = 18.897650000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          DataField = 'troco'
          DataSet = DS_Rel_Canc
          DataSetName = 'CANC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -7
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[CANC."troco"]')
          ParentFont = False
        end
      end
      object Footer2: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 42.834673330000000000
        Top = 279.685220000000000000
        Width = 377.953000000000000000
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 83.149660000000000000
          Top = 26.456710000000000000
          Width = 205.354463330000000000
          Height = 16.377963330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'CANCELAMENTOS')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          AllowVectorExport = True
          Left = 75.590600000000000000
          Top = 0.539932860000000000
          Width = 155.500662860000000000
          Height = 16.197985710000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'VALOR TOTAL DA VENDA:')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          AllowVectorExport = True
          Left = 241.889920000000000000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          Memo.UTF8W = (
            '[SUM(<RelMovVendas."valor">,MasterData1)]')
        end
        object Memo49: TfrxMemoView
          AllowVectorExport = True
          Top = 15.118120000000000000
          Width = 386.771903330000000000
          Height = 17.637806670000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ' +
              '- - - - - - - - - - - - - - - - - - - - ')
          ParentFont = False
        end
      end
    end
  end
  object query_canc: TFDQuery
    Connection = fd
    SQL.Strings = (
      'select * from movimentacoes')
    Left = 680
    Top = 664
    object query_cancid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object query_canctipo: TStringField
      FieldName = 'tipo'
      Origin = 'tipo'
      Required = True
      Size = 10
    end
    object query_cancmovimento: TStringField
      FieldName = 'movimento'
      Origin = 'movimento'
      Required = True
    end
    object query_cancdesconto: TBCDField
      FieldName = 'desconto'
      Origin = 'desconto'
      Required = True
      Precision = 10
      Size = 2
    end
    object query_cancvalor: TBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
      Precision = 10
      Size = 2
    end
    object query_cancmetodo: TStringField
      FieldName = 'metodo'
      Origin = 'metodo'
      Required = True
      Size = 15
    end
    object query_cancstatus: TStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 15
    end
    object query_cancvalor_pago: TBCDField
      FieldName = 'valor_pago'
      Origin = 'valor_pago'
      Required = True
      Precision = 10
      Size = 2
    end
    object query_canctroco: TBCDField
      FieldName = 'troco'
      Origin = 'troco'
      Required = True
      Precision = 10
      Size = 2
    end
    object query_cancfuncionario: TStringField
      FieldName = 'funcionario'
      Origin = 'funcionario'
      Required = True
    end
    object query_cancdata: TDateField
      FieldName = 'data'
      Origin = 'data'
      Required = True
    end
    object query_canchora: TTimeField
      FieldName = 'hora'
      Origin = 'hora'
      Required = True
    end
    object query_cancid_movimento: TIntegerField
      FieldName = 'id_movimento'
      Origin = 'id_movimento'
      Required = True
    end
  end
  object query_cor_produtos: TFDQuery
    Connection = fd
    Left = 728
    Top = 168
  end
  object Rel_abertura: TfrxReport
    Version = '6.2.1'
    DataSet = rel_DS_Caixa
    DataSetName = 'DSCaixa'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44132.179217210700000000
    ReportOptions.LastChange = 44132.193642175920000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 120
    Top = 712
    Datasets = <
      item
        DataSet = rel_DS_Caixa
        DataSetName = 'DSCaixa'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 100.000000000000000000
      PaperHeight = 20.000000000000000000
      PaperSize = 256
      BackPicture.Data = {
        0A544A504547496D61676592220000FFD8FFE104C44578696600004D4D002A00
        0000080007011200030000000100010000011A00050000000100000062011B00
        05000000010000006A0128000300000001000200000131000200000022000000
        720132000200000014000000948769000400000001000000A8000000D4000AFC
        8000002710000AFC800000271041646F62652050686F746F73686F7020434320
        32303137202857696E646F77732900323031393A30333A31332032313A30313A
        3237000003A001000300000001FFFF0000A0020004000000010000011BA00300
        0400000001000001710000000000000006010300030000000100060000011A00
        050000000100000122011B0005000000010000012A0128000300000001000200
        0002010004000000010000013202020004000000010000038A00000000000000
        48000000010000004800000001FFD8FFED000C41646F62655F434D0002FFEE00
        0E41646F626500648000000001FFDB0084000C08080809080C09090C110B0A0B
        11150F0C0C0F1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E
        0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC000110800A0007B03012200
        021101031101FFDD00040008FFC4013F00000105010101010101000000000000
        00030001020405060708090A0B01000105010101010101000000000000000100
        02030405060708090A0B1000010401030204020507060805030C330100021103
        04211231054151611322718132061491A1B14223241552C16233347282D14307
        259253F0E1F163733516A2B283264493546445C2A3743617D255E265F2B384C3
        D375E3F3462794A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F6
        37475767778797A7B7C7D7E7F711000202010204040304050607070605350100
        021103213112044151617122130532819114A1B14223C152D1F0332462E17282
        92435315637334F1250616A2B283072635C2D2449354A317644555367465E2F2
        B384C3D375E3F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6
        E6F62737475767778797A7B7C7FFDA000C03010002110311003F00F504924950
        4A92492494A4924925292492494A4924925292492494A4924925292492494FFF
        D0F5049249504A92492494A4924925292492494A4924925292492494A4924925
        292492494FFFD1F5049249504A92492494A4924925292492494A492492529249
        2494A4924925292492494FFFD2F5049249504A92492494A4924925292492494A
        4924925292492494A4924925292492494FFFD3F5049249504A92492494A49249
        25292492494A4924925292492494A4924925292492494FFFD4F5049249504A92
        492494A4924925292492494A4924925292492494A4924925292492494FFFD5F5
        049249504A92492494A4924925292492494A4924925292492494A49249252924
        92494FFFD6F5049249504A92492494A4924925292492494A4924925292492494
        A4924925292492494FFFD7F5049249504A92492494A4924925292492494A4924
        925292492494A4924925292492494FFFD0F5049249504A92492494A492492529
        2492494A4924925292492494A4924925292492494FFFD9FFED0CD650686F746F
        73686F7020332E30003842494D04250000000000100000000000000000000000
        00000000003842494D043A000000000125000000100000000100000000000B70
        72696E744F7574707574000000050000000050737453626F6F6C010000000049
        6E7465656E756D00000000496E746500000000436C726D0000000F7072696E74
        5369787465656E426974626F6F6C000000000B7072696E7465724E616D655445
        585400000017004800500020004400650073006B006A00650074002000330035
        00310030002000730065007200690065007300000000000F7072696E7450726F
        6F6653657475704F626A63000000160043006F006E0066006900670075007200
        6100E700E3006F002000640065002000500072006F0076006100000000000A70
        726F6F6653657475700000000100000000426C746E656E756D0000000C627569
        6C74696E50726F6F660000000970726F6F66434D594B003842494D043B000000
        00022D00000010000000010000000000127072696E744F75747075744F707469
        6F6E7300000017000000004370746E626F6F6C0000000000436C6272626F6F6C
        00000000005267734D626F6F6C000000000043726E43626F6F6C000000000043
        6E7443626F6F6C00000000004C626C73626F6F6C00000000004E677476626F6F
        6C0000000000456D6C44626F6F6C0000000000496E7472626F6F6C0000000000
        42636B674F626A63000000010000000000005247424300000003000000005264
        2020646F7562406FE000000000000000000047726E20646F7562406FE0000000
        000000000000426C2020646F7562406FE000000000000000000042726454556E
        744623526C74000000000000000000000000426C6420556E744623526C740000
        0000000000000000000052736C74556E74462350786C40520000000000000000
        000A766563746F7244617461626F6F6C010000000050675073656E756D000000
        00506750730000000050675043000000004C656674556E744623526C74000000
        000000000000000000546F7020556E744623526C740000000000000000000000
        0053636C20556E74462350726340590000000000000000001063726F70576865
        6E5072696E74696E67626F6F6C000000000E63726F7052656374426F74746F6D
        6C6F6E67000000000000000C63726F70526563744C6566746C6F6E6700000000
        0000000D63726F705265637452696768746C6F6E67000000000000000B63726F
        7052656374546F706C6F6E6700000000003842494D03ED000000000010004800
        000001000200480000000100023842494D042600000000000E00000000000000
        0000003F8000003842494D040D0000000000040000005A3842494D0419000000
        0000040000001E3842494D03F300000000000900000000000000000100384249
        4D271000000000000A000100000000000000023842494D03F500000000004800
        2F66660001006C66660006000000000001002F6666000100A1999A0006000000
        000001003200000001005A00000006000000000001003500000001002D000000
        060000000000013842494D03F80000000000700000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03
        E800003842494D04080000000000100000000100000240000002400000000038
        42494D041E000000000004000000003842494D041A00000000034D0000000600
        00000000000000000001710000011B0000000C00530065006D0020005400ED00
        740075006C006F002D0031000000010000000000000000000000000000000000
        00000100000000000000000000011B0000017100000000000000000000000000
        0000000100000000000000000000000000000000000000100000000100000000
        00006E756C6C0000000200000006626F756E64734F626A630000000100000000
        0000526374310000000400000000546F70206C6F6E6700000000000000004C65
        66746C6F6E67000000000000000042746F6D6C6F6E6700000171000000005267
        68746C6F6E670000011B00000006736C69636573566C4C73000000014F626A63
        00000001000000000005736C6963650000001200000007736C69636549446C6F
        6E67000000000000000767726F757049446C6F6E6700000000000000066F7269
        67696E656E756D0000000C45536C6963654F726967696E0000000D6175746F47
        656E6572617465640000000054797065656E756D0000000A45536C6963655479
        706500000000496D672000000006626F756E64734F626A630000000100000000
        0000526374310000000400000000546F70206C6F6E6700000000000000004C65
        66746C6F6E67000000000000000042746F6D6C6F6E6700000171000000005267
        68746C6F6E670000011B0000000375726C54455854000000010000000000006E
        756C6C54455854000000010000000000004D7367655445585400000001000000
        000006616C74546167544558540000000100000000000E63656C6C5465787449
        7348544D4C626F6F6C010000000863656C6C5465787454455854000000010000
        00000009686F727A416C69676E656E756D0000000F45536C696365486F727A41
        6C69676E0000000764656661756C740000000976657274416C69676E656E756D
        0000000F45536C69636556657274416C69676E0000000764656661756C740000
        000B6267436F6C6F7254797065656E756D0000001145536C6963654247436F6C
        6F7254797065000000004E6F6E6500000009746F704F75747365746C6F6E6700
        0000000000000A6C6566744F75747365746C6F6E67000000000000000C626F74
        746F6D4F75747365746C6F6E67000000000000000B72696768744F7574736574
        6C6F6E6700000000003842494D042800000000000C000000023FF00000000000
        003842494D041100000000000101003842494D04140000000000040000000138
        42494D040C0000000003A6000000010000007B000000A0000001740000E88000
        00038A00180001FFD8FFED000C41646F62655F434D0002FFEE000E41646F6265
        00648000000001FFDB0084000C08080809080C09090C110B0A0B11150F0C0C0F
        1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E
        0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0CFFC000110800A0007B03012200021101031101
        FFDD00040008FFC4013F00000105010101010101000000000000000300010204
        05060708090A0B01000105010101010101000000000000000100020304050607
        08090A0B1000010401030204020507060805030C330100021103042112310541
        51611322718132061491A1B14223241552C16233347282D14307259253F0E1F1
        63733516A2B283264493546445C2A3743617D255E265F2B384C3D375E3F34627
        94A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F6374757677787
        97A7B7C7D7E7F711000202010204040304050607070605350100021103213112
        044151617122130532819114A1B14223C152D1F0332462E17282924353156373
        34F1250616A2B283072635C2D2449354A317644555367465E2F2B384C3D375E3
        F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F627374757
        67778797A7B7C7FFDA000C03010002110311003F00F5049249504A92492494A4
        924925292492494A4924925292492494A4924925292492494FFFD0F504924950
        4A92492494A4924925292492494A4924925292492494A4924925292492494FFF
        D1F5049249504A92492494A4924925292492494A4924925292492494A4924925
        292492494FFFD2F5049249504A92492494A4924925292492494A492492529249
        2494A4924925292492494FFFD3F5049249504A92492494A4924925292492494A
        4924925292492494A4924925292492494FFFD4F5049249504A92492494A49249
        25292492494A4924925292492494A4924925292492494FFFD5F5049249504A92
        492494A4924925292492494A4924925292492494A4924925292492494FFFD6F5
        049249504A92492494A4924925292492494A4924925292492494A49249252924
        92494FFFD7F5049249504A92492494A4924925292492494A4924925292492494
        A4924925292492494FFFD0F5049249504A92492494A4924925292492494A4924
        925292492494A4924925292492494FFFD93842494D042100000000005D000000
        01010000000F00410064006F00620065002000500068006F0074006F00730068
        006F00700000001700410064006F00620065002000500068006F0074006F0073
        0068006F00700020004300430020003200300031003700000001003842494D04
        060000000000070007010100010100FFE10CFD687474703A2F2F6E732E61646F
        62652E636F6D2F7861702F312E302F003C3F787061636B657420626567696E3D
        22EFBBBF222069643D2257354D304D7043656869487A7265537A4E54637A6B63
        3964223F3E203C783A786D706D65746120786D6C6E733A783D2261646F62653A
        6E733A6D6574612F2220783A786D70746B3D2241646F626520584D5020436F72
        6520352E362D633133382037392E3135393832342C20323031362F30392F3134
        2D30313A30393A30312020202020202020223E203C7264663A52444620786D6C
        6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F30
        322F32322D7264662D73796E7461782D6E7323223E203C7264663A4465736372
        697074696F6E207264663A61626F75743D222220786D6C6E733A786D703D2268
        7474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F2220786D6C
        6E733A64633D22687474703A2F2F7075726C2E6F72672F64632F656C656D656E
        74732F312E312F2220786D6C6E733A786D704D4D3D22687474703A2F2F6E732E
        61646F62652E636F6D2F7861702F312E302F6D6D2F2220786D6C6E733A737445
        76743D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F
        73547970652F5265736F757263654576656E74232220786D6C6E733A70686F74
        6F73686F703D22687474703A2F2F6E732E61646F62652E636F6D2F70686F746F
        73686F702F312E302F2220786D703A43726561746F72546F6F6C3D2241646F62
        652050686F746F73686F702043432032303137202857696E646F777329222078
        6D703A437265617465446174653D22323031392D30332D31335432313A30313A
        32372D30333A30302220786D703A4D65746164617461446174653D2232303139
        2D30332D31335432313A30313A32372D30333A30302220786D703A4D6F646966
        79446174653D22323031392D30332D31335432313A30313A32372D30333A3030
        222064633A666F726D61743D22696D6167652F6A7065672220786D704D4D3A49
        6E7374616E636549443D22786D702E6969643A62316535623364622D65343935
        2D393234302D386134312D6466356163313930646432362220786D704D4D3A44
        6F63756D656E7449443D22786D702E6469643A62316535623364622D65343935
        2D393234302D386134312D6466356163313930646432362220786D704D4D3A4F
        726967696E616C446F63756D656E7449443D22786D702E6469643A6231653562
        3364622D653439352D393234302D386134312D64663561633139306464323622
        2070686F746F73686F703A436F6C6F724D6F64653D2233223E203C786D704D4D
        3A486973746F72793E203C7264663A5365713E203C7264663A6C692073744576
        743A616374696F6E3D2263726561746564222073744576743A696E7374616E63
        6549443D22786D702E6969643A62316535623364622D653439352D393234302D
        386134312D646635616331393064643236222073744576743A7768656E3D2232
        3031392D30332D31335432313A30313A32372D30333A3030222073744576743A
        736F6674776172654167656E743D2241646F62652050686F746F73686F702043
        432032303137202857696E646F777329222F3E203C2F7264663A5365713E203C
        2F786D704D4D3A486973746F72793E203C2F7264663A4465736372697074696F
        6E3E203C2F7264663A5244463E203C2F783A786D706D6574613E202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020203C3F787061
        636B657420656E643D2277223F3EFFEE002141646F6265006440000000010300
        1003020306000000000000000000000000FFDB00840001010101010101010101
        0201010102020101010102020202020202020302030303030203030404040404
        0305050505050507070707070808080808080808080801010101020202040303
        0407050405070808080808080808080808080808080808080808080808080808
        0808080808080808080808080808080808080808080808FFC20011080171011B
        03011100021101031101FFC4005F000101000000000000000000000000000000
        0A01010101000000000000000000000000000005081001000000000000000000
        000000000000A01101000000000000000000000000000000A012010000000000
        00000000000000000000A0FFDA000C03010102110311000000BC2C8140000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000001FFDA00080102000105
        00539FFFDA0008010300010500539FFFDA0008010100010500539FFFDA000801
        0202063F00539FFFDA0008010302063F00539FFFDA0008010101063F00539FFF
        D9}
      Frame.Typ = []
      object Memo53: TfrxMemoView
        AllowVectorExport = True
        Left = 60.472480000000000000
        Top = 30.236240000000000000
        Width = 62.992166670000000000
        Height = 13.858276670000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          'VALOR ABER')
        ParentFont = False
      end
      object Memo54: TfrxMemoView
        AllowVectorExport = True
        Left = 124.724490000000000000
        Top = 30.236240000000000000
        Width = 66.771696670000000000
        Height = 13.858276670000000000
        DataSet = rel_DS_Caixa
        DataSetName = 'DSCaixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          'VALOR FECH')
        ParentFont = False
      end
      object Memo56: TfrxMemoView
        AllowVectorExport = True
        Left = 196.535560000000000000
        Top = 30.236240000000000000
        Width = 62.992166670000000000
        Height = 13.858276670000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          'VALOR VEND')
        ParentFont = False
      end
      object Memo57: TfrxMemoView
        AllowVectorExport = True
        Left = 260.787570000000000000
        Top = 30.236240000000000000
        Width = 70.551226670000000000
        Height = 13.858276670000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          'VALOR QUEBRA')
        ParentFont = False
      end
      object DSCaixavalor_abertura: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 60.472480000000000000
        Top = 41.574830000000000000
        Width = 64.252010000000000000
        Height = 18.897650000000000000
        DataSet = rel_DS_Caixa
        DataSetName = 'DSCaixa'
        DisplayFormat.FormatStr = '%2.2m'
        DisplayFormat.Kind = fkNumeric
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          '[DSCaixa."valor_abertura"]')
        ParentFont = False
      end
      object DSCaixavalor_fechamento: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 124.724490000000000000
        Top = 41.574830000000000000
        Width = 68.031540000000000000
        Height = 18.897650000000000000
        DataField = 'valor_fechamento'
        DataSet = rel_DS_Caixa
        DataSetName = 'DSCaixa'
        DisplayFormat.FormatStr = '%2.2m'
        DisplayFormat.Kind = fkNumeric
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          '[DSCaixa."valor_fechamento"]')
        ParentFont = False
      end
      object DSCaixavalor_vendido: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 196.535560000000000000
        Top = 41.574830000000000000
        Width = 64.252010000000000000
        Height = 18.897650000000000000
        DataField = 'valor_vendido'
        DataSet = rel_DS_Caixa
        DataSetName = 'DSCaixa'
        DisplayFormat.FormatStr = '%2.2m'
        DisplayFormat.Kind = fkNumeric
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          '[DSCaixa."valor_vendido"]')
        ParentFont = False
      end
      object DSCaixavalor_quebra: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 260.787570000000000000
        Top = 41.574830000000000000
        Width = 71.811070000000000000
        Height = 18.897650000000000000
        DataField = 'valor_quebra'
        DataSet = rel_DS_Caixa
        DataSetName = 'DSCaixa'
        DisplayFormat.FormatStr = '%2.2m'
        DisplayFormat.Kind = fkNumeric
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          '[DSCaixa."valor_quebra"]')
        ParentFont = False
      end
      object DSCaixafuncionario_abertura: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 245.669450000000000000
        Top = 10.204724410000000000
        Width = 83.149660000000000000
        Height = 18.897650000000000000
        DataField = 'funcionario_abertura'
        DataSet = rel_DS_Caixa
        DataSetName = 'DSCaixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Memo.UTF8W = (
          '[DSCaixa."funcionario_abertura"]')
        ParentFont = False
      end
      object Memo1: TfrxMemoView
        AllowVectorExport = True
        Left = 86.929190000000000000
        Top = 7.559060000000000000
        Width = 154.960730000000000000
        Height = 15.118120000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          'Informa'#231#245'es do caixa da ')
        ParentFont = False
      end
    end
  end
  object tb_retirada: TFDTable
    IndexFieldNames = 'id'
    Connection = fd
    UpdateOptions.UpdateTableName = 'retirada_caixa'
    TableName = 'retirada_caixa'
    Left = 576
    Top = 504
  end
  object query_retirada: TFDQuery
    Connection = fd
    SQL.Strings = (
      'select *  from retirada_caixa')
    Left = 624
    Top = 512
  end
  object DSRetirada: TDataSource
    DataSet = query_retirada
    Left = 672
    Top = 488
  end
  object rel_retirada: TfrxDBDataset
    UserName = 'rel_retirada'
    CloseDataSource = False
    FieldAliases.Strings = (
      'id=id'
      'funcionario=funcionario'
      'valor=valor'
      'motivo=motivo'
      'data=data'
      'hora=hora')
    DataSet = query_retirada
    BCDToCurrency = False
    Left = 120
    Top = 608
  end
  object query_canc2: TFDQuery
    Connection = fd
    SQL.Strings = (
      'select * from movimentacoes')
    Left = 672
    Top = 744
  end
  object rel_DS_Estoque: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    DataSet = query_produtos
    BCDToCurrency = False
    Left = 240
    Top = 888
  end
  object rel_Estoque: TfrxReport
    Version = '6.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44153.737074085600000000
    ReportOptions.LastChange = 44153.757115150500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 320
    Top = 888
    Datasets = <
      item
        DataSet = rel_DS_Estoque
        DataSetName = 'frxDBDataset2'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 100.000000000000000000
      PaperHeight = 125.000000000000000000
      PaperSize = 256
      BackPicture.Data = {
        0A544A504547496D61676592220000FFD8FFE104C44578696600004D4D002A00
        0000080007011200030000000100010000011A00050000000100000062011B00
        05000000010000006A0128000300000001000200000131000200000022000000
        720132000200000014000000948769000400000001000000A8000000D4000AFC
        8000002710000AFC800000271041646F62652050686F746F73686F7020434320
        32303137202857696E646F77732900323031393A30333A31332032313A30313A
        3237000003A001000300000001FFFF0000A0020004000000010000011BA00300
        0400000001000001710000000000000006010300030000000100060000011A00
        050000000100000122011B0005000000010000012A0128000300000001000200
        0002010004000000010000013202020004000000010000038A00000000000000
        48000000010000004800000001FFD8FFED000C41646F62655F434D0002FFEE00
        0E41646F626500648000000001FFDB0084000C08080809080C09090C110B0A0B
        11150F0C0C0F1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E
        0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC000110800A0007B03012200
        021101031101FFDD00040008FFC4013F00000105010101010101000000000000
        00030001020405060708090A0B01000105010101010101000000000000000100
        02030405060708090A0B1000010401030204020507060805030C330100021103
        04211231054151611322718132061491A1B14223241552C16233347282D14307
        259253F0E1F163733516A2B283264493546445C2A3743617D255E265F2B384C3
        D375E3F3462794A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F6
        37475767778797A7B7C7D7E7F711000202010204040304050607070605350100
        021103213112044151617122130532819114A1B14223C152D1F0332462E17282
        92435315637334F1250616A2B283072635C2D2449354A317644555367465E2F2
        B384C3D375E3F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6
        E6F62737475767778797A7B7C7FFDA000C03010002110311003F00F504924950
        4A92492494A4924925292492494A4924925292492494A4924925292492494FFF
        D0F5049249504A92492494A4924925292492494A4924925292492494A4924925
        292492494FFFD1F5049249504A92492494A4924925292492494A492492529249
        2494A4924925292492494FFFD2F5049249504A92492494A4924925292492494A
        4924925292492494A4924925292492494FFFD3F5049249504A92492494A49249
        25292492494A4924925292492494A4924925292492494FFFD4F5049249504A92
        492494A4924925292492494A4924925292492494A4924925292492494FFFD5F5
        049249504A92492494A4924925292492494A4924925292492494A49249252924
        92494FFFD6F5049249504A92492494A4924925292492494A4924925292492494
        A4924925292492494FFFD7F5049249504A92492494A4924925292492494A4924
        925292492494A4924925292492494FFFD0F5049249504A92492494A492492529
        2492494A4924925292492494A4924925292492494FFFD9FFED0CD650686F746F
        73686F7020332E30003842494D04250000000000100000000000000000000000
        00000000003842494D043A000000000125000000100000000100000000000B70
        72696E744F7574707574000000050000000050737453626F6F6C010000000049
        6E7465656E756D00000000496E746500000000436C726D0000000F7072696E74
        5369787465656E426974626F6F6C000000000B7072696E7465724E616D655445
        585400000017004800500020004400650073006B006A00650074002000330035
        00310030002000730065007200690065007300000000000F7072696E7450726F
        6F6653657475704F626A63000000160043006F006E0066006900670075007200
        6100E700E3006F002000640065002000500072006F0076006100000000000A70
        726F6F6653657475700000000100000000426C746E656E756D0000000C627569
        6C74696E50726F6F660000000970726F6F66434D594B003842494D043B000000
        00022D00000010000000010000000000127072696E744F75747075744F707469
        6F6E7300000017000000004370746E626F6F6C0000000000436C6272626F6F6C
        00000000005267734D626F6F6C000000000043726E43626F6F6C000000000043
        6E7443626F6F6C00000000004C626C73626F6F6C00000000004E677476626F6F
        6C0000000000456D6C44626F6F6C0000000000496E7472626F6F6C0000000000
        42636B674F626A63000000010000000000005247424300000003000000005264
        2020646F7562406FE000000000000000000047726E20646F7562406FE0000000
        000000000000426C2020646F7562406FE000000000000000000042726454556E
        744623526C74000000000000000000000000426C6420556E744623526C740000
        0000000000000000000052736C74556E74462350786C40520000000000000000
        000A766563746F7244617461626F6F6C010000000050675073656E756D000000
        00506750730000000050675043000000004C656674556E744623526C74000000
        000000000000000000546F7020556E744623526C740000000000000000000000
        0053636C20556E74462350726340590000000000000000001063726F70576865
        6E5072696E74696E67626F6F6C000000000E63726F7052656374426F74746F6D
        6C6F6E67000000000000000C63726F70526563744C6566746C6F6E6700000000
        0000000D63726F705265637452696768746C6F6E67000000000000000B63726F
        7052656374546F706C6F6E6700000000003842494D03ED000000000010004800
        000001000200480000000100023842494D042600000000000E00000000000000
        0000003F8000003842494D040D0000000000040000005A3842494D0419000000
        0000040000001E3842494D03F300000000000900000000000000000100384249
        4D271000000000000A000100000000000000023842494D03F500000000004800
        2F66660001006C66660006000000000001002F6666000100A1999A0006000000
        000001003200000001005A00000006000000000001003500000001002D000000
        060000000000013842494D03F80000000000700000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03
        E800003842494D04080000000000100000000100000240000002400000000038
        42494D041E000000000004000000003842494D041A00000000034D0000000600
        00000000000000000001710000011B0000000C00530065006D0020005400ED00
        740075006C006F002D0031000000010000000000000000000000000000000000
        00000100000000000000000000011B0000017100000000000000000000000000
        0000000100000000000000000000000000000000000000100000000100000000
        00006E756C6C0000000200000006626F756E64734F626A630000000100000000
        0000526374310000000400000000546F70206C6F6E6700000000000000004C65
        66746C6F6E67000000000000000042746F6D6C6F6E6700000171000000005267
        68746C6F6E670000011B00000006736C69636573566C4C73000000014F626A63
        00000001000000000005736C6963650000001200000007736C69636549446C6F
        6E67000000000000000767726F757049446C6F6E6700000000000000066F7269
        67696E656E756D0000000C45536C6963654F726967696E0000000D6175746F47
        656E6572617465640000000054797065656E756D0000000A45536C6963655479
        706500000000496D672000000006626F756E64734F626A630000000100000000
        0000526374310000000400000000546F70206C6F6E6700000000000000004C65
        66746C6F6E67000000000000000042746F6D6C6F6E6700000171000000005267
        68746C6F6E670000011B0000000375726C54455854000000010000000000006E
        756C6C54455854000000010000000000004D7367655445585400000001000000
        000006616C74546167544558540000000100000000000E63656C6C5465787449
        7348544D4C626F6F6C010000000863656C6C5465787454455854000000010000
        00000009686F727A416C69676E656E756D0000000F45536C696365486F727A41
        6C69676E0000000764656661756C740000000976657274416C69676E656E756D
        0000000F45536C69636556657274416C69676E0000000764656661756C740000
        000B6267436F6C6F7254797065656E756D0000001145536C6963654247436F6C
        6F7254797065000000004E6F6E6500000009746F704F75747365746C6F6E6700
        0000000000000A6C6566744F75747365746C6F6E67000000000000000C626F74
        746F6D4F75747365746C6F6E67000000000000000B72696768744F7574736574
        6C6F6E6700000000003842494D042800000000000C000000023FF00000000000
        003842494D041100000000000101003842494D04140000000000040000000138
        42494D040C0000000003A6000000010000007B000000A0000001740000E88000
        00038A00180001FFD8FFED000C41646F62655F434D0002FFEE000E41646F6265
        00648000000001FFDB0084000C08080809080C09090C110B0A0B11150F0C0C0F
        1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E
        0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0CFFC000110800A0007B03012200021101031101
        FFDD00040008FFC4013F00000105010101010101000000000000000300010204
        05060708090A0B01000105010101010101000000000000000100020304050607
        08090A0B1000010401030204020507060805030C330100021103042112310541
        51611322718132061491A1B14223241552C16233347282D14307259253F0E1F1
        63733516A2B283264493546445C2A3743617D255E265F2B384C3D375E3F34627
        94A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F6374757677787
        97A7B7C7D7E7F711000202010204040304050607070605350100021103213112
        044151617122130532819114A1B14223C152D1F0332462E17282924353156373
        34F1250616A2B283072635C2D2449354A317644555367465E2F2B384C3D375E3
        F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F627374757
        67778797A7B7C7FFDA000C03010002110311003F00F5049249504A92492494A4
        924925292492494A4924925292492494A4924925292492494FFFD0F504924950
        4A92492494A4924925292492494A4924925292492494A4924925292492494FFF
        D1F5049249504A92492494A4924925292492494A4924925292492494A4924925
        292492494FFFD2F5049249504A92492494A4924925292492494A492492529249
        2494A4924925292492494FFFD3F5049249504A92492494A4924925292492494A
        4924925292492494A4924925292492494FFFD4F5049249504A92492494A49249
        25292492494A4924925292492494A4924925292492494FFFD5F5049249504A92
        492494A4924925292492494A4924925292492494A4924925292492494FFFD6F5
        049249504A92492494A4924925292492494A4924925292492494A49249252924
        92494FFFD7F5049249504A92492494A4924925292492494A4924925292492494
        A4924925292492494FFFD0F5049249504A92492494A4924925292492494A4924
        925292492494A4924925292492494FFFD93842494D042100000000005D000000
        01010000000F00410064006F00620065002000500068006F0074006F00730068
        006F00700000001700410064006F00620065002000500068006F0074006F0073
        0068006F00700020004300430020003200300031003700000001003842494D04
        060000000000070007010100010100FFE10CFD687474703A2F2F6E732E61646F
        62652E636F6D2F7861702F312E302F003C3F787061636B657420626567696E3D
        22EFBBBF222069643D2257354D304D7043656869487A7265537A4E54637A6B63
        3964223F3E203C783A786D706D65746120786D6C6E733A783D2261646F62653A
        6E733A6D6574612F2220783A786D70746B3D2241646F626520584D5020436F72
        6520352E362D633133382037392E3135393832342C20323031362F30392F3134
        2D30313A30393A30312020202020202020223E203C7264663A52444620786D6C
        6E733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F30
        322F32322D7264662D73796E7461782D6E7323223E203C7264663A4465736372
        697074696F6E207264663A61626F75743D222220786D6C6E733A786D703D2268
        7474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F2220786D6C
        6E733A64633D22687474703A2F2F7075726C2E6F72672F64632F656C656D656E
        74732F312E312F2220786D6C6E733A786D704D4D3D22687474703A2F2F6E732E
        61646F62652E636F6D2F7861702F312E302F6D6D2F2220786D6C6E733A737445
        76743D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F
        73547970652F5265736F757263654576656E74232220786D6C6E733A70686F74
        6F73686F703D22687474703A2F2F6E732E61646F62652E636F6D2F70686F746F
        73686F702F312E302F2220786D703A43726561746F72546F6F6C3D2241646F62
        652050686F746F73686F702043432032303137202857696E646F777329222078
        6D703A437265617465446174653D22323031392D30332D31335432313A30313A
        32372D30333A30302220786D703A4D65746164617461446174653D2232303139
        2D30332D31335432313A30313A32372D30333A30302220786D703A4D6F646966
        79446174653D22323031392D30332D31335432313A30313A32372D30333A3030
        222064633A666F726D61743D22696D6167652F6A7065672220786D704D4D3A49
        6E7374616E636549443D22786D702E6969643A62316535623364622D65343935
        2D393234302D386134312D6466356163313930646432362220786D704D4D3A44
        6F63756D656E7449443D22786D702E6469643A62316535623364622D65343935
        2D393234302D386134312D6466356163313930646432362220786D704D4D3A4F
        726967696E616C446F63756D656E7449443D22786D702E6469643A6231653562
        3364622D653439352D393234302D386134312D64663561633139306464323622
        2070686F746F73686F703A436F6C6F724D6F64653D2233223E203C786D704D4D
        3A486973746F72793E203C7264663A5365713E203C7264663A6C692073744576
        743A616374696F6E3D2263726561746564222073744576743A696E7374616E63
        6549443D22786D702E6969643A62316535623364622D653439352D393234302D
        386134312D646635616331393064643236222073744576743A7768656E3D2232
        3031392D30332D31335432313A30313A32372D30333A3030222073744576743A
        736F6674776172654167656E743D2241646F62652050686F746F73686F702043
        432032303137202857696E646F777329222F3E203C2F7264663A5365713E203C
        2F786D704D4D3A486973746F72793E203C2F7264663A4465736372697074696F
        6E3E203C2F7264663A5244463E203C2F783A786D706D6574613E202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020202020202020202020202020202020202020202020203C3F787061
        636B657420656E643D2277223F3EFFEE002141646F6265006440000000010300
        1003020306000000000000000000000000FFDB00840001010101010101010101
        0201010102020101010102020202020202020302030303030203030404040404
        0305050505050507070707070808080808080808080801010101020202040303
        0407050405070808080808080808080808080808080808080808080808080808
        0808080808080808080808080808080808080808080808FFC20011080171011B
        03011100021101031101FFC4005F000101000000000000000000000000000000
        0A01010101000000000000000000000000000005081001000000000000000000
        000000000000A01101000000000000000000000000000000A012010000000000
        00000000000000000000A0FFDA000C03010102110311000000BC2C8140000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000001FFDA00080102000105
        00539FFFDA0008010300010500539FFFDA0008010100010500539FFFDA000801
        0202063F00539FFFDA0008010302063F00539FFFDA0008010101063F00539FFF
        D9}
      Frame.Typ = []
      object Header1: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 56.692950000000000000
        Top = 18.897650000000000000
        Width = 377.953000000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 113.385900000000000000
          Top = 18.897650000000000000
          Width = 143.622140000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'ESTOQUE BAIXO')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 60.472480000000000000
        Top = 98.267780000000000000
        Width = 377.953000000000000000
        DataSet = rel_DS_Estoque
        DataSetName = 'frxDBDataset2'
        RowCount = 0
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 90.708720000000000000
          Top = 3.779530000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Nome')
          ParentFont = False
        end
        object frxDBDataset2estoque: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 215.433210000000000000
          Top = 22.677180000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'estoque'
          DataSet = rel_DS_Estoque
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset2."estoque"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 200.315090000000000000
          Top = 3.779530000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Estoque Atual')
          ParentFont = False
        end
        object frxDBDataset2nome: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 41.574830000000000000
          Top = 22.677180000000000000
          Width = 151.181200000000000000
          Height = 30.236240000000000000
          DataField = 'nome'
          DataSet = rel_DS_Estoque
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset2."nome"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Top = 45.354360000000000000
          Width = 389.291590000000000000
          Height = 11.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              '- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ' +
              '- - - - - - - - - - - - - - - - - - - - - - - - - - - ')
          ParentFont = False
        end
      end
    end
  end
  object query_det_entradas: TFDQuery
    Active = True
    Connection = fd
    SQL.Strings = (
      'select * from detalhes_entradas')
    Left = 600
    Top = 424
    object query_det_entradascod_exc: TIntegerField
      DisplayWidth = 6
      FieldName = 'cod_exc'
      Origin = 'cod_exc'
      Required = True
    end
    object query_det_entradasid: TFDAutoIncField
      DisplayWidth = 6
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      Visible = False
    end
    object query_det_entradasid_entrada: TIntegerField
      DisplayWidth = 10
      FieldName = 'id_entrada'
      Origin = 'id_entrada'
      Required = True
      Visible = False
    end
    object query_det_entradasproduto: TStringField
      DisplayWidth = 50
      FieldName = 'produto'
      Origin = 'produto'
      Required = True
      Size = 60
    end
    object query_det_entradasquantidade: TIntegerField
      DisplayWidth = 10
      FieldName = 'quantidade'
      Origin = 'quantidade'
      Required = True
    end
    object query_det_entradasfuncionario: TStringField
      DisplayWidth = 50
      FieldName = 'funcionario'
      Origin = 'funcionario'
      Required = True
      Visible = False
      Size = 50
    end
    object query_det_entradasid_produto: TIntegerField
      DisplayWidth = 10
      FieldName = 'id_produto'
      Origin = 'id_produto'
      Required = True
      Visible = False
    end
    object query_det_entradasdata: TDateField
      DisplayWidth = 10
      FieldName = 'data'
      Origin = 'data'
      Required = True
    end
  end
  object DS_det_entradas: TDataSource
    DataSet = query_det_entradas
    Left = 656
    Top = 440
  end
  object tb_det_entradas: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = fd
    UpdateOptions.UpdateTableName = 'pdv.detalhes_entradas'
    TableName = 'pdv.detalhes_entradas'
    Left = 576
    Top = 392
  end
end
