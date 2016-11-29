<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Document View</title>
</head>
<body>
<h1>Document View</h1>
<hr/>
<?php
    require_once("config.php");
    $uri = htmlspecialchars($_GET["uri"]);
    $contents = REST_PATH . "/db/queries/articleText.xql?uri=$uri";
    $result = file_get_contents($contents);
    echo $result;
?>
</body>
</html>
