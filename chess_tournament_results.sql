-- Step 1: Create the Table
DROP TABLE IF EXISTS ChessTournament;
CREATE TABLE ChessTournament (
    Final_Rank INTEGER PRIMARY KEY,
    Player TEXT NOT NULL,
    State TEXT NOT NULL,
    Total_Points FLOAT NOT NULL,
    Pre_Rating INTEGER NOT NULL,
    Avg_Opponent_Pre_Rating FLOAT NOT NULL
);


-- Step 2: Load CSV into Table 
DESC ChessTournament;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/chess_tournament_results.csv' 
INTO TABLE ChessTournament 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
SELECT COUNT(*) FROM ChessTournament;


SELECT * FROM ChessTournament LIMIT 10;

SELECT Player, Pre_Rating 
FROM ChessTournament 
ORDER BY Pre_Rating DESC 
LIMIT 1;





