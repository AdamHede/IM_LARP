-- =============================================
-- Sample Data Generation for Project Æsir (PostgreSQL)
-- =============================================

-- Clear existing data (optional, use with caution!)
-- DELETE FROM Character_Quest_Assignment;
-- DELETE FROM Tasks;
-- DELETE FROM GameLocations;
-- DELETE FROM Quest;
-- DELETE FROM Characters;
-- DELETE FROM Employee;

-- =============================================
-- 1. Populate Employee Table
-- =============================================
INSERT INTO Employee (Name, Team, Department, Office, Tenure) VALUES
('Astrid Jensen', 'Project Chimera', 'Research & Development', 'Copenhagen', 5),
('Bjørn Hansen', 'Project Phoenix', 'Research & Development', 'Copenhagen', 8),
('Clara Møller', 'Core Tech', 'Research & Development', 'Aarhus', 3),
('David Nielsen', 'Nordics Team', 'Sales & Marketing', 'Copenhagen', 10),
('Eva Kristensen', 'DACH Team', 'Sales & Marketing', 'Zurich', 6),
('Frederik Andersen', 'Global Accounts', 'Sales & Marketing', 'Oslo', 4),
('Greta Schmidt', 'Logistics', 'Operations', 'Zurich', 12),
('Henrik Larsen', 'Facility Security', 'Operations', 'Copenhagen', 7),
('Ingrid Olsen', 'IT Support', 'Operations', 'Aarhus', 2),
('Jakob Pedersen', 'Audit Group', 'Finance', 'Copenhagen', 9),
('Katrine Berg', 'Budget Control', 'Finance', 'Oslo', 5),
('Lars Sørensen', 'Project Chimera', 'Research & Development', 'Aarhus', 6),
('Maja Petersen', 'Project Phoenix', 'Research & Development', 'Copenhagen', 1),
('Niklas Jørgensen', 'Core Tech', 'Research & Development', 'Oslo', 7),
('Olivia Rasmussen', 'Nordics Team', 'Sales & Marketing', 'Aarhus', 3),
('Peter Madsen', 'DACH Team', 'Sales & Marketing', 'Zurich', 11),
('Quinn Eriksen', 'Global Accounts', 'Sales & Marketing', 'Copenhagen', 5),
('Rasmus Thomsen', 'Logistics', 'Operations', 'Oslo', 8),
('Sofia Vestergaard', 'Facility Security', 'Operations', 'Aarhus', 4),
('Thomas Christiansen', 'IT Support', 'Operations', 'Zurich', 6),
('Ursula Müller', 'Audit Group', 'Finance', 'Zurich', 15),
('Viktor Nilsson', 'Budget Control', 'Finance', 'Copenhagen', 2),
('Wilma Johansson', 'Project Chimera', 'Research & Development', 'Oslo', 9),
('Xander Lund', 'Project Phoenix', 'Research & Development', 'Aarhus', 5),
('Yrsa Holm', 'Core Tech', 'Research & Development', 'Copenhagen', 12),
('Zane Fischer', 'Nordics Team', 'Sales & Marketing', 'Zurich', 1),
('Anders Poulsen', 'Facility Security', 'Operations', 'Copenhagen', 10),
('Birgitte Nygaard', 'Global Accounts', 'Sales & Marketing', 'Oslo', 7),
('Christian Dahl', 'IT Support', 'Operations', 'Aarhus', 3),
('Diana Bach', 'Audit Group', 'Finance', 'Zurich', 8); -- Total 30 employees

