---
name: plano-por-versao
description: Transforma uma versão aprovada de um design spec em plano de implementação com tarefas pequenas em TDD, no formato "passo → verify", sem nenhum TBD. Use quando o spec (ou uma versão dele) foi aprovado e é hora de planejar o código.
---

# Plano por versão

Só comece se o spec da versão estiver aprovado pelo usuário. Se não estiver, pare e peça a aprovação.

## Cabeçalho
- **Goal:** o subtítulo da versão ("Esse app ajuda [quem] a [resultado] fazendo [como]") e o critério de pronto.
- **Architecture** e **Tech Stack**, em poucas linhas.
- **Spec:** link para o documento aprovado.
- **Global Constraints:** regras que valem para todas as tarefas.
- **Review Focus:** 5 casos de borda que a revisão final precisa checar.

## Mapa de arquivos
- Liste os arquivos que serão criados ou alterados, com uma linha de responsabilidade cada.

## Tarefas
Cada tarefa é pequena, testável sozinha e tem:
- **Files:** o que muda.
- **Interfaces:** funções, rotas ou tipos que a tarefa expõe.
- **Passos em TDD**, cada um no formato `Passo → verify: checagem`:
  1. Escrever o teste → verify: o teste falha pelo motivo esperado.
  2. Implementar o mínimo → verify: o teste passa.
  3. Rodar a suíte → verify: tudo verde.
  4. Commit → verify: `git status` limpo.

## Regras
- Mudanças cirúrgicas: cada linha mudada vem do pedido, sem refatorar de passagem, seguindo o estilo existente.
- Simplicidade: nada especulativo, nenhuma abstração usada uma vez só.
- Proibido "TBD", "a definir" ou "implementar depois".
- Salve o plano em `docs/superpowers/plans/` do projeto, se o projeto não definir outro lugar.

## Autorrevisão (antes de entregar)
- Toda funcionalidade do escopo da versão tem tarefa? → verify: lista cruzada spec x tarefas.
- Algum passo sem verify? → verify: nenhum.
- Algum TBD? → verify: busca por "TBD" vazia.

