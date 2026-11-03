# macItRun

Play Windows games on your Mac (Apple silicon, macOS 26+), using Wine with DXMT or DXVK.
macItRun is free. If it helps you, consider [supporting it on Ko-fi](https://ko-fi.com/matheusrosa27).

*Português abaixo · Español abajo*

## Install

Paste this in Terminal:

```bash
curl -fsSL https://raw.githubusercontent.com/matheusrosa27/macItRun-runtime/main/install.sh | sh
```

The script (in this repository, [read it](install.sh)) downloads the latest release, checks its
SHA-256 and copies macItRun to Applications.

**Or download the .zip:** get `macItRun.zip` from the [latest release](https://github.com/matheusrosa27/macItRun-runtime/releases/latest),
unzip it and drag macItRun to Applications. macItRun is not notarized by Apple, so the first time
you open it macOS blocks it: go to **System Settings → Privacy & Security** and click
**Open Anyway** (only once).

macItRun needs Rosetta 2 (`softwareupdate --install-rosetta --agree-to-license`).

## What is in this repository

- `install.sh`: the installer above.
- [Releases](https://github.com/matheusrosa27/macItRun-runtime/releases):
  - `v…`: the app (`macItRun.zip` and its SHA-256).
  - `runtime-…`: the Wine runtime the app downloads (`…-x86_64.tar.xz`) and **its complete
    source code** (`…-sources.tar`): Wine from CodeWeavers' open-source CrossOver code with the
    macItRun patches, plus gnutls, nettle, gmp, freetype and the build script.

## Licenses

Wine and the libraries built with it are LGPL (see the sources archive of each runtime release;
gmp and nettle are LGPL-3.0-or-later or GPL-2.0-or-later, freetype is FTL or GPL-2.0). The graphics
layers are DXMT 0.80 (MIT) and DXVK-macOS (zlib), and Vulkan comes from MoltenVK (Apache-2.0).
The app shows every license under **Licenses**. CrossOver and CodeWeavers are trademarks of
CodeWeavers, Inc.; macItRun is not affiliated with them. macItRun comes with no warranty; online
games with kernel anti-cheat do not work and may ban accounts used under Wine.

---

## Português

Jogue jogos de Windows no Mac (Apple silicon, macOS 26 ou mais novo). Gratuito; apoie no
[Ko-fi](https://ko-fi.com/matheusrosa27).

**Instalar:** cole no Terminal o comando acima (`curl … | sh`). Ele baixa a última versão, confere o
SHA-256 e coloca o app em Aplicativos. **Ou** baixe o `macItRun.zip` da [última versão](https://github.com/matheusrosa27/macItRun-runtime/releases/latest),
extraia e arraste para Aplicativos; na primeira abertura, vá em **Ajustes do Sistema → Privacidade e
Segurança → Abrir mesmo assim** (só uma vez, porque o app não é notarizado pela Apple).

As releases `runtime-…` trazem o Wine usado pelo app e o código-fonte completo dele (LGPL).

## Español

Juega a juegos de Windows en el Mac (Apple silicon, macOS 26 o posterior). Gratis; apóyalo en
[Ko-fi](https://ko-fi.com/matheusrosa27).

**Instalar:** pega en Terminal el comando de arriba (`curl … | sh`). Descarga la última versión,
verifica el SHA-256 y copia la app a Aplicaciones. **O** descarga `macItRun.zip` de la [última versión](https://github.com/matheusrosa27/macItRun-runtime/releases/latest),
descomprímelo y arrástralo a Aplicaciones; la primera vez, ve a **Ajustes del Sistema → Privacidad y
seguridad → Abrir igualmente** (solo una vez, porque la app no está notarizada por Apple).

Las releases `runtime-…` incluyen el Wine que usa la app y su código fuente completo (LGPL).
