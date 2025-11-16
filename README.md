# Nautilus Infrastructure Automation with Ansible

Automated deployment and configuration of application servers in Stratos DC using Ansible.

This repository documents a series of infrastructure automation tasks completed to standardize server setup, package installation, service management, and fine-grained file permissions — all without manual intervention. | 2025-11-15 | Deployed web server with branded content using `lineinfile` | Deployed files conditionally using `ansible_nodename` conditionals | 2025-11-15 | Created VPC using Terraform for cloud migration strategy | 2025-11-15 | Created security group using Terraform for cloud migration | 2025-11-15 | Created EC2 instance using Terraform for cloud migration |

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
| ✅ Deploy web server + branded content | `ansible/playbook.yml` | Installed `httpd`, created `index.html` with branded welcome message at top using `lineinfile` |
| ✅ Conditional file deployment | `ansible/playbook.yml` | Used `when` conditionals with `ansible_nodename` to copy different files to different servers with unique ownership |
| ✅ Terraform VPC creation | `terraform/main.tf` | Created `datacenter-vpc` in `us-east-1` using Infrastructure as Code |
| ✅ Terraform Security Group | `terraform/main.tf` | Created `xfusion-sg` with HTTP/SSH rules using Infrastructure as Code |
| ✅ Terraform EC2 Instance | `terraform/main.tf` | Created `devops-ec2` instance with auto-generated `devops-kp` key using Infrastructure as Code |
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
