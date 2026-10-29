---
name: design-spec
description: Cria o design spec de um produto ou SaaS do zero, com descoberta, roadmap de versões, metas por etapa, plano de código e infraestrutura, e portão de aprovação antes de qualquer código. Use quando começar um produto novo e quiser um documento de planejamento com versões.
---

# Design spec de produto

Documento em pt-BR, direto, sem inventar dados: marque hipóteses como [HIPÓTESE] e o que precisa ser checado como [VERIFICAR].

## Fase 1: descoberta (antes do documento)
- Leia tudo o que já existe antes de perguntar.
- Uma pergunta por mensagem, específica, dizendo o que a resposta muda.
- Se o pedido for ambíguo, mostre as interpretações possíveis em vez de escolher uma em silêncio.
- Devolva o entendido em blocos curtos (200 a 300 palavras).
- Apresente 2 ou 3 abordagens com trade-offs e recomende uma. Discorde quando houver caminho mais simples.
- Dimensione: mudança pequena gera documento curto; subsistemas independentes viram specs separados.

## Fase 2: o spec (seções)
1. Resumo.
2. Contexto e piloto.
3. Dores priorizadas (frequência x impacto), com citações reais.
4. Público e personas.
5. Metas, não metas e anti-metas.
6. Suposições e ambiguidades: suposições explícitas e interpretações pendentes, cada uma com a pergunta ao usuário.
7. Abordagens consideradas, a escolhida e por quê.
8. Solução: funcionalidades por dor. Simplicidade primeiro, nada especulativo.
9. Roadmap de versões (v0, v1 MVP, v2...). **Cada versão tem como subtítulo obrigatório "Esse app ajuda [quem] a [resultado] fazendo [como]".** Depois: escopo, fora do escopo (o que foi cortado e por quê), meta, critério de pronto verificável (nunca "funcionar bem") e duração estimada.
10. Arquitetura e stack, custos [ESTIMATIVA], caminho web → PWA → app. Setup: `CLAUDE.md` do projeto com as regras do time (ver a skill `diretrizes-claude-md`).
11. Dados, segurança e compliance.
12. Modelo de negócio e preço (hipóteses).
13. Métricas.
14. Riscos e mitigações.
15. Papéis e rituais.
16. Decisões, marcando quem decidiu ("decidido pelo usuário" ou "decisão do agente, revisar").
17. Próximos passos e perguntas em aberto.
18. Histórico de versões do documento.

## Fase 3: revisão do builder
- Um revisor tenta planejar a construção só com o documento. As dúvidas vão em três grupos: já respondidas, pequenas (o agente decide e marca) e do usuário (todas numa única mensagem).

## Portão de aprovação
- Nenhum código, scaffold ou instalação antes de o usuário aprovar o spec.

## Fase 4: plano por versão
- Depois da aprovação, use a skill `plano-por-versao` para cada versão.

Entregue no formato pedido (por exemplo, Google Docs) e devolva o link.

