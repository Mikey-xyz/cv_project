#!/bin/bash

print_contact_info() {
    clear
    check_terminal_size
    print_header
    echo ""
    echo ""
    echo "[Contact Information]"
    echo "- Email: $email"
    echo "- LinkedIn: $linkedin"
    echo "- Phone: $phone"
}