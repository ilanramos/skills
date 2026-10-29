## Diretrizes de trabalho (do projeto)

Regras de comportamento pra qualquer mudança neste projeto. Onde o projeto tiver uma regra mais específica, ela vale primeiro.

### 0. Fluxo
- Nada de código antes de o dono do projeto aprovar o spec. Cada versão aprovada vira um plano em `docs/superpowers/plans/` com Goal, Architecture, Stack, link do spec, Global Constraints e Review Focus.
- O plano é feito de tarefas pequenas, cada uma testável sozinha, com Files, Interfaces e passos de poucos minutos. Não pode ficar nenhum "TBD".
- Sem deploy, sem criar recurso na nuvem ou pago e sem enviar mensagem, e-mail ou post. Isso só acontece com liberação explícita do dono do projeto.

### 1. Pensar antes de codar
- Escreva as suposições. Se tiver dúvida, pergunte antes de começar.
- Se o pedido tiver mais de uma leitura possível, mostre as opções em vez de escolher calado.
- Se existir um caminho mais simples, diga. Questione quando fizer sentido.

### 2. Simplicidade primeiro
- Faça só o que foi pedido. Nada de recurso especulativo, abstração usada uma vez só ou configuração que ninguém pediu.
- Antes de escrever algo novo, reaproveite o que já existe no repo e no navegador.
- Se 200 linhas cabem em 50, reescreva.
- Nunca corte validação, tratamento de erro real, segurança nem acessibilidade pra deixar o código menor.

### 3. Mudanças cirúrgicas
- Toda linha alterada tem que vir do pedido. Nada de refatorar de passagem, reformatar ou "melhorar" o código vizinho.
- Siga o estilo que já existe no projeto.
- Remova só o que a sua própria mudança deixou órfão. Código morto que já existia você só aponta, não apaga.

### 4. Metas verificáveis
- Planeje no formato `passo → verify: checagem`.
- Use TDD sempre: escreva o teste, veja ele falhar, implemente, veja passar e faça o commit. Código sem um teste que falhou antes não entra. Tarefa trivial só pula isso com aval explícito.

### 5. Bugs
- Encontre a causa raiz antes de corrigir, de preferência com um teste que reproduz o bug.
- Se três correções seguidas falharem, pare e reveja a arquitetura em vez de tentar a quarta.

### 6. Evidência antes de dizer "pronto"
- Só diga que está pronto mostrando a saída real dos testes ou do build.
- Revise cada tarefa e faça uma revisão final. Avalie o feedback tecnicamente, em vez de só aceitar.
- Feche com os testes verdes e ofereça merge, PR ou manter na branch. Deploy é sempre com o dono do projeto.
- Nas respostas, seja curto e direto. No código, seja exato.

