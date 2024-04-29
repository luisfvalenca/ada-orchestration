# ada-orchestration

Este projeto consiste na aplicação do módulo anterior mas agora conteinerizado e orquestrado pelo Kubernets:

O sistema verifica se alguma transação seguida foi realizada em alguma outra unidade federativa(estado) a partir da última UF utilizada.

Execute o comando `make build` para construir as imagens mas sem as instanciar.

Depois desta passo, executar a aplicação e os seus pods execute o comando `make run`.

As transções geradas pelo producer estão no arquivo `transactions.json`.

O arquivo/link com número da conta passível de fraude vai estar disponível para download no console do minio.