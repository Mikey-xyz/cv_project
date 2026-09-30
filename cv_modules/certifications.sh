#!/bin/bash

print_cert(){
    local date="$1"
    local name="$2"

    printf "[%-7s] %s\n" "$date" "$name"
}

print_certifications() {
    clear
    check_terminal_size
    print_header
    echo ""
    echo ""
    echo "[Certifications]"
    echo ""
    echo "Plataforma NAU"
    echo "──────────────────────────────────────────────────────────────"
    print_cert "JUN 2026" "Fundamentos de Cibersegurança"
    print_cert "JUN 2026" "Introdução às Boas Práticas de Cibersegurança"
    echo ""
    print_cert "JUL 2026" "Estratégias de cibersegurança empresarial"
    print_cert "JUL 2026" "Introdução à Segurança da Informação Classificada"
    print_cert "JUL 2026" "Gestão dos Riscos de Cibersegurança nas Organizações"
    echo ""
    print_cert "SEP 2026" "Cyber Security Incident Response"
    echo ""
    echo ""
    echo "ArcX"
    echo "──────────────────────────────────────────────────────────────"
    print_cert "SEP 2026" "Cyber Threat Intelligence 101"
}