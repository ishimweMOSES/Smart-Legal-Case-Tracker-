# ⚖️ Smart Legal Case Tracker (SLCT)  
### AUCA Information Management Capstone Project — Group: TUES  
**Student:** Moise Ishimwe (ID: 27657)  

---

## 📌 Project Overview  
Manual management of legal cases leads to inefficiency, missed deadlines, and billing errors in law firms.  
**Smart Legal Case Tracker (SLCT)** is an Oracle PL/SQL database system designed to streamline case tracking, client communication, billing, and task management in small to medium law firms, ensuring accuracy, automation, and security.

---

## 🗂️ Phase 1: Problem Definition & Requirements  

### Problem Statement  
Law firms struggle with managing case deadlines, client communication, and billing manually. SLCT automates these processes to reduce errors and increase productivity.

### Target Users  
- **Lawyers:** Manage cases, deadlines, and client info  
- **Administrative Staff:** Handle billing, scheduling, and client registration  
- **Clients:** (Optional) Receive case updates  

### Main Goals  
- Automate deadline reminders  
- Improve client communication via notifications  
- Simplify invoice generation and payment tracking  
- Ensure secure, scalable data storage  

### Key Entities & Attributes  

| Entity  | Key Attributes                                  |
|---------|------------------------------------------------|
| Clients | Client_ID, Name, Contact_Info, Case_ID          |
| Cases   | Case_ID, Type_of_Case, Status, Assigned_Lawyer, Deadline |
| Lawyers | Lawyer_ID, Name, Specialization, Availability  |
| Billing | Invoice_ID, Client_ID, Services_Rendered, Payment_Status, Amount |
| Tasks   | Task_ID, Case_ID, Assigned_To, Due_Date, Status |

---

## 📊 Phase 2: Business Process Modeling (BPM)  

- **Process Name:** Legal Case Tracking & Billing  
- **Objective:** Automate case deadlines, client updates, billing  
- **Key Roles:** Client, Lawyer, Admin Staff, System (Oracle DB)  
- **Expected Benefits:** Fewer missed deadlines, efficient invoicing, improved decision-making  

> 📸 *Insert BPMN Diagram Screenshot Here*  

---

## 🗃️ Phase 3: Logical Data Model (ER Diagram) & Normalization  

### Entities & Relationships  

| Entity   | PK       | Key FKs                           | Notes                              |
|----------|----------|---------------------------------|-----------------------------------|
| Clients  | Client_ID|                                 | Contact_Info NOT NULL             |
| Cases    | Case_ID  | Assigned_Lawyer → Lawyers.Lawyer_ID | Deadline NOT NULL                 |
| Lawyers  | Lawyer_ID|                                 | Availability (VARCHAR or BOOLEAN) |
| Billing  | Invoice_ID| Client_ID, Case_ID              | Payment_Status CHECK constraint  |
| Tasks    | Task_ID  | Case_ID, Assigned_To → Lawyer_ID| Due_Date NOT NULL                |

### Normalization  
- All tables normalized to **3NF** ensuring data integrity and no redundancy.  

> 📸 *Insert ER Diagram Screenshot Here*  

---

## 🏗️ Phase 4: Database Creation & Configuration  

### Key Actions  
- Created Pluggable Database:  
```sql
CREATE PLUGGABLE DATABASE TUES_27657_SLCT ADMIN USER moise IDENTIFIED BY moise ROLES=(DBA);

