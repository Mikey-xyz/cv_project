#!/bin/bash

check_terminal_size() {
    local width
    local height

    width=$(tput cols 2>/dev/null || echo 0)
    height=$(tput lines 2>/dev/null || echo 0)

    if (( width < 60 || height < 20 )); then
        clear
        echo "Terminal demasiado pequeno."
        echo ""
        echo "Tamanho atual: ${width}x${height}"
        echo "Tamanho mínimo: 60x20"
        echo ""
        echo "Por favor, aumenta o tamanho do terminal"
        echo "e executa o programa novamente."
        exit 1
    fi
}

print_bullet() {
    local text="$1"
    local width

    width=$(tput cols)

    (( width > 40 )) || width=80

    printf '%s\n' "$text" |
        fold -s -w "$((width - 8))" |
        awk '
            NR == 1 { printf "│  • %s\n", $0; next }
                    { printf "│    %s\n", $0 }
        '
}

print_wrapped() {
    local text="$1"
    local width=70
    width=$(tput cols)
    ((width > 20)) || width=80
    local wrapped_text=$(echo "$text" | fold -s -w "$width")
    echo "$wrapped_text"
}

print_header() {
    echo "╔══════════════════════════════════════════════════════════╗"
    echo "║                    MIGUEL PEREIRA                        ║"
    echo "║         CYBERSECURITY TECHNICIAN IN TRAINING             ║"
    echo "║               JUNIOR SOFTWARE DEVELOPER                  ║"
    echo "╚══════════════════════════════════════════════════════════╝"
}

menu_options() {
    echo "[CV]"
    echo "[1] About Me"
    echo "[2] Contact Information"
    echo "[3] Education"
    echo "[4] Experience"
    echo "[5] Skills"
    echo "[6] Languages"
    echo "[7] Certifications"
    echo ""
    echo "[SYSTEM]"
    echo "[8] System Options"
    echo ""
    echo "[0] Exit"
    echo ""

    read -rp "Select an option: " option
}

menu_security_tools() {
    while true; do
        clear
        print_header

        echo "[System Options]"
        echo ""
        echo "[1] Environment Detection"
        echo "[2] Installed Tools"
        echo "[3] Security Check"
        echo "[0] Back"
        echo ""

        read -rp "Select an option: " option

        case "$option" in
            1) detect_environment; pause ;;
            2) detect_tools; pause ;;
            3) security_scan; pause ;;
            0) return ;;
            *) echo "Invalid option. Please try again." ;;
        esac
    done
}

pause() {
    echo ""
    read -rp "Press ENTER to return to menu..."
    clear
}

print_help() {
    echo "Usage: $0 [OPTION]"
    echo ""
    echo "CV Related Options:"
    echo "  --about               Display information about me"
    echo "  --contact             Display contact information"
    echo "  --education           Display education details"
    echo "  --experience          Display work experience"
    echo "  --skills              Display skills"
    echo "  --languages           Display languages"
    echo "  --certifications      Display certifications"
    echo ""
    echo "Security Tools Options:"
    echo "  --detect-environment  Detect the current environment"
    echo "  --detect-tools        Detect installed security tools"
    echo "  --security-scan       Perform a security scan"
    echo ""
    echo "  --help                Show this help message"
}