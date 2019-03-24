<html>
	<head>
		<title>Stopping TCP Dump Packet Trace</title>
	</head>
	<body>
		<h3>Stopping Packet Trace</h3>
	<?php
	exec('sudo -u root -S /var/www/html/stop.sh < /var/sudopass/sudopass.secret');
	?>

	<p><a href="filelist.php">Click Here </a>to download your files!</a>
	</body>
</html>
