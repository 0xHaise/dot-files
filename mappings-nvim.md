
## Cheatsheet de Mapeos Personalizados en Neovim

### General

|Comando|Acción|
|---|---|
|`\wq`|Guardar y salir (`:wq!`)|
|`\w`|Guardar (`:w!`)|
|`\q`|Salir sin guardar (`:q!`)|

---

### Navegación entre ventanas

|Comando|Acción|
|---|---|
|`<C-h>`|Mover a la ventana izquierda|
|`<C-j>`|Mover a la ventana inferior|
|`<C-k>`|Mover a la ventana superior|
|`<C-l>`|Mover a la ventana derecha|

---

### Redimensionar ventanas

|Comando|Acción|
|---|---|
|`<A-h>`|Aumentar ancho ventana|
|`<A-l>`|Reducir ancho ventana|
|`<A-j>`|Reducir alto ventana|
|`<A-k>`|Aumentar alto ventana|

---

### Movimiento rápido del cursor

|Comando|Acción|
|---|---|
|`<S-h/l/j/k>`|Mover cursor 5 caracteres/filas en dirección respectiva|

---

### Tabs

|Comando|Acción|
|---|---|
|`\tn`|Nueva pestaña (`:tabnew`)|
|`\to`|Cerrar todas las demás pestañas (`:tabonly`)|
|`\tc`|Cerrar pestaña actual (`:tabclose`)|
|`\tm`|Mover pestaña (`:tabmove`)|
|`\t\`|Siguiente pestaña (`:tabnext`)|

---

### Buffers (Buffergator)

|Comando|Acción|
|---|---|
|`\bb`|Abrir Buffergator en ventana|
|`\bB`|Abrir Buffergator en nueva pestaña|
|`\bn`|Buffer siguiente (MRU)|
|`\bp`|Buffer anterior (MRU)|
|`\bd`|Cerrar buffer actual|

---

### Git (Gitsigns / Fugitive)

|Comando|Acción|
|---|---|
|`\gg`|Abrir interfaz `:Git` (Fugitive)|
|`\gi`|Mostrar estado Git (`:Git status`)|
|`\gc`|Hacer commit (`:Git commit`)|
|`\gb`|Blame línea (`:Git blame`)|
|`\gd`|Difftool (`:Git difftool`)|
|`\gm`|Mergetool (`:Git mergetool`)|
|`\gdv` / `\gdh`|Diff vertical u horizontal|
|`\gs`|Stage hunk actual (Gitsigns)|
|`\gr`|Reset hunk actual|
|`\gS`|Stage buffer completo|
|`\gR`|Reset buffer completo|
|`\gU`|Undo stage del buffer|
|`\gB`|Toggle blame en línea actual|
|`\gh`|Preview del hunk|
|`\gu`|Undo hunk|
|`\gn` / `\gp`|Ir a siguiente/anterior hunk|

---

### Comentarios (vim-commentary)

|Comando|Acción|
|---|---|
|`gc` (modo normal/visual)|Comentar/descomentar líneas|

---

### Code Actions (CoC)

| Comando      | Acción                                    |
| ------------ | ---------------------------------------- |
| `\a`         | Acción sobre selecci                      |
| `\ac`        | Acción en cur                             |
| `\as`        | Acción en el bu                           |
| `\qf`        | Quickfix en la línea a                    |
| `\re` / `\r` | Refactori                                 |
| `\cl`        | Ejecutar c                                |
| `\h`   (custom de K) : listar la documentacion  ntacion  |

---

### Navegación LSP (CoC)

|Comando|Acción|
|---|---|
|`gd`|Ir a definición|
|`gy`|Ir a definición de tipo|
|`gi`|Ir a implementación|
|`gr`|Buscar referencias|

---

### Terminal Flotante (Floaterm)

|Comando|Acción|
|---|---|
|`<C-t>`|Alternar terminal flotante|
|`<Esc>` en Floaterm|Salir del modo terminal y cerrar|

---

### Explorador de archivos (NERDTree)

| Comando | Acción                          |
| ------- | ------------------------------- |
| `<C-n>` | Alternar NERDTree               |
| `R`     |  refrescar el nerdtree enfocado |

| **Comando en NERDTree** | **Acción**                             |
| ----------------------- | -------------------------------------- |
| `o`                     | Abrir archivo en la misma ventana      |
| `i`                     | Abrir en **split horizontal** (vsplit) |
| `s`                     | Abrir en **split vertical**            |
| `t`                     | Abrir en una **nueva pestaña** (tab)   |
| `O`                     | Expandir todo el árbol de directorio   |
| `x`                     | Cerrar un nodo/directorio              |


---

### Dashboard

|Comando|Acción|
|---|---|
|`\p`|Abrir Dashboard|

---

### Which-key

|Comando|Acción|
|---|---|
|`\w`|Mostrar accesos mapeados (`WhichKey`)|

---

### Otros

| Comando     | Acción                                   |
| ----------- | ---------------------------------------- |
| `<F5>`      | Alternar árbol de cambios (Undotree)     |
| `\s`        | Ignorar palabra en corrector ortográfico |
| `:Format`   | Formatear buffer con CoC                 |
| `:Fold`     | Aplicar folding vía CoC                  |
| `:OR`       | Organizar imports (CoC)                  |
| `<leader>l` | custom de :Prettier                      |

---
 

 
 
```vim
:CocInstall coc-snippets
```
 
- `coc-snippets`: Motor de expansión de snippets compatible con UltiSnips y VSCode-style snippets
 
2 Instalar snippets predefinidos para HTML

Los snippets más completos están en el repositorio: [https://github.com/rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets), ampliamente usado en CoC, LSPs y VSCode.

```bash
mkdir -p ~/.config/coc/ultisnips
git clone https://github.com/rafamadriz/friendly-snippets.git ~/.config/coc/friendly-snippets
cp ~/.config/coc/friendly-snippets/snippets/html.json ~/.config/coc/ultisnips/html.snippets
```
_O también puedes convertir manualmente los `.json` de VSCode a `.snippets` si los prefieres en otro formato._

3 Habilitar y configurar snippets en tu `coc-settings.json` : Ubica el archivo en `~/.config/nvim/coc-settings.json` y asegúrate de tener algo como:

```json
{
  "snippets.ultisnips.directories": [
    "ultisnips",
    "~/.config/coc/friendly-snippets/snippets"
  ],
  "suggest.snippetIndicator": "",
  "coc.preferences.snippetSupport": true
}
```
  


`coc.nvim` (Conquer of Completion) es un plugin de autocompletado inteligente para Neovim, diseñado para proporcionar una experiencia similar a Visual Studio Code dentro del entorno de Vim/Neovim. Su principal característica es la integración con el **protocolo Language Server Protocol (LSP)**, lo que permite funcionalidades avanzadas como:

- Autocompletado inteligente
    
- Diagnóstico de errores en tiempo real
    
- Jump to Definition / References
    
- Renombrado de símbolos
    
- Refactorización
    
- Soporte de múltiples lenguajes con extensiones
    

## Rol de coc.nvim

`coc.nvim` actúa como un **cliente LSP completo**, gestionando servidores de lenguaje y actuando como middleware entre estos y el entorno de Neovim. Utiliza Node.js para ejecutarse, lo que permite aprovechar el vasto ecosistema de extensiones de VSCode y facilitar la instalación de servidores de lenguaje a través de `coc extensions`.

Además de LSP, `coc.nvim` también integra funcionalidades de autocompletado de buffer, snippet, spell-checking, y soporte para linters/formatters externos como `eslint`, `prettier`, `black`, `stylua`, entre otros.
 
 
### Lista de comandos útiles

- `:CocList extensions`: Listar todas las extensiones instaladas
    
- `:CocList diagnostics`: Ver todos los errores/advertencias del proyecto
    
- `:CocList symbols`: Ver símbolos del archivo actual
    
- `:CocList outline`: Ver estructura del documento
    
- `:CocList commands`: Ver todos los comandos disponibles
    
- `:CocCommand workspace.renameCurrentFile`: Renombrar archivo con actualización de referencias
    

## Relación con LSP

`coc.nvim` implementa el cliente del **Language Server Protocol** y, a través de extensiones específicas (como `coc-tsserver`, `coc-pyright`, etc.), se comunica con servidores de lenguaje que proporcionan análisis semántico del código, autocompletado contextual, navegación entre símbolos, refactorizaciones seguras, y otras capacidades avanzadas.

Esto permite que Neovim se transforme en un entorno de desarrollo moderno, comparable a IDEs completos, sin sacrificar la velocidad y eficiencia del ecosistema Vim.

## Ventajas clave

- Integración nativa con el ecosistema de extensiones de VSCode
    
- Configuración declarativa mediante JSON en `coc-settings.json`
    
- Soporte para múltiples servidores de lenguaje simultáneamente
    
- Diagnóstico en tiempo real y soporte de múltiples linters/formatters
    
- Totalmente asíncrono y rápido
    

En **Neovim**, los _buffers_ representan los contenidos cargados en memoria de archivos abiertos o creados en la sesión actual. A diferencia de las ventanas (`windows`) y pestañas (`tabs`), los _buffers_ no necesariamente están visibles, pero su contenido puede permanecer activo para ser reutilizado, editado o consultado.

Comprender y manejar buffers eficientemente permite un flujo de trabajo más ágil, especialmente en proyectos que requieren cambiar entre múltiples archivos de manera rápida y organizada.

---

## ¿Qué es un buffer en Neovim?

Un _buffer_ es una estructura de memoria que contiene el contenido de un archivo o texto temporal. Cada vez que abres un archivo con `:edit`, `:split`, `:vsplit`, `:tabnew`, o creas uno nuevo, Neovim crea un nuevo buffer.

Los buffers pueden estar:

- **Activos y visibles**: si están mostrados en una ventana
    
- **Activos pero ocultos**: si se cambiaron pero aún residen en memoria
    
- **Sin guardar**: si tienen modificaciones (`modified`)
    
- **Unloaded**: si ya no están en memoria (pueden recargarse desde el disco)
    

---

## Casos de uso comunes

1. **Navegación entre archivos**: mantener múltiples buffers abiertos permite cambiar entre varios archivos sin necesidad de cerrarlos o abrir nuevas ventanas.
    
2. **Edición simultánea**: cuando se editan múltiples archivos, los buffers permiten mantener el estado de cada uno y volver rápidamente.
    
3. **Comparación de archivos**: útil al usar `:vert diffsplit` o `:diffthis` entre dos buffers cargados.
    
4. **Exploración temporal**: puedes abrir archivos temporalmente para inspección sin cerrar tu archivo principal.
    

---

## Keybindings personalizados recomendados (con `<leader>`)

Asumiendo que estás usando una configuración moderna con tecla líder `\`:

```vim
" Buffer navegación
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>bl :buffers<CR>:buffer<Space>
nnoremap <leader>bo :bufdo bd<CR> " Cierra todos los buffers

