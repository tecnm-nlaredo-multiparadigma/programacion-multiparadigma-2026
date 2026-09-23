# Tu repositorio del proyecto — 11 pasos

Miércoles 23 de septiembre · Unidad 1

Al terminar la sesión tienes que tener: **tu repositorio público**, la prueba de 1000 kg
**en verde**, un **pull request con CI en verde** y el **merge hecho**. Eso es la mitad de
la competencia **C1.2**, que se verifica el viernes.

## Antes de empezar

- Cuenta de GitHub, con sesión iniciada
- Node 22: compruébalo con `node --version`
- Git configurado:

```bash
git config --global user.name "Tu Nombre"
git config --global user.email "tu@correo"
```

## 1 · Crea tu repositorio a partir de la plantilla

1. Abre <https://github.com/tecnm-nlaredo-multiparadigma/plantilla-cotizador>
2. Botón verde **Use this template** → **Create a new repository**
3. **Owner:** tu cuenta · **Repository name:** `cotizador-TUCONTROL` (ejemplo: `cotizador-22100167`)
4. Visibilidad: **Public** → **Create repository**

> **Público no es opcional:** sin eso no corre la verificación automática en el plan gratuito.

## 2 · Registra tu repositorio

Pega la liga de tu repositorio en el canal de Teams de la materia. Sin ese paso, para mí no existe.

## 3 · Bájalo a tu máquina

```bash
git clone https://github.com/TUUSUARIO/cotizador-TUCONTROL.git
cd cotizador-TUCONTROL
npm install
```

## 4 · Compruébalo ANTES de tocar nada

```bash
npm run verificar
```

Falla una prueba: *"aplica descuento EXACTAMENTE en 1000 kg"*. Léela completa: dice qué
esperaba (11500) y qué recibió (12500). No abras el código antes de leerla.

## 5 · Crea tu rama

```bash
git switch -c fix/descuento-en-1000
```

Nunca se trabaja directo en `main`. Es la regla 1 del README.

## 6 · Arregla el defecto

Está en `src/cotizador.ts` y es de **un solo carácter**. La regla de negocio dice que el
descuento aplica **a partir de** 1000 kg, y "a partir de" incluye al 1000. Borra también el
comentario `TODO` cuando lo arregles.

## 7 · Vuelve a verificar

```bash
npm run verificar
```

Tipos, linter y pruebas: las tres en verde. Si sigue en rojo, no avances.

## 8 · Guarda el cambio con un mensaje que diga el PROPÓSITO

```bash
git add -A
git commit -m "fix: aplica el descuento por volumen exactamente en 1000 kg"
```

`fix: arreglo`, `cambios` o `wip` no cuentan. Dentro de seis meses el mensaje es lo único que queda.

## 9 · Súbelo

```bash
git push -u origin fix/descuento-en-1000
```

## 10 · Abre el pull request

- Entra a tu repositorio en GitHub: aparece el aviso **Compare & pull request**
- Título: el mismo mensaje del commit
- En la descripción contesta: qué resolviste, cómo lo verificaste y qué descartaste
- Espera el check verde de CI (tarda un minuto). Si sale rojo, ábrelo y lee el error

## 11 · Intégralo

Con el check en verde: **Merge pull request** → **Confirm merge**. Ya tienes el ciclo completo.

## Lista de verificación — esto es lo que se revisa el viernes

- [ ] Mi repositorio es público y se llama `cotizador-<mi control>`
- [ ] Pegué la liga en Teams
- [ ] `npm run verificar` pasa las tres puertas en mi máquina
- [ ] Trabajé en una rama, no en `main`
- [ ] Mi commit describe el propósito, en formato Conventional Commits
- [ ] Mi PR tiene el check de CI en verde y está integrado

## Si algo falla

| Si pasa esto | Haz esto |
|---|---|
| `git: command not found` / `npm: command not found` | No están instalados. Ve `INSTALACION.md`. Hoy trabaja con un compañero y termina en casa |
| Al hacer push me pide usuario y contraseña | GitHub ya no acepta contraseña. Plan B sin instalar nada: haz el cambio desde el navegador (paso 6, botón del lápiz en GitHub) y al guardar elige **Create a new branch**; ahí mismo se abre el pull request |
| El PR no muestra ningún check | Pestaña **Actions** de tu repositorio → habilita los workflows. Regresa a **Checks** en el PR |
| CI en rojo y en mi máquina pasa | Casi siempre no subiste el arreglo: `git status`, luego `add`, `commit` y `push` otra vez |
| Me equivoqué de nombre al crear el repo | Settings → Rename. No hay que volver a empezar |
