**Design Document: Project Æsir (AI-Enhanced Strategic Interaction RPG)**
*(Updated: Incorporating Email, Locations, Skill Checks)*

**1. Introduction & Goals**

* **Concept:** Project Æsir is an AI-driven system designed to manage and enhance a large-scale LARP (Live Action Role-Playing) event, specifically tailored for corporate settings like Implement's "August Adventure."
* **Core Innovation:** Utilize AI to generate dynamic, progressive storylines and character interactions delivered primarily via **Email**, while providing organizers (Game Masters/GMs) with a dedicated app for monitoring and control. The game integrates real-world **Locations** and uses **DnD-style skill checks** for resolving challenges.
* **Primary Goals:**
    * **Strategic Networking:** Move beyond random encounters to facilitate meaningful interactions between specific employee segments (cross-departmental, cross-office, varying tenure) based on organizational data, aiming to strengthen the internal network.
    * **Enhanced Engagement:** Provide a unique, immersive, and fun experience for participants through personalized quests, evolving narratives, location-based objectives, and familiar RPG mechanics (skill checks).
    * **Organizer Efficiency:** Streamline event management for GMs with real-time monitoring, intervention capabilities, automated content generation, and location management tools.
    * **Culture Building:** Reinforce company values and cohesiveness through collaborative problem-solving within the game's narrative framework.
* **Character Philosophy:** Participants are assigned **fair and balanced characters** with distinct skills and roles, encouraging diverse approaches to problem-solving independent of real-world positions.

**2. System Architecture Overview**

* **Backend Server:** The central hub housing the database, game logic, AI engine integration, and business logic.
* **AI Engine:** Responsible for character generation (balanced archetypes/skills), story/quest generation (incorporating locations), narrative progression, suggesting skill check difficulties (DCs), and potentially analysing player interactions to adapt the game state.
* **Database:** Stores user data (anonymized/aliased where appropriate), character profiles (including defined skills/modifiers), quest details, location data, game state, event logs, org data links.
* **Email Service Provider (ESP) Integration:** Manages sending potentially high volumes of formatted emails (HTML possible) to participants and processing incoming replies for game actions. Requires robust deliverability and reply parsing.
* **GM Control App:** A web or native application accessible only to organizers, providing dashboards, monitoring tools, content editing (including locations and quest DCs), and intervention capabilities.

**3. User Experience (Participant - via Email)**

* **Onboarding:** Participants receive initial emails introducing their character (name, archetype, balanced skills/stats), the game world premise, faction alignment (if any), and their starting situation/objective, often tied to a location.
    * *Example Email Subject:* Welcome Agent [Character Name] - Your Mission Brief!
    * *Example Email Body:* "Greetings Agent [Character Name]. You are [Character Archetype, e.g., 'The Infiltrator'] known for your [mention key skill, e.g., Stealth +3]. Faction [Faction Name] needs you. Your first mission: Retrieve the stolen data schematics hidden at the **'Old Pump House'** [Real Location Name]. Intel suggests heavy surveillance. Proceed with caution."
* **Gameplay Loop:**
    * Receive quests/objectives via email, often directing them to physical **Locations**.
    * Travel to the specified real-world location.
    * Interact with other players in person based on email instructions.
    * Perform actions or report arrival/findings by replying to specific emails (e.g., replying with subject 'ARRIVED PUMP HOUSE' or 'SCHEMATICS RETRIEVED').
    * Engage in **Skill Checks**: Receive an email detailing a challenge. Reply to attempt the check.
        * *Example Challenge Email:* "Subject: Security Alert! | You encounter a laser grid blocking the archive room! Disabling it requires a Tech Skill Check (DC 15). Your Tech Skill modifier is +4. Reply with 'ATTEMPT TECH' to try and bypass it."
        * *Example Outcome Email (Success):* "Subject: RE: Security Alert! | Result: Success! Your roll: 18 (14 on d20 + 4 Mod) vs DC 15. The laser grid deactivates!"
        * *Example Outcome Email (Failure):* "Subject: RE: Security Alert! | Result: Failure! Your roll: 9 (5 on d20 + 4 Mod) vs DC 15. The grid remains active, and an alarm notifies nearby guards!"
    * Receive updates, new quests, or consequences based on their actions (or inaction) via email.
* **Interaction:** Clear instructions in emails. Replies likely parsed based on keywords in the subject line or simple body content to trigger game state changes.

**4. Game Master Experience (Organiser App)**

