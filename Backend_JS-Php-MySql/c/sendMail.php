<?php
	session_start();
	// Import PHPMailer classes into the global namespace
	// These must be at the top of your script, not inside a function
	use PHPMailer\PHPMailer\PHPMailer;
	use PHPMailer\PHPMailer\SMTP;
	use PHPMailer\PHPMailer\Exception;

	if(!empty($_GET['file'])){
		$file = $_GET['file'];
	}

	$sendEmail = $emailErr =  "";
	$subject = $body = "";
	$type = $typeErr = "";
	$mailMsg = "";
	if(isset($_POST['submit'])){
		// validating email
		if(empty($_POST['email'])){
			$emailErr = "Required!";
		}else{
			$sendEmail = $_POST['email'];
			if (!filter_var($sendEmail, FILTER_VALIDATE_EMAIL)) {
			  $emailErr = "Invalid email format";
			}
		}

		if($_POST['type'] == "-1"){
			$typeErr = "Select one option";
		}else{
			$type = $_POST["type"];
			if($type == "offerletter"){
				$subject = "Congrats! and Thanks for Showing interest to be a part of our Organisation & here our Offer letter.";
				$body = "
					Dear Candidate, Please Find your offer letter in the attachment.  Please reply here in acceptance of this internship offer within 10 days of this mail.
					<br><br>
					For any other query or suggestion, Feel free to let us know at
					:https://wa.me/918851719915  , +919205137675
				";
			}else{
				$subject = "Here your Internship certificate/";
				$body = "
					Dear Candidate, Please Find your certificate in the attachment.  
					<br><br>
					For any other query or suggestion, Feel free to let us know at
					:https://wa.me/918851719915  , +919205137675
				";
			}
		}

		if($emailErr == "" and $typeErr == ""){

			// Load Composer's autoloader
			require './phpmailer/vendor/autoload.php';

			// Instantiation and passing `true` enables exceptions
			$mail = new PHPMailer(true);

			try {
				//Server settings
				
				//$mail->IsSMTP();
				$mail->SMTPDebug = 2;
				$mail->CharSet = 'UTF-8';
				$mail->Host = "smtp.gmail.com";
				$mail->SMTPAuth= true;
				$mail->SMTPSecure = 'tls';
				$mail->Port = 587;
				$mail->Username= 'skillexpoo@gmail.com';
				$mail->Password= 'lipk.000';

				$mail->SMTPOptions = array(
					'ssl' => array(				
						'verify_peer' => false,				
						'verify_peer_name' => false,
						'allow_self_signed' => true
					)
				);

			    //Recipients
			    $mail->setFrom('info@slogfy.xyz', 'HR Team @ROBOSLOG, Slogfy');
			    $mail->addAddress($sendEmail);     // Add a recipient
			        $mail->addCC('narendra@roboslog.in');
$mail->addReplyTo('info@roboslog.in', 'Roboslog Official');
			    // Attachments
			    $mail->addAttachment($file);         // Add attachments
			    //$mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name

			    // Content
			    $mail->isHTML(true);                                  // Set email format to HTML
			    $mail->Subject = $subject;
			    $mail->Body    = $body;

			    $mail->send();
			    $mailMsg = 'Email sent successfully!';
			} catch (Exception $e) {
			    $mailMsg = "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
			}
		}
	}


	
?>
<!DOCTYPE html>
<html>
<head>
	<title>sendMail</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<style type="text/css">
		body{
			padding: 5rem 0;
		}
		embed{
			width: 50%;
			height: 100vh !important;
			margin: 2rem 0 0 50%;
			transform: translateX(-50%);
		}
	</style>
</head>
<body>

	<h1 class="text-center">Send mail to</h1>

	<form class="text-center w-50 mx-auto" action="" method="POST">
		<div class="row">
			<div class="col-lg-6">
				<input type="text" class="form-control" placeholder="Enter email" name="email" value="<?php echo $sendEmail; ?>">
				<span class="text-danger"><?php echo $emailErr; ?></span>
			</div>
			<div class="col-lg-6">
				<select name="type" class="form-control">
					<option value="-1">----Document Type----</option>
					<option value="offerletter">1. Offer Letter</option>
					<option value="certificate">2. Internship Certificate</option>
				</select>
				<span class="text-danger"><?php echo $typeErr; ?></span>
			</div>
		</div>
		<span class="text-success"><?php echo $mailMsg; ?></span><br>
		<a href="./dashboard.php" class="btn btn-dark mt-3">Go to Dashboard</a>
		<input type="submit" class="btn btn-primary mt-3" name="submit" value="Send Mail">
	</form>

	<embed src="<?php echo $file; ?>"/>

	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" integrity="sha384-1CmrxMRARb6aLqgBO7yyAxTOQE2AKb9GfXnEo760AUcUmFx3ibVJJAzGytlQcNXd" crossorigin="anonymous"></script>
</body>
</html>