# ada-orchestration

Este projeto consiste na aplicação do módulo anterior mas agora conteinerizado e orquestrado pelo Kubernets:

O sistema verifica se alguma transação seguida foi realizada em alguma outra unidade federativa(estado) a partir da última UF utilizada.

Execute o comando `make run` para subir a aplicação e os seus pods.

As transções geradas pelo producer estão no arquivo `producer/transactions.json`.

Para este projeto é necessário acesso ao docker hub, pois todas as imagens declaradas estão do registry default do docker (inclusive as que foram buildadas: https://hub.docker.com/u/luisfvalenca)

O arquivo/link com número da conta passível de fraude vai estar disponível para download no console do minio:

    - minio.ada-orchestration/relatorios-fraudes/