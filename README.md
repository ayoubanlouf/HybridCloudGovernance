# Hybrid Cloud Governance & IaC Automation via Azure Arc

## 📌 Overview
This project demonstrates how to integrate a local "On‑Prem" environment into Microsoft Azure using **Azure Arc** and manage it with **Infrastructure as Code (IaC)** via **Terraform**.  
The goal is to showcase hybrid cloud governance, automated configuration, and enterprise‑grade security practices.

Key highlights:
- Onboarding a local "On-Prem" server into Azure Arc.
- Using Terraform to provision cloud resources and enforce governance.
- Applying Azure Policies for monitoring and compliance.
- Monitoring server performance counterd with Azure Monitor Agent.

---

## 🛠️ Project Roadmap
The project is structured into six phases:

1. **Creating the Local “On‑Prem” Environment**  
   - VMware Workstation VM setup  
   - Ubuntu OS installation  

2. **Installing the Prerequisites**  
   - Azure CLI & Terraform installation  

3. **Creating the Cloud Environment with Terraform (IaC)**  
   - Provider definition  
   - Resource Group creation  
   - Service Principal setup with least privilege  
   - Variables and outputs configuration  

4. **Connecting the “On‑Prem” Server to the Cloud**  
   - Installing Azure Connected Machine Agent (azcmagent)  
   - Registering required resource providers  
   - Connecting VM to Azure Arc  

5. **Post‑Deployment Governance**  
   - Policy assignment via Terraform  
   - Enabling Azure Monitor extensions
   - Monitoring the server with Log Analytics Workspace  

6. **Repository Publishing**  
   - GitHub repo setup with `.gitignore`  

---

## 📂 Documentation
For the **full technical walkthrough, screenshots, and evidence**, please refer to the attached PDF:

👉 [HybridCloudGovernanceDoc.pdf](HybridCloudGovernanceDoc.pdf)
