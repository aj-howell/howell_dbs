<?php 
 ini_set('display_errors', 1); 
 ini_set('display_startup_errors', 1); 
 error_reporting(E_ALL); 

$dbhost = 'localhost'; 
$dbuser = 'prof'; 
$dbpass = 'charmander'; 

$conn = new mysqli($dbhost, $dbuser, $dbpass); 

if ($conn->connect_errno) {
 echo "Error: Failed to make a MySQL connection,
 here is why: ". "<br>";
 echo "Errno: " . $conn->connect_errno . "\n";
 echo "Error: " . $conn->connect_error . "\n";
 exit; // Quit this PHP script if the connection fails.
} else {
 echo "Connected Successfully!" . "<br>";
 echo "YAY!" . "<br>";
}
$dblist = "SHOW databases;";

$result = $conn->query($dblist);

while ($dbname = $result->fetch_array()) {
    echo $dbname['Database'] . "<br>";
   }

// entering in the bookstore database to select all the tables
//$dbuse = "USE bookstore;";

//$result2 = $conn->query($dbuse);

//while ($dbtable=)

//   $conn->close();
?>

<h2>Check back soon!</h2>