" Toggle entre buffer actual y anterior
nnoremap <leader># :b#<CR>
```

Estos keybindings permiten:

- Navegar rápidamente entre buffers (`bn`, `bp`)
    
- Eliminar el buffer actual (`bd`)
    
- Listar y seleccionar buffers (`bl`)
    
- Cerrar todos los buffers abiertos (`bo`)
    
- Alternar entre los últimos dos buffers (`#`)
    
 
---

## Buenas prácticas

- Evita usar `:e` para abrir repetidamente el mismo archivo, mejor usa `:b` si ya está cargado.

La diferencia principal entre `:e <archivo>` y `:b <archivo>` en Neovim radica en cómo gestionan los **buffers**:

- `:e <archivo>` (_edit_):  
    Abre un **nuevo buffer** cargando el archivo desde disco. Si el archivo ya está abierto en otro buffer, crea una **nueva instancia**, perdiendo la sesión anterior si no se ha guardado.
    
- `:b <archivo>` (_buffer_):  
    Cambia al **buffer ya cargado en memoria** correspondiente a ese archivo, sin volver a leerlo desde disco. Solo funciona si el buffer ya está abierto.
    

**Resumen:**

- `:e` → Carga desde disco (nuevo buffer).
    
- `:b` → Cambia a un buffer ya existente (en memoria).


