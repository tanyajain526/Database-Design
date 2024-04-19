use COURSERA;
INSERT INTO User (UserID, UserName, Email, Password, UserType, CreatedDate,LastUpdatedDate, IsDeleted) 
VALUES 
    (1, 'John Case', 'johncase@gmail.com', 'Password@1', 'Student', '2024-03-10','2024-03-10', 0),
    (2, 'Jane Arey', 'janearey@yahoo.com', 'SecureP@ss2', 'Student', '2024-03-09','2024-03-09', 0),
    (3, 'Jill Smith', 'jillsmith@gmail.com', 'Teach@3', 'Instructor', '2024-03-08','2024-03-08', 0),
    (4, 'Mike Jones', 'mike_jones@yahoo.com', 'M1k3J@n3s', 'Student', '2024-03-07','2024-03-07', 0),
    (5, 'Sarah Johnson', 'sarah_jackson@gmail.com', 'S@rahJ4ckson', 'Staff', '2024-03-06','2024-03-06', 0),
    (6, 'Linda Williams', 'linda_williams@yahoo.com', 'L1nd@W1ll1ams', 'Instructor', '2024-03-05','2024-03-05', 0),
    (7, 'Chris Evans', 'chris_evans@gmail.com', 'Chr1sEv@ns', 'Student', '2024-03-04','2024-03-04', 0),
    (8, 'Emily Whatson', 'emily_white@yahoo.com', 'Em1lyWhit3', 'Student', '2024-03-03', '2024-03-03',0),
	(9,'Taylor Jane','taylor@ymail.com','Tjamie1@','Staff','2024-03-03', '2024-03-03',0);   

INSERT INTO Student (SUserID, EducationalInstitution, Goals) 
VALUES 
    (1, 'Harvard University', 'Gain knowledge in various subjects'),
    (2, 'Stanford University', 'Excel in computer science'),
    (4, 'Massachusetts Institute of Technology', 'Pursue a career in engineering'),
    (7, 'University of California, Berkeley', 'Become a data scientist'),
    (8, 'Yale University', 'Explore liberal arts');
    
INSERT INTO Staff (STUserID, Role, Department, AccessLevel) 
VALUES 
(5, 'Admin', 'IT', 'Full Access'),
(9,'Editor','Corrections','Read Only');

INSERT INTO Instructor (IUserID, CourseCount, EducationalInstitution, Company) 
VALUES 
    (3, 5, 'University of Wisconsin', 'Apple'),
    (6, 3, 'University of South Carolina', 'Meta');
    
INSERT INTO Course (CourseID, IUserID, EnrollmentCount, CourseName, CourseTitle, CourseDescription, StartDate, EndDate, Price) 
VALUES 
    (1, 3, 100, 'CS101', 'Introduction to Computer Science', 'Learn the fundamentals of computer science', '2024-04-01', '2024-06-30', 99.99),
    (2, 3, 50, 'MATH201', 'Advanced Mathematics', 'Explore advanced topics in mathematics', '2024-05-01', '2024-07-31', 129.99),
    (3, 6, 80, 'ENG101', 'Introduction to Engineering', 'Discover the world of engineering', '2024-06-01', '2024-08-31', 149.99),
    (4, 6, 60, 'MECH301', 'Mechanical Engineering Principles', 'Study core concepts of mechanical engineering', '2024-07-01', '2024-09-30', 179.99);
    
INSERT INTO Accomplishment (AccomplishmentID, CourseID, SUserID, AccomplishmentType) 
VALUES 
    (1, 1, 1, 'Certificate'),
    (2, 1, 2, 'Degree'),
    (3, 2, 4, 'Certificate'),
    (4, 2, 8, 'Degree'),
    (5, 3, 7, 'Certificate');
    
INSERT INTO Degree (DAccomplishmentID, UniversityID, UniversityName, DegreeIssueDate) 
VALUES 
    (2, 1, 'Harvard University', '2024-08-01'),
    (4, 2, 'Stanford University', '2024-08-05');

INSERT INTO Certificate (CAccomplishmentID, CompanyName, IssueDate, CertificateExpiryDate) 
VALUES 
    (1, 'IBM', '2024-07-01', '2025-07-01'),
    (3, 'Mictosoft', '2024-07-15', '2025-07-15'),
    (5, 'Meta', '2024-08-01', '2025-08-01');
    
