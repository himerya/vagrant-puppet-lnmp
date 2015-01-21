<html>
	<head>
		<title>PHP Test</title>
	</head>
	<body>
	<?php
		echo '<p>Ciao mondo!</p>';
		$ora = date('H:i');
		echo '<p>Sono le '.$ora.'</p>';
		$method = $_SERVER['REQUEST_METHOD'];
		echo "<p>$method</p>";

		$servername = "localhost";
		$username = "lnmp";
		$password = "lnmp";

		// Create connection
		$conn = mysql_connect($servername, $username, $password);

		// Check connection
		if (!$conn) {
		    die("Connection failed");
		}
		echo "Connected successfully<br>";

		mysql_select_db('lnmp', $conn);

		if($_GET['ff'])
		{
			$mittente = $_SERVER['REMOTE_ADDR'];
			$testo = $_GET['ff'];
			$query = "insert into Messaggi (mittente, testo) values('$mittente','$testo')";
			mysql_query($query);
		}

		$query = "SELECT * from Messaggi where mittente = '".$_SERVER['REMOTE_ADDR']."'";

		$result = mysql_query($query);

		while($row = mysql_fetch_assoc($result))
		{
			echo $row['mittente'];
		}

	?>
	</body>
</html>
