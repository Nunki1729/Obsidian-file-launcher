# Obsidian File Launcher (Linux)

This project provides a simple launcher that allows you to open Markdown (`.md`) files directly in Obsidian from your file explorer.

> **Current status:**
> This project has only been tested on **Pop!_OS**. It may work on other Linux distributions, but this is not guaranteed.

---

## Installation

### 1. Download Obsidian

Download the AppImage from the official website:

https://obsidian.md/download

Then:

* Place the file in the same directory as `install.sh`
* Rename it to:

```bash
Obsidian.AppImage
```

---

### 2. Make the installer executable

Open a terminal in the project folder and run:

```bash
chmod +x install.sh
```

---

### 3. Run the installer

```bash
./install.sh
```

---

## What the installer does

* Copies the launcher and required files to `~/.obsidian_app`
* Creates a `.desktop` entry
* Registers Obsidian as the default application for `.md` files

---

## Notes

* This project does **not** include Obsidian itself.
* You must download the AppImage manually from the official website.
* The AppImage must be named exactly `Obsidian.AppImage`.

---

## Limitations

* Only tested on Pop!_OS
* Requires a Linux desktop environment with `.desktop` support

---

## Acknowledgements

Thanks to the Obsidian team for their support and for building such a great tool.

---

# <Project Name>

Short description of what your project does.

## License

This project is licensed under the **GNU General Public License v3.0** (GPL-3.0).  
See the [LICENSE](./LICENSE) file for details.

## Author

© 2026 Javier Santiago (Nunki1729)  
Contact: cocosunusu@gmail.com or GitHub: [Nunki1729](https://github.com/Nunki1729)
