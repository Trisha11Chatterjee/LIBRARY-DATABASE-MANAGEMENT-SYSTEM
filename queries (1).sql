
-- create
CREATE TABLE MEMBER
(
    memberId VARCHAR(10) PRIMARY KEY,
    firstName VARCHAR(20) NOT NULL,
    lastName VARCHAR(20) NOT NULL,
    address VARCHAR(50),
    dateOfBirth DATE,
    numberOfBooks DECIMAL(1,0)
);

INSERT INTO MEMBER VALUES ('14525049', 'Aditi', 'Salunkhe', '500 N, 39th Street, Philadelphia, PA 19104', STR_TO_DATE('1997/11/24', '%Y/%m/%d'), 3);
INSERT INTO MEMBER VALUES('14463926', 'Natasha', 'Lalwani', '3414 Baring St, Apt 2F, Philadelphia, PA 19104', STR_TO_DATE('1998/06/09', '%Y/%m/%d'), 3);
INSERT INTO MEMBER VALUES('14476512', 'Janam', 'Patel', '4020 Baring St, Apt 210, Philadelphia, PA 19104', STR_TO_DATE('1999/01/18', '%Y/%m/%d'), 5);
INSERT INTO MEMBER VALUES('14498734', 'Suyog', 'Narkhede', '3836 Haverford, Apt 134, Philadelphia, PA 19104', STR_TO_DATE('1997/10/26', '%Y/%m/%d'), 5);
INSERT INTO MEMBER VALUES('14401267', 'Oshin', 'Kushwaha', '314 N Powelton, Apt 2A, Philadelphia, PA 19104', STR_TO_DATE('1995/06/14', '%Y/%m/%d'), 3);
INSERT INTO MEMBER VALUES('14424681', 'Atharv', 'Joshi', '3734 Brandywine, Philadelphia, PA 19104', STR_TO_DATE('1997/12/23', '%Y/%m/%d'), 5);

SELECT * FROM MEMBER;

CREATE TABLE STUDENT
(
    memberId VARCHAR(10),
    degree CHAR(20),
    major VARCHAR(20),
    FOREIGN KEY (memberId) REFERENCES MEMBER(memberId)
);

INSERT INTO STUDENT VALUES('14525049', 'Masters', 'Information System');
INSERT INTO STUDENT VALUES('14463926', 'Masters', 'AIML');
INSERT INTO STUDENT VALUES('14401267', 'Bachelors', 'Business Analytics');

SELECT * FROM STUDENT;

CREATE TABLE STAFF
(
    memberID VARCHAR(10),
    wage DECIMAL(7,2),
    shifts VARCHAR(10) NOT NULL,
    role VARCHAR(10) NOT NULL,
    FOREIGN KEY (memberID) REFERENCES MEMBER(memberId)
);

INSERT INTO STAFF VALUES('14476512', 3450.67, 'Morning', 'Librarian');
INSERT INTO STAFF VALUES('14498734', 1200.95, 'Afternoon', 'Assistant');
INSERT INTO STAFF VALUES('14424681', 2400.75, 'Evening', 'Technician');

SELECT * FROM STAFF;

CREATE TABLE ROOM
(
    roomId VARCHAR(10) PRIMARY KEY,
    seatingCapacity DECIMAL(2,0),
    typeOfRoom VARCHAR(10) NOT NULL
);

INSERT INTO ROOM VALUES('2468', 10, 'Conference');
INSERT INTO ROOM VALUES('1234', 15, 'Conference');
INSERT INTO ROOM VALUES('5678', 1, 'Work Pod');
INSERT INTO ROOM VALUES('1213', 50, 'Seminar');
INSERT INTO ROOM VALUES('1415', 25, 'Lecture');
INSERT INTO ROOM VALUES('9101', 2, 'Work Pod');

SELECT * FROM ROOM;

CREATE TABLE RESERVES
(
    roomId VARCHAR(10),
    memberID VARCHAR(10),
    reservesDate DATE NOT NULL,
    timings VARCHAR(10) NOT NULL,
    FOREIGN KEY (roomId) REFERENCES ROOM(roomId),
    FOREIGN KEY (memberID) REFERENCES MEMBER(memberId)
);

INSERT INTO RESERVES VALUES('2468', '14525049', STR_TO_DATE('2022/01/15', '%Y/%m/%d'), '10AM-12PM');
INSERT INTO RESERVES VALUES('5678', '14476512', STR_TO_DATE('2022/05/02', '%Y/%m/%d'), '12PM-4PM');
INSERT INTO RESERVES VALUES('1213', '14401267', STR_TO_DATE('2022/06/08', '%Y/%m/%d'), '5PM-6PM');

SELECT * FROM RESERVES;

CREATE TABLE BOOK
(
    bookId VARCHAR(10) PRIMARY KEY,
    bookName VARCHAR(20) NOT NULL,
    category VARCHAR(20),
    edition VARCHAR(20),
    bookType VARCHAR(10),
    language VARCHAR(10)
);

INSERT INTO BOOK VALUES('123', 'Gone Girl', 'Thriller','3', 'Audiobook', 'English');
INSERT INTO BOOK VALUES('456', 'Forbes', 'Business', '1', 'Magazine', 'English');
INSERT INTO BOOK VALUES('789', 'Don Quixote', 'Parody', '2', 'Paperback','Spanish');
INSERT INTO BOOK VALUES('001', 'Nirmala', 'Drama','2' , 'Hardcover','Hindi');
INSERT INTO BOOK VALUES('333', 'Divergent', 'Science Fiction', '3', 'Audiobook','English');
INSERT INTO BOOK VALUES('646', 'Mala', 'Romantic', '1', 'Paperback','Urdu');


SELECT * FROM BOOK;

