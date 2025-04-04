-- =============================================
-- Updated Schema Definition for Project Æsir (PostgreSQL)
-- =============================================

-- Drop tables in reverse order of creation if needed for complete reset
-- DROP TABLE IF EXISTS Character_Quest_Assignment;
-- DROP TABLE IF EXISTS Tasks;
-- DROP TABLE IF EXISTS GameLocations;
-- DROP TABLE IF EXISTS Quest;
-- DROP TABLE IF EXISTS Characters;
-- DROP TABLE IF EXISTS Employee;

-- =============================================
-- Employee Table
-- Stores basic information about the employees, now including email and phone.
-- =============================================
CREATE TABLE Employee (
    EmployeeID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,         -- Added Email field
    PhoneNumber VARCHAR(20) NULL,               -- Added Phone Number field (nullable)
    Team VARCHAR(255),
    Department VARCHAR(255),
    Office VARCHAR(255),
    Tenure INTEGER NOT NULL DEFAULT 0 CHECK (Tenure >= 0)
);

-- =============================================
-- Characters Table
-- Defines the in-game characters linked to employees. (No changes here)
-- =============================================
CREATE TABLE Characters (
    CharacterID SERIAL PRIMARY KEY,
    EmployeeID INTEGER UNIQUE,
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    Strength INTEGER DEFAULT 10,
    Intelligence INTEGER DEFAULT 10,
    Sneak INTEGER DEFAULT 10,
    Charisma INTEGER DEFAULT 10,
    Guild VARCHAR(255),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID) ON DELETE SET NULL ON UPDATE CASCADE
);

-- =============================================
-- Quest Table
-- Defines the available quests in the game. (No changes here)
-- =============================================
CREATE TABLE Quest (
    QuestID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    Points INTEGER DEFAULT 0
);

-- =============================================
-- GameLocations Table
-- Defines specific locations within the game world. (No changes here)
-- =============================================
CREATE TABLE GameLocations (
    LocationID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL UNIQUE,
    RealWorldDescription TEXT
);

-- =============================================
-- Tasks Table
-- Defines individual tasks or steps within a quest. (No changes here)
-- =============================================
CREATE TABLE Tasks (
    TaskID SERIAL PRIMARY KEY,
    QuestID INTEGER NOT NULL,
    TaskName VARCHAR(255),
    LocationID INTEGER,
    Description TEXT,
    SkillsToCheck VARCHAR(255),
    SkillCheckDC INTEGER,
    IsPassed BOOLEAN DEFAULT NULL,
    FOREIGN KEY (QuestID) REFERENCES Quest(QuestID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (LocationID) REFERENCES GameLocations(LocationID) ON DELETE SET NULL ON UPDATE CASCADE
);

-- =============================================
-- Character_Quest_Assignment Table (Junction Table: Characters <-> Quest)
-- Assigns quests to characters and tracks their role/status. (No changes here)
-- =============================================
CREATE TABLE Character_Quest_Assignment (
    CharacterQuestAssignmentID SERIAL PRIMARY KEY,
    CharacterID INTEGER NOT NULL,
    QuestID INTEGER NOT NULL,
    Role VARCHAR(255),
    Status VARCHAR(50) DEFAULT 'Assigned',
    UNIQUE (CharacterID, QuestID),
    FOREIGN KEY (CharacterID) REFERENCES Characters(CharacterID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (QuestID) REFERENCES Quest(QuestID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- =============================================
-- Schema Definition Complete
-- =============================================