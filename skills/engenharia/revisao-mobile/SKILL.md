---
name: revisao-mobile
description: Revisa e corrige os problemas de toque, campos e layout que site feito com IA costuma ter no celular, mexendo só no que existe no projeto, e entrega a lista do que precisa ser testado em aparelho físico. Use quando for finalizar um site ou app web, ou quando reclamarem de zoom ao tocar em input, página arrastando pro lado, botão ruim de tocar ou layout cortado no celular.
---

# Revisão mobile

Deixa o site bom de usar no celular sem mudança inventada, e diz com clareza o que só um aparelho de verdade consegue confirmar.

## Passos
1. Mapeie o projeto: stack, CSS global, meta viewport, campos, botões de ícone, barras fixas e layouts de tela cheia → verify: você sabe apontar arquivo e linha de cada um, ou que não existe.
2. Classifique os 10 itens abaixo como **corrigir**, **já ok** ou **não existe** → verify: os 10 têm status, com arquivo:linha quando existem.
3. Corrija só o que está como **corrigir**, na origem do problema, seguindo [`references/correcoes.md`](./references/correcoes.md) → verify: cada linha do diff vem de um item da lista.
4. Rode os testes e o build do projeto, e meça o overflow em 320px e 390px → verify: saída real na resposta.
5. Entregue o resumo no formato abaixo → verify: as 5 seções estão lá, e nenhuma ficou de fora por estar vazia.

## Os 10 itens

**Toques**
1. Cor de hover presa depois do toque.
2. Flash cinza ao tocar.
3. Botão ou link que demora a responder ao toque.
4. Segurar o botão e selecionar o texto.
5. Botão de ícone com área de toque menor que 44px.

**Campos**
6. Página dá zoom ao tocar no campo.
7. Teclado errado para o tipo de dado.

**Tela e layout**
8. Página arrasta para o lado.
9. Parte de baixo cortada quando a barra do navegador aparece.
10. Notch e indicador de início em cima dos elementos.

## Resumo final

```markdown
## Corrigido
- Item, arquivo:linha, o que mudou.

## Já estava ok
- Item, arquivo:linha.

## Não existe no projeto
- Item e por que não se aplica.

## Verificação
- Saída dos testes e do build, ou "o projeto não tem".
- `scrollWidth` e `clientWidth` em 320px e 390px.

## Testar no celular físico
- [ ] O que testar, em qual sistema, e o resultado esperado.
```

A última seção é a mais importante. Inclua cada item abaixo que exista no projeto, mesmo que você não tenha mexido nele:

| Item | O que conferir no aparelho | Por que o emulador não basta |
|---|---|---|
| 1 | Tocar no botão e soltar: a cor volta ao normal | O modo mobile do DevTools simula o toque com o mouse |
| 2 | Tocar em botão e link: sem flash, com resposta visual ao pressionar | O flash é desenhado pelo navegador do aparelho |
| 3 | Tocar várias vezes seguidas: resposta imediata, sem zoom | A sensação de atraso depende do toque e do aparelho reais |
| 4 | Segurar o botão: não seleciona texto nem abre menu | Pressão longa é do sistema |
| 5 | Acertar o ícone com o polegar, sem pegar o vizinho | O emulador mede a área, não o dedo |
| 6 | iPhone: tocar em cada campo, sem zoom | O DevTools não reproduz o zoom do Safari no iOS |
| 7 | iPhone e Android: abrir cada campo e ver o teclado | O emulador não mostra o teclado do sistema |
| 9 | Rolar até a barra do navegador sumir e voltar: nada cortado nem pulando | O emulador não tem a barra que encolhe |
| 10 | iPhone com notch, em pé e deitado: nada embaixo do notch nem do indicador | No emulador as áreas seguras costumam ser zero |

O item 8 dá para validar no emulador. O Simulator do Xcode roda o Safari de verdade e ajuda nos itens 6, 7, 9 e 10, mas não substitui o toque no aparelho.

## Regras
- Não aplique a lista no automático. Item sem componente correspondente fica como **não existe**.
- Nunca resolva o zoom com `maximum-scale=1` ou `user-scalable=no`. Se já estiver no projeto, tire: isso impede quem precisa de ampliar a tela.
- Nunca resolva o arrasto lateral com `overflow-x: hidden` no `body` ou no `html`. Ache o elemento que passa da tela.
- Aumente a área de toque com pseudo-elemento, sem mudar o tamanho visível do botão.
- Nunca use `user-select: none` em texto da página nem em campos.
- Quem tira o flash do toque coloca um `:active` no lugar e mantém o `:focus-visible`.
- Só adicione `viewport-fit=cover` se houver barra fixa ou layout de ponta a ponta, e sempre junto dos paddings.
- Nunca diga que testou no celular se só testou no emulador.
