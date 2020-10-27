<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://image.flaticon.com/icons/svg/2790/2790616.svg?v=1.1.1" rel="icon">
<title>covid-ePass</title>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="form-style.css">
<style>
input.invalid {
  border-color: #ff4c4c;
}

.tab {
  display: none;
}

.topbar-divider {
  width: 0;
  border-right: 1px solid #e3e6f0;
  height: calc(4.375rem - 2rem);
  margin: auto 1rem;
}

textarea{
  margin-bottom: 15px;
  border-radius: 2rem;
  margin-top: 10px;
  margin-left: 4px;
}


button {
  background-color:#007bff ;
  color: #ffffff;
  border: none;
  padding: 10px 20px;
  font-size: 17px;
  font-family: Raleway;
  cursor: pointer;
}

button:hover {
  opacity: 0.8;
}

#prevBtn {
  background-color: #007bff;
}

{
  border-radius: 2rem;
}

.custom-select{
  border-radius: 5rem;
  margin-bottom: 22px;
  height: 45px;
}

.custom-file{
  margin-top: 10px;
  margin-bottom: 25px;
  margin-left: 4px;
}

/* Make circles that indicate the steps of the form: */
.step {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #007bff;
  border: none;
  border-radius: 50%;
  display: inline-block;
  opacity: 0.5;
}

.step.active {
  opacity: 1;
}

/* Mark the steps that are finished and valid: */
.step.finish {
  background-color: #3c94d0;
}
</style>
</head>
<body>

<%
      response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
      
      if(session.getAttribute("user_name")==null){
    	  response.sendRedirect("signin.html");
      }

%>



<div id="topbar" class="d-none d-lg-flex align-items-center fixed-top">
    <div class="container d-flex">
      <div class="contact-info mr-auto">
        <i class="fa fa-envelope" style="color:black;"></i> <a href="tnega@tn.gov.in">tnega@tn.gov.in</a>
        <i class="fa fa-phone" style="color:black;"></i> +91-44-40164907
      </div>
      </div>
    </div>


    <header id="header" class="fixed-top">
      <div class="container d-flex align-items-center">

        <h1 class="logo mr-auto"><a href="index.html">Covid-<span>e</span>Pass</a></h1>
        <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li><a href="index.html">Home</a></li>
          <li><a href="index.html#about">About</a></li>
          <li class="active"><a href="epass.html">E-pass</a></li>
          <li><a href="index.html#contact">Contact</a></li>
          
          <div class="topbar-divider d-none d-sm-block"></div>

          <a style="padding-top: 10px;"class="nav-link dropdown-toggle" href="#" id="userDropdown"  data-toggle="dropdown" >
          <span class="mr-2 d-none d-lg-inline  small">User profile</span>
          <i class="fa fa-user-circle-o" style="font-size:20px; color:#007bff;"></i>
          </a>

          <div class="dropdown-menu dropdown-menu-right">

            <a class="dropdown-item" href="status.jsp">
                  <i class="fa fa-table"></i>
                  Track-status
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="logout" >
                  <i class="fa fa-sign-out"></i>
                  Logout
                </a>
          </div>
        </ul>
      </nav>
    </div>
  </header>


  <section>

  </section>





  <div style="padding-top:100px;"class="container">
    <div class="row">
      <div class="col-lg-10 col-xl-9 mx-auto">
        <div class="card card-signin flex-row my-5">
          <div class="card-body">
            <h5 class="card-title text-center">Register-ePass</h5>
            <form class="form-signin" action="store.jsp">
              <div class="tab">
              <div class ="row">
              <div class="col-md-6"><div class="form-label-group">
                <input type="text"  id="name" class="form-control" placeholder="Full Name"   name="fname" required autofocus>
                <label for="name">Full Name</label>
              </div></div>
              <div class="col-md-6"><div class="form-label-group">
                <input type="date" id="dob" class="form-control" placeholder="Date of Birth"   name="dob" required>
                <label for="dob">Date of Birth</label>
              </div></div></div><b style="font-size:20px;padding:5px;">Contact info:</b>
                   <div class="form-label-group">
                     <input type="email" id="mail" class="form-control" name="email" placeholder="Email"  required>
                     <label for="mail">Email</label>
                   </div>
                   <div class="form-label-group">
                     <input type="text" id="numbr" class="form-control" name="num" placeholder="Phone number" required>
                     <label for="numbr">Phone number</label>
                   </div>
              </div>
              <div class="tab">
                <div class="form-label-group">
                <input type="number" class="form-control" placeholder="Age" name="age" id="age" required><label for="age">Age</label></div>
                <div class="row">
                <div class="col-sm-3"><b style="margin-left:6px;">Choose Gender :</b></div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" name="Gender" id="exampleRadios1" value="M" required>
                  <label class="form-check-label" for="exampleRadios1">
                    Male
                  </label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" name="Gender" id="exampleRadios2" value="F" required>
                  <label class="form-check-label" for="exampleRadios2">
                    Female
                  </label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" name="Gender" id="exampleRadios3" value="O" required>
                  <label class="form-check-label" for="exampleRadios3">
                    Others
                  </label>
                </div></div><br>
                <select name="reason" class="custom-select" required>
            		    <option value="" disabled selected>Travel reason</option>
            		    <option value="function">Marriage/Function</option>
            		    <option value="medical">Medical Emergency</option>
            		    <option value="death">Death</option>
            		    <option value="business">Business Meeting</option>
            		    <option value="work">Work-related</option>
            		  </select><br>
                  <div class="form-label-group">
                <input name="Occupation" class="form-control" placeholder="Occupation" name="occ" id="occupation" required><label for="occupation">Occupation</label></div>
                </div>
              <div class="tab">
                <div class="form-label-group">
            		<input type="text" class="form-control" placeholder="Father's/Mother's Name" name="parentname" id="pname" required>
                <label for="pname">Father's/Mother's Name</label></div>
                <div class="form-label-group">
                <input type="number" class="form-control" placeholder="Number of people" name="no_ppl" id="no_ppl" required><label for="no_ppl">Number of people travelling</label></div>
                <div class="row">
                  <div class="col-md-6"><textarea class="form-control" name="From_addr" rows="6" cols="25" placeholder="From address" required></textarea></div>
                  <div class="col-md-6"><textarea class="form-control" name="To_addr" rows="6" cols="25" placeholder="To address" required></textarea></div>
                </div>

              </div>

              <div class="tab">
                <select name="transport" class="custom-select">
                   <option value="" disabled selected>Vehicle type</option>
                   <option value="bike">Bike(1 person only)</option>
                   <option value="car">Car(2-3 persons only)</option>
                   <option value="taxi">Hired-Taxi(2 persons + driver)</option>
                   <option value="Suv">Suv-cars(4 persons + driver)</option>
                   <option value="Bus">Bus(7 persons + driver)</option>
                 </select>

                 <div class ="row">
                 <div class="col-md-6"><div class="form-label-group">
                   <input type="number"  id="id_no" class="form-control" placeholder="ID proof number"   name="aadhar" required>
                   <label for="id_no">ID proof number</label>
                 </div></div>
                 <div class="col-md-6"><div class="form-label-group">
                   <input type="date" id="travldate" class="form-control" placeholder="Travel Date"   name="travel_date" required>
                   <label for="travldate">Travel Date</label>
                 </div></div></div>

                 <div class="custom-file">
                    <input type="file" class="custom-file-input" id="customFile" name="ID_proof">
                    <label class="custom-file-label" for="customFile">Choose a file for ID-proof</label>
                  </div>

              </div>




              <!--<div><button class="btn btn-primary btn-block text-uppercase" type="submit">Apply</button>-->
    <div style="overflow:auto;">
    <div style="float:right;">
      <button class="btn btn-primary text-uppercase" type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
      <button class="btn btn-primary text-uppercase" type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
    </div>
  </div>
  <!-- Circles which indicates the steps of the form: -->
  <div style="text-align:center;margin-top:40px;">
    <span class="step"></span>
    <span class="step"></span>
    <span class="step"></span>
    <span class="step"></span>
  </div>
  
       <input style="margin-top:1rem;" class="btn btn-primary btn-block text-uppercase" type="submit" value="Register" id="submit">
  

            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

