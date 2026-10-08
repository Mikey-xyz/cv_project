#!/bin/bash

print_study(){
    local establishment="$1"
    local course="$2"
    local start_date="$3"
    local end_date="$4"
    echo "┌─ $establishment"
    echo "│  $course"
    echo "│  $start_date - $end_date"
    echo "│"
}

print_education() {
    clear
    check_terminal_size
    print_header

    echo ""
    echo ""

    print_study "Escola Básica e Secundária de Canelas" "Curso Profissional Técnico de Informática - Sistemas" "2019" "2022"
    print_bullet "Developed programming fundamentals through pseudocode, C++, and Java."
    print_bullet "Applied programming logic, algorithms, and problem-solving techniques to practical exercises."
    print_bullet "Learned fundamental computer networking concepts, including RJ45 cable termination and basic network setup."
    print_bullet "Gained hands-on experience with basic computer assembly, hardware components, and system configuration."
    print_bullet "Developed foundational knowledge of computer systems and IT infrastructure."

    echo "│"
    echo "└────────────────────────────────────────────"
    echo ""

    print_study "IEFP - Instituto do Emprego e Formação Profissional" "APZ+ Técnico Especialista em Cibersegurança" "MAR 2026" "MAR 2027"
    print_bullet "Developed Python and Ruby scripts for log analysis, data processing, and basic security analysis."
    print_bullet "Worked with SQL databases, including database management and querying through phpMyAdmin."
    print_bullet "Gained hands-on experience with Ubuntu and Kali Linux environments."
    print_bullet "Studied and applied cybersecurity concepts across ethical hacking, intrusion detection systems (IDS), and vulnerability assessment."
    print_bullet "Performed network and web vulnerability identification and analysis using security-focused tools and techniques."
    print_bullet "Analyzed evidence related to cybersecurity incidents and potential attacks."
    print_bullet "Studied local area networks (LANs), network configuration, and subnetting."
    print_bullet "Installed, configured, and maintained client and server operating systems, including Windows and Windows Server."
    print_bullet "Developed practical knowledge across multiple areas of cybersecurity, networking, system administration, and security analysis."

    echo "│"
    echo "└────────────────────────────────────────────"
    echo ""
}