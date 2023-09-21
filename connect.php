<?php
define( 'DB_NAME_POST', 'add db name' );

/** Database username */
define( 'DB_USER_POST', 'add user' );

/** Database password */
define( 'DB_PASSWORD_POST', 'add pass' );

/** Database hostname */
define( 'DB_HOST_POST', 'add host' );

define('API_AUTH', 'add auth token');
$conn = new mysqli(DB_HOST_POST, DB_USER_POST, DB_PASSWORD_POST, DB_NAME_POST);
$conn->set_charset("utf8mb4");
if ($conn->connect_error) {
die("Connection failed: " . $conn->connect_error);
}
$q = "SELECT wpp.id ,wpp.title, wpp.content, wpp.image, wpd.name, wpd.bearer FROM wp_posts wpp JOIN wp_domains wpd ON wpp.id_domain = wpd.id WHERE sent = 'false';";
$r = $conn->query($q);
$data = $r->fetch_all(MYSQLI_ASSOC);