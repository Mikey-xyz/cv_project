#!/bin/bash

detect_environment() {
    clear 
    print_header

    echo ""
    echo "[Environment Detection]"
    echo ""

    echo "Operating System: $(uname -s)"
    echo "Kernel Version: $(uname -r)"
    echo "Architecture: $(uname -m)"
    echo "Hostname: $(hostname)"
    echo "Current User: $(whoami)"
    echo "Shell: $SHELL"
}