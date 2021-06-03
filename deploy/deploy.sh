#!/bin/bash
for PIPE in $(jq '.pipes[].nome' -r pipelines.json)
do
  echo 'Fazendo deploy da pipe' $PIPE
  aws cloudformation deploy --template-file "${GITHUB_WORKSPACE}/${PIPE}/infra/template.yml" --stack-name ${PIPE}
done