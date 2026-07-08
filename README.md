# 🎮 Autonomous System simulation in Docker
> A class project built with **Docker** containers.
> 🌍 Full ISP simulation. 🧩 VPN, DNS, SMTP and much more.
---


## 📌 Project Overview
ISPs have always been a blackbox with many layers of abstraction, but a blackbox that we all use daily.
To better understand how they work, this project focuses on recreating an Autonomous System that acts as an ISP,
interconnecting other ASs and granting a private and safe access to the rest of the network for its customers.

---


## 🚀 Features
| Feature             | Status        |
|---------------------|---------------|
| VPN connexion between client and enterprise site          | 🟩 Done !      |
| Enterprise and public DNS with dynamic host resolution    | 🟩 Done !      |
| Dynamic routing via OSPF                                  | 🟩 Done !      |
| Dynamic attribution of IP via a subscription system       | 🟩 Done !      |
| Private ip and box-like connection for the ISP's clients  | 🟩 Done !      |
| Functionning VoIP service via Asterisk for the enterprise | 🟩 Done !      |
| SMTP server to send mail for the enterprise               | 🟩 Done !      |
| VLAN segmentation of the enterprise site                  | 🟩 Done !      |
| Secure access implemented by a firewall                   | 🟩 Done !      |
---


## 🗓️ Development Timeline
| Date       | Milestone                   | Status    |
|------------|-----------------------------|-----------|
| 2025-10 | Project initialized          | ✅ Done     |
| 2026-01 | Project Due                  | ✅ Done     |
| 2026    | Continuation of the project  | 🟧 To do    |
---


## ▶️ Running the Program
```bash
# Launching
docker compose up -d

# Acessing a specific equipment
docker exec "equipment-name" bash
```
>💡 Make sure you have Docker desktop installed !
---


## 🧪 TODO
- [ ] A lot.
---


## 🐞 Known Issues
- [ ] None for now.
---


## 🤝 Contributors
| Names        | Role           | Github Profile|
|-------------|----------------|---------------|
| *Hocine Mediani*     | 👨‍💻 Developer   | [> hocinemediani](https://github.com/hocinemediani) |
| *Ilian Kraifi*       | 👨‍💻 Developer   | [> iki389](https://github.com/ik389) |
| *Benjamin Krief*     | 👨‍💻 Developer   | [> Banshai012](https://github.com/Banshai012) |
| *Bonheur Eldjimbaye* | 👨‍💻 Developer   | [> BONHEUR-ELDJIMBAYE](https://github.com/BONHEUR-ELDJIMBAYE) |
| *Aymen Nadi*         | 👨‍💻 Developer   | [> aymennadi](https://github.com/aymennadi) |
| *Marouane Berrad*    | 👨‍💻 Developer   | [> marbrd](https://github.com/marbrd) |
---


## 💬 Feedback & Contact
📬 Found a bug? Have suggestions?  
Open an issue or contact me directly via [hocine.mediani7@gmail.com](mailto:hocine.mediani7@gmail.com)

---

Shield: [![CC BY-NC-ND 4.0][cc-by-nc-nd-shield]][cc-by-nc-nd]

This work is licensed under a
[Creative Commons Attribution-NonCommercial-NoDerivs 4.0 International License][cc-by-nc-nd].

[![CC BY-NC-ND 4.0][cc-by-nc-nd-image]][cc-by-nc-nd]

[cc-by-nc-nd]: http://creativecommons.org/licenses/by-nc-nd/4.0/
[cc-by-nc-nd-image]: https://licensebuttons.net/l/by-nc-nd/4.0/88x31.png
[cc-by-nc-nd-shield]: https://img.shields.io/badge/License-CC%20BY--NC--ND%204.0-lightgrey.svg
