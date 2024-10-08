CREATE TABLE public.customer_info (
    customerID TEXT,
    gender TEXT,
    SeniorCitizen INTEGER,
    Partner TEXT,
    Dependents TEXT,
    tenure INTEGER,
    PhoneService TEXT,
    MultipleLines TEXT,
    InternetService TEXT,
    OnlineSecurity TEXT,
    OnlineBackup TEXT,
    DeviceProtection TEXT,
    TechSupport TEXT,
    StreamingTV TEXT,
    StreamingMovies TEXT,
    Contract TEXT,
    PaperlessBilling TEXT,
    PaymentMethod TEXT,
    MonthlyCharges NUMERIC,
    TotalCharges NUMERIC,
    Churn TEXT
);
-- Set ownership of the table to the postgres user
ALTER TABLE public.customer_info OWNER to postgres;

-- Change TotalCharges column's data type to allow for NULL conversion
ALTER TABLE customer_info
ALTER COLUMN TotalCharges TYPE TEXT;

-- Update space characters to be null
UPDATE customer_info
SET TotalCharges = NULLIF(TotalCharges, ' ')
WHERE TotalCharges = ' ';

-- Change TotalCharges column's data type to allow for Numeric conversion
ALTER TABLE customer_info
ALTER COLUMN TotalCharges TYPE VARCHAR(50);


ALTER TABLE customer_info
ADD totalchargesint NUMERIC(6, 2);

UPDATE customer_info
SET totalchargesint = CAST(totalcharges AS NUMERIC(6, 2));


ALTER TABLE customer_info
DROP COLUMN totalcharges


ALTER TABLE customer_info
RENAME COLUMN totalchargesint to totalcharges


