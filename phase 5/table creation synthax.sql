

CREATE TABLE clients (
    client_id INT PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    contact_info VARCHAR2(100) NOT NULL
);


CREATE TABLE lawyers (
    lawyer_id INT PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    specialization VARCHAR2(100),
    availability VARCHAR2(20)
);


CREATE TABLE cases (
    case_id INT PRIMARY KEY,
    type_of_case VARCHAR2(100) NOT NULL,
    status VARCHAR2(50) NOT NULL,
    assigned_lawyer INT,
    deadline DATE NOT NULL,
    CONSTRAINT fk_assigned_lawyer FOREIGN KEY (assigned_lawyer)
        REFERENCES lawyers(lawyer_id)
        ON DELETE SET NULL
);


CREATE TABLE tasks (
    task_id INT PRIMARY KEY,
    case_id INT NOT NULL,
    assigned_to INT NOT NULL,
    due_date DATE NOT NULL,
    status VARCHAR2(50) NOT NULL,
    CONSTRAINT fk_task_case FOREIGN KEY (case_id)
        REFERENCES cases(case_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_task_lawyer FOREIGN KEY (assigned_to)
        REFERENCES lawyers(lawyer_id)
        ON DELETE SET NULL
);


CREATE TABLE billing (
    invoice_id INT PRIMARY KEY,
    client_id INT NOT NULL,
    case_id INT NOT NULL,
    services_rendered CLOB,
    amount DECIMAL(10,2) NOT NULL,
    payment_status VARCHAR2(20) CHECK (payment_status IN ('Paid', 'Pending', 'Overdue')),
    CONSTRAINT fk_billing_client FOREIGN KEY (client_id)
        REFERENCES clients(client_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_billing_case FOREIGN KEY (case_id)
        REFERENCES cases(case_id)
        ON DELETE CASCADE
);


