<?php
 
 $host = "localhost";
 $user = "root";
 $pass = "";
 $db = "flutter";
 $con = mysqli_connect($host, $user, $pass, $db) or die('Error Connecting');
  
 
 $json = file_get_contents('php://input');
  
 
 $obj = json_decode($json,true);
 
 
 $mobile = $obj['mobile'];
 
 
 $password = $obj['password'];
 
 //Applying User Login query with email and password.
 $loginQuery = "select * from login_data  where mobile = '$mobile' and password = '$password' ";
 
 // Executing SQL Query.
 $check = mysqli_fetch_array(mysqli_query($con,$loginQuery));
 
	if(isset($check)){
		
		 // Successfully Login Message.
		 $onLoginSuccess = 'Login Matched';
		 
		 // Converting the message into JSON format.
		 $SuccessMSG = json_encode($onLoginSuccess);
		 
		 // Echo the message.
		 echo $SuccessMSG ; 
	 
	 }
	 
	 else{
	 
		 // If Email and Password did not Matched.
		$InvalidMSG = 'Invalid Username or Password Please Try Again' ;
		 
		// Converting the message into JSON format.
		$InvalidMSGJSon = json_encode($InvalidMSG);
		 
		// Echo the message.
		 echo $InvalidMSGJSon ;
	 
	 }
 
 mysqli_close($con);
?>