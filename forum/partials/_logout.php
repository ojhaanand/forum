<?php
session_start();
echo "logging out........";

session_destroy();
header ("location: /forum?loggedoout=true")
?>