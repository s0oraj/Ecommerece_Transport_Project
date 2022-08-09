<?php 
$name=$_REQUEST["name"];
$ip_address=$_REQUEST["myip"];
$mac=$_REQUEST["my_mac"];
$function_name=$_REQUEST["function_name"];
$version=$_REQUEST["version"];
$update_url=$_REQUEST["update_url"];
if($mac==""){
    die("Empty Mac Address");
}
$conn=new mysqli("localhost","root","","ota_sys");

if($conn->connect_errno){

    echo "Failed to connect to Database";
    exit();
}

else{

    $query="SELECT * from registered_devices WHERE mac='$mac'";
    $result=$conn->query($query);   
    if($result->num_rows>0){

        $row=$result->fetch_assoc();
        $query="UPDATE registered_devices SET name='$name', ip_address='$ip_address',
        mac='$mac' ,function_name='$function_name',version='$version',update_link='$update_url' 
        WHERE mac='$mac'";
        $res=$conn->query($query);


        if($res){

            echo "Device Registered/Updated Successfully";

        }

        else{

            echo "Failed to Register/Update";
        }

    }

    else{

        $query="INSERT INTO registered_devices(name,ip_address,mac,function_name,version,update_link)
        VALUES('$name','$ip_address','$mac','$function_name','$version','$update_url')";
        $res=$conn->query($query);
        if($res){

             echo "Inserted Succesfully";

        }

        else{

            echo "Failed to Insert Data Into Database";

        }

    }

}

$conn->close();

?>