# Smart Legal Case Tracker – PL/SQL Oracle Project

## 👤 Group Information

* **Group Name:** TUES
* **Student Name:** Moise Ishimwe
* **Student ID:** 27657

---

## 📌 Problem Statement

Managing legal cases, deadlines, lawyer assignments, and billing in a law firm is often handled using scattered spreadsheets or manual paperwork. This leads to missed deadlines, billing errors, inefficient lawyer task distribution, and poor tracking of client engagements.

### 📍 Context

The system will be used by law firms to manage their cases, tasks, and billing processes effectively. It will help streamline operations and centralize data for clients, cases, tasks, billing, and lawyers.

### 🎯 Target Users

* Legal Firm Administrators
* Lawyers
* Billing/Accounts Staff

### ✅ Project Goals

* Automate case and task management.
* Track lawyer responsibilities.
* Monitor deadlines and overdue cases.
* Improve accuracy of billing processes.
* Provide audit trails and enforce security policies.

---

## 📊 Phase II – Business Process Modeling (MIS)

### 📘 Scope

Modeling the legal case handling process: client onboarding → case assignment → task delegation → billing → closure.

### 🔑 Key Entities

* Client
* Lawyer
* Case
* Task
* Billing System
* Admin System

### 🏊 Swimlane Diagram

(*Placeholder for diagram, designed in draw\.io or Lucidchart*)

### 📝 Explanation

This model shows how a client initiates a case, which is then assigned to a lawyer. Tasks are delegated with deadlines, and billing is done after reviewing the services. This supports MIS by improving workflow tracking, reducing redundancy, and enabling data-driven decisions.

---

## 📐 Phase III – Logical Model Design

### 🔸 Entities & Attributes

* **CLIENT**(`client_id`, `name`, `email`, `phone`)
* **LAWYER**(`lawyer_id`, `name`, `email`, `specialty`)
* **CASE**(`case_id`, `title`, `description`, `client_id`, `lawyer_id`, `start_date`, `status`)
* **TASK**(`task_id`, `case_id`, `description`, `assigned_to`, `due_date`, `status`)
* **BILLING**(`billing_id`, `case_id`, `amount`, `billing_date`, `status`)

### 🔗 Relationships

* CLIENT → CASE (1\:M)
* LAWYER → CASE (1\:M)
* CASE → TASK (1\:M)
* CASE → BILLING (1\:M)

### ✅ Constraints

* `NOT NULL` on all PKs and essential fields.
* `CHECK` constraints for valid statuses (e.g., 'OPEN', 'CLOSED').
* Foreign keys between CASE ↔ CLIENT, LAWYER and CASE ↔ TASK, BILLING.

### 🧪 Normalization

All tables are normalized to 3NF.

---

## 🧱 Phase IV – Database Creation

```sql
CREATE PLUGGABLE DATABASE tues_27657_moise_caseTracker_db ADMIN USER moise IDENTIFIED BY moise;
```

### 🔧 Admin Setup

* Admin user: `moise`
* Password: `moise`

### 📸 Screenshot Placeholder

*Add screenshot from Oracle Enterprise Manager showing database name.*

---

## 🗃️ Phase V – Table Implementation & Data Insertion

### 📋 Table Creation

```sql
CREATE TABLE client (
  client_id NUMBER PRIMARY KEY,
  name VARCHAR2(100) NOT NULL,
  email VARCHAR2(100),
  phone VARCHAR2(20)
);

CREATE TABLE lawyer (
  lawyer_id NUMBER PRIMARY KEY,
  name VARCHAR2(100) NOT NULL,
  email VARCHAR2(100),
  specialty VARCHAR2(50)
);

CREATE TABLE case (
  case_id NUMBER PRIMARY KEY,
  title VARCHAR2(100),
  description VARCHAR2(255),
  client_id NUMBER REFERENCES client(client_id),
  lawyer_id NUMBER REFERENCES lawyer(lawyer_id),
  start_date DATE,
  status VARCHAR2(20) CHECK (status IN ('OPEN', 'CLOSED'))
);

CREATE TABLE task (
  task_id NUMBER PRIMARY KEY,
  case_id NUMBER REFERENCES case(case_id),
  description VARCHAR2(255),
  assigned_to NUMBER REFERENCES lawyer(lawyer_id),
  due_date DATE,
  status VARCHAR2(20)
);

CREATE TABLE billing (
  billing_id NUMBER PRIMARY KEY,
  case_id NUMBER REFERENCES case(case_id),
  amount NUMBER(10,2),
  billing_date DATE,
  status VARCHAR2(20)
);
```

