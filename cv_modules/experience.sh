#!/bin/bash

print_job(){
    local company="$1"
    local role="$2"
    local start_date="$3"
    local end_date="$4"
    echo "┌─ $company"
    echo "│  $role"
    echo "│  $start_date - $end_date"
    echo "│"
}

print_experience() {
    clear
    check_terminal_size
    print_header

    echo ""
    echo "[Experience]"
    echo ""

    print_job "key.value" "Junior Software Developer" "FEB 2024" "NOV 2025"

    print_bullet "Enterprise Web Applications — Co-developed enterprise web applications using C# for backend services and Angular for interactive frontend interfaces."

    print_bullet "CRM Development — Built an internal CRM solution from scratch, covering requirements analysis, data modelling and feature implementation."

    print_bullet "Database Development — Designed database schemas and implemented data validation, structured data access and database troubleshooting."

    print_bullet "Hospitality Management System — Designed and deployed a real-time room management and housekeeping dashboard for a hospitality client."

    echo "│"
    echo "└────────────────────────────────────────────"
    echo ""

    print_job "Expandindustria S.A" "Junior Software Developer" "OCT 2022" "FEB 2024"

    print_bullet "Java Development — Maintained and developed features for the company's core business application based on functional and technical requirements."

    print_bullet "Bug Fixing & Troubleshooting — Resolved approximately 5–10 bugs and change requests per week through root-cause analysis."

    print_bullet "SQL & Database Troubleshooting — Wrote queries, extracted data and investigated database issues while maintaining data integrity."

    print_bullet "Deployment & Configuration — Supported application deployment, software configuration and local environment setup for end users."

    echo "│"
    echo "└────────────────────────────────────────────"
}