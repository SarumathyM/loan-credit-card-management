-- create database 
create database loan;
-- use database
use loan;
 CREATE TABLE User(
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    address TEXT,
    date_of_birth DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Loans Table
CREATE TABLE Loans (
    loan_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    loan_type VARCHAR(50), -- e.g., Personal, Home, Auto, etc.
    principal_amount DECIMAL(12, 2),
    interest_rate DECIMAL(5, 2),
    tenure_months INT,
    start_date DATE,
    end_date DATE,
    status VARCHAR(20) CHECK (status IN ('Active', 'Closed', 'Defaulted')),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Credit Cards Table
CREATE TABLE CreditCards (
    card_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    card_number VARCHAR(16) UNIQUE NOT NULL,
    card_type VARCHAR(20), -- e.g., Visa, MasterCard, etc.
    credit_limit DECIMAL(10, 2),
    balance DECIMAL(10, 2),
    expiry_date DATE,
    status VARCHAR(20) CHECK (status IN ('Active', 'Blocked', 'Closed')),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Transactions Table
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    card_id INT,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10, 2),
    description VARCHAR(200),
    FOREIGN KEY (card_id) REFERENCES CreditCards(card_id)
);

-- Loan Repayments Table
CREATE TABLE LoanRepayments (
    repayment_id INT PRIMARY KEY AUTO_INCREMENT,
    loan_id INT,
    payment_date DATE,
    amount_paid DECIMAL(10, 2),
    FOREIGN KEY (loan_id) REFERENCES Loans(loan_id)
);

-- Payment History Table
CREATE TABLE PaymentHistory (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    payment_date DATE,
    payment_method VARCHAR(50), -- e.g., Bank Transfer, Credit Card, etc.
    amount DECIMAL(10, 2),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);
-- insert values into User table
INSERT INTO User (full_name, email, phone, address, date_of_birth) VALUES
('John Doe', 'johndoe@example.com', '1234567890', '123 Main St, New York, NY', '1985-06-15'),
('Jane Smith', 'janesmith@example.com', '2345678901', '456 Elm St, Los Angeles, CA', '1990-09-22'),
('Robert Johnson', 'robertj@example.com', '3456789012', '789 Pine St, Chicago, IL', '1982-03-10'),
('Emily Davis', 'emilyd@example.com', '4567890123', '159 Maple St, Houston, TX', '1995-07-08'),
('Michael Brown', 'michaelb@example.com', '5678901234', '753 Oak St, Phoenix, AZ', '1988-12-25'),
('Sarah Wilson', 'sarahw@example.com', '6789012345', '852 Cedar St, Philadelphia, PA', '1993-05-14'),
('David Martinez', 'davidm@example.com', '7890123456', '951 Birch St, San Antonio, TX', '1991-11-30'),
('Jessica Garcia', 'jessicag@example.com', '8901234567', '357 Spruce St, San Diego, CA', '1987-04-18'),
('Daniel Lopez', 'daniell@example.com', '9012345678', '258 Willow St, Dallas, TX', '1994-08-21'),
('Laura Hernandez', 'laurah@example.com', '0123456789', '147 Redwood St, San Jose, CA', '1996-01-05'),
('Christopher Moore', 'chrism@example.com', '1122334455', '369 Aspen St, Austin, TX', '1983-10-17'),
('Amanda Taylor', 'amandat@example.com', '2233445566', '741 Palm St, Jacksonville, FL', '1992-06-09'),
('Matthew Anderson', 'matthewa@example.com', '3344556677', '963 Fir St, San Francisco, CA', '1986-02-28'),
('Sophia Thomas', 'sophiat@example.com', '4455667788', '852 Cherry St, Indianapolis, IN', '1997-03-12'),
('Joshua White', 'joshuaw@example.com', '5566778899', '159 Magnolia St, Columbus, OH', '1984-09-26'),
('Olivia Martin', 'oliviam@example.com', '6677889900', '357 Cypress St, Fort Worth, TX', '1998-12-04'),
('James Thompson', 'jamest@example.com', '7788990011', '258 Sequoia St, Charlotte, NC', '1989-07-23'),
('Isabella Robinson', 'isabellar@example.com', '8899001122', '147 Beech St, Detroit, MI', '1995-11-15'),
('Ethan Clark', 'ethanc@example.com', '9900112233', '753 Hickory St, El Paso, TX', '1991-05-29'),
('Mia Lewis', 'mial@example.com', '0011223344', '369 Poplar St, Seattle, WA', '1993-08-07');
-- insert values into lones table
INSERT INTO Loans (user_id, loan_type, principal_amount, interest_rate, tenure_months, start_date, end_date, status) VALUES
(1, 'Personal', 5000.00, 5.50, 24, '2023-01-10', '2025-01-10', 'Active'),
(2, 'Home', 150000.00, 3.75, 240, '2020-06-15', '2040-06-15', 'Active'),
(3, 'Auto', 25000.00, 4.20, 60, '2022-09-01', '2027-09-01', 'Active'),
(4, 'Personal', 8000.00, 6.00, 36, '2021-04-20', '2024-04-20', 'Closed'),
(5, 'Education', 20000.00, 4.80, 48, '2020-08-30', '2024-08-30', 'Active'),
(6, 'Home', 175000.00, 3.50, 300, '2019-12-10', '2044-12-10', 'Active'),
(7, 'Personal', 10000.00, 5.00, 24, '2022-07-15', '2024-07-15', 'Closed'),
(8, 'Auto', 30000.00, 4.50, 72, '2021-11-25', '2027-11-25', 'Active'),
(9, 'Business', 50000.00, 6.50, 60, '2018-05-10', '2023-05-10', 'Closed'),
(10, 'Personal', 12000.00, 5.75, 30, '2023-03-05', '2025-09-05', 'Active'),
(11, 'Home', 200000.00, 3.25, 360, '2015-06-20', '2045-06-20', 'Active'),
(12, 'Auto', 18000.00, 4.00, 48, '2021-09-15', '2025-09-15', 'Closed'),
(13, 'Education', 22000.00, 4.90, 60, '2019-12-01', '2024-12-01', 'Closed'),
(14, 'Personal', 7000.00, 6.25, 18, '2023-05-10', '2024-11-10', 'Active'),
(15, 'Business', 75000.00, 6.75, 72, '2017-08-20', '2023-08-20', 'Closed'),
(16, 'Home', 130000.00, 3.90, 180, '2022-02-28', '2037-02-28', 'Active'),
(17, 'Auto', 22000.00, 4.30, 54, '2020-04-10', '2025-10-10', 'Defaulted'),
(18, 'Education', 28000.00, 4.60, 72, '2021-07-01', '2027-07-01', 'Active'),
(19, 'Personal', 9000.00, 5.90, 24, '2023-10-05', '2025-10-05', 'Active'),
(20, 'Business', 60000.00, 7.00, 84, '2016-11-15', '2023-11-15', 'Closed');
-- insert values into credicards table
INSERT INTO CreditCards (user_id, card_number, card_type, credit_limit, balance, expiry_date, status) VALUES
(1, '4111222233334444', 'Visa', 5000.00, 1500.00, '2027-06-30', 'Active'),
(2, '5111222233335555', 'MasterCard', 7000.00, 2000.00, '2026-09-15', 'Active'),
(3, '6111222233336666', 'American Express', 10000.00, 5000.00, '2028-04-20', 'Active'),
(4, '7111222233337777', 'Visa', 4000.00, 1000.00, '2025-12-10', 'Blocked'),
(5, '8111222233338888', 'MasterCard', 6000.00, 3000.00, '2026-08-25', 'Active'),
(6, '9111222233339999', 'Discover', 9000.00, 2500.00, '2027-11-05', 'Active'),
(7, '1011222233330001', 'Visa', 12000.00, 8000.00, '2029-02-18', 'Active'),
(8, '1111222233331111', 'MasterCard', 7500.00, 3500.00, '2026-07-07', 'Closed'),
(9, '1211222233332222', 'American Express', 5000.00, 1000.00, '2025-10-30', 'Active'),
(10, '1311222233333333', 'Visa', 8500.00, 4500.00, '2028-06-15', 'Active'),
(11, '1411222233334444', 'MasterCard', 11000.00, 6000.00, '2027-03-20', 'Blocked'),
(12, '1511222233335555', 'Discover', 6500.00, 2500.00, '2026-09-12', 'Active'),
(13, '1611222233336666', 'Visa', 14000.00, 9000.00, '2029-08-27', 'Active'),
(14, '1711222233337777', 'MasterCard', 7800.00, 4000.00, '2025-05-08', 'Active'),
(15, '1811222233338888', 'American Express', 15000.00, 7000.00, '2030-01-19', 'Closed'),
(16, '1911222233339999', 'Visa', 6200.00, 3200.00, '2028-12-14', 'Active'),
(17, '2011222233330001', 'MasterCard', 5000.00, 1200.00, '2027-07-22', 'Active'),
(18, '2111222233331111', 'Discover', 8000.00, 5000.00, '2029-04-10', 'Blocked'),
(19, '2211222233332222', 'Visa', 9500.00, 4800.00, '2027-10-05', 'Active'),
(20, '2311222233333333', 'MasterCard', 12000.00, 6000.00, '2026-06-30', 'Active');
-- insert values into transactions table
INSERT INTO Transactions (card_id, transaction_date, amount, description) VALUES
(1, '2024-03-01 10:15:30', 150.75, 'Grocery Shopping at Walmart'),
(2, '2024-03-02 14:20:45', 200.50, 'Online Purchase - Amazon'),
(3, '2024-03-03 09:10:20', 50.00, 'Gas Station - Shell'),
(4, '2024-03-04 18:45:10', 75.30, 'Restaurant - Olive Garden'),
(5, '2024-03-05 12:30:50', 500.00, 'Electronics - Best Buy'),
(6, '2024-03-06 16:20:30', 125.99, 'Clothing - Macy\'s'),
(7, '2024-03-07 08:50:40', 300.00, 'Flight Ticket - Delta Airlines'),
(8, '2024-03-08 20:05:15', 45.75, 'Coffee Shop - Starbucks'),
(9, '2024-03-09 11:40:20', 600.00, 'Hotel Booking - Hilton'),
(10, '2024-03-10 15:55:10', 80.20, 'Movie Tickets - AMC Theatres'),
(11, '2024-03-11 19:25:30', 130.99, 'Online Subscription - Netflix'),
(12, '2024-03-12 10:10:50', 20.50, 'Fast Food - McDonald\'s'),
(13, '2024-03-13 21:00:45', 700.00, 'Furniture Purchase - IKEA'),
(14, '2024-03-14 13:35:20', 95.99, 'Gym Membership - Planet Fitness'),
(15, '2024-03-15 07:20:10', 40.75, 'Taxi Ride - Uber'),
(16, '2024-03-16 22:10:30', 250.00, 'Concert Ticket - Ticketmaster'),
(17, '2024-03-17 17:55:50', 35.60, 'Pharmacy - CVS'),
(18, '2024-03-18 09:30:15', 400.25, 'Appliance Purchase - Home Depot'),
(19, '2024-03-19 20:45:40', 55.50, 'Bookstore - Barnes & Noble'),
(20, '2024-03-20 14:05:25', 90.00, 'Theme Park - Disney');
-- insert values into loanrepayments table
INSERT INTO LoanRepayments (loan_id, payment_date, amount_paid) VALUES
(1, '2024-01-10', 250.00),
(2, '2024-02-15', 1200.00),
(3, '2024-03-01', 500.00),
(4, '2024-01-20', 300.00),
(5, '2024-02-28', 450.00),
(6, '2024-03-10', 1300.00),
(7, '2024-01-05', 400.00),
(8, '2024-02-18', 550.00),
(9, '2024-03-12', 800.00),
(10, '2024-01-25', 600.00),
(11, '2024-02-05', 1500.00),
(12, '2024-03-08', 700.00),
(13, '2024-01-12', 900.00),
(14, '2024-02-22', 350.00),
(15, '2024-03-14', 1000.00),
(16, '2024-01-30', 1100.00),
(17, '2024-02-11', 750.00),
(18, '2024-03-06', 650.00),
(19, '2024-01-17', 500.00),
(20, '2024-02-28', 1200.00);
-- insert values into paymenthistory table
INSERT INTO PaymentHistory (user_id, payment_date, payment_method, amount) VALUES
(1, '2024-01-05', 'Bank Transfer', 500.00),
(2, '2024-01-10', 'Credit Card', 750.00),
(3, '2024-01-15', 'PayPal', 300.00),
(4, '2024-01-20', 'Debit Card', 450.00),
(5, '2024-01-25', 'Bank Transfer', 600.00),
(6, '2024-02-01', 'Credit Card', 800.00),
(7, '2024-02-05', 'PayPal', 350.00),
(8, '2024-02-10', 'Debit Card', 500.00),
(9, '2024-02-15', 'Bank Transfer', 900.00),
(10, '2024-02-20', 'Credit Card', 700.00),
(11, '2024-02-25', 'PayPal', 400.00),
(12, '2024-03-01', 'Debit Card', 550.00),
(13, '2024-03-05', 'Bank Transfer', 650.00),
(14, '2024-03-10', 'Credit Card', 1000.00),
(15, '2024-03-15', 'PayPal', 750.00),
(16, '2024-03-20', 'Debit Card', 420.00),
(17, '2024-03-25', 'Bank Transfer', 580.00),
(18, '2024-03-30', 'Credit Card', 620.00),
(19, '2024-04-01', 'PayPal', 470.00),
(20, '2024-04-05', 'Debit Card', 540.00);

--  stored procedure to retrieve all payment records from the PaymentHistory table
DELIMITER //

CREATE PROCEDURE GetAllPaymentRecords()
BEGIN
    SELECT * FROM PaymentHistory;
END //

DELIMITER ;
CALL GetAllPaymentRecords();
-- stored procedure to find all payments made in March 2024
DELIMITER //

CREATE PROCEDURE GetPaymentsInMarch2024()
BEGIN
    SELECT * FROM PaymentHistory 
    WHERE payment_date BETWEEN '2024-03-01' AND '2024-03-31';
END //

DELIMITER ;
CALL GetPaymentsInMarch2024();

-- stored procedure to get the payment history for a specific user based on their user_id
DELIMITER //

CREATE PROCEDURE GetPaymentHistoryByUser(IN p_user_id INT)
BEGIN
    SELECT * FROM PaymentHistory WHERE user_id = p_user_id;
END //

DELIMITER ;
CALL GetPaymentHistoryByUser(5);

-- stored procedure to find the total amount paid by each user from the PaymentHistory table
DELIMITER //

CREATE PROCEDURE GetTotalAmountPaidByEachUser()
BEGIN
    SELECT user_id, SUM(amount) AS total_paid 
    FROM PaymentHistory 
    GROUP BY user_id 
    ORDER BY total_paid DESC;
END //

DELIMITER ;
CALL GetTotalAmountPaidByEachUser();

-- stored procedure to retrieve payments made using a specific payment method
DELIMITER //

CREATE PROCEDURE GetPaymentsByMethod(IN p_payment_method VARCHAR(50))
BEGIN
    SELECT * FROM PaymentHistory WHERE payment_method = p_payment_method;
END //

DELIMITER ;
CALL GetPaymentsByMethod('Credit Card');

-- stored procedure to retrieve payments above a certain amount
DELIMITER //

CREATE PROCEDURE GetPaymentsAboveAmount(IN p_amount DECIMAL(10,2))
BEGIN
    SELECT * FROM PaymentHistory WHERE amount > p_amount;
END //

DELIMITER ;
CALL GetPaymentsAboveAmount(700);

-- stored procedure to find users who made payments in a specific month
DELIMITER //

CREATE PROCEDURE GetPaymentsByMonth(IN p_year INT, IN p_month INT)
BEGIN
    SELECT * FROM PaymentHistory 
    WHERE YEAR(payment_date) = p_year AND MONTH(payment_date) = p_month;
END //

DELIMITER ;
CALL GetPaymentsByMonth(2024, 3);

-- stored procedure to count the number of payments per payment method
DELIMITER //

CREATE PROCEDURE GetPaymentCountByMethods()
BEGIN
    SELECT payment_method, COUNT(*) AS total_transactions 
    FROM PaymentHistory 
    GROUP BY payment_method;
END //

DELIMITER ;
CALL GetPaymentCountByMethods();

-- stored procedure to get the highest payment made from the PaymentHistory table
DELIMITER //

CREATE PROCEDURE GetHighestPayment()
BEGIN
    SELECT * FROM PaymentHistory 
    ORDER BY amount DESC 
    LIMIT 1;
END //

DELIMITER ;
CALL GetHighestPayment();

-- stored procedure to find users who made payments using multiple payment methods
DELIMITER //

CREATE PROCEDURE GetUsersWithMultiplePaymentMethods()
BEGIN
    SELECT user_id, COUNT(DISTINCT payment_method) AS method_count
    FROM PaymentHistory 
    GROUP BY user_id
    HAVING method_count > 1;
END //

DELIMITER ;
CALL GetUsersWithMultiplePaymentMethods();