* **Dashboard:** Real-time overview: Quest progress, player engagement, skill check success/failure rates, player distribution across **Locations** (if check-ins are used), flagged issues.
* **Participant Monitoring:** Search/filter participants; view profiles (Character details including **skills/modifiers**, current objective, quest history, recent email logs, current reported **Location**).
* **Content Management:**
    * **Location Manager:** Create, edit, delete game locations, mapping them to real-world places (Name, Description, potentially hints/lore).
    * **Character Overview:** View all generated characters, archetypes, and their skill distributions to ensure balance.
    * **Quest Editor:** View/Edit AI-generated quests; Create manual quests. **Crucially:** Assign quests to **Locations**, define **Skill Checks** required (Skill type, Difficulty Class - DC), edit text, triggers, rewards. Assign quests manually.
* **Intervention & Communication Tools:** Manually advance quests, grant items/info, adjust player skill points (rarely, for fixing errors), resolve issues. Broadcast emails (via ESP proxy) to groups (by location, quest, faction, org data) or individuals.

**5. AI Engine Details**

* **Character Generation:**
    * AI assigns archetypes and distributes skill points using a defined balancing system (e.g., point-buy, standardized arrays) to ensure **fairness**. Archetypes offer different specializations but comparable overall potential. *Avoids* direct correlation between real-world role and character power.
    * Generates initial goals requiring interaction and potentially travel to specific **Locations**.
* **Story & Quest Generation:**
    * AI weaves narratives incorporating the GMs' defined theme, factions, and **Locations**.
    * **Intelligent Mixing Algorithm:** Uses org data (Dept, Team, Office, Tenure) and GM-defined rules to generate interaction quests, now potentially directing people to meet at specific **Locations**. (e.g., "Find Character X, known to frequent the 'Trading Post' [Location], they have information vital for your cross-departmental task.")
    * Suggests appropriate **Skill Check DCs** based on quest difficulty or context, which GMs can review/override.
* **Progression & Adaptability:** Monitors email replies to track progress. AI can adapt the story based on overall player success/failure rates on key quests or skill checks, potentially triggering contingency quests or shifting narrative focus. Flags unresponsive players or bottlenecks at locations/quests for GM attention.

**6. Data Model (Simplified Additions/Changes)**

* **Users:** UserID, RealName, EmailAddress, Department, Team, Office, Tenure, Age, Gender.
* **Characters:** CharacterID, UserID (link), CharacterName, Archetype, Faction, **Skills** (e.g., `Skill_Stealth: 3`, `Skill_Charm: 2`, `Skill_Tech: 4`, `Skill_Lore: 1` - representing modifiers), Inventory, CurrentQuestID, CurrentLocationID (optional, if tracking check-ins), Status.
* **Quests:** QuestID, Title, Description (Email Body), Type, TriggerCondition, Objectives (list: e.g., 'Reply Subject=ARRIVED X', 'Reply Subject=ATTEMPT SKILL Y'), **RequiredLocationID** (link, optional), **SkillCheck_Type** (e.g., 'Tech', 'Persuasion'), **SkillCheck_DC** (integer), SuccessOutcome, FailOutcome, AssociatedCharacters/Groups, IsManualOverride.
* **Locations:** LocationID, Name, RealWorldDescription, GMNotes (e.g., 'Main Hall near Cafeteria'), MapCoordinates (optional).
* **EmailLog:** MessageID, UserID, Direction (In/Out), Timestamp, Subject, Body, Status (Sent/Failed/Received/Parsed/Error).

**7. Core Mechanics**

* **Email Interaction:** Primary interface using formatted emails and keyword-based replies.
* **Location-Based Objectives:** Quests explicitly tied to physical, predefined locations, requiring players to move around the event space.
* **d20 Skill Check Resolution:** Abstract challenges resolved via virtual d20 roll + character skill modifier vs. DC, managed by the backend and communicated via email.
* **Intelligent Mixing:** AI-driven quest generation targeting specific interaction patterns using org data and locations.
* **Character Balancing:** System ensures assigned characters have comparable overall effectiveness.
* **GM Override:** GMs retain full control via the dedicated app.

**8. Technical Considerations**

* **Email Service Provider (ESP):** High deliverability is critical (avoiding spam filters). Need robust parsing of incoming email replies (subject line keywords likely most reliable). Consider rate limits.
* **Scalability:** Backend must handle potentially bursty email processing and game logic for 1000+ users.
* **Reliability:** High uptime essential. Plan for potential email delays.
* **AI Model:** Needs capability for balanced character generation, narrative text generation incorporating locations/skills, and potentially DC suggestion.
* **Data Privacy:** Secure handling of user data and email addresses.

**9. Open Questions & Future Considerations**

* How robust does email parsing need to be? Just subjects, or simple body keywords too?
* Player feedback mechanism if an email instruction is unclear or they get physically stuck? (Dedicated support email? GM intervention?)
* How to physically signpost the in-game **Locations** in the real world? (Simple signs? Themed props?)
* Contingency for participants with poor mobile email access during the event?
* Potential for simple web-link "check-ins" in emails instead of reply parsing for location arrival?