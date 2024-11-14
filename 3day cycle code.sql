-- Step 1: Create the original table (example, if it doesn't exist)
CREATE TABLE original_table (
    day INT,
    score INT
);

INSERT INTO original_table (day, score)
VALUES
    (1, 100), (2, 105), (3, 110), (4, 95), (5, 100), (6, 105), (7, 110),
    (8, 115), (9, 120), (10, 125), (11, 130), (12, 135), (13, 140), (14, 145),
    (15, 150), (16, 155), (17, 160), (18, 165), (19, 170), (20, 175), (21, 180),
    (22, 185), (23, 190), (24, 195), (25, 200), (26, 205), (27, 210), (28, 215),
    (29, 220), (30, 225), (31, 230), (32, 235), (33, 240), (34, 245), (35, 250);




WITH converted_scores AS (
    SELECT 
        day,
        (score)  AS score 
    FROM 
        original_table
),CTE AS (
    SELECT 
        day,
        score,
        (day % 15) AS mod_day,
        CASE 
            WHEN (day % 3) = 1 THEN score
            WHEN (day % 3) = 2 THEN score - LAG(score, 1) OVER (ORDER BY day)
            when (day % 3) = 0 then score - LAG(score, 1) OVER (ORDER BY day)
        END AS scored
    FROM converted_scores
)
SELECT
    day,
    CASE WHEN mod_day = 1 THEN scored * 0.60 WHEN mod_day = 2 THEN scored * 0.25 WHEN mod_day = 3 THEN scored * 0.15 ELSE 0 END AS n1,
    CASE WHEN mod_day = 2 THEN scored * 0.60 WHEN mod_day = 3 THEN scored * 0.25 WHEN mod_day = 4 THEN scored * 0.15 ELSE 0 END AS n2,
    CASE WHEN mod_day = 3 THEN scored * 0.60 WHEN mod_day = 4 THEN scored * 0.25 WHEN mod_day = 5 THEN scored * 0.15 ELSE 0 END AS n3,
    CASE WHEN mod_day = 4 THEN scored * 0.60 WHEN mod_day = 5 THEN scored * 0.25 WHEN mod_day = 6 THEN scored * 0.15 ELSE 0 END AS n4,
    CASE WHEN mod_day = 5 THEN scored * 0.60 WHEN mod_day = 6 THEN scored * 0.25 WHEN mod_day = 7 THEN scored * 0.15 ELSE 0 END AS n5,
    CASE WHEN mod_day = 6 THEN scored * 0.60 WHEN mod_day = 7 THEN scored * 0.25 WHEN mod_day = 8 THEN scored * 0.15 ELSE 0 END AS n6,
    CASE WHEN mod_day = 7 THEN scored * 0.60 WHEN mod_day = 8 THEN scored * 0.25 WHEN mod_day = 9 THEN scored * 0.15 ELSE 0 END AS n7,
    CASE WHEN mod_day = 8 THEN scored * 0.60 WHEN mod_day = 9 THEN scored * 0.25 WHEN mod_day = 10 THEN scored * 0.15 ELSE 0 END AS n8,
    CASE WHEN mod_day = 9 THEN scored * 0.60 WHEN mod_day = 10 THEN scored * 0.25 WHEN mod_day = 11 THEN scored * 0.15 ELSE 0 END AS n9,
    CASE WHEN mod_day = 10 THEN scored * 0.60 WHEN mod_day = 11 THEN scored * 0.25 WHEN mod_day = 12 THEN scored * 0.15 ELSE 0 END AS n10,
    CASE WHEN mod_day = 11 THEN scored * 0.60 WHEN mod_day = 12 THEN scored * 0.25 WHEN mod_day = 13 THEN scored * 0.15 ELSE 0 END AS n11,
    CASE WHEN mod_day = 12 THEN scored * 0.60 WHEN mod_day = 13 THEN scored * 0.25 WHEN mod_day = 14 THEN scored * 0.15 ELSE 0 END AS n12,
    CASE WHEN mod_day = 13 THEN scored * 0.60 WHEN mod_day = 14 THEN scored * 0.25 WHEN mod_day = 0 THEN scored * 0.15 ELSE 0 END AS n13,
    CASE WHEN mod_day = 14 THEN scored * 0.60 WHEN mod_day = 0 THEN scored * 0.25 ELSE 0 END AS n14,
    CASE WHEN mod_day = 0 THEN scored * 0.60 ELSE 0 END AS n15
FROM CTE
ORDER BY day;

