ALTER TABLE students
    RENAME COLUMN rollno TO roll_number;

ALTER TABLE students
    ALTER COLUMN roll_number TYPE VARCHAR(255)
    USING roll_number::text;

ALTER TABLE students
    ADD COLUMN email VARCHAR(255),
    ADD COLUMN phone_number VARCHAR(255),
    ADD COLUMN date_of_birth DATE,
    ADD COLUMN gender VARCHAR(255),
    ADD COLUMN blood_group VARCHAR(255),
    ADD COLUMN course VARCHAR(255),
    ADD COLUMN branch VARCHAR(255),
    ADD COLUMN year INTEGER,
    ADD COLUMN profile_image VARCHAR(255),
    ADD COLUMN created_at TIMESTAMP;