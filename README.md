# skills

Skills de agente (Claude Code e outros harnesses compatíveis com Agent Skills) que eu uso no dia a dia para construir produtos com IA, em público. Tudo em pt-BR.

São pequenas, componíveis e fáceis de adaptar: copie, mude, faça suas.

## As skills

### Produto

| Skill | O que faz |
|---|---|
| [`design-spec`](./skills/produto/design-spec/SKILL.md) | Descoberta uma pergunta por vez, spec com roadmap de versões (cada uma com o subtítulo "Esse app ajuda [quem] a [resultado] fazendo [como]") e aprovação antes de qualquer código. |
| [`plano-por-versao`](./skills/produto/plano-por-versao/SKILL.md) | Transforma uma versão aprovada do spec em plano de tarefas pequenas em TDD, no formato `passo → verify`, sem nenhum TBD. |

### Engenharia

| Skill | O que faz |
|---|---|
| [`diretrizes-claude-md`](./skills/engenharia/diretrizes-claude-md/SKILL.md) | Aplica o bloco de diretrizes de trabalho (fluxo, simplicidade, mudanças cirúrgicas, TDD, causa raiz, evidência) no `CLAUDE.md` de um projeto. |

### Negócio e Design

Em breve.

## Instalação (Claude Code)

Instale sempre a partir de uma [release](https://github.com/ilanramos/skills/releases). A mais recente é a `v0.1.0`.

**Baixando a release:**

```bash
VERSAO=v0.1.0
mkdir -p ~/skills
curl -L https://github.com/ilanramos/skills/archive/refs/tags/$VERSAO.tar.gz | tar xz --strip-components=1 -C ~/skills
~/skills/scripts/link-skills.sh
```

**Pelo git, preso na release** (para atualizar, troque a tag):

```bash
git clone --branch v0.1.0 --depth 1 https://github.com/ilanramos/skills.git ~/skills
~/skills/scripts/link-skills.sh
```

O `link-skills.sh` cria os atalhos das skills em `~/.claude/skills`.

**Para atualizar:** apague `~/skills` e repita o passo acima com a tag nova. As versões e as mudanças de cada uma ficam nas [releases](https://github.com/ilanramos/skills/releases).

## Organização

- `skills/produto`, `skills/engenharia`, `skills/negocio`, `skills/design`: skills prontas, distribuídas no plugin.
- `skills/em-andamento`: rascunhos, fora do plugin.
- `template/SKILL.md`: ponto de partida para uma skill nova.

## Licença

[MIT](./LICENSE)