-- =============================================
-- 2. Populate Characters Table
-- Assuming EmployeeIDs are generated sequentially starting from 1
-- Assigning stats somewhat randomly for variety (sum roughly 40)
-- =============================================
INSERT INTO Characters (EmployeeID, Name, Description, Strength, Intelligence, Sneak, Charisma, Guild) VALUES
(1, 'Viper', 'Adept at infiltration and extraction.', 8, 12, 15, 5, 'The Syndicate'),
(2, 'Ghost', 'Master of disguise and silent movement.', 7, 10, 16, 7, 'Black Helix'),
(3, 'Oracle', 'Information broker with deep network access.', 5, 18, 7, 10, 'Aether Collective'),
(4, 'Whisper', 'Expert in social engineering and persuasion.', 6, 10, 8, 16, 'Chronos Corp'),
(5, 'Nomad', 'Specialist in navigating hostile environments.', 12, 8, 12, 8, 'The Syndicate'),
(6, 'Wraith', 'Excels at electronic warfare and hacking.', 5, 16, 10, 9, 'Black Helix'),
(7, 'Titan', 'Focuses on heavy security and protection.', 15, 7, 5, 13, 'Chronos Corp'),
(8, 'Cipher', 'Codebreaker and cryptography expert.', 6, 17, 9, 8, 'Aether Collective'),
(9, 'Shadow', 'Operative specializing in surveillance.', 7, 11, 17, 5, 'The Syndicate'),
(10, 'Echo', 'Mimicry and deep cover specialist.', 8, 12, 10, 10, 'Black Helix'),
(11, 'Rook', 'Strategic planner and logistical support.', 9, 14, 6, 11, 'Chronos Corp'),
(12, 'Raven', 'Intelligence gathering and analysis.', 6, 16, 11, 7, 'Aether Collective'),
(13, 'Jackal', 'Resourceful scavenger and opportunist.', 10, 9, 13, 8, 'The Syndicate'),
(14, 'Lynx', 'Quick and agile operative for urban settings.', 8, 11, 15, 6, 'Black Helix'),
(15, 'Griffin', 'Air surveillance and drone expert.', 7, 13, 9, 11, 'Chronos Corp'),
(16, 'Sphinx', 'Enigmatic operative dealing in secrets.', 5, 15, 10, 10, 'Aether Collective'),
(17, 'Cerberus', 'Guardian of secure locations.', 16, 8, 6, 10, 'The Syndicate'),
(18, 'Hydra', 'Manages complex networks of agents.', 9, 15, 7, 9, 'Black Helix'),
(19, 'Phoenix', 'Expert in recovery and counter-ops.', 11, 12, 8, 9, 'Chronos Corp'),
(20, 'Wyvern', 'Specializes in sabotage and disruption.', 10, 10, 14, 6, 'Aether Collective'),
(21, 'Basilisk', 'Deals with biological and chemical threats.', 8, 14, 9, 9, 'The Syndicate'),
(22, 'Chimera', 'Master of blending technologies.', 7, 16, 8, 9, 'Black Helix'),
(23, 'Gorgon', 'Psychological warfare specialist.', 6, 13, 10, 11, 'Chronos Corp'),
(24, 'Kraken', 'Maritime operations expert.', 13, 9, 9, 9, 'Aether Collective'),
(25, 'Manticore', 'Deception and misinformation expert.', 7, 14, 11, 8, 'The Syndicate'),
(26, 'Naga', 'Operative skilled in poisons and toxins.', 8, 12, 14, 6, 'Black Helix'),
(27, 'Ogre', 'Brute force and intimidation tactics.', 17, 6, 5, 12, 'Chronos Corp'),
(28, 'Pixie', 'Miniature tech and infiltration expert.', 5, 15, 16, 4, 'Aether Collective'),
(29, 'Satyr', 'Charmer and information extractor.', 7, 11, 9, 13, 'The Syndicate'),
(30, 'Troll', 'Online disruption and misinformation.', 9, 13, 7, 11, 'Black Helix');

-- =============================================
-- 3. Populate Quest Table
-- =============================================
INSERT INTO Quest (Name, Description, Points) VALUES
('Operation Nightingale', 'Intercept sensitive communication logs from the R&D network.', 150),
('The Zurich Gambit', 'Retrieve stolen prototype schematics before they leave the city.', 200),
('Project Chimera Sabotage', 'Infiltrate the Chimera lab and subtly disrupt their primary experiment.', 180),
('Black Helix Extraction', 'A Black Helix informant needs safe passage out of the Oslo office.', 120),
('Chronos Corp Counter-Intel', 'Plant misinformation within the Chronos Corp sales database.', 160),
('Aether Collective Data Heist', 'Acquire market analysis data from the Aether Collective server farm.', 220),
('The Syndicate''s Missing Agent', 'Locate a Syndicate agent who went dark in Aarhus.', 100),
('Secure the Server Room', 'Prevent a rival team from accessing the main server room during maintenance.', 140),
('Audit Trail Anomaly', 'Investigate irregularities in the Finance department''s audit logs.', 130),
('Operation Silent Whisper', 'Gather intel on the upcoming product launch by eavesdropping in key locations.', 170);

