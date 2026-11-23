# Cybersecurity and Governance QA Report

## Week 11 Test Cases

### QA-01 - Environment Checkpoint
**Test:** Verify the Kubernetes node, application pods, monitoring pods, NetworkPolicy, ServiceAccount, web health endpoint, and GitHub ruleset.

**Expected Result:** Required services are available and the protect-master ruleset is active.

**Evidence:** `capstone/cybersecurity-governance/evidence/environment-checkpoint.txt`

### QA-02 - Container Image Vulnerability Scan
**Test:** Scan the running web image with Trivy.

**Expected Result:** Trivy produces a vulnerability report that can be used as baseline evidence.

**Evidence:** `capstone/cybersecurity-governance/evidence/trivy-image-before.json`

### QA-03 - Repository Secret Scan
**Test:** Run gitleaks against the full Git history.

**Expected Result:** Zero unresolved secret findings.

**Evidence:** `capstone/cybersecurity-governance/evidence/gitleaks-report.json`

### QA-04 - OpenTofu Checkov Scan
**Test:** Scan the Week 5 OpenTofu configuration with Checkov.

**Expected Result:** Checkov produces a security configuration report.

**Evidence:** `capstone/cybersecurity-governance/evidence/checkov-before.json`

### QA-05 - OpenTofu Trivy Scan
**Test:** Scan the Week 5 configuration with Trivy config.

**Expected Result:** Trivy produces a configuration scan report.

**Evidence:** `capstone/cybersecurity-governance/evidence/trivy-config-before.json`

### QA-06 - Kubernetes Workload Scan
**Test:** Run kube-score against the live web and database deployment manifests.

**Expected Result:** kube-score evaluates the Kubernetes workload configuration.

**Evidence:** `capstone/cybersecurity-governance/evidence/kube-score.txt`

## Author and Tester

Author: Abdirahman Mohamed  
Tester: Abdirahman Mohamed
