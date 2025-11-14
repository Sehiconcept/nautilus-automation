# Ansible Automation Files

This directory contains the configuration files used to automate Nautilus app servers.

## Files

- `inventory` — Ansible inventory defining `stapp01`, `stapp02`, `stapp03` with connection details.
- `playbook.yml` — Single playbook with 3 plays targeting each server individually to apply unique configurations.

## Why Not One Play for All?

Some tasks require **server-specific behavior**:
- `blog.txt` → ACL for group `tony` (on stapp01)
- `story.txt` → ACL for user `steve` (on stapp02)
- `media.txt` → ACL for group `banner` (on stapp03)

Using separate `hosts:` blocks ensures precision — no overwrites, no misconfigurations.

## How to Run

```bash
cd /home/thor/ansible/
ansible-playbook -i inventory playbook.yml
