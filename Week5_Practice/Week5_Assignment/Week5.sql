-- Employee 테이블 데이터 삽입
INSERT INTO Employee(Eid, EName, Position, Department_Did, Department_Dname)
VALUES 
    (230001, 'CHOI', 'Professor', 1, 'ICE'),
    (230002, 'kIM', 'Professor', 1, 'ICE'),
    (230003, 'LEE', 'Staff', 1, 'ICE'),
    (230004, 'PARK', 'Professor', 2, 'CS'),
    (230005, 'YU', 'Professor', 1, 'ICE');

-- class 테이블 데이터 삽입
INSERT INTO Class(ClassId, ClassName, Professor, NumberOfParticipants, Department_Did, Department_Dname)
VALUES
    (1, 'OOP1', 'CHOI', 50, 1, 'ICE'),
    (2, 'OOP2', 'PARK', 50, 2, 'CS'),
    (3, 'DataStructures', 'KIM', 40, 1, 'ICE'),
    (4, 'Algorithms', 'CHOI', 70, 1, 'ICE'),
    (5, 'Database Design', 'CHOI', 90, 1, 'ICE');

-- Club 테이블 데이터 삽입
INSERT INTO Club(Cid, CName, Department_Did, Department_Dname)
VALUES
    (1, 'Club1', 1, 'ICE'),
    (2, 'Club2', 1, 'ICE'),
    (3, 'Club3', 1, 'ICE'),
    (4, 'Club4', 2, 'CS'),
    (5, 'Club5', 2, 'CS');