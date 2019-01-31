package main

import(
	"fmt"
	"httprouter"
	"net/http"
	"html/template"
	"log"
	"os"
	"io"
	//"strconv"
	"time"
	"strings"
	"database/sql"
	_ "github.com/go-sql-driver/mysql"

)



func Home(w http.ResponseWriter , r *http.Request , _ httprouter.Params){



	t,err:= template.ParseFiles("index.html")
	if(err != nil){
	fmt.Println("Error Getting template :",err)
	} else{
	t.Execute(w,nil)
	}
	// } else{

	// 	http.Redirect(w, r, "/loged", 302)


	// }
}	


func Login(w http.ResponseWriter , r *http.Request , _ httprouter.Params){

	
		uname := r.FormValue("username")
		pword := r.FormValue("password")

		r.ParseForm()
 		tempusertype := r.Form["usertype"]

 		usertype := strings.Join(tempusertype,"")


		// UniqueIP , err := getIP(r)

		lookfor := SmallUser{

			Username : uname,
			Password : pword,

		}

		user_exists := Validate(lookfor,usertype)


		if ( user_exists ){

			// UniqueIP := r.RemoteAddr

			// UIP := UniqueIP[:6]

		
			// var Insert_This customSessions.Session

			// Insert_This.Username = uname

			// Insert_This.UniqueIP = UIP

			// errr := customSessions.PutSession(db_sessions,DB_Sessions,Col_Sessions,Insert_This)

			// if(errr!= nil){
			// 	fmt.Println("err found.. lol")
			// }

				

			if(usertype == "1"){


				smallstudent:= GetStudentData(uname)

				allAssignments := getAssignments(smallstudent.Batch)
				
				t,err:= template.ParseFiles("dashboard.html")
			
				riperr(err)

				dashboardObj := DashboardObject{
					Current : smallstudent,
					Assignments : allAssignments,
				}

				//fmt.Println(allAssignments)

				t.Execute(w,dashboardObj)

				// session.Close()
				// output := uname+pword+" Successful "

				// w.Write([]byte(output))

			} else if( usertype=="2"){

					// t,err:= template.ParseFiles("controlboard.html")
			
					// riperr(err)

					// t.Execute(w,lookfor)
					
					 http.Redirect(w, r, "/created/"+uname, 301)
			}

		} else{

				t,err:= template.ParseFiles("message.html")
		
				riperr(err)


				m := Message{
					ID : "",
					Msg: "Login Unsuccessful for "+uname+" , "+pword,
				}

				t.Execute(w,m)

		}

}





func Validate(User SmallUser,Usertype string) (bool){

	// session := customSessions.CreateSession(DB_Url)

	// found , err := Find_User(DB_Name,Collection_Name,session,"Username",User.Username)	

	// riperr(err)

	db, err := sql.Open("mysql", "assignroot:assign123@(166.62.10.53:3306)/assigndb")
    if err != nil {
        panic(err.Error())  // Just for example purpose. You should use proper error handling instead of panic
    }
    defer db.Close()

   
     rows, err := db.Query("SELECT ID,Passphrase FROM User")
    checkErr(err)

    for rows.Next() {
      
        var username string
        var password string
      
        err = rows.Scan(&username,&password)
        
        checkErr(err)
        
        if (username == User.Username) {
        	fmt.Println("Found");
        	if (password == User.Password) {
        		
        		
        		if (Usertype=="1") {
        				

     				rows, errr := db.Query("SELECT Student_ID FROM Student")
    				checkErr(errr)

    				for rows.Next() {
      
        				var student_id string
        				
        				err = rows.Scan(&student_id)
        
        				checkErr(err)

        				if student_id==User.Username {
        					fmt.Println("Authenticated")
        					return true		
        				}

        			}
        			
        		} else if(Usertype=="2"){

        			rows, errr := db.Query("SELECT Teacher_ID FROM Teacher")
    				checkErr(errr)

    				for rows.Next() {
      
        				var teacher_id string
        				
        				err = rows.Scan(&teacher_id)
        
        				checkErr(err)

        				if teacher_id==User.Username {
        					fmt.Println("Authenticated")
        					return true		
        				}

        			}
        		}

        		
        	}
        }

    }

	// if( found.Username == "" ){

	// 	return false,""

	// } else{

	// 	if( found.Password == User.Password ){

	// 		return true,found.UserType[0]
		
	// 	} else{

	// 		return false,""
	// 	}


	// }
 
    return false

}

