package main

import(

)

type User struct{
	
	ID string
	Passphrase string

	Date_of_Change_Date int
	Date_of_Change_Month int 
	Date_of_Change_Year int

}

type SmallUser struct{

	Username string 
	Password string

}


type Assignment struct{

	Assignment_ID string
	Assignment_Name string 
	Batch string 
	Teacher_ID string 
	Credits_Alloted int 
	Creation_Date int
	Creation_Month int
	Creation_Year int
	Deadline_Date string
	Course_ID string 
}


// type Batch struct{

// 	Batch string
// 	Years int
// 	Strength int

// }

// type Course struct{

// 	Course_ID string
// 	Course_Name string
// 	Department string
// 	Total_Credits int

// }

// type Department struct{

// 	Department string
// 	Head_Of_Department string

// }

// type Grading struct{

// 	Student_ID string
// 	Assignment_ID string
// 	Credits_Obtained int
// 	Plagiarism_Measure float

// }

// type Student_Timeline struct{

// 	Student_ID string
// 	Assignment_ID string
// 	Submission_Status int
// 	Review_Status int

// }

// type Submissions struct{

// 	Student_ID string
// 	Assignment_ID string
	
// 	Date_of_Submission_Date int
// 	Date_of_Submission_Month int 
// 	Date_of_Submission_Year int

// }

type Student struct{

	Student_ID string
	Name string 
	Batch string 

	Date_of_Birth_Date int
	Date_of_Birth_Month int 
	Date_of_Birth_Year int

	Date_of_Joining_Date int
	Date_of_Joining_Month int
	Date_of_Joining_Year int

	Date_of_Pass_Out_Date int
	Date_of_Pass_Out_Month int
	Date_of_Pass_Out_Year int

	Email string
}

type SmallStudent struct{

	Student_ID string
	Name string 
	Batch string 

}


type Teacher struct{

	Teacher_ID string
	Name string 
	Department string 

	Date_of_Transfer_Date int
	Date_of_Transfer_Month int 
	Date_of_Transfer_Year int

	Date_of_Joining_Date int
	Date_of_Joining_Month int
	Date_of_Joining_Year int

	Email string
}

type SmallTeacher struct{

	Teacher_ID string
	Name string 
	Department string 

}



type DashboardObject struct{

	 Current SmallStudent

	 Assignments []Assignment

}


type TDashboardObject struct{

	 Current string

	 Assignments []Assignment

}


type Message struct{

	ID string
	Msg string

}


type AssignmentPage struct{

	Current string

	Assignment Assignment
}


type AssignmentTPage struct{

	Current string

	Assignment Assignment

	Submited []SubStudent
}



type SubStudent struct{

	RollNumber string

}

