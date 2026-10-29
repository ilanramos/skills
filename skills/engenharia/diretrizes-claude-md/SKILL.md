---
name: diretrizes-claude-md
description: Aplica o bloco de diretrizes de trabalho (fluxo spec → plano, simplicidade, mudanças cirúrgicas, TDD, causa raiz e evidência) no CLAUDE.md de um projeto, criando o arquivo ou acrescentando no fim sem mexer no resto. Use quando começar um projeto novo ou quiser que o Claude Code siga as regras do time num repositório.
---

# Diretrizes no CLAUDE.md

O bloco fica em [`references/bloco.md`](./references/bloco.md).

## Passos
1. Confirme com o usuário em quais projetos aplicar → verify: lista de caminhos aprovada.
2. Para cada projeto, veja se `CLAUDE.md` existe na raiz → verify: `ls CLAUDE.md`.
3. Se o bloco já estiver lá (título "## Diretrizes de trabalho"), não duplique → verify: `grep -c "## Diretrizes de trabalho" CLAUDE.md` é 0 antes de escrever.
4. Se o arquivo não existir, crie só com o bloco. Se existir, acrescente o bloco no fim, separado por uma linha em branco, sem alterar nada acima → verify: `git diff CLAUDE.md` mostra só linhas adicionadas no fim.
5. Mostre ao usuário o final do arquivo e o `git status` → verify: evidência colada na resposta.

## Regras
- Não faça commit nem push sem o usuário pedir.
- Se o projeto tiver uma regra mais específica que conflite com o bloco, aponte o conflito em vez de editar a regra existente.