## Comandos esenciales para manejar buffers

|Comando|Descripción|
|---|---|
|`:ls` o `:buffers`|Lista los buffers activos|
|`:b <n>`|Cambia al buffer número `n`|
|`:b <nombre>`|Cambia al buffer que coincide con `nombre`|
|`:bd`|Elimina el buffer actual|
|`:bd <n>`|Elimina el buffer `n`|
|`:bwipeout`|Cierra buffer y lo borra completamente|
|`:bn`|Ir al siguiente buffer|
|`:bp`|Ir al buffer anterior|
|`:b#`|Volver al buffer anterior (toggle)|


- Usa `:bdelete` en lugar de `:q` si deseas cerrar el buffer sin cerrar la ventana.
    
- Para cambios entre múltiples archivos, prioriza buffers antes de pestañas si estás buscando eficiencia.
    
- Configura tu Neovim para permitir ocultar buffers sin guardarlos:
    
    ```vim
    set hidden
    ```
    
 


En **Neovim**, las _tabs_ representan **layouts de ventanas completas**, no simplemente archivos o buffers. A diferencia de otros editores como VSCode, donde cada pestaña suele estar asociada a un archivo, en Neovim una _tab_ puede contener múltiples _splits_ o ventanas, cada una con su propio buffer. Esto las convierte en una herramienta poderosa para organizar contextos de trabajo diferenciados, como vistas paralelas de distintos módulos o entornos.