func GetStudentData(uname string ) (SmallStudent){

	var name,batch string

	db, err := sql.Open("mysql", "assignroot:assign123@(166.62.10.53:3306)/assigndb")
    if err != nil {
        panic(err.Error())  // Just for example purpose. You should use proper error handling instead of panic
    }
    defer db.Close()


    getstudent, errr := db.Prepare("SELECT Name,Batch FROM Student Where Student_ID= ?")
    
    defer getstudent.Close()

    checkErr(errr)

    
    err = getstudent.QueryRow(uname).Scan(&name,&batch) // WHERE number = 13
    if err != nil {
        panic(err.Error())
    }

    thisStudent := SmallStudent{
			Name : name,
			Student_ID : uname, 
			Batch :batch,
			}	
	


    return thisStudent
}

func GetTeacherData(uname string ) (SmallTeacher){

	var name,department string

	db, err := sql.Open("mysql", "assignroot:assign123@(166.62.10.53:3306)/assigndb")
    if err != nil {
        panic(err.Error())  // Just for example purpose. You should use proper error handling instead of panic
    }
    defer db.Close()


    getstudent, errr := db.Prepare("SELECT Name,Department FROM Teacher Where Teacher_ID= ?")
    
    defer getstudent.Close()

    checkErr(errr)

    
    err = getstudent.QueryRow(uname).Scan(&name,&department) 
    if err != nil {
        panic(err.Error())
    }

    thisStudent := SmallTeacher{
			Name : name,
			Teacher_ID : uname, 
			Department :department,
			}	
	


    return thisStudent
}


func getUAssignments(Batch string ,Student_ID string)([]Assignment){

	db, err := sql.Open("mysql", "assignroot:assign123@(166.62.10.53:3306)/assigndb")
			    if err != nil {
			        panic(err.Error())  // Just for example purpose. You should use proper error handling instead of panic
			    }
			    defer db.Close()

	var Assignment_IDv,Assignment_Namev,Teacher_IDv,Course_IDv,Batchv string
			 	var Deadline_Datev string
			 	var Credits_Allotedv int


			 	allAssignments := []Assignment{}

			 	 rows, err := db.Query("SELECT Assignment_ID,Assignment_Name,Teacher_ID,Credits_Alloted,DATE(Deadline_DateTime),Course_ID,Batch FROM Assignment where Assignment_ID not in (Select Assignment_ID from Submissions s where s.Student_ID=?) order by Deadline_DateTime",Student_ID)
			    checkErr(err)

			    for rows.Next() {
			      			      
			        err = rows.Scan(&Assignment_IDv,&Assignment_Namev,&Teacher_IDv,&Credits_Allotedv,&Deadline_Datev,&Course_IDv,&Batchv)
			        


			        checkErr(err)
			        
			        if (Batchv==Batch) {
			        	assg := Assignment{
			        			Assignment_ID : Assignment_IDv,
								Assignment_Name  : Assignment_Namev,
								Batch :Batchv ,
								Teacher_ID  : Teacher_IDv,
								Credits_Alloted  : Credits_Allotedv,
								Deadline_Date :Deadline_Datev,
								Course_ID : Course_IDv, 
							}	

			        	allAssignments= AddItem(allAssignments, assg) 
			        }
			    }

	return allAssignments


}

