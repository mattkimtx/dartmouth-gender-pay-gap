<?php
//Set the vars used for your DB connection, using new acct creds
  $username="Matthew_Kim";
  $password="bookRace13";
  $database="gender_pay_gap";

//Acquire the Cat's name from your html POST
  $job=$_POST['job'];

//Establish MySQL connection called $mysqli
  $mysqli=new mysqli('localhost',$username,$password,$database);


//Define your query - pay close attention to ' and "!
  $query="SELECT Job, ROUND(AVG(Base + Bonus), 2) AS Salary from Employees where Job='".$job."'";
  $stmt=$mysqli->prepare($query);
  $stmt->bind_param('s',$job);
  $stmt->execute();
  $result = $stmt->get_result();

//Run query - result is reurned as a resource id
//If query has error, _LINE_ will print the error from mysql
  $result=$mysqli->query($query) or die($mysqli->error.__LINE__);


//Resource id results must be interpreted
//This while loop will run thru the results row by row & echo name & birth fields
if ($result->num_rows > 0) {
  while($row=$result->fetch_assoc()) {
  echo $row['Job']."'s Salary is " .$row['Salary']."</br>";
  }
  }
  else {
  echo 'NO RESULTS';
  }
?>
