# Regras deste repositório

## Organização
- Skills ficam em `skills/<categoria>/<nome>/SKILL.md`. Categorias: `produto`, `engenharia`, `negocio`, `design` (distribuídas) e `em-andamento` (rascunhos, não distribuídas).
- Nomes de pasta em kebab-case, sem acento. O `name` do frontmatter é igual ao nome da pasta.
- Frontmatter só com `name` e `description`. A `description` diz o que a skill faz e termina com "Use quando…".
- Detalhes longos vão em `references/` dentro da pasta da skill; o `SKILL.md` fica curto.
- Tudo em pt-BR.

## Ao adicionar, renomear ou remover uma skill distribuída
- Atualize a tabela da categoria no `README.md`, com o nome linkando para o `SKILL.md`.
- Atualize o array `skills` em `.claude-plugin/plugin.json`.
- Rode `claude plugin validate . --strict` e `scripts/link-skills.sh`.
- Skills em `em-andamento/` não entram no README nem no `plugin.json`.

## Conteúdo proibido
- Nada de dados de clientes ou leads, senhas, tokens, variáveis de ambiente ou URLs internas.

## Diretrizes de trabalho

### 0. Fluxo
- Nada de código antes de o dono do projeto aprovar o spec. Cada versão aprovada vira um plano com Goal, Architecture, Stack, link do spec, Global Constraints e Review Focus.
- Tarefas pequenas, cada uma testável sozinha, com Files, Interfaces e passos de poucos minutos. Nenhum "TBD".
- Sem deploy, recurso na nuvem ou pago, ou envio de mensagem, e-mail ou post sem liberação explícita.

### 1. Pensar antes de codar
- Escreva as suposições. Se tiver dúvida, pergunte antes de começar.
- Se o pedido tiver mais de uma leitura, mostre as opções em vez de escolher calado.
- Se existir um caminho mais simples, diga.

### 2. Simplicidade primeiro
- Faça só o que foi pedido. Nada de recurso especulativo ou abstração usada uma vez só.
- Reaproveite o que já existe antes de escrever algo novo.
- Nunca corte validação, tratamento de erro, segurança nem acessibilidade para encurtar.

### 3. Mudanças cirúrgicas
- Toda linha alterada vem do pedido. Nada de refatorar de passagem.
- Siga o estilo existente. Remova só o que a sua mudança deixou órfão.

### 4. Metas verificáveis
- Planeje no formato `passo → verify: checagem`.
- TDD sempre: teste, ver falhar, implementar, ver passar, commit.

### 5. Bugs
- Causa raiz antes de corrigir, de preferência com um teste que reproduz.
- Três correções seguidas falharam: pare e reveja a arquitetura.

### 6. Evidência antes de dizer "pronto"
- Mostre a saída real dos testes ou do build.
- Respostas curtas e diretas.