func getAssignments(Batch string) ([]Assignment){

	db, err := sql.Open("mysql", "assignroot:assign123@(166.62.10.53:3306)/assigndb")
			    if err != nil {
			        panic(err.Error())  // Just for example purpose. You should use proper error handling instead of panic
			    }
			    defer db.Close()

	var Assignment_IDv,Assignment_Namev,Teacher_IDv,Course_IDv,Batchv string
			 	var Deadline_Datev string
			 	var Credits_Allotedv int


			 	allAssignments := []Assignment{}

			 	 rows, err := db.Query("SELECT Assignment_ID,Assignment_Name,Teacher_ID,Credits_Alloted,DATE(Deadline_DateTime),Course_ID,Batch FROM Assignment order by Deadline_DateTime")
			    checkErr(err)

			    for rows.Next() {
			      			      
			        err = rows.Scan(&Assignment_IDv,&Assignment_Namev,&Teacher_IDv,&Credits_Allotedv,&Deadline_Datev,&Course_IDv,&Batchv)
			        


			        checkErr(err)
			        
			        if (Batchv==Batch) {
			        	assg := Assignment{
			        			Assignment_ID : Assignment_IDv,
								Assignment_Name  : Assignment_Namev,
								Batch :Batchv ,
								Teacher_ID  : Teacher_IDv,
								Credits_Alloted  : Credits_Allotedv,
								Deadline_Date :Deadline_Datev,
								Course_ID : Course_IDv, 
							}	

			        	allAssignments= AddItem(allAssignments, assg) 
			        }
			    }

	return allAssignments
}



func getTAssignments(ID string) ([]Assignment){

	db, err := sql.Open("mysql", "assignroot:assign123@(166.62.10.53:3306)/assigndb")
			    if err != nil {
			        panic(err.Error())  // Just for example purpose. You should use proper error handling instead of panic
			    }
			    defer db.Close()

	var Assignment_IDv,Assignment_Namev,Teacher_IDv,Course_IDv,Batchv string
			 	var Deadline_Datev string
			 	var Credits_Allotedv int


			 	allAssignments := []Assignment{}

			 	 rows, err := db.Query("SELECT Assignment_ID,Assignment_Name,Teacher_ID,Credits_Alloted,DATE(Deadline_DateTime),Course_ID,Batch FROM Assignment order by Deadline_DateTime")
			    checkErr(err)

			    for rows.Next() {
			      			      
			        err = rows.Scan(&Assignment_IDv,&Assignment_Namev,&Teacher_IDv,&Credits_Allotedv,&Deadline_Datev,&Course_IDv,&Batchv)
			        


			        checkErr(err)
			        
			        if (Teacher_IDv==ID) {
			        	assg := Assignment{
			        			Assignment_ID : Assignment_IDv,
								Assignment_Name  : Assignment_Namev,
								Batch :Batchv ,
								Teacher_ID  : Teacher_IDv,
								Credits_Alloted  : Credits_Allotedv,
								Deadline_Date :Deadline_Datev,
								Course_ID : Course_IDv, 
							}	

			        	allAssignments= AddItem(allAssignments, assg) 
			        }
			    }

	return allAssignments
}


func getSubmitedList(ID string) ([]SubStudent){

	db, err := sql.Open("mysql", "assignroot:assign123@(166.62.10.53:3306)/assigndb")
	if err != nil {
			  panic(err.Error())  
	}
	defer db.Close()

	 rows, err := db.Query("select Student_ID from Submissions where Assignment_ID = ?",ID);
	if err != nil {
        panic(err.Error()) // proper error handling instead of panic in your app

    }

    var studentid SubStudent
    var all []SubStudent

    for rows.Next() {
    					err = rows.Scan(&studentid.RollNumber)
    					riperr(err)
    				 	all = append(all, studentid)
			        }
			    

	return all

}
 




func AddItem(all []Assignment , item Assignment) []Assignment {
    all = append(all, item)
    return all
}

// func DumpAssignments(Batch string) ([]Assignment , error) {

	
//  	var Assignment_ID,Assignment_Name,Teacher_ID,Credits_Alloted,Deadline_Date,Deadline_Month,Deadline_Year,Course_ID string

//     getstudent, errr := db.Prepare("SELECT Assignment_ID,Assignment_Name,Teacher_ID,Credits_Alloted,Deadline_Date,Deadline_Month,Deadline_Year,Course_ID FROM Assignment Where Batch= ?")
    
//     checkErr(errr)

//     err = getstudent.QueryRow(Batch).Scan(&Assignment_ID,&Assignment_Name,&Teacher_ID,&Credits_Alloted,&Deadline_Date,&Deadline_Month,&Deadline_Year,&Course_ID) // WHERE number = 13
//     if err != nil {
//         panic(err.Error())
//     }


