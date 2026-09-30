#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

set -Eeuo pipefail

source "$SCRIPT_DIR/config.sh"
source "$SCRIPT_DIR/functions.sh"

for cvmodule in "$SCRIPT_DIR"/cv_modules/*.sh; do
    source "$cvmodule"
done

for systemmodule in "$SCRIPT_DIR"/system_modules/*.sh; do
    source "$systemmodule"
done

handle_arguments() {
    case "${1:-}" in 
        --about) print_about ;;
        --contact) print_contact_info ;;
        --education) print_education ;;
        --experience) print_experience ;;
        --skills) print_skills ;;
        --languages) print_languages ;;
        --certifications) print_certifications ;;
        --detect-environment) detect_environment ;;
        --detect-tools) detect_tools ;;
        --security-scan) security_scan ;;
        --help) print_help ;;
        "") main ;;
        *) echo "Invalid argument. Use --help for usage information."; exit 1 ;;
    esac
}

main() {
    while true; do
        clear
        check_terminal_size
        print_header
        echo ""
        menu_options

        case "$option" in
            1) print_about; pause ;;
            2) print_contact_info; pause ;;
            3) print_education; pause ;;
            4) print_experience; pause ;;
            5) print_skills; pause ;;
            6) print_languages; pause ;;
            7) print_certifications; pause ;;
            8) menu_security_tools ;;
            0) echo "Exiting..."; exit 0 ;;
            *) echo "Invalid option. Please try again." ;;
        esac
    done
}

check_terminal_size
handle_arguments "$@"