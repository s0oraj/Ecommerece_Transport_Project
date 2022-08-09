<?php
session_start();
$dir = "./certificate/";

// Sort in ascending order - this is default
$a = scandir($dir);

// Sort in descending order
//$b = scandir($dir,1);

?> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>
<body>

    <!-- admin dashboard -->
    <h1 class="p-3 text-center">Admin Dashboard</h1>

    <div class="container-fluid">
        <!-- <div class="row my-3">
            <div class="col-12">
                <div class="card p-3">
                    
                </div>
            </div>
        </div> -->

        <!-- fetch all data in cards -->
        <h2>Certificates</h2>
        <div class="row">
            <?php 
                for($i=0; $i<sizeof($a);$i++){
                    $file = $dir.$a[$i];
            ?>
            <div class="col-2 mb-2">
                <div class="card p-2">
                    <a href="<?php echo $dir.$a[$i] ?>"><?php echo $a[$i] ?></a>

                    <a href="<?php echo "./sendMail.php?file=".$file; ?>" class="btn btn-primary">Send Mail</a>
                </div>
            </div>
            <?php    }
                ?>
        </div>
    </div>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" integrity="sha384-1CmrxMRARb6aLqgBO7yyAxTOQE2AKb9GfXnEo760AUcUmFx3ibVJJAzGytlQcNXd" crossorigin="anonymous"></script>
</body>
</html>