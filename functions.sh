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
    printf "%b\n" "${CYAN}──────────────────── [ CV ] ────────────────────${RESET}"

    printf "%b\n" "${WHITE}[1] About Me${RESET}"
    printf "%b\n" "${WHITE}[2] Contact${RESET}"
    printf "%b\n" "${WHITE}[3] Education${RESET}"
    printf "%b\n" "${WHITE}[4] Experience${RESET}"
    printf "%b\n" "${WHITE}[5] Skills${RESET}"
    printf "%b\n" "${WHITE}[6] Certifications${RESET}"
    printf "%b\n" "${WHITE}[7] Projects${RESET}"

    echo ""

    printf "%b\n" "${CYAN}────────────────── [ SYSTEM ] ──────────────────${RESET}"

    printf "%b\n" "${WHITE}[8] System & Security ${RESET}"

    echo ""

    printf "%b\n" "${RED}[0] Exit${RESET}"

    printf "\n%b" "${GREEN}> ${RESET}"

    read -rp "Select an option: " option
}

menu_security_tools() {
    while true; do
        clear
        print_header

        printf "%b\n" "${CYAN}─────────────────── [ SYSTEM ] ───────────────────${RESET}"

        printf "%b\n" "${WHITE}[1] Environment Detection${RESET}"
        printf "%b\n" "${WHITE}[2] Installed Tools${RESET}"
        printf "%b\n" "${WHITE}[3] Security Check${RESET}"
        echo ""
        printf "%b\n" "${RED}[0] Back${RESET}"
        echo ""

        printf "\n%b" "${GREEN}> ${RESET}"
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

animate_progress() {
    local label="$1"
    local width=30
    local progress
    local filled
    local empty

    for ((progress = 0; progress <= 100; progress += 2)); do
        filled=$((progress * width / 100))
        empty=$((width - filled))

        printf "\033[37m\r  %-12s [" "$label"

        printf '\033[37m%*s' "$filled" '' | tr ' ' '#'
        printf '\033[37m%*s' "$empty" '' | tr ' ' '-'

        printf "] %3d%%" "$progress"

        sleep 0.02
    done

    printf " \033[92m[OK]\n"
}

blink_access_granted() {
    local message="> ACCESS GRANTED <"

    for ((i = 0; i < 4; i++)); do
        printf "\r  %-20s" "$message"
        sleep 0.2

        printf "\r  %-20s" ""
        sleep 0.2
    done

    printf "\r  %-20s\n" "$message"
}

animate_banner() {
    local colors=(
        "\033[36m"  # Cyan
        "\033[34m"  # Blue
        "\033[35m"  # Magenta
        "\033[34m"  # Blue
    )

    local reset="\033[0m"
    local index=0
    local frames=15
    local frame

    tput civis

    for ((frame = 0; frame < frames; frame++)); do
        printf '\033[H'

        printf "%b" "${colors[$index]}"

        cat << 'EOF'
  +------------------------------------------------------+
  |                                                      |
  |              MIGUEL PEREIRA                          |
  |              CYBERSECURITY TECHNICIAN                |
  |                                                      |
  |              CLI CURRICULUM VITAE                    |
  |                                                      |
  +------------------------------------------------------+
EOF

        printf "%b" "$reset"

        sleep 0.15

        index=$((index + 1))

        if (( index >= ${#colors[@]} )); then
            index=0
        fi
    done

    tput cnorm
}


show_intro() {
    clear

    # Hide cursor during animation
    tput civis

    echo ""
    echo "  +------------------------------------------------------+"
    echo "  |        MIGUEL PEREIRA // SECURE TERMINAL            |"
    echo "  +------------------------------------------------------+"
    echo ""

    printf "  ${GREEN}> ${RESET}INITIALIZING CV SYSTEM"
    echo ""
    echo ""

    animate_progress "SYSTEM"
    animate_progress "NETWORK"
    animate_progress "SECURITY"
    animate_progress "CV MODULES"

    echo ""
    blink_access_granted

    sleep 0.8

    clear

    animate_banner

    sleep 0.1

    # Show cursor again
    tput cnorm
}