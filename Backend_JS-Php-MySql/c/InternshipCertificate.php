<?php  
 
$name=$_POST['fullname'];
 $name_len = strlen($_POST['fullname']);
$title=$_POST['reason'];
$certificate=$_POST['cer'];
$company=$_POST['company'];
$valid=$_POST['valid'];
$date=$_POST['date'];
$dep=$_POST['depart'];
$email=$_POST['email'];
$no=date('dmyyi');//Application No.
//$image=imagecreatefromjpeg("c.jpg");
if(empty($date))
{
    
    $date=date('d').' '.date('M').' '.date('Y');//Set default sign 
}
if(isset($_FILES['image'])){
      $errors= array();
      $file_name = $_FILES['image']['name'];
      $file_size =$_FILES['image']['size'];
     
      $file_tmp =$_FILES['image']['tmp_name'];
      $file_type=$_FILES['image']['type'];
      $exploded = explode('.', $_FILES['image']['name']);
      $file_ext = strtolower(end($exploded));
      $extensions= array("jpeg","jpg");
     
      
      if(in_array($file_ext,$extensions)=== false){
         
          $file_name="signature.png";

         //$errors[]="extension not allowed, please choose a JPEG file.";
      }
     
        
      if($file_size > 2097152){
         $errors[]='File size must be excately 2 MB';
      }
      
       
      $filepath = "images/" . $file_name;
      
      if(empty($errors)==true){
         move_uploaded_file($file_tmp,"images/". $file_name);
         
        
      }else{
         print_r($errors);
      }
  }

    
if($name_len<=8){
            
            $x = 95;
           
          }
          elseif($name_len<=11){
            $x = 85;
            
          }
          elseif($name_len<=13){
            $x = 70;
            
          }
          elseif($name_len<=15){
            $x = 65;
          }
          elseif($name_len<=17){
             $x = 60;
          }
          elseif($name_len<=20){
              $x = 55;
            
          }
          elseif($name_len<=24){
              $x = 50;
          }
          

 



$file_pdfpath="certificate/".$name.".pdf";
//        imagejpeg($image,$file_path);
//        imagedestroy($image); 210, 297
       
        require ('fpdf.php');
        
        
        $pdf = new FPDF('l');
        $pdf->AddPage();
        $pdf->Image('images/c.jpg',0, 0,295,210);
        

         $pdf->SetTextColor(255, 255, 255);
         $pdf->SetFont('helvetica','',22);
        $pdf->SetXY(170, 10);
        $pdf->Write(8, $company);
        
         $pdf->SetFont('times','',22);
        $pdf->SetXY( 30, 135);
        $pdf->Write(8,$title);
        $pdf->Write(8," ");
        $pdf->Write(8, $dep);
        
         $pdf->SetTextColor(255,255,255);
        $pdf->SetFont('times','',29);
         $pdf->SetXY(60, 44);
        $pdf->Write(8, $certificate);
       
        //$pdf->Write(8,'CERTIFICATE');
        //$pdf->SetXY(30, 47);
       

      
        $pdf->SetTextColor(255,255,255);
         $pdf->SetXY(73, 65);
        $pdf->Write(8,'To whom it may concern');
        



        
        $pdf->SetTextColor(255,255,255);
        $pdf->SetFont('courier','B',35);
        //$pdf->SetXY(85, 112.5,);
        $pdf->SetXY($x,112.5);
        $pdf->Write(8,$name);
        
        
       
        
        
        $pdf->Image($filepath,246, 130,44,23);
        //$pdf->SetMargins(31.5, 0);

        
        
        $pdf->SetFont('times','',21);
        $pdf->SetXY(18, 181.4);
        $pdf->Write(8, $valid);
        
       
        $pdf->SetXY( 198, 181.4);
        $pdf->Write(8, $date);

        $pdf->SetXY( 18, 10);
        $pdf->Write(8, 'S.N.- ');
        $pdf->Write(8, $no);
        
        $pdf->SetTextColor(0,0,0);
        $pdf->SetXY(252,160);
         $pdf->SetFont('times','',21);
        $pdf->Write(8,'Signature');
 
        $file_pdfpath="certificate/".$email.".pdf";//Change this according to the folder name given 
        $pdf->Output($file_pdfpath,'F');

?>
<!DOCTYPE html>
<html>
<head>
	<title>Preview</title>
</head>
<body>
<centre>
    
    <div style="display:flex; align-items: center; justify-content: center;">
        
        <h1> Congrats ! Here Your Certificate </h1>
    </div>
    <div style="display:flex; align-items: center; justify-content: center;">
        <h3>Preview </h3>
    </div>       
        
   <div style="display:flex; align-items: center; justify-content: center;">
        
        <iframe src="<?php echo $file_pdfpath; ?>" width="500px" height="450px"> </iframe>
    </div>
   
</centre>

</body>
</html>