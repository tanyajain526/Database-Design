#drop database COURSERA;
create database COURSERA;
use coursera;

CREATE TABLE User (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(255),
    Email VARCHAR(255),
    Password VARCHAR(255),
    UserType VARCHAR(50),
    CreatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    LastUpdatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    IsDeleted BOOLEAN
);

CREATE TABLE Student (
    SUserID INT PRIMARY KEY,
    EducationalInstitution VARCHAR(255),
    Goals VARCHAR(255),
    FOREIGN KEY (SUserID) REFERENCES User(UserID)
);

CREATE TABLE Staff(
    STUserID INT PRIMARY KEY,
    Role VARCHAR(255),
    Department VARCHAR(255),
    AccessLevel VARCHAR(255),
    FOREIGN KEY (STUserID) REFERENCES User(UserID)
);

CREATE TABLE Instructor (
    IUserID INT PRIMARY KEY,
    CourseCount INT,
    EducationalInstitution VARCHAR(255),
    Company VARCHAR(255),
    FOREIGN KEY (IUserID) REFERENCES User(UserID)
);
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    IUserID INT,
    EnrollmentCount INT,
	CourseName VARCHAR(255),
    CourseTitle VARCHAR(255),
    CourseDescription VARCHAR(255),
    StartDate DATE,
    EndDate DATE,
    Price DECIMAL(10, 2),
    FOREIGN KEY (IUserID) REFERENCES Instructor(IUserID)
);

CREATE TABLE Accomplishment (
    AccomplishmentID INT PRIMARY KEY,
    CourseID INT,
    SUserID INT,
    AccomplishmentType VARCHAR(255),
    FOREIGN KEY (SUserID) REFERENCES Student(SUserID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

CREATE TABLE Degree (
    DAccomplishmentID INT PRIMARY KEY,
    UniversityID INT,
    UniversityName VARCHAR(255),
    DegreeIssueDate DATE,
    FOREIGN KEY (DAccomplishmentID) REFERENCES Accomplishment(AccomplishmentID)
);

CREATE TABLE Certificate (
    CAccomplishmentID INT PRIMARY KEY,
    CompanyName VARCHAR(255),
    IssueDate DATE,
    CertificateExpiryDate DATE,
    FOREIGN KEY (CAccomplishmentID) REFERENCES Accomplishment(AccomplishmentID)
);

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    SUserID INT,
    CourseID INT,
    EnrollmentDate DATE,
    CompletionStatus VARCHAR(50),
    PaymentReciept INT,
    FOREIGN KEY (SUserID) REFERENCES Student(SUserID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

CREATE TABLE Review (
    ReviewID INT PRIMARY KEY,
    SUserID INT,
    CourseID INT,
    Rating INT,
    Comment TEXT,
    Review_Date DATE,
    FOREIGN KEY (SUserID) REFERENCES Student(SUserID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

CREATE TABLE Subject (
    SubjectID INT PRIMARY KEY,
    SubjectDescription TEXT,
    SubjectName VARCHAR(255)
);

CREATE TABLE Specialization (
    SpecializationID INT PRIMARY KEY,
    SubjectID INT,
    SpecializationDescription TEXT,
    SpecializationTitle VARCHAR(255),
    FOREIGN KEY (SubjectID) REFERENCES Subject(SubjectID)
);

CREATE TABLE Skill (
    SkillID INT PRIMARY KEY,
    CourseID INT,
    SpecializationID INT,
    SkillName VARCHAR(255),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    FOREIGN KEY (SpecializationID) REFERENCES Specialization(SpecializationID)
);

CREATE TABLE Module (
    ModuleID INT PRIMARY KEY,
    CourseID INT,
    ModuleTitle VARCHAR(255),
    ModuleDescription TEXT,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

CREATE TABLE CourseMaterial (
    CourseMaterialID INT PRIMARY KEY,
	ModuleID INT,
    CourseMaterialTitle VARCHAR(255),
    Type VARCHAR(50),
    CourseMaterialDescription TEXT,
    UploadedDate DATE,
    Content TEXT,
    FOREIGN KEY (ModuleID) REFERENCES Module(ModuleID)
);

CREATE TABLE Assignment (
    AssignmentID INT PRIMARY KEY,
    CourseID INT,
    AssignmentTitle VARCHAR(255),
    AssignmentDescription TEXT,
    DueDate DATE,
    TimeLimit TIMESTAMP,
    AttemptLimit INT,
    AssignmentType VARCHAR(50),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

CREATE TABLE Quiz (
    QAssignmentID INT PRIMARY KEY,
    NumberOfAttempts INT,
    FOREIGN KEY (QAssignmentID) REFERENCES Assignment(AssignmentID)
);

CREATE TABLE Lab (
    LAssignmentID INT PRIMARY KEY,
    NumberOfExercises INT,
    FOREIGN KEY (LAssignmentID) REFERENCES Assignment(AssignmentID)
);

CREATE TABLE Evaluation (
    ModuleID INT,
    AssignmentID INT,
    PRIMARY KEY (ModuleID, AssignmentID)
);

CREATE TABLE Grade (
    GradeID INT,
    AssignmentID INT,
    EnrollmentID INT,
    Score DECIMAL(5, 2),
    FOREIGN KEY (EnrollmentID) REFERENCES Enrollment(EnrollmentID),
    PRIMARY KEY (GradeID, AssignmentID)
);

COMMIT;