INSERT INTO Enrollment (EnrollmentID, SUserID,CourseID, EnrollmentDate, CompletionStatus, PaymentReciept) 
VALUES 
    (1, 1,1, '2024-04-01', 'Completed', 123456),
    (2, 2,2, '2024-05-01', 'In Progress', 789012),
    (3, 4,3, '2024-06-01', 'In Progress', 345678),
    (4, 7, 4,'2024-08-01', 'Not Started', 567890),
    (5, 8,1, '2024-09-01', 'Not Started', 234567);
    
INSERT INTO Review (ReviewID, SUserID, CourseID, Rating, Comment, Review_Date) 
VALUES 
    (1, 1, 1, 5, 'Great course, learned a lot!', '2024-07-05'),
    (2, 2, 1, 4, 'Challenging but rewarding.', '2024-08-10'),
    (3, 4, 2, 5, 'Excellent content, very informative.', '2024-09-15'),
    (4, 7, 3, 4, 'Enjoyed the course, would recommend.', '2024-10-20');

INSERT INTO Subject (SubjectID, SubjectDescription, SubjectName) 
VALUES 
    (1, 'Fundamental concepts of computer science', 'Computer Science'),
    (2, 'Advanced topics in mathematics', 'Mathematics'),
    (3, 'Basic principles of engineering', 'Engineering'),
    (4, 'Core concepts in mechanical engineering', 'Mechanical Engineering');

INSERT INTO Specialization (SpecializationID, SubjectID, SpecializationDescription, SpecializationTitle) 
VALUES 
    (1, 1, 'Deep dive into computer science fundamentals for operations', 'Computer Science Operating Systems'),
	(2, 1, 'Deep dive into database designs', 'Database Administration'),
    (3, 2, 'Advanced mathematics for research', 'Advanced Mathematics Research'),
    (4, 2, 'Advanced mathematics for actuaries', 'Acturial Mathematics'),
    (5, 3, 'Engineering principles to ace an internship', 'Principles of a new Engineer'),
    (6, 4, 'Stress and dynamic analysis for loading', 'Finite Element Analysis');

INSERT INTO Skill (SkillID, CourseID, SpecializationID, SkillName) 
VALUES 
    (1, 1, 1, 'Programming Basics'),
    (2, 1, 1, 'Data Structures'),
    (3, 2, 3, 'Advanced Mathematics'),
    (4, 2, 4, 'Mathematical Proofs'),
    (5, 3, 1, 'Engineering Principles'),
    (6, 3, 6, 'Case Study Analysis'),
    (7, 4, 5, 'Lab Experimentation'),
    (8, 4, 6, 'Mechanical Design Software'),
    (9, 1, 2, 'Database Design'),
    (10, 2, 3, 'Mathematical Modeling');
    
INSERT INTO Module (ModuleID, CourseID, ModuleTitle, ModuleDescription) 
VALUES 
    (1, 1, 'Introduction to Programming', 'Learn the basics of programming and problem-solving'),
    (2, 1, 'Data Structures', 'Study various data structures and their implementations'),
    (3, 2, 'Advanced Mathematics', 'Explore advanced topics in mathematics'),
    (4, 2, 'Mathematical Proofs', 'Learn techniques for mathematical proofs'),
    (5, 3, 'Fundamentals of Engineering', 'Introduction to basic engineering principles'),
    (6, 3, 'Engineering Case Studies', 'Explore real-world engineering case studies'),
    (7, 4, 'Mechanical Engineering Lab', 'Hands-on experience in mechanical engineering experiments'),
    (8, 4, 'Mechanical Design', 'Learn about mechanical design principles and software'),
    (9, 1, 'Advanced Programming Concepts', 'Explore advanced programming concepts'),
    (10, 2, 'Mathematical Modeling', 'Learn about mathematical modeling techniques');
    
