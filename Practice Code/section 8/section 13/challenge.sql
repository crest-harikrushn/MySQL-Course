-- ! Schemas
create table students (id int primary key auto_increment, 
first_name VARCHAR(200))

create table papers (id int primary key AUTO_INCREMENT,
student_id int,
title VARCHAR(200),
grade int,
FOREIGN KEY(student_id) references students(id) ON DELETE CASCADE);


-- ! DATA
INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

-- ?===========================================================================


-- ? ch1
SELECT first_name, title, grade from students 
inner join papers on students.id = papers.student_id;

-- ? ch2
-- * 1) Using LEFT JOIN
SELECT first_name, title, grade from students 
left join papers on students.id = papers.student_id;

-- * 2) Using RIGHT JOIN
SELECT first_name, title, grade from papers 
RIGHT join students on students.id = papers.student_id;

-- ? ch3
-- * 1) Using LEFT JOIN
SELECT first_name, IFNULL(title, 'MISSING'), IFNULL(grade, 0) from students 
LEFT join papers on students.id = papers.student_id;

-- * 2) Using RIGHT JOIN
SELECT first_name, IFNULL(title, 'MISSING'), IFNULL(grade, 0) from papers 
RIGHT join students on students.id = papers.student_id;

-- ? ch4
-- * 1) Using LEFT JOIN
SELECT first_name, IFNULL(AVG(grade), 0) AS average FROM students 
left join papers on students.id = papers.student_id
GROUP BY first_name
ORDER BY average DESC;

-- * 2) Using RIGHT JOIN
SELECT first_name, IFNULL(AVG(grade), 0) AS average FROM papers
RIGHT join students on students.id = papers.student_id
GROUP BY first_name
ORDER BY average DESC;

-- ? CH5
SELECT 
    first_name, 
    IFNULL(AVG(grade), 0) AS average, 
    CASE 
        WHEN IFNULL(AVG(grade), 0) >= 75 THEN 'PASSING'
        ELSE 'FAILING'
    END AS passing_status 
FROM students 
left join papers on students.id = papers.student_id
GROUP BY first_name
ORDER BY average DESC;


