-- SCHEMA: gamification

DROP SCHEMA IF EXISTS gamification;
CREATE SCHEMA IF NOT EXISTS gamification;

DROP TABLE IF EXISTS gamification_student_points,gamification_student_badges;
DROP TABLE IF EXISTS gamification_students,gamification_badges;

-- AUTHORIZATION sapgroup2;

CREATE TABLE gamification_students (
    student_id INTEGER,
	student_name VARCHAR(255) NOT NULL,
	grade_id INTEGER NOT NULL,
	grade_name VARCHAR(255) NOT NULL,
	profile_img_url VARCHAR(255),
    updated_at TIMESTAMP DEFAULT NOW(),
	created_at TIMESTAMP DEFAULT NOW(),
	PRIMARY KEY(student_id)
);

CREATE TABLE gamification_student_points (
    student_id INTEGER NOT NULL UNIQUE,
	points INTEGER NOT NULL DEFAULT 0,
    updated_at TIMESTAMP DEFAULT NOW(),
	CONSTRAINT fk_gamification_student
      FOREIGN KEY(student_id) 
	  REFERENCES gamification_students(student_id)
);

CREATE TABLE gamification_badges (
	badge_id INTEGER,
	badge_name VARCHAR(255) NOT NULL,
	badge_desc VARCHAR(255),
	badge_img_url VARCHAR(255) NOT NULL,
	badge_required_points INTEGER DEFAULT NULL,
	badge_required_worksheets INTEGER DEFAULT NULL,
	badge_requirement_type VARCHAR(255) NOT NULL DEFAULT 'points',
	PRIMARY KEY(badge_id)
);

CREATE TABLE gamification_student_badges (
	student_id INTEGER NOT NULL,
	badge_id INTEGER NOT NULL DEFAULT 0,
	badge_achieved BOOLEAN DEFAULT TRUE,
	updated_at TIMESTAMP DEFAULT NOW(),
	CONSTRAINT fk_link_student
      FOREIGN KEY(student_id)
	  REFERENCES gamification_students(student_id),
	
	CONSTRAINT fk_link_badge
      FOREIGN KEY(badge_id) 
	  REFERENCES gamification_badges(badge_id),
	UNIQUE(student_id,badge_id)
);