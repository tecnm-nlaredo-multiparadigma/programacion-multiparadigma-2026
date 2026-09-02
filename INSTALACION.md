# Instalacion

Solo hace falta esto para las unidades 1 y 3. Elixir llega en la semana 3 y
Prolog **no se instala**: corre en el navegador.

## Node y npm

Windows y macOS: descarga la version **LTS 22** de nodejs.org.
Linux (Debian/Ubuntu): `sudo apt install nodejs npm`

Verifica:

```bash
node --version   # debe decir v22.x
npm --version
```

## Git

`git --version`. Si no responde, instala de git-scm.com.

Configura tu identidad **con el correo institucional**, porque de ahi salen
las estadisticas del tablero:

```bash
git config --global user.name "Tu Nombre"
git config --global user.email "tucorreo@nuevolaredo.tecnm.mx"
```

## VS Code

Extensiones: **ESLint**, **Vitest**, **ElixirLS** (semana 3).

## Elixir — semana 3, no antes

elixir-lang.org/install.html. Verifica con `iex` (se sale con `Ctrl+C` dos veces).

## Prolog — no se instala

SWISH corre en el navegador: swish.swi-prolog.org

## Clonar este repositorio

```bash
git clone https://github.com/tecnm-nlaredo-multiparadigma/programacion-multiparadigma-2026.git
cd programacion-multiparadigma-2026/01-cuatro-estilos
node src/comparar.js
```

Si imprime `$2,191.15` cuatro veces, ya quedo.
