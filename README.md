# ⚖️ Smart Legal Case Tracker (SLCT)

> 🎓 **Capstone Oracle PL/SQL Project – AUCA, Department of Information Management**  
> 👨‍💻 Developed by: **Moise Ishimwe** (ID: 27657)  
> 👥 Group: **TUES**  
> 📘 Project Type: Full-stack Oracle Database Application with Advanced Features

---

## 📌 Project Overview

Legal offices often suffer from disorganized case management, missed deadlines, and manual billing errors.  
**Smart Legal Case Tracker (SLCT)** is a fully integrated PL/SQL-based solution that automates lawyer-client operations, enforces business rules, and audits sensitive actions — ensuring **security, accuracy, and professionalism** in legal firm management.

---

## 🗂️ Project Structure (Capstone Phases)

### 🔹 **Phase IV: Database Creation and Naming**

✅ A dedicated **Pluggable Database (PDB)** was created:

```sql
CREATE PLUGGABLE DATABASE TUES_27657_Moise_SLCT_DB ADMIN USER moise IDENTIFIED BY moise
ROLES = (DBA);
