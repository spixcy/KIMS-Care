CREATE TABLE patients (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    phone_number VARCHAR(255),
    date_of_birth DATE,
    gender VARCHAR(255),
    blood_group VARCHAR(255),
    address VARCHAR(255),
    profile_image VARCHAR(255),
    created_at TIMESTAMP
);