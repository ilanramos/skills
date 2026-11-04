# Correções da revisão mobile

Um bloco por item. Adapte ao estilo do projeto; os seletores são exemplos.

## 1. Cor de hover presa depois do toque

```css
@media (hover: hover) and (pointer: fine) {
  .botao:hover { background: var(--cor-hover); }
}
```

Tailwind: a v4 já restringe `hover:` a aparelhos com hover (só com `hover: hover`). Na v3, ligue `future.hoverOnlyWhenSupported`. Confira a versão antes de reescrever qualquer classe.

## 2. Flash cinza ao tocar

```css
a, button, label, summary, [role="button"] {
  -webkit-tap-highlight-color: transparent;
}
.botao:active { background: var(--cor-pressionado); }
```

Sem `:active`, o toque fica sem resposta visual. Não mexa no `:focus-visible`: é ele que guia quem navega pelo teclado.

Confira no iPhone: o Safari no iOS pode não aplicar `:active` sem um listener de toque na página. Só se o botão ficar sem resposta no aparelho, adicione:

```js
document.addEventListener("touchstart", () => {}, { passive: true });
```

## 3. Botão ou link que demora a responder

```css
a, button, input, select, textarea, label, [role="button"] {
  touch-action: manipulation;
}
```

Isso tira o zoom de toque duplo nesses elementos e mantém o zoom de pinça. Elemento clicável sem `touch-action` conta como **corrigir**, mesmo com a meta viewport certa. Em navegador moderno com a meta viewport certa, a melhora pode ser pequena. Se ainda estiver lento, a causa é outra (handler pesado, re-render): investigue em vez de empilhar CSS.

## 4. Selecionar texto ao segurar

```css
button, [role="button"], .controle {
  -webkit-user-select: none;
  user-select: none;
}
```

O Safari precisa do prefixo. Não aplique em `input` e `textarea`: no Safari isso pode impedir a digitação. Também não aplique no `body` nem em texto que a pessoa queira copiar (preço, endereço, telefone).

## 5. Área de toque do botão de ícone

```css
.botao-icone { position: relative; }
.botao-icone::after {
  content: "";
  position: absolute;
  top: 50%;
  left: 50%;
  width: max(100%, 44px);
  height: max(100%, 44px);
  transform: translate(-50%, -50%);
}
```

O que pode dar errado:
- Se o botão já tem `position: absolute` ou `fixed`, não troque por `relative`: ele já serve de referência para o pseudo-elemento.
- `overflow: hidden` no botão corta a área extra. No pai, corta a parte que passar dele.
- A área ampliada pode invadir qualquer vizinho clicável, e o toque vai para o elemento errado. Meça e, se invadir, abra espaço entre eles (`margin` ou `gap`): esse ajuste faz parte da correção.
- `::after` já em uso: use o `::before`.
- `input` não tem pseudo-elemento. Aumente pelo `padding` ou pelo `label`.

Botão de texto menor que 44px não é este item: não mude, aponte no resumo final.

## 6. Zoom ao tocar no campo

O iOS dá zoom quando a fonte calculada do campo é menor que 16px. Vale para `input`, `select`, `textarea` e `contenteditable`.

```css
input, select, textarea { font-size: 16px; }
```

- Confira o valor calculado, não só o CSS: `0.875rem` dá 14px.
- Procure sobrescritas por componente. Tailwind: troque `text-sm` por `text-base md:text-sm` em campos.
- Se houver `maximum-scale=1` ou `user-scalable=no` na meta viewport, tire.

## 7. Teclado certo

| Dado | Atributos |
|---|---|
| Valor com centavos | `type="text" inputmode="decimal"` |
| Código de verificação | `type="text" inputmode="numeric" autocomplete="one-time-code"` |
| E-mail | `type="email" autocomplete="email"` |
| Telefone | `type="tel" autocomplete="tel"` |

- Em pt-BR, o teclado decimal costuma trazer vírgula. `parseFloat("12,50")` devolve `12`, então o código que lê o valor precisa aceitar vírgula. Confira antes de trocar.
- Código em `type="number"` perde o zero à esquerda: `0123` vira `123`.
- Ao sair de `type="number"`, procure quem usa `valueAsNumber`, `min`, `max` ou `step` nesse campo.

## 8. Página arrastando para o lado

Ache o responsável no console, com a largura do celular:

```js
[...document.querySelectorAll("body *")].filter(
  (el) => el.getBoundingClientRect().right > document.documentElement.clientWidth + 1
);
```

Carrossel e tabela com rolagem própria aparecem na lista sem serem o problema: confira pelo `document.documentElement.scrollWidth`, que deve ser igual ao `clientWidth`.

Causas comuns:
- `width: 100vw` somado a margem ou padding.
- `white-space: nowrap` em texto longo.
- Imagem ou vídeo sem `max-width: 100%`.
- Tabela larga sem um contêiner com `overflow-x: auto`.
- Filho de flex ou grid sem `min-width: 0`.
- Margem negativa.

Se um elemento decorativo precisa mesmo sair da tela, use `overflow-x: clip` no contêiner dele, nunca no `body`. `overflow-x: hidden` em ancestral também pode quebrar `position: sticky`.

## 9. Parte de baixo cortada

```css
.tela-cheia { min-height: 100vh; min-height: 100dvh; }
.hero { min-height: 100vh; min-height: 100svh; }
```

- `100dvh` acompanha a barra do navegador: serve para layout de tela cheia, como app e modal.
- `100svh` é a menor altura possível e não muda ao rolar: serve para hero, sem o conteúdo pular.
- A linha com `100vh` é o fallback de navegador antigo. Prefira `min-height` a `height`, para o conteúdo poder crescer.

## 10. Notch e indicador de início

Só se houver barra fixa ou layout de ponta a ponta, ou seja, conteúdo ou controle encostado na borda da tela. Fundo colorido encostado na borda não conta. Sem `viewport-fit=cover`, o Safari já mantém o conteúdo dentro da área segura. Adicionar o `cover` sem os paddings piora a página.

```html
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
```

```css
.barra-superior { padding-top: max(12px, env(safe-area-inset-top)); }
.barra-inferior { padding-bottom: max(12px, env(safe-area-inset-bottom)); }
```

Com o celular deitado, o notch fica na lateral: use `env(safe-area-inset-left)` e `env(safe-area-inset-right)` nos elementos colados nas laterais.