// }



func CreateAssignment(w http.ResponseWriter , r *http.Request , p httprouter.Params){

		id:= p.ByName("id")

		smallteacher:= GetTeacherData(id)
	
		t,err:= template.ParseFiles("CreateAssignment.html")
		
		riperr(err)

		t.Execute(w,smallteacher)

	}




func Grading(w http.ResponseWriter , r *http.Request , p httprouter.Params){

	id := p.ByName("teacher")

	assgid := p.ByName("assignment")

	assg := getAssign(assgid)

	list := getSubmitedList(assgid)

	new_AssignPage := AssignmentTPage{

			Current : id,
			Assignment : assg,
			Submited: list,

		}

	t,err:= template.ParseFiles("assignDetails.html")
		
	riperr(err)

	t.Execute(w,new_AssignPage)

}


func Grade(w http.ResponseWriter , r *http.Request , p httprouter.Params){

	teacher:= p.ByName("teacher")
	assg:= p.ByName("assignment")

	id := r.FormValue("name")
	credits := r.FormValue("credits")
	plag := r.FormValue("plag")

	db, err := sql.Open("mysql", "assignroot:assign123@(166.62.10.53:3306)/assigndb")
	if err != nil {
			  panic(err.Error())  
	}
	defer db.Close()

	stmtIns, err := db.Prepare("Insert into Grading values(?,?,?,?)");
	if err != nil {
        panic(err.Error()) // proper error handling instead of panic in your app

    }
    defer stmtIns.Close()

     _, err = stmtIns.Exec(id,assg,credits,plag) // Insert tuples (i, i^2)
        if err != nil {
            panic(err.Error()) // proper error handling instead of panic in your app
        }


	t,err:= template.ParseFiles("tmessage.html")
		
	riperr(err)


	m := Message{

		ID : teacher,
		Msg: "Assignment Successful Graded for "+id+" for Assignment "+assg,
	}

		t.Execute(w,m)


}




func PublishAssignment(w http.ResponseWriter , r *http.Request , p httprouter.Params){

		teacher:= p.ByName("teacher")

		id := r.FormValue("id")
		name := r.FormValue("name")
		credits := r.FormValue("credits")
		deadline := r.FormValue("deadline")
		course := r.FormValue("course")	
		batch := r.FormValue("batch")

		fmt.Println(deadline)

		db, err := sql.Open("mysql", "assignroot:assign123@(166.62.10.53:3306)/assigndb")
			    if err != nil {
			        panic(err.Error())
			    }
		defer db.Close()


		stmtIns, err := db.Prepare("Insert into Assignment values(?,?,?,?,?,?,?,?)");
		
		if err != nil {
        	panic(err.Error())
    	}
    	
    	defer stmtIns.Close()

    	current_time := time.Now().Local()



     	_, err = stmtIns.Exec(id,name,teacher,batch, credits,current_time,deadline,course) // Insert tuples (i, i^2)
        
        if err != nil {
            panic(err.Error())
        }


		// t,err:= template.ParseFiles("yourAssignments.html")
		
		// riperr(err)

		// t.Execute(w,new_HackPage)


}


// func Profile(w http.ResponseWriter , r *http.Request , _ httprouter.Params){
// 	UniqueIP := r.RemoteAddr

// 	uip:= UniqueIP[:6]

// 	sessionValues , err := customSessions.GetSession(db_sessions,DB_Sessions,Col_Sessions,uip)
		
// 	riperr(err)

// 	if( len(sessionValues) != 0){

// 		t,err:= template.ParseFiles("profile.html")
		
// 		riperr(err)

// 		t.Execute(w,sessionValues[0])

// 	}
// }


// func Signup(w http.ResponseWriter , r *http.Request , _ httprouter.Params){

// 		name := r.FormValue("name")
// 		uname := r.FormValue("username")
// 		pword := r.FormValue("password")

// 		r.ParseForm()
// 		usertype := r.Form["usertype"]
	

// 		new_user := &User{
// 			Name : name,
// 			Username : uname, 
// 			Password :pword,
// 			UserType :usertype,
// 			}	