<script>
var currentTab = 0; // Current tab is set to be the first tab (0)
showTab(currentTab); // Display the current tab

function showTab(n) {
  // This function will display the specified tab of the form...
  var x = document.getElementsByClassName("tab");
  x[n].style.display = "block";
  //... and fix the Previous/Next buttons:
  if (n == 0) {
    document.getElementById("prevBtn").style.display = "none";
    document.getElementById("submit").style.display = "none";
  } else {
    document.getElementById("prevBtn").style.display = "inline";
  }
  if (n == (x.length - 1)) {
    document.getElementById("nextBtn").style.display = "none";
    document.getElementById("submit").style.display = "inline";

  } else {
    document.getElementById("nextBtn").innerHTML = "Next";
    document.getElementById("submit").style.display = "none";
  }
  //... and run a function that will display the correct step indicator:
  fixStepIndicator(n)
}

function nextPrev(n) {
  // This function will figure out which tab to display
  var x = document.getElementsByClassName("tab");
  // Exit the function if any field in the current tab is invalid:
  if (n == 1 && !validateForm()) return false;
  // Hide the current tab:
  x[currentTab].style.display = "none";
  // Increase or decrease the current tab by 1:
  currentTab = currentTab + n;
  // if you have reached the end of the form...
  if (currentTab >= x.length) {
    // ... the form gets submitted:
    document.getElementById("regForm").submit();
    return false;
  }
  // Otherwise, display the correct tab:
  showTab(currentTab);
}

function validateForm() {
  // This function deals with validation of the form fields
  var x, y, i, valid = true;
  x = document.getElementsByClassName("tab");
  y = x[currentTab].getElementsByTagName("input");
  // A loop that checks every input field in the current tab:
  for (i = 0; i < y.length; i++) {
    // If a field is empty...
    if (y[i].value == "") {
      // add an "invalid" class to the field:
      y[i].className += " invalid";
      // and set the current valid status to false
      valid = false;
    }
  }
  // If the valid status is true, mark the step as finished and valid:
  if (valid) {
    document.getElementsByClassName("step")[currentTab].className += " finish";
  }
  return valid; // return the valid status
}

function fixStepIndicator(n) {
  // This function removes the "active" class of all steps...
  var i, x = document.getElementsByClassName("step");
  for (i = 0; i < x.length; i++) {
    x[i].className = x[i].className.replace(" active", "");
  }
  //... and adds the "active" class on the current step:
  x[n].className += " active";
}
</script>

</body>
</html>