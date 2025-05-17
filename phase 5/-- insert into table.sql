-- insert into clients 

INSERT INTO clients (client_id, name, contact_info) VALUES (1, 'Alice Johnson', 'alice.johnson@example.com');
INSERT INTO clients (client_id, name, contact_info) VALUES (2, 'Bob Smith', 'bob.smith@example.com');
INSERT INTO clients (client_id, name, contact_info) VALUES (3, 'Charlie Brown', 'charlie.brown@example.com');
INSERT INTO clients (client_id, name, contact_info) VALUES (4, 'Diana Prince', 'diana.prince@example.com');
INSERT INTO clients (client_id, name, contact_info) VALUES (5, 'Ethan Hunt', 'ethan.hunt@example.com');

-- insert into lawyers

INSERT INTO lawyers (lawyer_id, name, specialization, availability) VALUES (101, 'John Doe', 'Criminal Law', 'Available');
INSERT INTO lawyers (lawyer_id, name, specialization, availability) VALUES (102, 'Jane Smith', 'Corporate Law', 'Unavailable');
INSERT INTO lawyers (lawyer_id, name, specialization, availability) VALUES (103, 'Mark Lee', 'Family Law', 'Available');
INSERT INTO lawyers (lawyer_id, name, specialization, availability) VALUES (104, 'Laura Kim', 'Intellectual Property', 'Available');
INSERT INTO lawyers (lawyer_id, name, specialization, availability) VALUES (105, 'Tom Hardy', 'Environmental Law', 'Unavailable');


--insert into cases 

INSERT INTO cases (case_id, type_of_case, status, assigned_lawyer, deadline) 
VALUES (201, 'Criminal Defense', 'Open', 101, TO_DATE('2025-06-30', 'YYYY-MM-DD'));

INSERT INTO cases (case_id, type_of_case, status, assigned_lawyer, deadline) 
VALUES (202, 'Business Contract', 'Closed', 102, TO_DATE('2025-05-15', 'YYYY-MM-DD'));

INSERT INTO cases (case_id, type_of_case, status, assigned_lawyer, deadline) 
VALUES (203, 'Divorce', 'Pending', 103, TO_DATE('2025-07-20', 'YYYY-MM-DD'));

INSERT INTO cases (case_id, type_of_case, status, assigned_lawyer, deadline) 
VALUES (204, 'Patent Infringement', 'Open', 104, TO_DATE('2025-08-10', 'YYYY-MM-DD'));

INSERT INTO cases (case_id, type_of_case, status, assigned_lawyer, deadline) 
VALUES (205, 'Environmental Regulation', 'Open', 105, TO_DATE('2025-09-01', 'YYYY-MM-DD'));

-- insert into tasks 

INSERT INTO tasks (task_id, case_id, assigned_to, due_date, status) 
VALUES (301, 201, 101, TO_DATE('2025-05-25', 'YYYY-MM-DD'), 'In Progress');

INSERT INTO tasks (task_id, case_id, assigned_to, due_date, status) 
VALUES (302, 202, 102, TO_DATE('2025-05-10', 'YYYY-MM-DD'), 'Completed');

INSERT INTO tasks (task_id, case_id, assigned_to, due_date, status) 
VALUES (303, 203, 103, TO_DATE('2025-07-15', 'YYYY-MM-DD'), 'Pending');

INSERT INTO tasks (task_id, case_id, assigned_to, due_date, status) 
VALUES (304, 204, 104, TO_DATE('2025-08-01', 'YYYY-MM-DD'), 'In Progress');

INSERT INTO tasks (task_id, case_id, assigned_to, due_date, status) 
VALUES (305, 205, 105, TO_DATE('2025-08-20', 'YYYY-MM-DD'), 'Pending');


-- insert into billing 

INSERT INTO billing (invoice_id, client_id, case_id, services_rendered, amount, payment_status) 
VALUES (401, 1, 201, 'Consultation, Court Representation', 1500.00, 'Paid');

INSERT INTO billing (invoice_id, client_id, case_id, services_rendered, amount, payment_status) 
VALUES (402, 2, 202, 'Contract Drafting', 800.00, 'Pending');

INSERT INTO billing (invoice_id, client_id, case_id, services_rendered, amount, payment_status) 
VALUES (403, 3, 203, 'Mediation, Document Preparation', 1200.00, 'Overdue');

INSERT INTO billing (invoice_id, client_id, case_id, services_rendered, amount, payment_status) 
VALUES (404, 4, 204, 'Patent Filing, Legal Advice', 2000.00, 'Paid');

INSERT INTO billing (invoice_id, client_id, case_id, services_rendered, amount, payment_status) 
VALUES (405, 5, 205, 'Environmental Compliance Check', 1100.00, 'Pending');

-- commit 

COMMIT;

