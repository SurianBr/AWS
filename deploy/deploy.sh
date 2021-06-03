#!/bin/bash
for PIPE in $(jq '.pipes[].nome' -r pipelines.json)
do
  echo valida template
  cfn-lint "${GITHUB_WORKSPACE}/${PIPE}/infra/template.yml"
  if [ $? -ne 0 ]; then
    echo "Erro no lint"
    exit -1
  fi

  echo 'Fazendo deploy da pipe' $PIPE
  aws cloudformation deploy --template-file "${GITHUB_WORKSPACE}/${PIPE}/infra/template.yml" --stack-name ${PIPE}
done