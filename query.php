<html>
  <head>
    <title>CS143 Project 1A</title>
    <style>
     table {
       border-collapse: collapse;
     }

     table, th, td {
       border: 1px solid black;
     }

     th {
       height: 40px;
     }

     .full-width {
       width: 100%;
     }
    </style>
  </head>
  <body>
    <h3>Enter SQL Query Here:</h3>
    <br />
    <form action="./query.php" method="GET">
      <textarea class="full-width" name="query" rows="8"><?php
						if (!empty($_GET['query'])) {
						  echo $_GET['query'];
						}

						?></textarea>
      <br />
      <button type="submit" value="Submit" />Submit</button>
    </form>
    <?php

    if (!empty($_GET['query'])) {
      echo "<h3>Results from MySQL:</h3>";

      $db_connection = mysql_connect("localhost", "cs143", "");

      if(!$db_connection) {
	$errmsg = mysql_error($db_connection);
	echo "Connection failed:".$errmsg."<br />";
	exit(1);
      }
      
      mysql_select_db("CS143", $db_connection);
      
      $query = $_GET['query'];
      $rs = mysql_query($query, $db_connection);

      $num_fields = mysql_num_fields($rs);
      
      echo '<table class="full-width"><tr>';
      for ($i = 0; $i < $num_fields; $i++) {
	$field = mysql_fetch_field($rs, $i);
	echo "<th>".$field->name."</th>";
      }
      echo "</tr>";
      
      while($row = mysql_fetch_row($rs)) {
	echo "<tr>";
	for ($i = 0; $i < $num_fields; $i++) {
	  $field_value = is_null($row[$i]) ? "N/A" : $row[$i];
	  echo "<td>".$field_value."</td>";
	}
	echo "</tr>";
      }

      echo "</table>";

      mysql_close($db_connection);
    }

    
    ?>
  </body>
</html>
