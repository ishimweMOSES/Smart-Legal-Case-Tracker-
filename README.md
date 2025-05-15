# ⚖️ Smart Legal Case Tracker (SLCT)

> 🎓 **Capstone Project – Oracle PL/SQL Database System**  
> 🧑‍💻 Developed by: **Moise Ishimwe**  
> 🧑‍🤝‍🧑 Group: TUES | 🆔 Student ID: 27657

---

## 📌 Project Overview

🔍 Legal firms often struggle to manage large amounts of sensitive case data, lawyer assignments, billing, and deadlines.  
📉 Manual systems cause delays, errors, and lack of accountability.  

💡 **Smart Legal Case Tracker (SLCT)** is a centralized legal case management system built with **Oracle 18c/21c** using **PL/SQL**. It automates operations, enforces security, restricts invalid manipulations, and provides full audit tracking.

---

## 📚 Features at a Glance

✅ Dynamic database with full PL/SQL support  
🔒 Secure data access with day-based and holiday-based triggers  
📦 Reusable procedures and packages for modular programming  
🕵️ Full auditing of insert/update/delete attempts  
📈 Normalized schema with ERD and BPMN design  
📊 OEM monitoring and real-world insertions for testing

---

## 🧩 Problem Statement

Legal offices face:

- ⚠️ Poor tracking of deadlines and billing
- ❌ Lack of automation for case monitoring
- 🔐 No restrictions on who can alter sensitive data and when
- 🕵️‍♂️ No way to track user activity or unauthorized actions

**This system solves these issues through automation, restrictions, and logging.**

---

## 🛠️ Technologies Used

| Tool                  | Purpose                           |
|-----------------------|-----------------------------------|
| Oracle 18c / 21c      | Database engine                   |
| PL/SQL                | Logic, Triggers, Procedures       |
| Oracle SQL Developer  | DB Interface                      |
| GitHub                | Version Control & Reporting       |
| Draw.io / Lucidchart  | BPMN + ERD Diagrams               |

---

## 📦 Database Overview

### 🧱 Main Entities

- 👤 `CLIENTS`: Stores client details  
- ⚖️ `CASES`: Tracks legal cases  
- 🧑‍💼 `LAWYERS`: Handles lawyer assignments  
- 💵 `BILLING`: Manages case fees  
- 📅 `TASKS`: Records daily activities & deadlines

### 🔐 Special Tables

- 📆 `HOLIDAYS`: Public holidays blocking data entry  
- 🪪 `AUDIT_LOG`: Tracks user DML attempts and outcomes  

---

## 🖼️ Diagrams

### 🧠 ER Diagram  
📸 *Insert ERD screenshot here*

### 🔄 BPMN Business Flow  
📸 *Insert BPMN workflow screenshot here*

---

## 🔧 SQL Implementation

### 📁 File Structure


---

## 🚀 Sample Outputs

### 📋 Client Fetch Procedure  
📸 *Screenshot of `fetch_clients_by_lawyer` output*

### 🧱 Trigger Restriction Message  
📸 *Screenshot showing weekday/holiday block message*

### 🕵️ Audit Log Entry  
📸 *Screenshot of `AUDIT_LOG` table after blocked action*

---

## 🔒 Security & Auditing

✔️ Only allows DML on weekends (Saturday/Sunday)  
✔️ Uses a `HOLIDAYS` table to block special days  
✔️ Logs every attempt into `AUDIT_LOG` with:
- 👤 `USER_ID`
- 🕒 `ACTION_TIME`
- 📄 `OPERATION`
- ✅ `STATUS` (allowed/denied)

---

## 🧪 Testing & Validation

🔍 All operations tested in:

- ✅ Oracle SQL Developer  
- ✅ SQL*Plus  

🎯 Edge cases tested:
- Weekday inserts (blocked ❌)  
- Weekend inserts (allowed ✅)  
- Holiday inserts (blocked ❌)  
- Select queries and procedures (successful ✅)  

---

## 📊 Monitoring with OEM

📸 *Screenshot showing SLCT database in Oracle Enterprise Manager (OEM)*

---

## 🔁 Future Enhancements

✨ Web-based front-end using Flask or PHP  
🔗 API integration with legal document systems  
📱 Mobile dashboard for lawyers on the go  
🔏 Role-based permissions for better control

---

## 📑 References

- Oracle PL/SQL Developer Guide  
- Oracle Docs: [https://docs.oracle.com](https://docs.oracle.com)  
- Real-case inspiration from Rwanda Judiciary Website  
- Capstone project guide (AUCA IM Dept)

---

> 🧠 “Law is reason, free from passion – but managing law requires precision, security, and automation. That’s what SLCT delivers.”  
> – *Team TUES*

