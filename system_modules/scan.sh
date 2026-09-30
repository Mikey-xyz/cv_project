#!/bin/bash

security_scan() {
    clear
    print_header

    echo ""
    echo "[Security Check]"
    echo ""

    echo "[Firewall]"

    if command -v ufw >/dev/null 2>&1; then
        ufw_status=$(sudo ufw status 2>/dev/null | head -n 1)
        if [[ "$ufw_status" == "Status: active" ]]; then
            echo "✓ UFW is active"
        else
            echo "✗ UFW is inactive"
        fi
    else
        echo "✗ UFW is not installed"
    fi

    echo ""
    echo "[SSH]"

    if command -v systemctl >/dev/null 2>&1; then
        if systemctl is-active --quiet ssh 2>/dev/null; then
            echo "⚠ SSH service is running"
        else
            echo "✓ SSH service is not running"
        fi
    else
        echo "⚠ systemctl not available"
    fi

    echo ""
    echo "[Open Ports]"

    if command -v ss >/dev/null 2>&1; then
        open_ports=$(ss -tuln 2>/dev/null | awk 'NR>1 {print $5}' | cut -d: -f2 | sort -u)
        if [[ -n "$open_ports" ]]; then
            echo "Open ports:"
            echo "$open_ports"
        else
            echo "No open ports found"
        fi
    else
        echo "✗ ss command is not available to check open ports"
    fi

    echo ""
    echo "[Temporary Directory]"

    tmp_permissions="$(stat -c "%a" /tmp 2>/dev/null || echo "unknown")"
    if [[ "$tmp_permissions" == "1777" ]]; then
        echo "✓ /tmp has standard permissions"
    else
        echo "⚠ /tmp permissions should be reviewed"
    fi
}