-- =============================================
-- 4. Populate GameLocations Table
-- =============================================
INSERT INTO GameLocations (Name, RealWorldDescription) VALUES
('Server Farm Alpha', 'Basement - Data Center Sector A'),
('Whispering Gallery', 'Main Canteen - Upper Balcony Area'),
('Dead Drop Zone', 'Exterior - North Bike Shed'),
('R&D Lab Sector 7G', 'Building B - Floor 3 - Restricted Access Zone'),
('Executive Suite Kilo', 'Main Building - Floor 10 - CEO Corridor'),
('The Boiler Room', 'Basement - Maintenance Access Tunnel M-3'),
('Archive Vault', 'Building C - Sub-level 2 - Record Storage'),
('Security Hub', 'Main Building - Floor 1 - Beside Main Entrance'),
('Logistics Bay 3', 'Warehouse D - Loading Dock Area 3'),
('Zurich Safehouse', 'Zurich Office - Meeting Room 'Zebra'' );

-- =============================================
-- 5. Populate Tasks Table
-- Linking Tasks to Quests and Locations
-- QuestIDs and LocationIDs assumed to be 1-10
-- =============================================
INSERT INTO Tasks (QuestID, TaskName, LocationID, Description, SkillsToCheck, SkillCheckDC) VALUES
-- Op Nightingale (Quest 1)
(1, 'Bypass Network Firewall', 1, 'Gain access to the internal R&D network segment.', 'Intelligence', 16),
(1, 'Locate Comm Logs', 1, 'Search the file directories for the specific communication logs.', 'Intelligence', 14),
(1, 'Extract Data Undetected', 1, 'Copy the logs to a secure device without tripping alarms.', 'Sneak', 15),
-- Zurich Gambit (Quest 2)
(2, 'Identify Courier', 10, 'Observe personnel in the Zurich Safehouse to identify the courier carrying the schematics.', 'Intelligence', 13),
(2, 'Lift Schematics', 10, 'Subtly acquire the schematic container from the courier.', 'Sneak', 16),
(2, 'Escape Zurich Securely', 10, 'Leave the location without being identified or followed.', 'Sneak', 14),
-- Chimera Sabotage (Quest 3)
(3, 'Gain Lab Access', 4, 'Bypass security to enter Lab Sector 7G.', 'Tech', 15), -- Assuming Tech skill exists implicitly or using Intelligence/Sneak
(3, 'Introduce Contaminant', 4, 'Subtly introduce the provided agent into the experiment apparatus.', 'Sneak', 14),
(3, 'Wipe Entry Logs', 4, 'Remove digital traces of your access to the lab.', 'Intelligence', 16),
-- Black Helix Extraction (Quest 4)
(4, 'Make Contact', 8, 'Discreetly contact the informant near the Security Hub.', 'Charisma', 13),
(4, 'Create Diversion', 9, 'Cause a minor disruption in Logistics Bay 3 to draw security away.', 'Intelligence', 14),
(4, 'Escort Informant Out', 3, 'Lead the informant safely to the Dead Drop Zone exit.', 'Sneak', 15),
-- Chronos Corp Counter-Intel (Quest 5)
(5, 'Access Sales Database', 1, 'Hack into the Chronos sales database server.', 'Intelligence', 17),
(5, 'Plant False Leads', 1, 'Insert the fabricated sales figures and reports.', 'Intelligence', 14),
-- Aether Collective Data Heist (Quest 6)
(6, 'Infiltrate Server Farm', 1, 'Find a way into Server Farm Alpha.', 'Sneak', 16),
(6, 'Crack Data Encryption', 1, 'Decrypt the market analysis data files.', 'Intelligence', 18),
(6, 'Disable Surveillance', 1, 'Temporarily disable cameras covering your exit route.', 'Sneak', 15),
-- Syndicate's Missing Agent (Quest 7)
(7, 'Gather Local Intel', 2, 'Ask around the Whispering Gallery for any sightings or rumors.', 'Charisma', 14),
(7, 'Check Last Known Location', 7, 'Investigate the Archive Vault for clues left by the agent.', 'Intelligence', 13),
-- Secure the Server Room (Quest 8)
(8, 'Reinforce Door Lock', 1, 'Add a secondary lock mechanism to the server room door.', 'Strength', 12), -- Assuming Strength skill
(8, 'Monitor Access Panel', 1, 'Watch the electronic access panel for tampering attempts.', 'Intelligence', 14),
-- Audit Trail Anomaly (Quest 9)
(9, 'Analyze Log Files', 7, 'Examine the finance logs in the Archive Vault for inconsistencies.', 'Intelligence', 15),
(9, 'Interview Clerk', 2, 'Question the relevant finance clerk discreetly in the Canteen.', 'Charisma', 14),
-- Op Silent Whisper (Quest 10)
(10, 'Plant Listening Device', 5, 'Place a bug in Executive Suite Kilo.', 'Sneak', 17),
(10, 'Eavesdrop at Water Cooler', 2, 'Listen for relevant chatter near the Whispering Gallery.', 'Sneak', 13),
(10, 'Retrieve Device', 5, 'Recover the listening device without being noticed.', 'Sneak', 16);


