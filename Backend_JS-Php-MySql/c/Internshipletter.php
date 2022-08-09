<?php  
        date_default_timezone_set('Asia/Kolkata');//Set to indian time zone 
        
        $no=date('dmyHi');//Application No.
        //To get the Data from the form
        $name=$_POST['cname'];
        $sname=explode(' ',$name);
        $college=$_POST['college'];
        $email=$_POST['email'];
        $Job_Profile=$_POST['dept'];
        $img=$_FILES['img']['name'];//Sign image 
        $duration=$_POST['duration'];
        $stipend=$_POST['stipend'];
        $supervisor=$_POST['supervisor'];
        $date=date('d M Y');//To set the Letter date 
        
        if(empty($duration))
        {
             $duration='2 months';//Set the default value as 6weeks
        }
        if(empty($stipend))
        {
             $stipend='unpaid';//Set the default value as 6weeks
        } 
        if(empty($supervisor))
        {
             $supervisor='Mr. Narendra Verma';//Set the default value as 6weeks
        }

        if(empty($img))
         {
             $img='images/sign.jpg';//Set default sign 
         }
         $datec=$_POST['Cdate'];
         
         if(empty($datec))
         {
             
             $date_confirm=date('d').' '.date('M').' '.date('Y');//Set default sign 
         }

         else
         {//To covert Date to format (date month year)
            $date_C=explode('-',$datec); 
            $date_confirm= $date_C[2];
            $mon="";
            switch ($date_C[1]) 
            {
                case 1:$mon=" Jan";
                    break;
                case 2:$mon=" Feb";
                break;
                case 3:$mon=" Mar";
                break;
                case 4:$mon=" Apr";
                break;
                case 5:$mon=" May";
                break;
                case 6:$mon=" Jun";
                break;
            case 7:$mon=" Jul";
            break;
            case 8:$mon=" Aug";
            break;
            case 9:$mon=" Sept";
            break;
            case 10:$mon=" Oct";
            break;
            case 11:$mon=" Nov";
            break;
            case 12:$mon=" Dec";
            break;
        }

        $date_confirm.=$mon." ".$date_C[0];
         }

        require('justification.php');
        //Add new page to pdf
        $pdf = new FPDF('P');
        $pdf->AddPage();
        
        //set the draw and fill colours 
        $pdf->SetFillColor(79,129,189);
        $pdf->SetDrawColor(79,129,189);
        $pdf->SetLineWidth(0.5);
       
        $pdf->Image('images/logo.png',25.5, 15, 18,15);//add the image on left cornor 
        
        $pdf->Rect(10,10,190,277,"D");//Border
        //headerLine 
        $pdf->SetLineWidth(1);
        $pdf->SetDrawColor(47,149,204);
        $pdf->Line(28.5,38.5,41.5,38.5);
        
        $pdf->SetDrawColor(200,201,203);
        $pdf->Line(42.5,38.5,180.5,38.5);
        
        
        //Footer 
        $pdf->SetFillColor(47,149,204);
        $pdf->SetDrawColor(47,149,204);
        $pdf->Rect(1,286,210,11,"DF");
        
        //Footer Line
        $pdf->SetLineWidth(1);
        $pdf->SetDrawColor(47,149,204);
        $pdf->Line(28.5,260.5,41.5,260.5);
        
        $pdf->SetDrawColor(200,201,203);
        $pdf->Line(42.5,260.5,180.5,260.5);
        
        //To get the divisions 
        $pdf->SetLineWidth(0.5);
        $pdf->SetDrawColor(47,149,204);
        $pdf->Line(79,263.5,79,270.5);
        $pdf->Line(129.5,263.5,129.5,270.5);
        
        //Mail information
        $pdf->SetFont('Times','',8);
        $pdf->Image('images/mail.png',31.5,263.5,6,5);
        $pdf->SetXY(40.5,264.5);
        $pdf->Write(5,"info@roboslog.in");
        
        //Website information
        $pdf->Image('images/website.png',86.5,263.5,6,6);
        $pdf->SetXY(97.5,264.5);
        $pdf->Write(5,"www.roboslog.in");
        
        //Location information 
        $pdf->Image('images/location.png',136.5,263.5,4,6);
        $pdf->SetXY(143.5,263.5);
        $pdf->Write(5,"Address: B-76,Gurukul library");
        $pdf->SetXY(153.5,266.5);
        $pdf->Write(5,"Saket, Delhi, 110030");
        
       //To add additional fonts 
        $pdf->AddFont('arial','','arial.php');
        $pdf->AddFont('arial','B','arialbd.php');
        
        $pdf->SetFont('Times','B',16);
        
        //Heading of letter 
        $pdf->SetXY(74.5,30.5);
        $pdf->Write(5,"Internship Offer Letter");
        
        //Phone image and details
        $pdf->Image('images/phone.png',158.5,13.5,5,5);
        $pdf->SetFont('arial','B',10);
        $pdf->SetXY(162.5,13.5);
        $pdf->Write(5,"+91 8851719915");
       
        
        //Start of letter
        $pdf->SetFont('arial','',11);
        
        $pdf->SetXY(26.5,43.5);
        $pdf->Write(5,"Roboslog Pvt.Ltd./R&D/2020/RSI".$no);//Displays Applicattion number 
        
        $pdf->SetXY(26.5,49.5);
        $pdf->Write(5,$date_confirm);//Date of the letter 
        
        $pdf->SetXY(26.5,55.5);
        $pdf->Write(5,$name);//Candidate's name
        
        $pdf->SetXY(26.5,61.5);
        $pdf->Write(5,$college);//College 
        
        $pdf->SetXY(26.5,72.5);
        $pdf->Write(5,"Sub: Internship offer Letter for ".$duration);//Suject of letter 
        
        $sal="Dear ".$sname[0];

        $pdf->SetXY(26.5,82.5);
        $pdf->Write(5,$sal);//Salutation of letter 
        
        $pdf->SetMargins(26.5, null,26.5);//set left and right margins 
        
        //To set the messages in diff paragraphs 
        $msg1="We are pleased to offer you an educational internship opportunity as ".$Job_Profile." Intern. You will report directly to Mr Narendra Your immediate supervisor will be $supervisor. We trust that your knowledge, skills and experience will be among our most valuable assets.";
        $msg2="As discussed, and agreed with you, the internshp is $stipend , and company will not be liable for any kind of other monetary components/benefits. Your role and salary structure will be revised if we will hire you in future.";
        $msg3="This offer letter must be signed within 10 days from ".$date.". Please send asigned copy of this letter indicating your acceptance to join us or you can reply to mail only before this date.";
        $msg4="Upon acceptance of our offer, This Offer letter will be treated as Joining letter and Other joining formalities will be carried out through mail as for remote internship. Also If you will not perform well during this internship, we can terminate your internship without prior notice.";
        
        $pdf->SetXY(26.5,90.5);
        $pdf->MultiCell(0, 5,$msg1,0 ,"J");//message 1
        
        $pdf->SetXY(26.5,111.5);
        $pdf->MultiCell(0, 5,$msg2,0 ,"J");//message 2
        
        $pdf->SetXY(26.5,126.5);
        $pdf->MultiCell(0, 5,$msg3,0 ,"J");//message 3
        
        $pdf->SetXY(26.5,141.5);
        $pdf->MultiCell(0, 5,$msg4,0 ,"J");//message 4
        
        //Signature and regards
        $pdf->SetXY(26.5,160.5);
        $pdf->Write(5,"We look forward to welcome you aboard.");// 
        
        $pdf->SetXY(26.5,164.5);
        $pdf->Write(5,"With Best Regards,");
        
        $pdf->SetXY(26.5,172.5);
        $pdf->Write(5,"Sincerely");
        
        $pdf->SetXY(26.5,178.5);
        $pdf->Write(5,"Kapil Singh");
        
        $pdf->SetXY(26.5,183.5);
        $pdf->Write(5,"HR Head,");
        
        $pdf->SetXY(26.5,188.5);
        $pdf->Write(5,"RoboSlog");
        
        $pdf->SetXY(26.5,196.5);
        $pdf->Write(5,'Authorized Signatory :');
        $pdf->Image($img,27.5,205.5,70,35);
        
        $file_pdfpath="certificate/".$email.".pdf";//Change this according to the folder name given 
        $pdf->Output($file_pdfpath,'F');//Forces download in the path specified 
        
?>

<!DOCTYPE html>
<html>
<head>
	<title>Preview</title>
</head>
<body>
<centre>
    
    <div style="display:flex; align-items: center; justify-content: center;">
        
        <h1>Congrats ! Here Your Offer letter </h1>
    </div>
    <div style="display:flex; align-items: center; justify-content: center;">
        <h3>Preview </h3>
    </div>       
        
   <div style="display:flex; align-items: center; justify-content: center;">
        
        <iframe src="<?php echo $file_pdfpath; ?>" width="400px" height="500px"> </iframe>
    </div>
   
</centre>

</body>
</html>

