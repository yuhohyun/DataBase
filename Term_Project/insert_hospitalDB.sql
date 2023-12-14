-- MEDICAL_SPECIALTY (진료과 및 부서)
-- 흉부외과, 정형외과, 신경외과, 내과, 외과, 영상의학과, 피부과, 안과, 소아과, 정신의학과, 응급실, 치과, 산부인과, 마취과, 수술실, 비뇨기과, 소화기내과
INSERT INTO MEDICAL_SPECIALTY (DepartmentName, PhoneNumber)
VALUES
    ('Cardiology', '032-101-0001'),
    ('Orthopedics', '032-101-0002'),
    ('Neurology', '032-101-0003'),
    ('Internal Medicine', '032-101-0004'),
    ('Surgery', '032-101-0005'),
    ('Radiology', '032-101-0006'),
    ('Dermatology', '032-101-0007'),
    ('Ophthalmology', '032-101-0008'),
    ('Pediatrics', '032-101-0009'),
    ('Psychiatry', '032-101-0010'),
    ('Emergency Room', '032-101-0011'),
    ('Dentistry', '032-101-0012'),
    ('Obstetrics and Gynecology', '032-101-0013'),
    ('Anesthesiology', '032-101-0014'),
    ('Operating Room', '032-101-0015'),
    ('Urology', '032-101-0016'),
    ('Gastroenterology', '032-101-0017'),
    ('Administration', '032-101-1001');

INSERT INTO DOCTOR (DoctorID, DepartmentID, Name, Address, PhoneNumber, Password)
VALUES 
    (1000000001, 1, 'KIM', 'INCHEON', '+82-10-0000-0001', '00000001'),
    (1000000002, 2, 'LEE', 'INCHEON', '+82-10-0000-0002', '00000002'),
    (1000000003, 3, 'PARK', 'INCHEON', '+82-10-0000-0003', '00000003'),
    (1000000004, 4, 'YU', 'INCHEON', '+82-10-0000-0004', '00000004'),
    (1000000005, 5, 'CHOI', 'INCHEON', '+82-10-0000-0005', '00000005');

INSERT INTO NURSE (NurseID, DepartmentID, Name, Address, PhoneNumber, Password)
VALUES 
    (2000000001, 1, 'YU', 'INCHEON', '+82-10-1000-0001', '00000001'),
    (2000000002, 2, 'CHOI', 'INCHEON', '+82-10-1000-0002', '00000002'),
    (2000000003, 3, 'KIM', 'INCHEON', '+82-10-1000-0003', '00000003'),
    (2000000004, 4, 'LEE', 'INCHEON', '+82-10-1000-0004', '00000004'),
    (2000000005, 5, 'PARK', 'INCHEON', '+82-10-1000-0005', '00000005');

INSERT INTO ADMINISTRATOR (AdministratorID, DepartmentID, Name, Address, PhoneNumber, Password)
VALUES 
    (1100000001, 18, 'YU', 'INCHEON', '+82-10-0000-0000', '00000000');


INSERT INTO PATIENT (DoctorID, NurseID, Name, SSN, Gender, Address, BloodType, Height, Weight, PhoneNumber, Password)
VALUES
    (1000000002, 2000000001, 'JO', '010101-3155001', 'M', 'INCHEON', 'O', 180, 75, '+82-10-0101-0001', '00001001');

INSERT INTO RESERVATION (ReservationNumber, ReservationDateTime, PatientID)
VALUES 
    (1, '2023-12-13-21:04:00', 3);