INSERT INTO CourseMaterial (CourseMaterialID, ModuleID, CourseMaterialTitle, Type, CourseMaterialDescription, UploadedDate, Content) 
VALUES 
    (1, 1, 'Introduction Slides', 'Presentation', 'Slides introducing the course', '2024-04-01', 'Slide content...'),
    (2, 1, 'Programming Tutorial', 'Video', 'Tutorial on programming basics', '2024-04-02', 'Video content...'),
    (3, 2, 'Data Structures Lecture Notes', 'Document', 'Notes on data structures', '2024-04-05', 'Document content...'),
    (4, 2, 'Data Structures Code Examples', 'Code', 'Code examples for data structures', '2024-04-06', 'Code snippets...'),
    (5, 3, 'Engineering Principles Presentation', 'Presentation', 'Slides on engineering principles', '2024-06-01', 'Presentation content...'),
    (6, 3, 'Engineering Case Studies', 'Document', 'Case studies in engineering', '2024-06-05', 'Case study content...'),
    (7, 4, 'Mechanical Lab Manual', 'Document', 'Manual for mechanical lab experiments', '2024-07-01', 'Manual content...'),
    (8, 4, 'Mechanical Design Software Tutorial', 'Video', 'Tutorial on mechanical design software', '2024-07-05', 'Video content...'),
    (9, 1, 'Programming Assignment Guidelines', 'Document', 'Guidelines for programming assignments', '2024-04-10', 'Guideline content...'),
    (10, 2, 'Data Structures Practice Problems', 'Document', 'Practice problems for data structures', '2024-04-15', 'Problem content...');
    
INSERT INTO Assignment (AssignmentID, CourseID, AssignmentTitle, AssignmentDescription, DueDate, TimeLimit, AttemptLimit,AssignmentType) 
VALUES 
    (1, 1, 'Programming Assignment 1', 'Write a program to solve a given problem', '2024-04-15', '2024-04-15 23:59:59', 3, 'Automatic Grading'),
    (2, 1, 'Data Structures Project', 'Implement various data structures', '2024-05-15', '2024-05-15 23:59:59', 2, 'Manual Grading'),
    (3, 2, 'Mathematics Quiz 1', 'Solve mathematical problems', '2024-06-15', '2024-06-15 23:59:59', 3, 'Automatic Grading'),
    (4, 2, 'Mathematics Assignment 2', 'Prove mathematical theorems', '2024-07-15', '2024-07-15 23:59:59', 2, 'Manual Grading'),
    (5, 3, 'Engineering Project Proposal', 'Propose an engineering project', '2024-08-15', '2024-08-15 23:59:59', 1, 'Peer Review'),
    (6, 3, 'Engineering Project Report', 'Submit the final project report', '2024-09-15', '2024-09-15 23:59:59', 1, 'Automatic Grading'),
    (7, 4, 'Mechanical Engineering Lab Report', 'Report on mechanical experiments', '2024-10-15', '2024-10-15 23:59:59', 1, 'Manual Grading'),
    (8, 4, 'Mechanical Engineering Design Project', 'Design a mechanical system', '2024-11-15', '2024-11-15 23:59:59', 2, 'Manual Grading'),
    (9, 1, 'Programming Assignment 2', 'Advanced programming tasks', '2024-12-15', '2024-12-15 23:59:59', 3, 'Automatic Grading'),
    (10, 2, 'Mathematics Assignment 3', 'Advanced mathematical problems', '2025-01-15', '2025-01-15 23:59:59', 2, 'Manual Grading');

INSERT INTO Quiz (QAssignmentID, NumberOfAttempts) 
VALUES 
    (3, 2), 
    (4, 3), 
    (5, 1), 
    (6, 2), 
    (7, 3), 
    (8, 1), 
    (9, 2), 
    (10, 3);
    
INSERT INTO Lab (LAssignmentID, NumberOfExercises) 
VALUES 
    (7, 5),
    (8, 4),
    (1, 3),
    (9, 6),
    (6, 5),
    (4, 4),
    (2, 6);

INSERT INTO Evaluation (ModuleID, AssignmentID) 
VALUES 
    (1, 1),
    (1, 2),
    (2, 3),
    (2, 4),
    (3, 5),
    (3, 6),
    (4, 7),
    (4, 8),
    (5, 9),
    (6, 10);

INSERT INTO Grade (GradeID, AssignmentID, EnrollmentID, Score) 
VALUES 
    (1, 1, 1, 95.50),
    (2, 2, 2, 87.25),
    (3, 3, 3, 92.00),
    (4, 4, 4, 88.75),
    (5, 5, 1, NULL),
    (6, 6, 2, NULL),
    (7, 7, 3, NULL),
    (8, 8, 4, 100),
    (9, 9, 5, 95),
    (10, 10, 1, NULL);
    
COMMIT;