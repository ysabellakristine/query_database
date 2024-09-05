-- Number 1 --

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

