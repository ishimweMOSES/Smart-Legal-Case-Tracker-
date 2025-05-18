
# 📚 Smart Legal Case Tracker – Capstone Project Documentation

## 👤 Author
**Moise Ishimwe**  
Bachelor of Information Management  
Adventist University of Central Africa (AUCA)

---

## 🧾 Project Description
**Smart Legal Case Tracker** is a complete legal case management database system that helps law firms manage and track clients, lawyers, tasks, billing, and cases more effectively using Oracle SQL and PL/SQL.

---

## ✅ Project Objectives
- 📂 Design a relational database to manage legal information.
- ✍️ Implement DML and DDL operations.
- 🔁 Automate operations using stored procedures and functions.
- 🔒 Secure the database using triggers and auditing.
- 📊 Track user activity and enforce restrictions using PL/SQL.

---

## 📌 Table of Contents
- [1. Problem Statement](#1-problem-statement)
- [2. Entity Relationship Design](#2-entity-relationship-design)
- [3. SQL Table Creation & Insertions](#3-sql-table-creation--insertions)
- [4. DML/DDL Operations](#4-dmlddl-operations)
- [5. Procedures & Functions](#5-procedures--functions)
- [6. Packages & Cursor Use](#6-packages--cursor-use)
- [7. Triggers & Auditing](#7-triggers--auditing)
- [8. Testing & Evidence](#8-testing--evidence)
- [9. Pluggable Database (PDB) Created](#9-pluggable-database-pdb-created)
- [10. Summary](#10-summary)
- [11. Recommendations](#11-recommendations)
- [12. Contact](#12-contact)

---

## 🔹 1. Problem Statement

Manual tracking of legal cases is inefficient and error-prone. This project solves that by introducing a database that supports automation, restrictions, and user accountability through advanced SQL and PL/SQL features.

> 🎯 We aim to prevent unauthorized data changes, automate workflows, and maintain integrity through strict controls and logging.

---

## 🔹 2. Entity Relationship Design

### Key Entities
- 👤 **Clients**: Stores client info
- ⚖️ **Cases**: Stores legal case details
- 🧑‍💼 **Lawyers**: Manages lawyer data
- 📋 **Tasks**: Tracks assigned legal tasks
- 💰 **Billing**: Logs services and payments

📸 _Screenshot Placeholder_  
**[Insert Screenshot: ERD Model]**

📸 _Screenshot Placeholder_  
**[Insert Screenshot: BPMN Diagram]**

---

## 🔹 3. SQL Table Creation & Insertions

Includes SQL statements for creating core entities and inserting sample data. This step is foundational for all database interactions and logic.

```sql
CREATE TABLE Clients (
  Client_ID INT PRIMARY KEY,
  Name VARCHAR2(100),
  Contact_Info VARCHAR2(100) NOT NULL
);
-- Adds the Clients table with relevant attributes
```

```sql
INSERT INTO Clients VALUES (1, 'John Doe', 'john@example.com');
-- Example client inserted
```

📸 _Screenshot Placeholder_  
**[Insert Screenshot: Tables + Insert Data Output]**

---

## 🔹 4. DML/DDL Operations

Demonstrates essential modification tasks (insert/update/delete) and structural changes.

```sql
UPDATE Cases SET Status = 'Closed' WHERE Case_ID = 101;
-- Changes status of case to 'Closed'
```

```sql
DELETE FROM Tasks WHERE Task_ID = 2;
-- Deletes task record with ID 2
```

```sql
ALTER TABLE Billing ADD Transaction_Method VARCHAR2(50);
-- Adds a payment method field to Billing table
```

📸 _Screenshot Placeholder_  
**[Insert Screenshot: DML/DDL Success]**

---

## 🔹 5. Procedures & Functions

Reusable PL/SQL blocks for querying and displaying information.

```sql
CREATE OR REPLACE PROCEDURE get_case_details (p_case_id IN NUMBER) IS
  v_status VARCHAR2(50);
BEGIN
  SELECT status INTO v_status FROM Cases WHERE Case_ID = p_case_id;
  DBMS_OUTPUT.PUT_LINE('Case Status: ' || v_status);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No such case found.');
END;
-- Procedure to display case status
```

```sql
CREATE OR REPLACE FUNCTION get_lawyer_name (p_lawyer_id IN NUMBER)
RETURN VARCHAR2 IS
  v_name VARCHAR2(100);
BEGIN
  SELECT Name INTO v_name FROM Lawyers WHERE Lawyer_ID = p_lawyer_id;
  RETURN v_name;
END;
-- Returns lawyer's name by ID
```

📸 _Screenshot Placeholder_  
**[Insert Screenshot: Procedure/Function Output]**

---

## 🔹 6. Packages & Cursor Use

Encapsulates related functions and procedures for modular use.

```sql
-- Package Specification
CREATE OR REPLACE PACKAGE case_pkg IS
  PROCEDURE show_case_status(p_case_id NUMBER);
  FUNCTION get_lawyer_name(p_lawyer_id NUMBER) RETURN VARCHAR2;
END case_pkg;
```

```sql
-- Package Body
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
-- Package handles cases and lawyers conveniently
```

📸 _Screenshot Placeholder_  
**[Insert Screenshot: Package Output]**

---

## 🔹 7. Triggers & Auditing

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
-- Prevents modifications on weekdays and holidays
```

📸 _Screenshot Placeholder_  
**[Insert Screenshot: Trigger Compilation & Result]**

---

## 🔹 8. Testing & Evidence

```sql
UPDATE Cases SET Status = 'Pending' WHERE Case_ID = 101;
-- Should trigger restriction logic
```

```sql
SELECT * FROM audit_log ORDER BY log_date DESC;
-- Displays audit log for all attempts
```

📸 _Screenshot Placeholder_  
**[Insert Screenshot: Audit Log Result]**

---

## 🔹 9. Pluggable Database (PDB) Created

📸 _Screenshot Placeholder_  
**[Insert Screenshot: PDB Created Confirmation Window]**

> Example: `TUES_MOISE_SMARTLEGALCASETRACKER_DB`

---

## 🔹 10. Summary

| Phase | Description | Status |
|-------|-------------|--------|
| Phase I | Problem Statement | ✅ Done |
| Phase II | ERD & Modeling | ✅ Done |
| Phase III | Logical Design | ✅ Done |
| Phase IV | Table Creation & Insertion | ✅ Done |
| Phase V | DML/DDL Operations | ✅ Done |
| Phase VI | Procedures, Functions, Cursors, Packages | ✅ Done |
| Phase VII | Triggers & Auditing | ✅ Done |

---

## 🔹 11. Recommendations
- 📅 Add more holiday entries each month to maintain restriction.
- 🖥️ Future improvement can include a UI and report generation module.
- 👥 Ensure roles and privileges are enforced for multi-user environments.

---

## 🔹 12. Contact

For questions, demo or collaboration:  
📩 ishimwemugemamoise@gmail.com  
📞 0789291093 | 0721412296

---

_This README serves as comprehensive documentation of the Smart Legal Case Tracker database project. All critical SQL, PL/SQL logic, and business rules are implemented and tested as part of this work._
