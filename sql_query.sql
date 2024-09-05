-- (To understand it better, I tried two methods: using join clause and with no join clause. I did the without join clause first since I find trouble understanding it to this day)

-- Number 1 --
--WITH JOIN --
SELECT 
    	fac.first_name AS Faculty_FirstName,
    	fac.last_name AS Faculty_LastName,
    	sub.available_subject_name AS Subject_Teaching,
    	cla.day AS Class_Day,
    	cla.time_start AS Class_Start,
    	cla.time_end AS Class_End,
    	sy.year_start AS Year_Start,
    	sy.year_end AS Year_End,
    	sem.semester AS Semester
FROM
    	Faculty fac
    	JOIN Classes cla ON fac.faculty_id = cla.faculty_id
    	JOIN Available_subjects sub ON cla.available_subject_id = sub.available_subject_id
    	JOIN School_years sy ON sub.school_year_id = sy.school_year_id
    	JOIN Semesters sem ON sub.semester_id = sem.semester_id;


--WITHOUT JOIN --
SELECT 
	fac.first_name AS Faculty_FirstName,
	fac.last_name AS Faculty_LastName,
	sub.available_subject_name AS Subject_Teaching,
	cla.day AS Class_Day,
	cla.time_start AS Class_Start,
	cla.time_end AS Class_End,
	sy.year_start AS Year_Start,
	sy.year_end AS Year_End,
	sem.semester AS Semester
FROM
	Faculty fac,
	Available_subjects sub,
	Classes cla,
	School_years sy,
	Semesters sem
WHERE
	fac.faculty_id = cla.faculty_id 
	AND cla.available_subject_id = sub.available_subject_id
	AND sub.school_year_id = sy.school_year_id
	AND sub.semester_id = sem.semester_id;

-- Number 2 --
--WITH JOIN --
SELECT 
    	fac.first_name AS Faculty_FirstName,
    	fac.last_name AS Faculty_LastName,
    	sub.available_subject_name AS Subject_Teaching,
    	cla.day AS Class_Day,
   	 cla.time_start AS Class_Start,
    	cla.time_end AS Class_End,
   	 ro.room_number AS Room_Number,
    	sem.semester AS Semester
FROM Faculty fac
    	JOIN Classes cla ON fac.faculty_id = cla.faculty_id
    	JOIN Available_subjects sub ON cla.available_subject_id = sub.available_subject_id
    	JOIN Rooms ro ON cla.room_id = ro.room_id
    	JOIN School_years sy ON sub.school_year_id = sy.school_year_id
    	JOIN Semesters sem ON sub.semester_id = sem.semester_id
WHERE
    	sy.year_start = 2019
    	AND sy.year_end = 2020
    	AND sem.semester = 1;
   

--WITHOUT JOIN --

SELECT 
	fac.first_name AS Faculty_FirstName,
	fac.last_name AS Faculty_LastName,
	sub.available_subject_name AS Subject_Teaching,
	cla.day AS Class_Day,
	cla.time_start AS Class_Start,
	cla.time_end AS Class_End,
	ro.room_number AS Room_Number,
	sem.semester AS Semester
FROM
	Faculty fac,
	Available_subjects sub,
	Classes cla,
	School_years sy,
    	Rooms ro,
	Semesters sem
WHERE
	fac.faculty_id = cla.faculty_id 
	AND cla.available_subject_id = sub.available_subject_id
	AND cla.room_id = ro.room_id
	AND sub.school_year_id = sy.school_year_id
	AND sub.semester_id = sem.semester_id
	AND sy.year_start = 2019
	AND sy.year_end = 2020
	AND sem.semester = 1;

-- Number 3 -- 
-- WITH JOIN --

SELECT 
    	stu.first_name AS Student_FirstName,
    	stu.last_name AS Student_LastName,
    	sub.available_subject_name AS Subject_Taken,
    	gra.grade AS Student_Grade,
    	sem.semester AS Semester
FROM
    	Students stu
    	JOIN Enrolled_subjects enr ON stu.student_id = enr.student_id
    	JOIN Classes cla ON enr.class_id = cla.class_id
    	JOIN Available_subjects sub ON cla.available_subject_id = sub.available_subject_id
    	JOIN Grades gra ON enr.class_id = gra.class_id
    	JOIN School_years sy ON sub.school_year_id = sy.school_year_id
    	JOIN Semesters sem ON sub.semester_id = sem.semester_id
WHERE
    	sy.year_start = 2019
    	AND sy.year_end = 2020
    	AND sem.semester = 1
    	AND stu.student_id = 2;

--WITHOUT JOIN --

SELECT 
	stu.first_name AS Student_FirstName,
	stu.last_name AS Student_LastName,
	sub.available_subject_name AS Subject_Taken,
	gra.grade AS Student_Grade,
	sem.semester AS Semester
FROM
	Available_subjects sub,
	Classes cla,
	School_years sy,
    	Enrolled_subjects enr,
    	Grades gra,
    	Students stu,
	Semesters sem
WHERE
	stu.student_id = enr.student_id 
    	AND enr.class_id = cla.class_id
    	AND enr.class_id = gra.class_id
	AND cla.available_subject_id = sub.available_subject_id
	AND sub.school_year_id = sy.school_year_id
	AND sub.semester_id = sem.semester_id
   	AND sy.year_start = 2019
    	AND sy.year_end = 2020
    	AND sem.semester = 1
    	AND stu.student_id = 2;

-- Number 4 --
-- WITH JOIN --
SELECT 
    	ro.room_number AS Room_Number,
    	COUNT(cla.class_id) AS Number_of_Classes
FROM
    	Rooms ro
    	JOIN Classes cla ON ro.room_id = cla.room_id
    	JOIN Available_subjects sub ON cla.available_subject_id = sub.available_subject_id
    	JOIN School_years sy ON sub.school_year_id = sy.school_year_id
    	JOIN Semesters sem ON sub.semester_id = sem.semester_id
WHERE
    	sy.year_start = 2019
    	AND sy.year_end = 2020
    	AND sem.semester = 2
GROUP BY ro.room_number
ORDER BY ro.room_number ASC;

-- WITHOUT JOIN --
SELECT 
	ro.room_number AS Room_Number,
	COUNT(cla.class_id) AS Number_of_Classes
FROM
	Rooms ro,
	Available_subjects sub,
	Classes cla,
	School_years sy,
	Semesters sem
WHERE
	cla.room_id = ro.room_id 
	AND cla.available_subject_id = sub.available_subject_id
	AND sub.school_year_id = sy.school_year_id
	AND sub.semester_id = sem.semester_id
   	AND sy.year_start = 2019
    	AND sy.year_end = 2020
    	AND sem.semester = 2
GROUP BY ro.room_number
ORDER BY ro.room_number ASC;
