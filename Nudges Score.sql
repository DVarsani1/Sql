CREATE TABLE day_scores (
    day INT PRIMARY KEY,
    score INT
);

-- Insert sample data
INSERT INTO day_scores (day, score) VALUES
(1, 100), (2, 150), (3, 200), (4, 250), (5, 300),
(6, 100), (7, 150), (8, 200), (9, 250), (10, 300),
(11, 100), (12, 150), (13, 200), (14, 250), (15, 300),
(16, 100), (17, 150), (18, 200), (19, 250), (20, 300),
(21, 100), (22, 150), (23, 200), (24, 250), (25, 300),
(26, 100), (27, 150), (28, 200), (29, 250), (30, 300),
(31, 100), (32, 150), (33, 200), (34, 250), (35, 300),
(36, 100), (37, 150), (38, 200), (39, 250), (40, 300),
(41, 100), (42, 150), (43, 200), (44, 250), (45, 300),
(46, 100), (47, 150), (48, 200), (49, 250), (50, 300),
(51, 100), (52, 150), (53, 200), (54, 250), (55, 300),
(56, 100), (57, 150), (58, 200), (59, 250), (60, 300);





WITH scores AS (
    SELECT 
        day,
        score
    FROM day_scores
)
SELECT
    day,
    CASE WHEN (day % 15) = 1 THEN score * 0.60 WHEN (day % 15) = 2 THEN score * 0.25 WHEN (day % 15) = 3 THEN score * 0.15 ELSE 0 END AS n1,
    CASE WHEN (day % 15) = 2 THEN score * 0.60 WHEN (day % 15) = 3 THEN score * 0.25 WHEN (day % 15) = 4 THEN score * 0.15 ELSE 0 END AS n2,
    CASE WHEN (day % 15) = 3 THEN score * 0.60 WHEN (day % 15) = 4 THEN score * 0.25 WHEN (day % 15) = 5 THEN score * 0.15 ELSE 0 END AS n3,
    CASE WHEN (day % 15) = 4 THEN score * 0.60 WHEN (day % 15) = 5 THEN score * 0.25 WHEN (day % 15) = 6 THEN score * 0.15 ELSE 0 END AS n4,
    CASE WHEN (day % 15) = 5 THEN score * 0.60 WHEN (day % 15) = 6 THEN score * 0.25 WHEN (day % 15) = 7 THEN score * 0.15 ELSE 0 END AS n5,
    CASE WHEN (day % 15) = 6 THEN score * 0.60 WHEN (day % 15) = 7 THEN score * 0.25 WHEN (day % 15) = 8 THEN score * 0.15 ELSE 0 END AS n6,
    CASE WHEN (day % 15) = 7 THEN score * 0.60 WHEN (day % 15) = 8 THEN score * 0.25 WHEN (day % 15) = 9 THEN score * 0.15 ELSE 0 END AS n7,
    CASE WHEN (day % 15) = 8 THEN score * 0.60 WHEN (day % 15) = 9 THEN score * 0.25 WHEN (day % 15) = 10 THEN score * 0.15 ELSE 0 END AS n8,
    CASE WHEN (day % 15) = 9 THEN score * 0.60 WHEN (day % 15) = 10 THEN score * 0.25 WHEN (day % 15) = 11 THEN score * 0.15 ELSE 0 END AS n9,
    CASE WHEN (day % 15) = 10 THEN score * 0.60 WHEN (day % 15) = 11 THEN score * 0.25 WHEN (day % 15) = 12 THEN score * 0.15 ELSE 0 END AS n10,
    CASE WHEN (day % 15) = 11 THEN score * 0.60 WHEN (day % 15) = 12 THEN score * 0.25 WHEN (day % 15) = 13 THEN score * 0.15 ELSE 0 END AS n11,
    CASE WHEN (day % 15) = 12 THEN score * 0.60 WHEN (day % 15) = 13 THEN score * 0.25 WHEN (day % 15) = 14 THEN score * 0.15 ELSE 0 END AS n12,
    CASE WHEN (day % 15) = 13 THEN score * 0.60 WHEN (day % 15) = 14 THEN score * 0.25 WHEN (day % 15) = 0 THEN score * 0.15 ELSE 0 END AS n13,
    CASE WHEN (day % 15) = 14 THEN score * 0.60  WHEN (day % 15) = 0 THEN score * 0.25 ELSE 0 END AS n14,
    CASE WHEN (day % 15) = 0 THEN score * 0.60 ELSE 0 End AS n15
FROM scores
ORDER BY day;