// 		session := customSessions.CreateSession(db)


// 		already_exists ,err := Find_User(DB_Users,Col_Users,session,"Username",new_user.Username)


// 		riperr(err)

// 		if (already_exists.Username == ""){

// 		err := Insert_User(DB_Users,Col_Users,session,new_user)

// 		riperr(err)

// 		session.Close()

// 		w.Write([]byte(new_user.Username + " Thank you for signing up , Please login from home page"))


// 		} else {

// 			w.Write([]byte("UserName already exists"))
// 		}
// }



// func Loged(w http.ResponseWriter , r *http.Request , _ httprouter.Params){


// 	// UniqueIP , err := getIP(r)

// 	UniqueIP := r.RemoteAddr

// 	UIP := UniqueIP[:6]

	
// 	sessionValues , errr := customSessions.GetSession(db_sessions,DB_Sessions,Col_Sessions,UIP)


// 	if(errr != nil){
// 		fmt.Println("Error Getting session")
// 	}

// 	session := customSessions.CreateSession(db)

// 	user,err := Find_User( DB_Users , Col_Users , session ,"Username" ,sessionValues[0].Username)	

// 	riperr(err)

// 	session.Close()	

// 	this := SmallUser{
// 		Username: user.Username,
// 		Password: user.Password,
// 	}

// 	user_exists, usertype := Validate(db,DB_Users,Col_Users,this)

// 	if ( user_exists ){

// 			if(usertype == "1"){

// 				session := customSessions.CreateSession(db)

// 				fmt.Println(session)	

// 				allhacks,err := DumpHacks(DB_Hack,Col_Hack,session)

// 				riperr(err)


// 				session.Close()

// 				t,err:= template.ParseFiles("dashboard.html")
			
// 				riperr(err)

// 				dashboardObj := DashboardObject{

// 					Current:sessionValues[0],
// 					Hacks:allhacks,
// 				}

// 				t.Execute(w,dashboardObj)

				

// 			} else if( usertype=="2"){

// 					t,err:= template.ParseFiles("controlboard.html")
			
// 					riperr(err)

// 					t.Execute(w,this)
// 			}

// 		}
	

// 	fmt.Println(sessionValues[0].Username,"Recurrring")

	

// }


// func Logout(w http.ResponseWriter , r *http.Request , _ httprouter.Params){


// 	UniqueIP := r.RemoteAddr

// 	uip:= UniqueIP[:6]
		
// 	err := customSessions.DeleteSession(db_sessions,DB_Sessions, Col_Sessions,"UniqueIP" ,uip)

// 	riperr(err)

// 	http.Redirect(w, r, "/", 302)


// }

func getAssign(Assignment_IDg string) (Assignment){

	db, err := sql.Open("mysql", "assignroot:assign123@(166.62.10.53:3306)/assigndb")
			    if err != nil {
			        panic(err.Error())  
			    }
			    defer db.Close()

	var Assignment_IDv,Assignment_Namev,Teacher_IDv,Course_IDv,Batchv string
			 	var Deadline_Datev string
			 	var Credits_Allotedv int


			 	//allAssignments := []Assignment{}

			 	 

			   		err = db.QueryRow("SELECT Assignment_ID,Assignment_Name,Teacher_ID,Credits_Alloted,DATE(Deadline_DateTime),Course_ID,Batch FROM Assignment where Assignment_ID =?",Assignment_IDg).Scan(&Assignment_IDv,&Assignment_Namev,&Teacher_IDv,&Credits_Allotedv,&Deadline_Datev,&Course_IDv,&Batchv);
			   		checkErr(err)

			        	assg := Assignment{
			        			Assignment_ID : Assignment_IDv,
								Assignment_Name  : Assignment_Namev,
								Batch :Batchv ,
								Teacher_ID  : Teacher_IDv,
								Credits_Alloted  : Credits_Allotedv,
								Deadline_Date :Deadline_Datev,
								Course_ID : Course_IDv, 
							}	
			        
			    	//fmt.Println(assg)

	return assg


}

