<?php
$conn=new mysqli("localhost","slogf_ota","Lopklipk.0","slogf_ota");
if($conn->connect_errno){
    echo "Failed to connect to Database";
    exit();
}
$query="SELECT * from registered_devices";
$result=$conn->query($query);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OTA System</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/jquery-ui.min.css">
    <link rel="stylesheet" href="css/index.css">
</head>
<body>
    <div class="container-fluid">
        <h1 class="text-center">OTA Update Management System</h1>
        <h3 class="text-center">List of all Devices</h3>
        <table class="table table-main text-center table-bordered table-hover">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">SL.NO</th>
                    <th scope="col">Name</th>
                    <th scope="col">IP Address</th>
                    <th scope="col">MAC Address</th>
                    <th scope="col">Function</th>
                    <th scope="col">Version</th>
                    <th scope="col">Last Updated</th>
                    <th scope="col">Update</th>
                </tr>
            </thead>
            <tbody>
            <?php
            if ($result->num_rows > 0) {
                foreach($result as $row){
                    ?>
                    <tr>
                        <td class="table-main"><?php echo $row['id'];?></td>
                        <td class="table-main"><?php echo $row["name"];?></td>
                        <td class="table-main"><?php echo $row["ip_address"];?></td>
                        <td class="table-main"><?php echo $row["mac"];?></td>
                        <td class="table-main"><?php echo $row["function_name"];?></td>
                        <td class="table-main"><?php echo $row["version"];?></td>
                        <td class="table-main"><?php echo $row["last_updated"];?></td>
                        <td class="table-main"><a href=<?php echo "http://".$row["update_link"];?>><button class="btn-warning btn1">Update</button></a></td>
                    </tr>
                <?php
                 } 
            }
            ?>
            </tbody>
        </table>
    </div>
    <script src="js/bootstrap.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.js"></script>
</body>
</html>