---

## ¿Qué es una tab en Neovim?

Una _tab_ (`tabpage`) es una instancia de layout que contiene múltiples _ventanas_ (`windows`), las cuales a su vez muestran distintos _buffers_. Cada tab es completamente independiente en cuanto a disposición de ventanas, pero todos los buffers siguen estando disponibles globalmente.

---

## Comandos básicos para trabajar con tabs

|Comando|Descripción|
|---|---|
|`:tabnew [archivo]`|Crea una nueva pestaña (opcionalmente con archivo)|
|`:tabclose`|Cierra la pestaña actual|
|`:tabonly`|Cierra todas las tabs excepto la actual|
|`:tabnext` o `:tabn`|Cambia a la siguiente tab|
|`:tabprev` o `:tabp`|Cambia a la tab anterior|
|`:tabfirst`|Va a la primera tab|
|`:tablast`|Va a la última tab|
|`:tabmove [n]`|Mueve la pestaña actual a la posición `n`|
|`gt`, `gT`|Siguiente / anterior tab (modo normal)|

---

## Casos de uso comunes para tabs

1. **Separación de contextos**: usar una tab por cada parte del sistema (frontend/backend, config/tests, etc.).
    
2. **Flujos de trabajo paralelos**: mantener una tab para desarrollo, otra para revisión de logs, otra para documentación.
    
3. **Comparaciones complejas**: abrir distintos conjuntos de splits en tabs distintas para comparar múltiples archivos.
    
4. **Visualización modular**: cada tab puede mostrar diferentes combinaciones de ventanas horizontales o verticales.
    

---

## Keybindings personalizados recomendados

Ya cuentas con los siguientes mappings personalizados:

```vim
map <leader>tn :tabnew<CR>      " Nueva tab vacía
map <leader>to :tabonly<CR>     " Cierra todas las tabs excepto la actual
map <leader>tc :tabclose<CR>    " Cierra tab actual
map <leader>tm :tabmove         " Mueve tab actual (requiere número después)
map <leader>t<leader> :tabnext  " Siguiente tab
```

Recomendaciones adicionales:

```vim
map <leader>tp :tabprevious<CR>   " Ir a la tab anterior
map <leader>tf :tabfirst<CR>      " Primera tab
map <leader>tl :tablast<CR>       " Última tab
map <leader>t1 :tabnext 1<CR>     " Ir a tab 1
map <leader>t2 :tabnext 2<CR>     " Ir a tab 2
" ... puedes continuar hasta el número máximo de tabs que suelas usar
```

También puedes integrar movimiento rápido con `gt` y `gT`:

```vim
" Puedes agregar estos si deseas reconfigurarlos
noremap <S-l> gt
noremap <S-h> gT
```

---

## Integración con Telescope o fzf

Para navegar entre tabs con interfaz interactiva, puedes usar `telescope-tabs` o una función propia combinada con `tabpagebuflist()`.

Ejemplo básico con Telescope y Lua:

```lua
-- plugin: https://github.com/LinArcX/telescope-tabs
require('telescope').load_extension('telescope-tabs')
vim.api.nvim_set_keymap('n', '<leader>tt', "<cmd>lua require('telescope-tabs').list_tabs()<CR>", { noremap = true, silent = true })
```

---

## Buenas prácticas

- No uses tabs como reemplazo de buffers o splits, sino como una capa superior de organización.
    
- Combina tabs con splits verticales y horizontales según tu flujo.
    
- Usa `:set showtabline=2` para mostrar siempre la barra de tabs en la parte superior.
    
- Usa `:tabdo` para ejecutar un comando en todas las tabs. Ejemplo: `:tabdo w` para guardar todos los archivos.
    

---

## Comparación: Buffers vs Tabs vs Windows

|Concepto|Persiste el contenido|Permite múltiples simultáneamente|Representa layout visual|
|---|---|---|---|
|Buffer|Sí|Sí|No|
|Window|Sí (por buffer)|Sí (splits)|Parcialmente|
|Tab|Sí (con ventanas)|Sí|Sí (layout completo)|

---
Aquí tienes una **guía completa, técnica y actualizada** para instalar y configurar **Prettier** como autoformateador de JavaScript (y otros lenguajes compatibles) en tu entorno Neovim con `init.vim`.

---

## ⚙️ Requisitos

- Tener instalado **Node.js**
    
- Usar `vim-plug` como gestor de plugins
    
- Tener `init.vim` (no `init.lua`)
    

---

## 1. **Instalar Prettier (global)**

