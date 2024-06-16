<?php
$servername = "your_server";
$username = "your_username";
$password = "your_password";
$dbname = "your_database";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT id_penjual, nama_penjual FROM Penjual WHERE status_penjual = 1";
$result = $conn->query($sql);

$restaurants = [];

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $restaurants[] = $row;
    }
}

$conn->close();

echo json_encode($restaurants);
?>
