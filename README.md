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

**Como plugin:**

```
/plugin marketplace add ilanramos/skills
/plugin install ilanramos-skills@ilanramos
```

**Com symlinks** (um `git pull` atualiza tudo):

```bash
git clone https://github.com/ilanramos/skills.git ~/skills
~/skills/scripts/link-skills.sh
```

**Com o skills CLI:** `npx skills add ilanramos/skills`

Instale por um caminho só, senão cada skill aparece duas vezes.

## Organização

- `skills/produto`, `skills/engenharia`, `skills/negocio`, `skills/design`: skills prontas, distribuídas no plugin.
- `skills/em-andamento`: rascunhos, fora do plugin.
- `template/SKILL.md`: ponto de partida para uma skill nova.

## Licença

[MIT](./LICENSE)
