# AWS
Repo para guardar várias pipelines da AWS.

Como criar uma pipeline nova:
    1- Criar uma branch a partir da master. Nomear a branch com o nome da pipeline. Ex: "bkt-dados-voos"
    2- Alterar o arquivo pipeline.json colocando o nome da branch no campo nome. Ex: "nome": "bkt-dados-voos"
    3- Alterar o cloudformation em infra/template.yml

Cada branch se equivale a uma pipeline na aws. NÃO ALTERE a branch Master, ela serve como base para as novas pipelines.

Não alterar o arquivo worflows\aws.yml, ele eé responsável pelo GitHub Actions.

Funcionamento do deploy:
    O deploy é feito pelo GitHub Actions em uma máquina ubunt que roda na Azure.

    O arquivo worflows\aws.yml detalha o que GitHub Actions tem que fazer:
        1- Instala e executa o lint para o cloudformation
        2- Copia o repo https://github.com/SurianBr/aws-deploy. Nesse repo tem um bash que vai fazer o deploy na aws.
        3 - No bash o deploy é feito através de comandos do AWS CLI, busca algumas informações necessárias no arquivo pipeline.json


