<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Read a document</title>
</head>
<body>
<h1>Choose a document to read from the list below</h1>
<hr/>
<ul>
<?php
    require_once("config.php");
    $year = htmlspecialchars($_GET["year"]);
    $contents = REST_PATH . "/db/queries/dateList.xql?year=$date";
    $result = file_get_contents($contents);
    echo $result;
?>
</ul>
</body>
</html>
