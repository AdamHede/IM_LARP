-- =============================================
-- Employee Table
-- Stores basic information about the employees.
-- =============================================
CREATE TABLE Employee (
    EmployeeID SERIAL PRIMARY KEY,              -- Use SERIAL for auto-incrementing integer PK in PostgreSQL
    Name VARCHAR(255) NOT NULL,
    Team VARCHAR(255),
    Department VARCHAR(255),
    Office VARCHAR(255),
    Tenure INTEGER NOT NULL DEFAULT 0 CHECK (Tenure >= 0) -- Use INTEGER, add CHECK constraint for non-negativity (no UNSIGNED in PG)
);

-- =============================================
-- Characters Table
-- Defines the in-game characters linked to employees.
-- =============================================
CREATE TABLE Characters (
    CharacterID SERIAL PRIMARY KEY,             -- Use SERIAL for PK
    EmployeeID INTEGER UNIQUE,                  -- Link to Employee, assuming one character per employee
    Name VARCHAR(255) NOT NULL,                 -- Character's in-game name
    Description TEXT,                           -- Longer description for the character
    Strength INTEGER DEFAULT 10,                -- Use INTEGER for stats
    Intelligence INTEGER DEFAULT 10,
    Sneak INTEGER DEFAULT 10,
    Charisma INTEGER DEFAULT 10,
    Guild VARCHAR(255),                         -- Character's guild or faction affiliation
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID) ON DELETE SET NULL ON UPDATE CASCADE
);

-- =============================================
-- Quest Table
-- Defines the available quests in the game.
-- Calculated fields are not included as columns.
-- =============================================
CREATE TABLE Quest (
    QuestID SERIAL PRIMARY KEY,                 -- Use SERIAL for PK
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    Points INTEGER DEFAULT 0                    -- Use INTEGER for points
);

-- =============================================
-- GameLocations Table (Interpreted from "In-game locations")
-- Defines specific locations within the game world.
-- =============================================
CREATE TABLE GameLocations (
    LocationID SERIAL PRIMARY KEY,              -- Use SERIAL for PK
    Name VARCHAR(255) NOT NULL UNIQUE,
    RealWorldDescription TEXT
);

-- =============================================
-- Tasks Table
-- Defines individual tasks or steps within a quest.
-- =============================================
CREATE TABLE Tasks (
    TaskID SERIAL PRIMARY KEY,                  -- Use SERIAL for PK
    QuestID INTEGER NOT NULL,                   -- Use INTEGER for FK
    TaskName VARCHAR(255),
    LocationID INTEGER,                         -- Use INTEGER for FK
    Description TEXT,
    SkillsToCheck VARCHAR(255),                 -- e.g., "Stealth", "Charisma,Tech"
    SkillCheckDC INTEGER,                       -- Use INTEGER for Difficulty Class
    IsPassed BOOLEAN DEFAULT NULL,              -- PostgreSQL has a native BOOLEAN type
    FOREIGN KEY (QuestID) REFERENCES Quest(QuestID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (LocationID) REFERENCES GameLocations(LocationID) ON DELETE SET NULL ON UPDATE CASCADE
);

-- =============================================
-- Character_Quest_Assignment Table (Junction Table: Characters <-> Quest)
-- Assigns quests to characters and tracks their role/status.
-- =============================================
CREATE TABLE Character_Quest_Assignment (
    CharacterQuestAssignmentID SERIAL PRIMARY KEY, -- Use SERIAL for PK
    CharacterID INTEGER NOT NULL,               -- Use INTEGER for FK
    QuestID INTEGER NOT NULL,                   -- Use INTEGER for FK
    Role VARCHAR(255),                          -- Role of the character in this specific quest
    Status VARCHAR(50) DEFAULT 'Assigned',      -- Represents quest status for this character
    UNIQUE (CharacterID, QuestID),              -- Ensure a character isn't assigned the same quest twice
    FOREIGN KEY (CharacterID) REFERENCES Characters(CharacterID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (QuestID) REFERENCES Quest(QuestID) ON DELETE CASCADE ON UPDATE CASCADE
);