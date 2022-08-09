

<!DOCTYPE html>

<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Details</title>
    <link rel="stylesheet" type="text/css" href="Style_Main.css">
    <link rel="stylesheet" type="text/css" href="Style_letter.css"> <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/datepicker/0.6.5/datepicker.min.css" rel="stylesheet"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/datepicker/0.6.5/datepicker.min.js"></script>

</head>

<body >

    <header>
		<div class="main">
			<div class="logo">
				<a href="#"><img src="images/logo.png" height="50" width="70"></a>
			</div>
		<div class="menu-bar">
<ul>
    <li><a href="index.php"><i class="fa fa-home"></i>Home</a></li>
	<li class="active"><a href="index.php"><i class="fa fa-pencil"></i>Create</a></li>
	
</ul>
</div>
		</div>
	</header>     
    <div class="details">
            <div class="form-container">
            
                <form method="post" action="Internshipletter.php" enctype="multipart/form-data">
 
                     <div class="form-group">
                        <label>Candidate Name:</label>
                        <input class="form-control" type="text" placeholder="Name " name="cname" required>
                    </div>
                    <div class="form-group">
                        <label>College Name:</label>
                        <input class="form-control" type="text" placeholder="College " name="college" required >
                        
                    </div>
                    <div class="form-group">
                        <label>Email ID:</label>
                        <input class="form-control" type="email" placeholder="Email ID " name="email" required >
                        
                    </div>
                    <div class="form-group">
                        <label for="ap">Duration:</label>
                        <input class="form-control" type="text" placeholder="eg.1 month" name="duration">
                    </div>
                    
                    <div class="form-group">
                        <label for="ap">Stipend:</label>
                        <input class="form-control" type="text" placeholder="eg. 2000 INR" name="stipend">
                    </div> 

                    <div class="form-group">
                        <label for="ap">Supervisor:</label>
                        <input class="form-control" type="text" placeholder="eg. Narendra verma " name="supervisor">
                    </div>

                    <div class="form-group">
                        <label for="ap">Confirm Date:</label>
                        <input class="form-control" type="date" id="datepicker" placeholder="Confirm Date " name="Cdate">
                    </div>
                    <div class="form-group">
                        <label for="ap">Job_Profile:</label>
                        <select class="form-control" name="dept">
                       <option class="form-control" value="Robotics Developer">Robotics Developer</option>
                        <option class="form-control" value="Web Developer">Web Developer</option>
                        <option class="form-control" value="Mobile App Developer">Mobile App Developer </option>
                         <option class="form-control" value="Social/SEO Marketing">Social/SEO Marketing</option>
                        <option class="form-control" value="CAD cum Product Designer">CAD cum Product Designer </option>
                        <option class="form-control" value="Graphics Designer">Graphics Designer</option>
                         <option class="form-control" value="Game Developer">Game Developer</option>
                        <option class="form-control" value="Python Developer">Python Developer</option>
                         <option class="form-control" value="Electronics Trainee">Electronics Trainee</option>
                        <option class="form-control" value="A.I. Researcher">A.I. Researcher</option>
                        <option class="form-control" value="Data Scientist">Data Scientist</option>
                        </select>
                    </div>
                    
                   
                    <div class="form-group">
                        <label >Signature:</label><br>
                        <div class="upload-btn-wrapper">
                            
                            <button class="btn1">Upload an image</button>
                            <input type="file" name="img">
                        </div>
                       
                    </div>
                   
                    <div class="form-group">
                         <button class="btn btn-primary btn-block" type="submit" style="margin-top: 10px; margin-left: 40px">Next</button>
                    </div>
                </form>
            </div>
        </div>
  
</body>

</html>
