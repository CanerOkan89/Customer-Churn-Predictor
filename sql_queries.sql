CREATE TABLE customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    gender VARCHAR(10),
    tenure INTEGER
);
CREATE TABLE contracts (
    customer_id VARCHAR(50) REFERENCES customers(customer_id),
    contract_type VARCHAR(20),
    monthly_charges DECIMAL(10,2),
    total_charges DECIMAL(10,2),
    PRIMARY KEY (customer_id)
);
INSERT INTO customers VALUES 
('CUST001', 'Female', 12),
('CUST002', 'Male', 34),
('CUST003', 'Female', 8);

INSERT INTO contracts VALUES 
('CUST001', 'Month-to-month', 65.50, 786.00),
('CUST002', 'Two year', 55.20, 1877.00),
('CUST003', 'Month-to-month', 75.80, 606.40);

SELECT 
    contract_type,
    COUNT(*) as customer_count,
    AVG(monthly_charges) as avg_monthly_charge,
    SUM(total_charges) as total_revenue
FROM contracts
GROUP BY contract_type
ORDER BY total_revenue DESC;

-- Customer lifetime value analysis with window functions
SELECT 
    c.customer_id,
    c.gender,
    c.tenure,
    con.contract_type,
    con.monthly_charges,
    con.total_charges,
    AVG(con.monthly_charges) OVER (PARTITION BY con.contract_type) as avg_charges_by_contract,
    RANK() OVER (ORDER BY con.total_charges DESC) as revenue_rank
FROM customers c
JOIN contracts con ON c.customer_id = con.customer_id
ORDER BY con.total_charges DESC;

CREATE TABLE staging_customer_data (
    customerID VARCHAR(50),
    gender VARCHAR(10),
    SeniorCitizen INTEGER,
    Partner VARCHAR(5),
    Dependents VARCHAR(5),
    tenure INTEGER,
    PhoneService VARCHAR(5),
    MultipleLines VARCHAR(20),
    InternetService VARCHAR(20),
    OnlineSecurity VARCHAR(20),
    OnlineBackup VARCHAR(20),
    DeviceProtection VARCHAR(20),
    TechSupport VARCHAR(20),
    StreamingTV VARCHAR(20),
    StreamingMovies VARCHAR(20),
    Contract VARCHAR(20),
    PaperlessBilling VARCHAR(5),
    PaymentMethod VARCHAR(30),
    MonthlyCharges DECIMAL(10,2),
    TotalCharges VARCHAR(20),
    Churn VARCHAR(5)
);

