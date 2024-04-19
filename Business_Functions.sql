use coursera;

-- WITHOUT JOINS
#List all courses and their corresponding instructors.
SELECT c.CourseTitle, i.IUserID
FROM Course c, Instructor i
WHERE c.IUSerID = i.IUserID;

-- Retrieve all certificates issued with their respective issue dates.
SELECT CAccomplishmentID, IssueDate FROM Certificate WHERE IssueDate > '2024-07-01';

#Identify top 2 courses with the highest enrollment:
SELECT CourseID, CourseName,CourseDescription, EnrollmentCount
FROM Course
ORDER BY EnrollmentCount DESC
LIMIT 2;

#-------------------------------------------------------------------------------------------------------------------------

-- USING JOINS
#Average rating of each course
SELECT c.CourseID, c.CourseName, AVG(r.Rating) AS AverageRating
FROM Course c
LEFT JOIN Review r ON c.CourseID = r.CourseID
GROUP BY c.CourseID, c.CourseName;

#Completion rate of specialization
SELECT sp.SpecializationID, sp.SpecializationTitle, 
       COUNT(DISTINCT e.EnrollmentID) AS TotalEnrollments,
       SUM(CASE WHEN e.CompletionStatus = 'Completed' THEN 1 ELSE 0 END) AS CompletedEnrollments,
       SUM(CASE WHEN e.CompletionStatus = 'Completed' THEN 1 ELSE 0 END) / COUNT(DISTINCT e.EnrollmentID) AS CompletionRate
FROM Specialization sp
JOIN Skill s ON sp.SpecializationID = s.SpecializationID
JOIN Course c ON s.CourseID = c.CourseID
LEFT JOIN Accomplishment a ON c.CourseID = a.CourseID
LEFT JOIN Enrollment e ON a.SUserID = e.SUserID
GROUP BY sp.SpecializationID, sp.SpecializationTitle;

#Revenue from each specialization
SELECT sp.SpecializationID, sp.SpecializationTitle,
       SUM(c.Price) AS TotalRevenue
FROM Specialization sp
JOIN Skill s ON sp.SpecializationID = s.SpecializationID
JOIN Course c ON s.CourseID = c.CourseID
GROUP BY sp.SpecializationID, sp.SpecializationTitle;

#Students with high engagement
SELECT u.UserID, u.UserName, COUNT(DISTINCT a.AssignmentID) AS AssignmentsCompleted, 
COUNT(DISTINCT q.QAssignmentID) AS QuizzesAttempted
FROM User u
JOIN Enrollment e ON u.UserID = e.SUserID
LEFT JOIN Assignment a ON e.EnrollmentID = a.CourseID
LEFT JOIN Quiz q ON e.EnrollmentID = q.QAssignmentID
GROUP BY u.UserID, u.UserName
ORDER BY (AssignmentsCompleted + QuizzesAttempted) DESC
LIMIT 5;

#Instructors with high course count
SELECT i.IUserID, u.UserName, COUNT(c.CourseID) AS CourseCount
FROM Instructor i
JOIN User u ON i.IUserID = u.UserID
JOIN Course c ON i.IUserID = c.IUserID
GROUP BY i.IUserID, u.UserName
ORDER BY CourseCount DESC
LIMIT 5;

#-------------------------------------------------------------------------------------------------------------------------

-- SUB-QUERY
#To see a student's latest enrollment
SELECT 
    UserID, UserName, 
    (SELECT CourseName FROM Course WHERE CourseID = (SELECT CourseID FROM Enrollment 
    WHERE SUserID = u.UserID ORDER BY EnrollmentDate DESC LIMIT 1)) AS LatestEnrollment
FROM 
    User u
WHERE 
    UserID = 1;

#-------------------------------------------------------------------------------------------------------------------------

-- VIEW
/* Creation of View provides valuable insights into the 
enrollment statistics for each course */
CREATE VIEW CourseEnrollmentStatistics AS
SELECT
    c.CourseID,
    c.CourseName,
    COUNT(e.EnrollmentID) AS EnrollmentCount,
    MAX(e.EnrollmentDate) AS LastEnrollmentDate
FROM
    Course c
LEFT JOIN
    Enrollment e ON c.CourseID = e.CourseID
GROUP BY
    c.CourseID, c.CourseName;
    
SELECT * FROM CourseEnrollmentStatistics;

#-------------------------------------------------------------------------------------------------------------------------

-- STORED PROCEDURE
/* Having a stored procedure for enrolling students in courses can streamline 
the enrollment process, ensuring data integrity and security*/
   DELIMITER //
CREATE PROCEDURE EnrollStudent(
    IN student_id INT, 
    IN course_id INT)
BEGIN
    -- Check if the student ID and course ID are valid
    DECLARE student_exists INT;
    DECLARE course_exists INT;
    DECLARE next_enrollment_id INT;
    DECLARE next_PaymentReciept INT;
    
    SELECT COUNT(*) INTO student_exists FROM Student WHERE SUserID = student_id;
    SELECT COUNT(*) INTO course_exists FROM Course WHERE CourseID = course_id;
    
    -- Ensure both student and course exist before enrollment
    IF student_exists > 0 AND course_exists > 0 THEN
    
     -- Perform the enrollment, 
        SELECT MAX(EnrollmentID) + 1 INTO next_enrollment_id FROM Enrollment; -- as default value not defined 
        SELECT MAX(PaymentReciept) + 1 INTO next_PaymentReciept FROM Enrollment;
        
        INSERT INTO Enrollment (EnrollmentID, SUserID, CourseID, EnrollmentDate, CompletionStatus, PaymentReciept)
        VALUES (next_enrollment_id, student_id, course_id, CURDATE(), 'Not Started', next_PaymentReciept);
        SELECT 'Enrollment successful' AS Message;
    ELSE
        SELECT 'Invalid student ID or course ID' AS Message;
    END IF; 
END // 
    DELIMITER ;

/* Next Steps to verify the Stored Procedure functionality
CALL EnrollStudent(11,11);
CALL EnrollStudent(8,4);
SELECT * FROM ENROLLMENT WHERE SUSERID = 8 AND COURSEID = 4;*/

#-------------------------------------------------------------------------------------------------------------------------

-- TRIGGER
/* Automatically updates the EnrollmentCount column in the Course table whenever a new 
enrollment is added to the Enrollment table.*/
DELIMITER //
CREATE TRIGGER UpdateEnrollmentCount
AFTER INSERT ON Enrollment
FOR EACH ROW
BEGIN
    UPDATE Course
    SET EnrollmentCount = EnrollmentCount + 1
    WHERE CourseID = NEW.CourseID;
END;
//
DELIMITER ;

/* Next Steps to verify the Trigger functionality
INSERT INTO Enrollment (EnrollmentID, SUserID,CourseID, EnrollmentDate, CompletionStatus, PaymentReciept) 
VALUES (7, 1, 2, '2024-04-01', 'Completed', 123456);
commit;
select * from Enrollment;
SELECT * FROM COURSE; */