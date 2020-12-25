<?php
 

$host = "localhost";
$user = "root";
$pass = "";
$db = "flutter";
$con = mysqli_connect($host, $user, $pass, $db) or die('Error Connecting');
 

$json = file_get_contents('php://input');
 

$obj = json_decode($json,true);
 

$name = $obj['name'];
$email = $obj['email'];
$mobile = $obj['mobile'];
$password = $obj['password'];

// Checking whether Email is Already Exist or Not in MySQL Table.
$CheckSQL = "SELECT * FROM login_data WHERE email='$email'";

// Executing Email Check MySQL Query.
$check = mysqli_fetch_array(mysqli_query($con,$CheckSQL));


if(isset($check)){

	 $emailExist = 'Email Already Exist, Please Try Again With New Email Address..!';
	 
	 // Converting the message into JSON format.
	$existEmailJSON = json_encode($emailExist);
	 
	// Echo the message on Screen.
	 echo $existEmailJSON ; 

  }
 else{
 
	 // Creating SQL query and insert the record into MySQL database table.
	 $Sql_Query = "insert into login_data (name,email,mobile,password) values ('$name','$email','$mobile',$password')";
	 
	 
	 if(mysqli_query($con,$Sql_Query)){
	 
		 // If the record inserted successfully then show the message.
		$MSG = 'User Registered Successfully' ;
		 
		// Converting the message into JSON format.
		$json = json_encode($MSG);
		 
		// Echo the message.
		 echo $json ;
	 
	 }
	 else{
	 
		echo 'Try Again';
	 
	 }
 }
 mysqli_close($con);
?>