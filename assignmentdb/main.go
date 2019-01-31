package main

import(
	"fmt"
	"httprouter"
	"net/http"
	"os"
)







func main(){

	 // db, err := sql.Open("mysql", "assignroot:assign123@(166.62.10.53:3306)/assigndb")
  //   if err != nil {
  //       panic(err.Error())  // Just for example purpose. You should use proper error handling instead of panic
  //   }
  //   defer db.Close()

   
  //    rows, err := db.Query("SELECT Name FROM Student")
  //   checkErr(err)

  //   for rows.Next() {
      
  //       var username string
      
  //       err = rows.Scan(&username)
        
  //       checkErr(err)
        
  //       fmt.Println(username)
  //   }




	server := httprouter.New()

	server.GET("/",Home)

	server.POST("/login",Login)

	server.GET("/unsubmitted/:id",Unsubmitted)
	server.GET("/all/:id",submitted)

	server.GET("/created/:teacher",created)

	// server.GET("/loged",Loged)

	 server.GET("/createAssignment/:id",CreateAssignment)

	 //server.GET("/status")

	 server.GET("/teacher/:teacher/:assignment",Grading)

	 server.POST("/grade/:teacher/:assignment",Grade)

	server.POST("/publish/:teacher",PublishAssignment)

	// server.POST("/signup",Signup)

	 server.GET("/assignment/:id/:roll",ShowHack)

	// server.GET("/logout",Logout)

	// server.GET("/profile",Profile)

	 server.POST("/upload/:course/:id", uploadHandler)

	server.ServeFiles("/resources/*filepath", http.Dir("./resources"))

	fmt.Println("Waiting at :3001")

	http.ListenAndServe(GetPort(),server)

}


func GetPort() string {
        var port = os.Getenv("PORT")
        // Set a default port if there is nothing in the environment
        if port == "" {
                port = "3001"
                fmt.Println("INFO: No PORT environment variable detected, defaulting to " + port)
        }
        return ":" + port
}


func checkErr(err error) {
    if err != nil {
        panic(err)
    }
}

