<?php
session_start();
// $_SESSION['username']=
// setcookie("mode", time());

// $_COOKIE['mode'] = "light";

ini_set('display_errors', 1); 
 ini_set('display_startup_errors', 1); 
 error_reporting(E_ALL); 

$dbhost = 'localhost'; 
$dbuser = 'aj2'; 
$dbpass = 'squirtle'; 
$db = 'instrument_rentals';

$conn = new mysqli($dbhost, $dbuser, $dbpass, $db); 

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
?>



<p>
    Remember this session: <br>
</p>


<?php
   
// if the user name is submitted then
 $reload=FALSE;
   

if(array_key_exists('username', $_POST) ){
    $reload=TRUE;    
    //session_start();



?>
    <form action='manageInstruments.php' method=POST>
     <input type="submit" name= "Log out" value = "Log out">
    </form>

<?php
   echo "Welcome " . $_POST['username'];
   // print the number of records it has deleted 

//    if($reload)
//    {
//     header("Location: {$_SERVER['REQUEST_URI']}", true, 303);
//     exit();

  // }

}
?>
<?php
if(!array_key_exists('username', $_POST))
    {
        
?>
        <form action='manageInstruments.php' method=POST>
        <input type="text" name="username" placeholder="Enter Username">    
        <input type="submit" name= "Remember session" value = "Remember session">
<?php 
    }



?>

<?php 
$sql = " SELECT instrument_id, instrument_type FROM instruments; ";
$results = $conn->query($sql);
//$id = $results;
?>

<?php  

$needs_reload= FALSE;
//if(array_key_exists("delete_selected", $_POST)){

$del_stmt = $conn->prepare("DELETE FROM instruments WHERE instrument_id=?");
$del_stmt->bind_param('i', $id); 

$resar = $results->fetch_all();
if(array_key_exists("delete_selected", $_POST)){
for($i=0; $i<$results->num_rows; $i++){
  
    $id = $resar[$i][0];
    
    if (isset($_POST["checkbox" . $id])){
    
        $del_stmt->execute();
        $needs_reload=True;
       //echo $conn->error;
    }

    }
    
    if($needs_reload){ 
        header("Location: {$_SERVER['REQUEST_URI']}", true, 303);
        exit();
    }

}
?>

<?php

if(array_key_exists("add_records", $_POST))
{
    $add_stmt = $conn->prepare("INSERT INTO instruments (instrument_type)
    VALUES ('Guitar'),
     ('Trumpet'),
     ('Flute'),
     ('Theremin'),
     ('Violin'),
     ('Tuba'),
     ('Melodica'),
     ('Trombone'),
     ('Keyboard');"); 

    $needs_reload=TRUE;
    $add_stmt->execute();

    if($needs_reload=TRUE)
    {
       header("Location: {$_SERVER['REQUEST_URI']}", true, 303);
        //exit(); 

    }
}

?>

<?php

$delete_stmt = $conn->prepare("DELETE FROM instruments");

if(array_key_exists("delete_selected", $_POST)){
    for($i=0; $i<$results->num_rows; $i++){
      
        $id = $resar[$i][0];
        
        if (isset($_POST["all"])){
        
            $delete_stmt->execute();
            $needs_reload=True;
           //echo $conn->error;
        }
    
        }
        
        if($needs_reload){ 
            header("Location: {$_SERVER['REQUEST_URI']}", true, 303);
            exit();
        }
    
    }
    

?>

<?php
function result_to_table($res) {
    $nrows = $res->num_rows;
    $ncols = $res->field_count;
    $resar = $res->fetch_all();



    ?> 
    <p>
    <?php echo $ncols; ?> columns, <?php echo $nrows; ?> rows.
    </p>
        <table>
        <thead>
        <tr>
    
    <th><b>Delete</b></th> 
        <?php while ($fld = $res->fetch_field()) {
    ?>
        <th><?php echo $fld->name; ?></th>
    <?php
    }
    ?>
    </tr>
    </thead>
    <tbody>
      
   

    <?php
    for ($i=0;$i<$nrows; $i++) {
    ?>
    <tr>
    <?php $id = $resar[$i][0] ?>
        <td> <input type="checkbox" 
        name="checkbox<?php echo $id; ?>" 
        value=<?php echo $id; ?>/></td>
    <?php
        for ( $j = 0; $j < $ncols; $j++ ) {
    ?>
            <td><?php echo $resar[$i][$j]; ?></td>
    <?php
        }
    ?>        
        </tr>
    <?php
    }
?>

    </tbody>
 <p> 
        Delete all records
    <input type="checkbox" 
        name="all" 
        value="all"> 
    </table> 
</p>
    
    
<?php
}
?>

<?php 
$lightmode=TRUE;
if(array_key_exists('toggle_dark_mode', $_POST) && $lightmode==TRUE){
?>  
    <style>
        h1, h2, h3, p, pre, table, ul, li 
        {
            color: white;
                }

                table, th, td {
 
                    border: 1px solid white;

                }

                body {

                    background-color: black;
                    
                }
    </style>

<?php
        $lightmode=FALSE;
}
?>


<form action="manageInstruments.php" method=POST>
<?php 
$results = $conn->query($sql);
result_to_table($results); 
$conn->close();
?>

<input type="submit" name= "delete_selected" value="Delete Selected Records" method=POST/>
</form>

<form action='manageInstruments.php' method=POST>
<input type="submit" name= "add_records" value="add records" method=POST/>
</form>

<form action='manageInstruments.php' method=POST>
<input type="submit" name= "toggle_dark_mode" value="Toggle Light/Dark Mode" method=POST/>
</form>
    
