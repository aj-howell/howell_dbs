
The name of our database is <?php echo htmlspecialchars($_POST['name']);?>. 
In this database, there are two tables:

<?php
// setting up an error message to display if the connection does not work
ini_set('display_errors', 1); 
ini_set('display_startup_errors', 1); 
error_reporting(E_ALL); 

$dbhost = 'localhost'; 
$dbuser = 'prof'; 
$dbpass = 'charmander'; 
$db = 'bookstore';

$conn = new mysqli($dbhost, $dbuser, $dbpass, $db); 

if ($conn->connect_errno) {
echo "Error: Failed to make a MySQL connection,
here is why: ". "<br>";
echo "Errno: " . $conn->connect_errno . "\n";
echo "Error: " . $conn->connect_error . "\n";
exit; // Quit this PHP script if the connection fails.
} else {
//echo "Connected Successfully!" . "<br>";
//echo "YAY!" . "<br>";

/* I've decided that instead of letting us know that we connected successfully that it'll only tell
us when we are wrong. If we aren't wrong then it'll just display the rows of the table. */
$dbtitle =  "
            SHOW TABLES;
";


$results = $conn->query($dbtitle);

$dbinfo = "SELECT FROM table;";
$results2 = $conn->query($dbinfo);

$i=0;


//in this loop I want to iterate through the number of tables that the bookstore db consist of 
"Here are list of all our tables";
foreach($results as $dbrow) 
{ 
        echo " " . "<br>";
        echo implode($dbrow) ;
     

}


}
/*$dbtitle =  "
            SHOW TABLES;
";


$results = $conn->query($dbtitle);

$dbinfo = "SELECT FROM table;";
$results2 = $conn->query($dbinfo);

$i=0;


//in this loop I want to iterate through the number of tables that the bookstore db consist of 
"Here are list of all our tables";
foreach($results as $dbrow) 
{ 
   
        echo implode($dbrow) . "<br>";
     

}*/
?>