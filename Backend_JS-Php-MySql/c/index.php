<!DOCTYPE html>
<html>
    <head>
        <title>Certificate Page</title>
            <meta name="viewport" content="width=device-width, initial-scale-1">
        <link rel="stylesheet" type="text/css" href="Style_letter.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
  .l{
  float: left;
   margin: 0;
  padding: 0;
  overflow: hidden;
  list-style-type: none;
}
</style>
    </head>
    <body>
        <header>
            <div class="main">
                <div class="logo">
                    <a href="#"><img src="images/logo.png" ></a>
                </div>
            <div class="menu-bar">
    <ul>
        <li ><a href="index.php"><i class="fa fa-home"></i>Home</a></li>
        <li class="active"><a href="index.php"><i class="fa fa-pencil"></i>Create</a>
        </li>
       
    </ul>
    </div>
            </div>
        </header>

<div class="tab">
  <button class="active">Select Design</button>
 <button><a>Personalize</a></button>
 
</div>

<div>
  <h3>Select a Certificate:</h3><br/>
  <ul id="design">
         
<li><a href="ic.php"><img src="images/web.jpg" width="100" height="80" >Certificate</a></li>
<li><a href="iol.php"><img src="images/offer.jpg" width="100" height="80"> Offer_letter</a></li>
<li><a href="Quiz_Page.html"><img src="images/quiz.jpg" width="100" height="80">Quiz </a></li>

</div>


<script>
function openMenu(evt, menuName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(menuName).style.display = "block";
  evt.currentTarget.className += " active";
}
</script>
 
</body>
</html> 
