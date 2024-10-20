# AutoPyl
# Script de Automatización de Payloads

Este script automatiza la creación de payloads para diferentes plataformas (Windows, Android, Linux, MacOS) usando `msfvenom`. Además, configura un listener de Metasploit en una nueva ventana de terminal para manejar la conexión una vez que el payload se ejecute en el dispositivo objetivo.

## Características

- Soporta múltiples plataformas: 
  - Windows
  - Android
  - Linux
  - MacOS
- Permite la entrada de usuario para:
  - LHOST (dirección IP)
  - LPORT (puerto)
  - Ruta de archivo para guardar el payload
- Abre automáticamente una nueva ventana de terminal (Kitty) y configura Metasploit en modo escucha.
- Efecto de carga durante la creación del payload para mejorar la experiencia del usuario.

## Requisitos

Antes de usar el script, asegúrate de tener los siguientes componentes instalados en tu sistema:

- **Arch Linux** (o cualquier otra distribución de Linux)
- **Kitty terminal** (o modifica el script para usar tu terminal preferida)
- **Metasploit Framework**
- **msfvenom** (viene incluido con Metasploit)

## Uso

1. Clona este repositorio o descarga el script directamente.
   
   ```bash
   git clone https://github.com/tuusuario/payload-automation.git
   cd payload-automation
2. Haz que el script sea ejecutable:

   ```bash
   chmod +x payAuto.sh

3. Ejecuta el script:
   ```bash
   ./payAuto.sh

4. Selecciona el tipo de dispositivo para el payload, ingresa la dirección IP, puerto y la ruta donde quieres guardar el payload. El script creará el payload y abrirá una nueva terminal con Metasploit en escucha.

## Personalización

Si usas una terminal diferente a Kitty, puedes modificar la línea correspondiente del script para ajustarlo a tu terminal favorita.