### 🧾 Sample Data Insertions

```sql
INSERT INTO client VALUES (1, 'Alice Smith', 'alice@email.com', '072100001');
INSERT INTO client VALUES (2, 'Bob Johnson', 'bob@email.com', '072100002');

INSERT INTO lawyer VALUES (1, 'John Doe', 'john@law.com', 'Criminal');
INSERT INTO lawyer VALUES (2, 'Jane Lee', 'jane@law.com', 'Corporate');

INSERT INTO case VALUES (1, 'Property Dispute', 'Land ownership conflict', 1, 1, SYSDATE, 'OPEN');
INSERT INTO case VALUES (2, 'Contract Review', 'Corporate agreement review', 2, 2, SYSDATE, 'OPEN');

INSERT INTO task VALUES (1, 1, 'Review documents', 1, SYSDATE + 7, 'PENDING');
INSERT INTO task VALUES (2, 2, 'Draft contract clauses', 2, SYSDATE + 10, 'PENDING');

INSERT INTO billing VALUES (1, 1, 500000, SYSDATE, 'UNPAID');
INSERT INTO billing VALUES (2, 2, 750000, SYSDATE, 'UNPAID');
```

---

## 🔁 Phase VI – Database Interaction and Transactions

### 📌 Procedures

```sql
CREATE OR REPLACE PROCEDURE get_case_details(p_case_id IN NUMBER) IS
  v_title VARCHAR2(100);
  v_status VARCHAR2(20);
BEGIN
  SELECT title, status INTO v_title, v_status FROM case WHERE case_id = p_case_id;
  DBMS_OUTPUT.PUT_LINE('Case: ' || v_title || ' | Status: ' || v_status);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Case not found.');
END;
```

### 📌 Cursor Example

```sql
DECLARE
  CURSOR c_tasks IS
    SELECT task_id, description FROM task WHERE status = 'PENDING';
BEGIN
  FOR t IN c_tasks LOOP
    DBMS_OUTPUT.PUT_LINE('Task ID: ' || t.task_id || ' - ' || t.description);
  END LOOP;
END;
```

### 📦 Package Example

```sql
CREATE OR REPLACE PACKAGE billing_pkg AS
  PROCEDURE update_status(p_case_id NUMBER);
END billing_pkg;

CREATE OR REPLACE PACKAGE BODY billing_pkg AS
  PROCEDURE update_status(p_case_id NUMBER) IS
  BEGIN
    UPDATE billing SET status = 'PAID' WHERE case_id = p_case_id;
  END;
END billing_pkg;
```

---

## 🔐 Phase VII – Advanced Programming and Auditing

### 📌 Holiday Table

```sql
CREATE TABLE holidays (
  holiday_date DATE PRIMARY KEY,
  description VARCHAR2(100)
);

INSERT INTO holidays VALUES (TO_DATE('2025-06-01', 'YYYY-MM-DD'), 'Independence Day');
```

### 🚫 Trigger to Block Changes on Weekdays & Holidays

```sql
CREATE OR REPLACE TRIGGER restrict_weekday_operations
BEFORE INSERT OR UPDATE OR DELETE ON case
BEGIN
  IF TO_CHAR(SYSDATE, 'DY') IN ('MON','TUE','WED','THU','FRI') OR
     EXISTS (SELECT 1 FROM holidays WHERE holiday_date = TRUNC(SYSDATE)) THEN
    RAISE_APPLICATION_ERROR(-20001, 'Operation not allowed on weekdays or holidays.');
  END IF;
END;
```

### 📋 Audit Table

```sql
CREATE TABLE audit_log (
  log_id NUMBER GENERATED ALWAYS AS IDENTITY,
  user_id VARCHAR2(50),
  action_time TIMESTAMP,
  operation VARCHAR2(20),
  status VARCHAR2(10)
);
```

### 🔧 Audit Trigger Example

```sql
CREATE OR REPLACE TRIGGER audit_case_change
AFTER INSERT OR UPDATE OR DELETE ON case
BEGIN
  INSERT INTO audit_log(user_id, action_time, operation, status)
  VALUES (USER, SYSTIMESTAMP, 'MODIFY_CASE', 'ALLOWED');
END;
```

---

> ✅ **Next Step:** Proceed with Phase VIII – Documentation and GitHub Upload.

> 📁 Add screenshots of your implementation results.
> 🔐 Make sure all code files are committed to your GitHub repo.

