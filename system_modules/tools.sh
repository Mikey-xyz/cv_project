#!/bin/bash

get_tool_version() {
    local tool="$1"
    local version=""

    case "$tool" in
        nmap)
            version=$(nmap --version 2>&1 | head -n 1 | sed 's/ (.*//' || true)
            ;;

        wireshark)
            version=$(wireshark --version 2>&1 | head -n 1 || true)
            ;;

        tshark)
            version=$(tshark --version 2>&1 | head -n 1 || true)
            ;;

        tcpdump)
            version=$(tcpdump --version 2>&1 | head -n 1 || true)
            ;;

        nikto)
            version=$(nikto -Version 2>&1 | head -n 1 || true)
            ;;

        sqlmap)
            version=$(sqlmap --version 2>&1 | head -n 1 || true)
            ;;

        hydra)
            version=$(hydra -h 2>&1 | grep -oE 'Hydra v[0-9]+\.[0-9]+' | head -n 1 || true)
            ;;

        john)
            version=$(john --list=build-info 2>&1 |
                grep -m 1 "Version" |
                sed 's/^Version: //' |
                cut -d' ' -f1 ||
                true)
            ;;

        gobuster)
            version=$(gobuster --version 2>&1 | head -n 1 || true)
            ;;

        netcat)
            version="Installed"
            ;;

        *)
            version="Installed"
            ;;
    esac

    if [[ -z "$version" ]]; then
        version="Installed"
    fi

    echo "$version"
}

detect_tools() {
    clear
    print_header

    echo ""
    echo "[Security Tools]"
    echo ""

    local tools=(
        "nmap"
        "wireshark"
        "tshark"
        "tcpdump"
        "nikto"
        "sqlmap"
        "hydra"
        "john"
        "gobuster"
        "netcat"
    )

    local tool
    local version

    for tool in "${tools[@]}"; do
        if command -v "$tool" >/dev/null 2>&1; then
            version="$(get_tool_version "$tool")"
            printf "✓ %-12s %s\n" "$tool" "$version"
        else
            printf "✗ %-12s Not Installed\n" "$tool"
        fi
    done
}