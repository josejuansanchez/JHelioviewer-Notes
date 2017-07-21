<?php

if ( empty($_GET['action']) ) exit;

switch($_GET['action']) {
    case "getDataSources":
      $filename = "./get_data_sources.txt";
      break;

    case "getJP2Image":
      $filename = "./get_jp2_image.txt";
      break;

    case "getJPX":
      $filename = "./get_jpx.txt";
      break;
}

$content = file_get_contents($filename, FILE_USE_INCLUDE_PATH);
echo $content;

?>
