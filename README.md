# 📚 Smart Legal Case Tracker – Capstone Project Documentation

## 👤 Author
**Moise Ishimwe**  
27657  
Bachelor Of Information Management

---

## 🧾 Project Description
**Smart Legal Case Tracker** is a legal case management system that assists law firms in managing and tracking clients, lawyers, tasks, billing, and legal cases efficiently using Oracle SQL and PL/SQL.

---

## ✅ Project Objectives
- 📂 Design a relational database to manage legal information.
- ✍️ Implement DML and DDL operations.
- 🔁 Automate operations using stored procedures and functions.
- 🔒 Secure the database using triggers and auditing.
- 📊 Track user activity and enforce restrictions using PL/SQL.

---

## 📌 Table of Contents
1. [Problem Statement](#-1-problem-statement)
2. [Business Process Model (BPMN)](#-2-business-process-model-bpmn)
3. [Entity Relationship Design (ERD)](#-3-entity-relationship-design-erd)
4. [SQL Table Creation & Insertions](#-4-sql-table-creation--insertions)
5. [DML/DDL Operations](#-5-dmlddl-operations)
6. [Procedures & Functions](#-6-procedures--functions)
7. [Packages & Cursor Use](#-7-packages--cursor-use)
8. [Triggers & Auditing](#-8-triggers--auditing)
9. [Testing & Evidence](#-9-testing--evidence)
10. [PDB Environment Info](#-pdb-environment-info)
11. [Summary](#-summary)
12. [Recommendations](#-recommendations)
13. [Contact](#-contact)
---

## 🔹 1. Problem Statement

Manual tracking of legal cases is inefficient and error-prone. This project introduces a robust database system that integrates automation, restrictions, and user accountability via advanced SQL/PLSQL programming.

> 🎯 Our goal: Prevent unauthorized changes, automate tasks, and ensure data integrity through strong controls and logging.

---

## 🧪 1.5🔹 PDB Environment Info

**Pluggable Database (PDB) Created:**  
`TUE_MOISE_SMARTLEGALCASE`

- ✅ Successfully created and opened
- 👨‍💻 Admin User: `moise_admin`
- 🔐 Password: `moise` *(masked in real submission)*

📸 _PDB and Open Status_  
![Alt Text](https://github.com/ishimweMOSES/Smart-Legal-Case-Tracker-/blob/fc4bc630376ff6e7cf79fc666bbc781401b0db2b/phase%204/pdb.png)


---

## 🔹 2. Business Process Model (BPMN)

Business processes like case assignment, billing, and legal task management are modeled using BPMN for better understanding and clarity.

📸 _ BPMN Diagram_  

![Alt Text](https://github.com/ishimweMOSES/Smart-Legal-Case-Tracker-/blob/94977f44f675c1903316fa7fc6342d41c7e75224/Phase%202/bpmn.png)


---

## 🔹 3. Entity Relationship Design (ERD)

### Key Entities
- 👤 **Clients**: Stores client info
- ⚖️ **Cases**: Contains case details
- 🧑‍💼 **Lawyers**: Lawyer information
- 📋 **Tasks**: Case-related tasks
- 💰 **Billing**: Payment and charges

📸 _ ER Diagram_  

![Alt Text](https://github.com/ishimweMOSES/Smart-Legal-Case-Tracker-/blob/94977f44f675c1903316fa7fc6342d41c7e75224/Phase%203/ERD.png)

---

## 🔹 4. SQL Table Creation & Insertions

### Example: Clients Table
```sql
CREATE TABLE Clients (
  Client_ID INT PRIMARY KEY,
  Name VARCHAR2(100),
  Contact_Info VARCHAR2(100) NOT NULL
);
```
🧾 *This creates the Clients table storing each client's details.*

### Sample Insert
```sql

INSERT INTO clients (client_id, name, contact_info) VALUES (5, 'Ethan Hunt', 'ethan.hunt@example.com');

```
📥 *Inserts a client into the table.*

📸 _Select to see the info _  
![Alt Text](https://github.com/ishimweMOSES/Smart-Legal-Case-Tracker-/blob/ee0f223816914258e4b2283939a32e23420783f5/phase%205/select%20from%20clients.png)

---

## 🔹 5. DML/DDL Operations

### Update a Case
```sql
UPDATE Cases SET Status = 'Closed' WHERE Case_ID = 101;
```
♻️ *Changes the status of a specific case.*

![Alt Text](https://github.com/ishimweMOSES/Smart-Legal-Case-Tracker-/blob/96e14b759d7d1990c320e32de8d5daa9df3c27e9/phase%206/update%20case%20.png)


### Delete a Task
```sql
DELETE FROM Tasks WHERE Task_ID = 2;
```
🗑️ *Deletes a specific task entry.*

![Alt Text](https://github.com/ishimweMOSES/Smart-Legal-Case-Tracker-/blob/96e14b759d7d1990c320e32de8d5daa9df3c27e9/phase%206/delete%20from%20task%20%20using%20ID%20that's%20not%20there%20.png)


### Alter Table to Add Column
```sql
ALTER TABLE Billing ADD Transaction_Method VARCHAR2(50);
```
➕ *Adds a new column for transaction method.*

📸 _Added column transaction_method_  

![Alt Text](https://github.com/ishimweMOSES/Smart-Legal-Case-Tracker-/blob/505a831311daf4c5a8d6aab2899c5b82fa73243f/phase%206/transaction%20method%20altered.png)


---

## 🔹 6. Procedures & Functions

### Procedure: Get Case Details
```sql
CREATE OR REPLACE PROCEDURE get_case_details (p_case_id IN NUMBER) IS
  v_status VARCHAR2(50);
BEGIN
  SELECT status INTO v_status FROM Cases WHERE Case_ID = p_case_id;
  DBMS_OUTPUT.PUT_LINE('Case Status: ' || v_status);
END;
```
🔍 *Displays status of a case using its ID.*

### Function: Get Lawyer Name
```sql
CREATE OR REPLACE FUNCTION get_lawyer_name (p_lawyer_id IN NUMBER)
RETURN VARCHAR2 IS
  v_name VARCHAR2(100);
BEGIN
  SELECT Name INTO v_name FROM Lawyers WHERE Lawyer_ID = p_lawyer_id;
  RETURN v_name;
END;
```
👨‍⚖️ *Returns lawyer’s name based on ID.*

📸 _Screenshot Placeholder_  
**[Insert Screenshot: Output from Procedure/Function]**

---

## 🔹 7. Packages & Cursor Use

### Package Specification
```sql
CREATE OR REPLACE PACKAGE case_pkg IS
  PROCEDURE show_case_status(p_case_id NUMBER);
  FUNCTION get_lawyer_name(p_lawyer_id NUMBER) RETURN VARCHAR2;
END case_pkg;
```
📦 *Declares procedures/functions for reuse.*

### Package Body
```sql
CREATE OR REPLACE PACKAGE BODY case_pkg IS
  PROCEDURE show_case_status(p_case_id NUMBER) IS
    v_status VARCHAR2(100);
  BEGIN
    SELECT status INTO v_status FROM Cases WHERE Case_ID = p_case_id;
    DBMS_OUTPUT.PUT_LINE('Status: ' || v_status);
  END;

  FUNCTION get_lawyer_name(p_lawyer_id NUMBER) RETURN VARCHAR2 IS
    v_name VARCHAR2(100);
  BEGIN
    SELECT name INTO v_name FROM Lawyers WHERE Lawyer_ID = p_lawyer_id;
    RETURN v_name;
  END;
END case_pkg;
```
⚙️ *Implements the logic defined in the package spec.*

📸 _Screenshot Placeholder_  
**[Insert Screenshot: Package Execution Result]**

---

## 🔹 8. Triggers & Auditing

### Holiday Table
```sql
CREATE TABLE Holidays (
  holiday_date DATE PRIMARY KEY
);
```
📅 *Holds official public holidays.*

### Audit Log Table
```sql
CREATE TABLE audit_log (
  log_id NUMBER GENERATED ALWAYS AS IDENTITY,
  user_id VARCHAR2(100),
  log_date DATE,
  operation VARCHAR2(20),
  table_name VARCHAR2(50),
  status VARCHAR2(10)
);
```
🧾 *Tracks who tried to do what and when.*

### Trigger: Restrict DML on Holidays and Weekdays
```sql
CREATE OR REPLACE TRIGGER trg_restrict_dml
BEFORE INSERT OR UPDATE OR DELETE ON Cases
FOR EACH ROW
DECLARE
  v_day VARCHAR2(10);
  v_today DATE := TRUNC(SYSDATE);
  v_holiday_count NUMBER;
BEGIN
  v_day := TO_CHAR(v_today, 'DY', 'NLS_DATE_LANGUAGE=ENGLISH');
  SELECT COUNT(*) INTO v_holiday_count FROM Holidays WHERE holiday_date = v_today;

  IF v_day IN ('MON','TUE','WED','THU','FRI') OR v_holiday_count > 0 THEN
    INSERT INTO audit_log(user_id, log_date, operation, table_name, status)
    VALUES (USER, SYSDATE, 'DML Attempt', 'Cases', 'Denied');
    RAISE_APPLICATION_ERROR(-20001, 'DML operations are not allowed today.');
  ELSE
    INSERT INTO audit_log(user_id, log_date, operation, table_name, status)
    VALUES (USER, SYSDATE, 'DML Attempt', 'Cases', 'Allowed');
  END IF;
END;
```
🛡️ *Prevents changes to the Cases table during restricted periods.*

📸 _Screenshot Placeholder_  
**[Insert Screenshot: Trigger Log Output]**

---

## 🔹 9. Testing & Evidence

### Example: Trigger Test
```sql
UPDATE Cases SET Status = 'Active' WHERE Case_ID = 101;
```
*Use this to test if the restriction trigger is working.*

### View Audit Logs
```sql
SELECT * FROM audit_log ORDER BY log_date DESC;
```
*Displays all user operations tracked by the audit log.*

📸 _Screenshot Placeholder_  
**[Insert Screenshot: Testing Evidence]**

---

## ✅ Summary

| Phase | Description | Status |
|-------|-------------|--------|
| Phase I | Problem Statement | ✅ Done |
| Phase II | Business Process Modeling | ✅ Done |
| Phase III | ERD & Logical Modeling | ✅ Done |
| Phase IV | SQL Table & Insertion | ✅ Done |
| Phase V | DML/DDL Operations | ✅ Done |
| Phase VI | Procedures, Functions, Cursors, Packages | ✅ Done |
| Phase VII | Triggers & Auditing | ✅ Done |

---

## 💡 Recommendations
- ✏️ Update public holidays monthly.
- 🧑‍💻 Consider developing a UI using Python or PHP.
- 🔐 Enhance multi-user access with strict roles and permissions.

---

## 📧 Contact

📩 ishimwemugemamoise@gmail.com  
📞 0789291093 | 0721412296  

---

🗓️ Generated on May 18, 2025