CREATE TABLE BORROW
(
    memberId VARCHAR(10),
    bookId VARCHAR(10),
    issueDate DATE NOT NULL,
    dueDate DATE NOT NULL,
    returnDate DATE NOT NULL,
    FOREIGN KEY (memberId) REFERENCES MEMBER(memberId),
    FOREIGN KEY (bookId) REFERENCES BOOK(bookId)
);

INSERT INTO BORROW VALUES('14525049', '456', STR_TO_DATE('2022/06/03', '%Y/%m/%d'), STR_TO_DATE('2022/06/17', '%Y/%m/%d'), STR_TO_DATE('2022/06/21', '%Y/%m/%d'));
INSERT INTO BORROW VALUES('14463926', '001', STR_TO_DATE('2022/04/25', '%Y/%m/%d'), STR_TO_DATE('2022/05/16', '%Y/%m/%d'), STR_TO_DATE('2022/05/13', '%Y/%m/%d'));
INSERT INTO BORROW VALUES('14424681', '333', STR_TO_DATE('2021/10/26', '%Y/%m/%d'), STR_TO_DATE('2021/11/15', '%Y/%m/%d'), STR_TO_DATE('2022/11/30', '%Y/%m/%d'));
INSERT INTO BORROW VALUES('14498734', '123', STR_TO_DATE('2020/01/13', '%Y/%m/%d'), STR_TO_DATE('2020/02/07', '%Y/%m/%d'), STR_TO_DATE('2020/02/05', '%Y/%m/%d'));
INSERT INTO BORROW VALUES('14476512', '646', STR_TO_DATE('2019/03/09', '%Y/%m/%d'), STR_TO_DATE('2019/03/30', '%Y/%m/%d'), STR_TO_DATE('2019/04/02', '%Y/%m/%d'));

SELECT * FROM BORROW;

CREATE TABLE LATE_PAYMENT
(
    paymentId VARCHAR(10) PRIMARY KEY,
    paymentDate DATE NOT NULL,
    amount DECIMAL(5,2) NOT NULL
);

INSERT INTO LATE_PAYMENT VALUES('5641', STR_TO_DATE('2022/06/21', '%Y/%m/%d'), 45.95);
INSERT INTO LATE_PAYMENT VALUES('1029', STR_TO_DATE('2022/06/30', '%Y/%m/%d'), 950.00);
INSERT INTO LATE_PAYMENT VALUES('3847', STR_TO_DATE('2019/04/03', '%Y/%m/%d'), 30.50);

SELECT * FROM LATE_PAYMENT;

CREATE TABLE MAKES
(
    paymentId VARCHAR(10),
    memberId VARCHAR(10),
    FOREIGN KEY (paymentId) REFERENCES LATE_PAYMENT(paymentId),
    FOREIGN KEY (memberId) REFERENCES MEMBER(memberId)
);

INSERT INTO MAKES VALUES('5641','14525049');
INSERT INTO MAKES VALUES('1029','14424681');
INSERT INTO MAKES VALUES('3847','14476512');

SELECT * FROM MAKES;

CREATE TABLE EQUIPMENT
(
    equipmentId VARCHAR(10) PRIMARY KEY,
    equipmentName VARCHAR(20) NOT NULL,
    acquireDate DATE,
    equipmentCost DECIMAL(7,2),
    quantity DECIMAL(2)
);

INSERT INTO EQUIPMENT VALUES('22','Printer', STR_TO_DATE('2022/02/14', '%Y/%m/%d'), 500.00, 1);
INSERT INTO EQUIPMENT VALUES('33','Scanner', STR_TO_DATE('2021/03/10', '%Y/%m/%d'), 350.00, 1);
INSERT INTO EQUIPMENT VALUES('44','Chair', STR_TO_DATE('2019/11/03', '%Y/%m/%d'), 4000.00, 20);
INSERT INTO EQUIPMENT VALUES('55','Desk', STR_TO_DATE('2015/09/24', '%Y/%m/%d'), 2100.00, 30);
INSERT INTO EQUIPMENT VALUES('66','Marker', STR_TO_DATE('2022/04/13', '%Y/%m/%d'), 100.00, 4);
INSERT INTO EQUIPMENT VALUES('77', 'White Board', STR_TO_DATE('2018/05/05', '%Y/%m/%d'), 12.00, 1);

SELECT * FROM EQUIPMENT;

CREATE TABLE HAS
(
    roomId VARCHAR(10),
    equipmentId VARCHAR(10),
    FOREIGN KEY (roomId) REFERENCES ROOM(roomId),
    FOREIGN KEY (equipmentId) REFERENCES EQUIPMENT(equipmentId)
);

INSERT INTO HAS VALUES('2468','22');
INSERT INTO HAS VALUES('1234','33');
INSERT INTO HAS VALUES('5678','66');
INSERT INTO HAS VALUES('1213','44');
INSERT INTO HAS VALUES('1415','55');
INSERT INTO HAS VALUES('9101','77');

SELECT * FROM HAS;

UPDATE MEMBER 
SET address = '744 Broad Street, Philadelphia, PA 19104'
WHERE memberId = '14525049';

SELECT * FROM MEMBER
WHERE memberId = '14525049';

SELECT 
MAX(wage) AS MAXWAGE,
MIN(wage) AS MINWAGE,
AVG(wage) AS AVGWAGE
FROM STAFF;

SELECT * FROM LATE_PAYMENT
WHERE amount > 40;

UPDATE EQUIPMENT
SET quantity = quantity + 3
WHERE equipmentId = '22';

SELECT * FROM EQUIPMENT
WHERE equipmentId = '22';

UPDATE STAFF
SET role = 'Manager'
WHERE memberId = '14498734';

SELECT * FROM STAFF
WHERE memberId = '14498734';