-- =============================================
-- 6. Populate Character_Quest_Assignment Table
-- Assigning ~4 Characters per Quest randomly for this example
-- CharacterIDs assumed 1-30, QuestIDs 1-10
-- =============================================
INSERT INTO Character_Quest_Assignment (CharacterID, QuestID, Role, Status) VALUES
-- Quest 1: Op Nightingale (Characters: 1, 8, 12, 20)
(1, 1, 'Infiltrator', 'Assigned'), (8, 1, 'Analyst', 'Assigned'), (12, 1, 'Support', 'Assigned'), (20, 1, 'Saboteur', 'Assigned'),
-- Quest 2: Zurich Gambit (Characters: 5, 16, 21, 26)
(5, 2, 'Courier Hunter', 'Assigned'), (16, 2, 'Analyst', 'Assigned'), (21, 2, 'Muscle', 'Assigned'), (26, 2, 'Infiltrator', 'Assigned'),
-- Quest 3: Chimera Sabotage (Characters: 2, 13, 22, 28)
(2, 3, 'Infiltrator', 'Assigned'), (13, 3, 'Resource', 'Assigned'), (22, 3, 'Tech Specialist', 'Assigned'), (28, 3, 'Infiltrator', 'Assigned'),
-- Quest 4: Black Helix Extraction (Characters: 4, 10, 18, 29)
(4, 4, 'Face', 'Assigned'), (10, 4, 'Escort', 'Assigned'), (18, 4, 'Coordinator', 'Assigned'), (29, 4, 'Distraction', 'Assigned'),
-- Quest 5: Chronos Counter-Intel (Characters: 6, 15, 25, 30)
(6, 5, 'Hacker', 'Assigned'), (15, 5, 'Support', 'Assigned'), (25, 5, 'Misinformation', 'Assigned'), (30, 5, 'Hacker', 'Assigned'),
-- Quest 6: Aether Data Heist (Characters: 3, 14, 24, 27)
(3, 6, 'Info Broker', 'Assigned'), (14, 6, 'Infiltrator', 'Assigned'), (24, 6, 'Muscle', 'Assigned'), (27, 6, 'Muscle', 'Assigned'),
-- Quest 7: Missing Agent (Characters: 9, 11, 17, 19)
(9, 7, 'Tracker', 'Assigned'), (11, 7, 'Planner', 'Assigned'), (17, 7, 'Guardian', 'Assigned'), (19, 7, 'Recovery', 'Assigned'),
-- Quest 8: Secure Server Room (Characters: 7, 17, 23, 27) -- Re-using some security/muscle types
(7, 8, 'Defender', 'Assigned'), (17, 8, 'Defender', 'Assigned'), (23, 8, 'Psych Ops', 'Assigned'), (27, 8, 'Defender', 'Assigned'),
-- Quest 9: Audit Trail Anomaly (Characters: 8, 12, 21, 25) -- Re-using some intel/analysis types
(8, 9, 'Analyst', 'Assigned'), (12, 9, 'Investigator', 'Assigned'), (21, 9, 'Forensics', 'Assigned'), (25, 9, 'Interviewer', 'Assigned'),
-- Quest 10: Op Silent Whisper (Characters: 1, 9, 14, 28) -- Re-using some sneak types
(1, 10, 'Infiltrator', 'Assigned'), (9, 10, 'Surveillance', 'Assigned'), (14, 10, 'Infiltrator', 'Assigned'), (28, 10, 'Technician', 'Assigned');

-- =============================================
-- Sample Data Generation Complete
-- =============================================