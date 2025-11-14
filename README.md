# Nautilus Infrastructure Automation with Ansible

Automated deployment and configuration of application servers in Stratos DC using Ansible.

This repository documents a series of infrastructure automation tasks completed to standardize server setup, package installation, service management, and fine-grained file permissions — all without manual intervention.

> **Goal**: Ensure consistency, security, and scalability across all app servers using infrastructure-as-code principles.

---

## ✅ Tasks Automated

| Task | Playbook | Description |
|------|----------|-------------|
| ✅ Install `httpd` | `ansible/playbook.yml` | Installed and enabled Apache HTTPD service on all app servers |
| ✅ Deploy static content | `ansible/playbook.yml` | Created `/var/www/html/index.html` with welcome message |
| ✅ Install `zip` utility | `ansible/playbook.yml` | Ensured `zip` package available on all servers |
| ✅ Create system files | `ansible/playbook.yml` | Created `/tmp/file.txt`, `/opt/sysops/{blog.txt,story.txt,media.txt}` |
| ✅ Set ACL permissions | `ansible/playbook.yml` | Granular file access for `tony`(group), `steve`(user), `banner`(group) |
| ✅ SSH key auth setup | Manual (pre-req) | Configured passwordless SSH from `thor@jumphost` to `tony@stapp0[1-3]` |

---

## 🛠️ How to Use (For Team Members)

### Prerequisites
- Access to jump host as user `thor`
- Inventory file at `/home/thor/ansible/inventory`
- SSH key-based authentication configured between `thor` and app servers

### Run the Automation
```bash
cd /home/thor/ansible/
ansible-playbook -i inventory playbook.yml
