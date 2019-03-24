<html>
	<head>
		<title>Starting TCP Dump Packet Trace</title>
	</head>
	<body>
		<h3>Starting Packet Trace</h3>
	<?php
	exec('sudo -u root -S /var/www/html/startcapture.sh < /var/sudopass/sudopass.secret');
	?>
	</body>
</html>
