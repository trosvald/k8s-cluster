<div align="center">

<img width="144px" height="144px" src="https://raw.githubusercontent.com/sysnet4admin/kubernetes-release-logos/main/v1.29.png"/>

## ☸ Home Kubernetes Cluster ☸

... managed with Flux and Renovate :robot:

</div>

<div align="center">
<div>

[![Kubernetes](https://img.shields.io/badge/dynamic/yaml?url=https://raw.githubusercontent.com/trosvald/k8s-cluster/main/infrastructure/talos/talconfig.yaml&query=$.kubernetesVersion&flat-square&logo=kubernetes&logoColor=white&label=k8s)](https://k8s.io/)&nbsp;&nbsp;
[![Talos](https://img.shields.io/badge/dynamic/yaml?url=https://raw.githubusercontent.com/trosvald/k8s-cluster/main/infrastructure/talos/talconfig.yaml&query=$.talosVersion&flat-square&logo=kubernetes&logoColor=white&label=talos)](https://www.talos.dev/)

</div>
</div>

<div align="center">

[![Node-Count](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.monosense.io%2Fquery%3Fformat%3Dendpoint%26metric%3Dprod_cluster_node_count&style=flat-square&label=Nodes)](https://github.com/kashalls/kromgo)&nbsp;&nbsp;
[![Uptime](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.monosense.io%2Fquery%3Fformat%3Dendpoint%26metric%3Dprod_cluster_uptime_days&style=flat-square&label=Uptime)](https://github.com/kashalls/kromgo)&nbsp;&nbsp;
[![Age-Days](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.monosense.io%2Fquery%3Fformat%3Dendpoint%26metric%3Dprod_cluster_age_days&style=flat-square&label=Age)](https://github.com/kashalls/kromgo)&nbsp;&nbsp;
[![Pod-Count](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.monosense.io%2Fquery%3Fformat%3Dendpoint%26metric%3Dprod_cluster_pod_count&style=flat-square&label=Pods)](https://github.com/kashalls/kromgo)&nbsp;&nbsp;
[![CPU-Usage](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.monosense.io%2Fquery%3Fformat%3Dendpoint%26metric%3Dprod_cluster_cpu_usage&style=flat-square&label=CPU)](https://github.com/kashalls/kromgo)&nbsp;&nbsp;
[![Memory-Usage](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.monosense.io%2Fquery%3Fformat%3Dendpoint%26metric%3Dprod_cluster_memory_usage&style=flat-square&label=Memory)](https://github.com/kashalls/kromgo)&nbsp;&nbsp;
</div>

## Overview

This repository is my home Kubernetes cluster in a declarative state. [Flux](https://github.com/fluxcd/flux2) watches the [kubernetes](./kubernetes/) folder and will make the changes to the cluster based on the YAML manifests.


### Core Components

- [cilium/cilium](https://github.com/cilium/cilium): Kubernetes CNI.
- [rook/rook](https://github.com/rook/rook): Distributed block storage for peristent storage.
- [mozilla/sops](https://toolkit.fluxcd.io/guides/mozilla-sops/): Manages secrets for Kubernetes, Ansible and Terraform.
- [kubernetes-sigs/external-dns](https://github.com/kubernetes-sigs/external-dns): Automatically manages DNS records from my cluster in Cloudflare (external) and Bind9 (internal).
- [jetstack/cert-manager](https://cert-manager.io/docs/): Creates SSL certificates for services in my Kubernetes cluster.
- [kubernetes/ingress-nginx](https://github.com/kubernetes/ingress-nginx/): Ingress controller to expose HTTP traffic to pods over DNS.
- [siderolabs/talos](https://www.talos.dev/): The Kubernetes Operating System.
- [backube/volsync](https://github.com/backube/volsync) and [backube/snapscheduler](https://github.com/backube/snapscheduler): Backup and recovery of persistent volume claims.
- [democratic-csi](https://github.com/democratic-csi/democratic-csi): Provides iSCSI and NFS storage provisioning

### :robot:&nbsp; Automation

- [Github Actions](https://docs.github.com/en/actions) for checking code formatting and running periodic jobs
- [Renovate](https://github.com/renovatebot/renovate) keeps the application charts and container images up-to-date

### Directories

This Git repository contains the following directories under [kubernetes](./kubernetes/).

```sh
📁 kubernetes      # Kubernetes cluster defined as code
├─📁 bootstrap     # Flux installation
├─📁 flux          # Main Flux configuration of repository
└─📁 apps          # Apps deployed into my cluster grouped by namespace
```

## 🔧 Hardware

My hardware I managed to acquire, sticking to amd64 based machines for now.

| Device                                                | Count | OS Disk Size  | Data Disk Size       | Ram     | Operating System | Purpose           |
|-------------------------------------------------------|-------|---------------|----------------------|---------|------------------|-------------------|
| Lenovo Thinkcentre M910q                              | 3     | 256GB SSD     | -                    | 32GB    | Talos            | control-plane     |
| Lenovo Thinkcentre M720q                              | 2     | 240GB SSD     | 1TB NVME             | 64GB    | Talos            | worker            |
| Lenovo Thinkcentre M920x                              | 2     | 512GB NVME    | 1TB NVME             | 64GB    | Talos            | worker            |
| Dell PE R720xd                                        | 1     | 500GB SSD     | 4x4TB HDD - ISCSI/NFS| 256GB   | TrueNAS SCALE    | NAS               |
|                                                       |       |               | 8x800GB SSD - S3     |         |                  |                   |
| Lenovo Thinkcentre M720q                              | 1     | 512GB NVME    | -                    | 16GB    | VyOS 1.4         | Router            |
| TP-LINK TL-SG3428X                                    | 1     | N/A           | N/A                  | N/A     | N/A              | Core Switch       |
| TP-LINK TL-SX3008F                                    | 2     | N/A           | N/A                  | N/A     | N/A              | ToR Switch        |
| TP-LINK TL-SG2210MP                                   | 1     | N/A           | N/A                  | N/A     | N/A              | PoE Switch        |
| APC SUA1500VA + 2x50Ah                                | 1     | N/A           | N/A                  | N/A     | N/A              | Network UPS       |
| APC SMC1500IC                                         | 1     | N/A           | N/A                  | N/A     | N/A              | Synology UPS      |
| APC SMC2000I                                          | 1     | N/A           | N/A                  | N/A     | N/A              | Worker UPS        |
| APC SMC2000I + 2x170Ah                                | 1     | N/A           | N/A                  | N/A     | N/A              | TrueNAS UPS       |

---

## 🤝 Graditude and Thanks

Thanks to all the people who donate their time to the [Kubernetes @Home](https://github.com/k8s-at-home/) community.

## 🔏 License

See [LICENSE](./LICENSE)