```bash
npm install -g prettier
```

Esto instala el binario `prettier` globalmente para que Neovim pueda invocarlo desde cualquier proyecto.

---

## 2. **Instalar plugin para formateo**

Vamos a usar [`prettier/vim-prettier`](https://github.com/prettier/vim-prettier), que es un plugin oficial para Neovim/Vim.

### En tu `init.vim` (con `vim-plug`):

```vim
call plug#begin('~/.config/nvim/plugged')

" Plugin oficial de Prettier
Plug 'prettier/vim-prettier', {
      \ 'do': 'npm install --frozen-lockfile --production',
      \ 'for': ['javascript', 'typescript', 'css', 'json', 'markdown'] }

call plug#end()
```

Luego ejecuta:

```vim
:PlugInstall
```

---

## 3. **Configuración básica en `init.vim`**

### Atajo para formatear el buffer:

```vim
" Atajo para ejecutar Prettier
nmap <leader>p :Prettier<CR>
```

### Para formatear automáticamente al guardar:

```vim
" Autoformatear antes de guardar archivos compatibles
autocmd BufWritePre *.js,*.ts,*.jsx,*.tsx,*.json,*.css,*.md Prettier
```

---

## 4. (Opcional) Crear archivo de configuración de Prettier

Para personalizar el estilo de formateo, crea un archivo `.prettierrc` en la raíz del proyecto:

```json
{
  "semi": true,
  "singleQuote": true,
  "tabWidth": 2,
  "trailingComma": "es5"
}
```

---

## 5. (Opcional) Verificar que funciona

Abre un archivo `.js` mal indentado, y ejecuta:

```vim
:Prettier
```

Debe autoindentar y aplicar el estilo definido en `.prettierrc`.

---

## 6. (Opcional) Soporte para otros lenguajes

Prettier también puede formatear:

- JSON
    
- YAML
    
- Markdown
    
- CSS/SCSS
    
- TypeScript
    
- HTML
    

Puedes añadirlos en el autocmd:

```vim
autocmd BufWritePre *.js,*.ts,*.jsx,*.tsx,*.json,*.css,*.scss,*.html,*.md Prettier
```

---

## 7. (Debug) Ver errores de Prettier

Si no funciona, ejecuta:

```vim
:messages
```

Para ver errores de ejecución o de configuración del binario.

---

¿Quieres que integre también ESLint, o que use `null-ls` como alternativa más robusta para integrarlo con LSP?

Sí, existen varios **plugins para Neovim** que permiten **previsualizar colores CSS/HTML/JS inline**, es decir, ver un bloque del color directamente en el texto. Uno de los más populares, livianos y mantenidos es:

---

## 🔸 [`norcalli/nvim-colorizer.lua`](https://github.com/norcalli/nvim-colorizer.lua)

### Características:

- Soporta múltiples formatos: `#RGB`, `#RRGGBB`, `rgba()`, `hsl()`, nombres de color (`red`, `blue`, etc.).
    
- Previsualización inline.
    
- Compatible con CSS, HTML, JS, Vue, etc.
    
- Autodetección de tipos de archivo.
    
- Soporta LSP y treesitter.
    

---

## ✅ Instalación con `vim-plug`

```vim
Plug 'norcalli/nvim-colorizer.lua'
```

Luego ejecutas:

```vim
:PlugInstall
```

---

## ⚙️ Configuración básica en `init.vim`

```vim
lua << EOF
require'colorizer'.setup()
EOF
```

Esto habilita la previsualización de colores para todos los tipos de archivo compatibles por defecto.

Si quieres configurarlo para ciertos tipos de archivo solamente:

```vim
lua << EOF
require'colorizer'.setup({
  'css';
  'javascript';
  'html';
  'lua';
}, {
  mode = 'foreground'; -- o 'background'
})
EOF
```

---

## 🔍 Comando manual

Para activarlo o desactivarlo manualmente:

```vim
:ColorizerAttachToBuffer
:ColorizerToggle
:ColorizerReloadAllBuffers
```

---

## Alternativas

- [`NvChad/nvim-colorizer.lua`](https://github.com/NvChad/nvim-colorizer.lua): un fork actualizado, enfocado en integraciones con la configuración de NvChad.
    
- [`ap/vim-css-color`](https://github.com/ap/vim-css-color): opción más clásica (para Vim también), pero no tan potente como el anterior.
    

---


# Enlaces 
https://swedishembedded.com/developers/vim-in-minutes
https://systemcrafters.net/emacs-tips/presentations-with-org-present/
https://hamvocke.com/blog/a-guide-to-customizing-your-tmux-conf/
