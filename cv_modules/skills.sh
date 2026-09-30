#!/bin/bash

print_skill_header() {
    echo "╔══════════════════════════════════════════════════════════╗"
    echo "║                                                          ║"
    echo "║                          SKILLS                          ║"
    echo "║                                                          ║"
    echo "╚══════════════════════════════════════════════════════════╝"
}

print_skills(){
    clear
    check_terminal_size
    print_header
    echo ""
    echo ""
    print_skill_header
    echo ""
    echo ""
    echo "[Programming Languages]"
    for skill in "${programming_languages[@]}"; do
        echo "• $skill"
    done
    echo ""
    echo "[Web Technologies]"
    for skill in "${web_technologies[@]}"; do
        echo "• $skill"
    done
    echo ""
    echo "[Operating Systems]"
    for skill in "${operating_systems[@]}"; do
        echo "• $skill"
    done
    echo ""
    echo "[Cybersecurity]"
    for skill in "${cybersecurity[@]}"; do
        echo "• $skill"
    done
    echo ""
    echo "[Technical Tools]"
    for skill in "${technical_tools[@]}"; do
        echo "• $skill"
    done
    echo ""
    echo "[Soft Skills]"
    for skill in "${soft_skills[@]}"; do
        echo "• $skill"
    done
}

print_languages() {
    clear
    check_terminal_size
    print_header
    echo ""
    echo ""
    echo "[Languages]"
    for language in "${languages[@]}"; do
        echo "• $language"
    done
}