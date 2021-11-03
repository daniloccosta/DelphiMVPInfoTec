# Exemplo simples de aplicativo de Vendas usando padrão MVP

Os dados não persistem, ou seja, os dados cadastrados permanecerão disponíveis somente durante a execução da aplicação.
> Nota: Devido ao padrão MVP utilizado, é possível adicionar facilmente uma base de dados para persistência dos dados sem impactos nas camadas de View e Presenter.

### São 3 telas demonstrando as operações básicas de um CRUD:

- ⚡Cadastro de Clientes

  ![](Imagens/TelaClientes.png)
  - Para adcionar um novo cliente, basta digitar o nome e em seguida clicar em Adicionar;
  - Para alterar o nome de um cliente já cadastrado, dê um clique duplo sobre o registro, então o nome do cliente aparecerá na caixa "Nome". Basta editar e clicar no botão com o nome "Atualizar";
  - Para excluir, selecione um registro e em seguida pressione as teclas Control + Delete.
  
- ⚡Cadastro de Produtos

  ![](Imagens/TelaProdutos.png)
  - Os comandos para Adicionar, Alterar e Excluir um registro, são os mesmos relacionados acima para a tela de clientes.
  
- ⚡Tela de Vendas/Pedidos

  ![](Imagens/TelaVendas.png)
  - 
