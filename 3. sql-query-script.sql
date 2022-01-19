-- [SELECT CASES]
-- SELECT * FROM gamification_students; -- This stores the list of students
-- SELECT * FROM gamification_badges; -- This stores the list of badges + its requirements
-- SELECT * FROM gamification_points; -- This stores the points of the students
-- SELECT * FROM gamification_student_badges; -- This stores the badges of the students

-- Use Case: Get unlocked badges within score range by user
SELECT * FROM gamification_badges AS parent_g_badges where badge_id NOT IN (
SELECT DISTINCT g_badges.badge_id FROM gamification_student_points AS g_student_points
INNER JOIN gamification_students AS g_students ON g_student_points.student_id = g_students.student_id
INNER JOIN gamification_student_badges AS g_student_badges ON g_student_badges.student_id <= g_students.student_id
INNER JOIN gamification_badges AS g_badges ON
g_badges.badge_id = g_student_badges.badge_id
WHERE g_students.student_id=3);

-- Use Case: Get user data by user
SELECT g_students.student_id,student_name,points,
g_badges.badge_id,badge_name,badge_img_url,badge_required_points,
badge_requirement_type,badge_achieved,profile_img_url,grade_id,grade_name
FROM gamification_students AS g_students
INNER JOIN gamification_student_points AS g_student_points ON g_students.student_id = g_student_points.student_id
INNER JOIN gamification_student_badges AS g_student_badges ON g_student_badges.student_id = g_student_points.student_id
INNER JOIN gamification_badges AS g_badges ON g_badges.badge_id = g_student_badges.badge_id
WHERE g_students.student_id = 2;

-- Use Case: Get scoreboard
SELECT DISTINCT g_students.student_id,student_name,profile_img_url,points FROM gamification_students AS g_students
INNER JOIN gamification_student_points AS g_student_points ON g_students.student_id = g_student_points.student_id
ORDER BY points DESC,student_name ASC;

-- Use Case: Get All Badges
SELECT g_badges.badge_id,g_badges.badge_name,g_badges.badge_desc,
g_badges.badge_img_url,g_badges.badge_required_points,g_badges.badge_requirement_type 
FROM gamification_badges AS g_badges;

-- Use Case: Update User Points
UPDATE gamification_student_points SET points = 10 WHERE student_id=1;

-- Use Case: Update User
UPDATE gamification_students SET
grade_id = 12345,
profile_img_url = 'http://niceimagenew.com',
student_name = 'Alwin Singh',
grade_name = 'Secondary 5',
updated_at = NOW();