func ShowHack(w http.ResponseWriter , r *http.Request , p httprouter.Params){

	roll:= p.ByName("roll")
	id:= p.ByName("id")
	fmt.Println()
	assg := getAssign(id)

		new_AssignPage := AssignmentPage{

			Current : roll,
			Assignment : assg,
		}

		t,err:= template.ParseFiles("showAssign.html")
		
		riperr(err)

		t.Execute(w,new_AssignPage)


}



func Unsubmitted(w http.ResponseWriter , r *http.Request , p httprouter.Params){

	
		id:= p.ByName("id")

				smallstudent:= GetStudentData(id)

				allAssignments := getUAssignments(smallstudent.Batch,smallstudent.Student_ID)
				
				t,err:= template.ParseFiles("udashboard.html")
			
				riperr(err)

				dashboardObj := DashboardObject{

					Current : smallstudent,
					Assignments : allAssignments,
				}

				//fmt.Println(allAssignments)

				t.Execute(w,dashboardObj)

				// session.Close()
				// output := uname+pword+" Successful "

				// w.Write([]byte(output))

}

func submitted(w http.ResponseWriter , r *http.Request , p httprouter.Params){

	
		id:= p.ByName("id")

				smallstudent:= GetStudentData(id)

				allAssignments := getAssignments(smallstudent.Batch,	)
				
				t,err:= template.ParseFiles("dashboard.html")
			
				riperr(err)

				dashboardObj := DashboardObject{

					Current : smallstudent,
					Assignments : allAssignments,
				}

				//fmt.Println(allAssignments)

				t.Execute(w,dashboardObj)

				// session.Close()
				// output := uname+pword+" Successful "

				// w.Write([]byte(output))

}


func created(w http.ResponseWriter , r *http.Request , p httprouter.Params){

	
		id:= p.ByName("teacher")

				allAssignments := getTAssignments(id)
				
				t,err:= template.ParseFiles("tdashboard.html")
			
				riperr(err)

				dashboardObj := TDashboardObject{

					Current : id,
					Assignments : allAssignments,
				}

				//fmt.Println(allAssignments)

				t.Execute(w,dashboardObj)

				// session.Close()
				// output := uname+pword+" Successful "

				// w.Write([]byte(output))

}


func uploadHandler(w http.ResponseWriter, r *http.Request , p httprouter.Params ) {

 	// the FormFile function takes in the POST input id file
 	file, header, err := r.FormFile("solution")
 	id:= p.ByName("id")
 	course:= p.ByName("course")
 	if err != nil {
 		fmt.Fprintln(w, err)
 		return
 	}

 	defer file.Close()

 	out, err := os.Create("/tmp/solutions/"+id+" "+course+".txt")
 	if err != nil {
 		fmt.Fprintf(w, "Unable to create the file for writing. Check your write access privilege")
 		return
 	}

 	defer out.Close()

 	// write the content from POST to the file
 	_, err = io.Copy(out, file)
 	if err != nil {
 		fmt.Fprintln(w, err)
 	}

	db, err := sql.Open("mysql", "assignroot:assign123@(166.62.10.53:3306)/assigndb")
	if err != nil {
			  panic(err.Error())  
	}
	defer db.Close()

	stmtIns, err := db.Prepare("Insert into Submissions values(?,?,?)");
	if err != nil {
        panic(err.Error()) // proper error handling instead of panic in your app

    }
    defer stmtIns.Close()

    current_time := time.Now().Local()

     _, err = stmtIns.Exec(id, course,current_time) // Insert tuples (i, i^2)
        if err != nil {
            panic(err.Error()) // proper error handling instead of panic in your app
        }


	t,err:= template.ParseFiles("message.html")
		
	riperr(err)


	m := Message{

		ID : id,
		Msg: "File uploaded successfully : "+header.Filename,
	}

		t.Execute(w,m)



 	// fmt.Fprintf(w, "<h2>File uploaded successfully : ")
 	// fmt.Fprintf(w, header.Filename)

 	// fmt.Fprintf(w, "<h2><h3><a href='/'>Go Home</a></h3>")
 }





func riperr(err error){
 	if err!= nil{

    		log.Println(err)

    	}
 }

