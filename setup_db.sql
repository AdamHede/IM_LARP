-- =============================================
-- Employee Table
-- Stores basic information about the employees.
-- =============================================
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,  -- Assuming EmployeeID is a numeric auto-incrementing key
    Name VARCHAR(255) NOT NULL,
    Team VARCHAR(255),
    Department VARCHAR(255),
    Office VARCHAR(255),
    Tenure INT UNSIGNED NOT NULL DEFAULT 0 -- Assuming tenure is years (non-negative)
);

-- =============================================
-- Characters Table
-- Defines the in-game characters linked to employees.
-- =============================================
CREATE TABLE Characters (
    CharacterID INT PRIMARY KEY AUTO_INCREMENT, -- Dedicated Character ID as primary key
    EmployeeID INT UNIQUE,                      -- Link to Employee, assuming one character per employee (UNIQUE)
    Name VARCHAR(255) NOT NULL,                 -- Character's in-game name
    Description TEXT,                           -- Longer description for the character
    Strength INT DEFAULT 10,                    -- Stat value, assuming INT type
    Intelligence INT DEFAULT 10,                -- Stat value, assuming INT type
    Sneak INT DEFAULT 10,                       -- Stat value, marked as INT
    Charisma INT DEFAULT 10,                    -- Stat value, assuming INT type
    Guild VARCHAR(255),                         -- Character's guild or faction affiliation
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID) ON DELETE SET NULL ON UPDATE CASCADE -- Link Employee, SET NULL if employee removed? Or CASCADE? Choose based on desired behavior.
);

-- =============================================
-- Quest Table
-- Defines the available quests in the game.
-- Calculated fields are not included as columns.
-- =============================================
CREATE TABLE Quest (
    QuestID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    Points INT DEFAULT 0                      -- Points awarded for completing the quest
);

-- =============================================
-- GameLocations Table (Interpreted from "In-game locations")
-- Defines specific locations within the game world.
-- =============================================
CREATE TABLE GameLocations (
    LocationID INT PRIMARY KEY AUTO_INCREMENT, -- Renamed 'in-game location key' for clarity
    Name VARCHAR(255) NOT NULL UNIQUE,         -- Renamed 'Name'/'in-game name', made unique
    RealWorldDescription TEXT                  -- Added field for mapping to reality
);

-- =============================================
-- Tasks Table
-- Defines individual tasks or steps within a quest.
-- =============================================
CREATE TABLE Tasks (
    TaskID INT PRIMARY KEY AUTO_INCREMENT,       -- Added a dedicated TaskID for easier referencing
    QuestID INT NOT NULL,
    TaskName VARCHAR(255),                       -- Renamed 'Task' for clarity
    LocationID INT,                              -- Foreign key to GameLocations table
    Description TEXT,
    SkillsToCheck VARCHAR(255),                  -- e.g., "Stealth", "Charisma,Tech"
    SkillCheckDC INT,                            -- Renamed 'Skill check level to pass' (Difficulty Class)
    IsPassed BOOLEAN DEFAULT NULL,               -- Renamed 'pass or fail', NULL means not attempted/recorded yet
    FOREIGN KEY (QuestID) REFERENCES Quest(QuestID) ON DELETE CASCADE ON UPDATE CASCADE, -- If Quest deleted, delete tasks
    FOREIGN KEY (LocationID) REFERENCES GameLocations(LocationID) ON DELETE SET NULL ON UPDATE CASCADE -- If Location deleted, keep task but remove location link
);

-- =============================================
-- Character_Quest_Assignment Table (Junction Table: Characters <-> Quest)
-- Assigns quests to characters and tracks their role/status.
-- =============================================
CREATE TABLE Character_Quest_Assignment (
    CharacterQuestAssignmentID INT PRIMARY KEY AUTO_INCREMENT, -- Added specific PK for easier modification/referencing
    CharacterID INT NOT NULL,
    QuestID INT NOT NULL,
    Role VARCHAR(255),                           -- Role of the character in this specific quest (e.g., 'Assignee', 'Target')
    Status VARCHAR(50) DEFAULT 'Assigned',       -- Renamed 'Field', represents quest status for this character (e.g., 'Assigned', 'In Progress', 'Completed')
    UNIQUE (CharacterID, QuestID),               -- Ensure a character isn't assigned the same quest twice
    FOREIGN KEY (CharacterID) REFERENCES Characters(CharacterID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (QuestID) REFERENCES Quest(QuestID) ON DELETE CASCADE ON UPDATE CASCADE
);