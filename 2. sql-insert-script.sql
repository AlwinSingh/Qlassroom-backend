-- This is a test script to validate if gamification database design works

DELETE FROM gamification_student_points;
DELETE FROM gamification_student_badges;
DELETE FROM gamification_students;
DELETE FROM gamification_badges;

INSERT INTO gamification_students(student_id,grade_id,profile_img_url,student_name,grade_name)
VALUES
(1,12345,'http://niceimage.com','Alwin','Secondary 4'),
(2,12345,'http://niceimage.com','Kester','Secondary 4'),
(3,12345,'http://niceimage.com','Jason','Secondary 4'),
(4,12345,'http://niceimage.com','Cleavon','Secondary 4'),
(5,12345,'http://niceimage.com','Abraham','Secondary 4');

INSERT INTO gamification_badges(badge_id,badge_name,badge_desc,badge_img_url,badge_required_points)
VALUES
(1,'Begineer Badge','This is a description','http://nicebadgeimage.com',20),
(2,'Tier 1 Badge','This is a description','http://nicebadgeimage.com',40),
(3,'Tier 2 Badge',NULL,'http://nicebadgeimage.com',60),
(4,'Tier 3 Badge',NULL,'http://nicebadgeimage.com',80),
(5,'Tier 4 Badge','This is a description','http://nicebadgeimage.com',100);


INSERT INTO gamification_student_points(student_id,points)
VALUES
(1,5),
(2,55),
(3,140),
(4,20),
(5,90);

INSERT INTO gamification_student_badges(student_id,badge_id)
VALUES
(2,1),
(2,2),
(3,1),
(3,2),
(3,3),
(3,4),
(4,1),
(5,1),
(5,2),
(5,3);