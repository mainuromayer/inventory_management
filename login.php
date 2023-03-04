<?php
include('./session/index.php');
$validation_errors = isset($_SESSION['validation_error']) ? $_SESSION['validation_error'] : [];
$emailError = array_key_exists('email',$validation_errors) ? $validation_errors['email']:"";
$passwordError = array_key_exists('password',$validation_errors) ? $validation_errors['password']:"";
unset($_SESSION['validation_error']);
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

    <link rel="stylesheet" href=".//assets//css//login.css">
</head>
<body>


    <h3 class="logo pt-4 text-center">Inventory Management System</h3>
    <p class="text-center pb-3">The faster you fill up, the faster you get a ticket</p>

    <!-- Main Div Start -->
    <div class="d-flex container pt-4 pb-4 gap-3">

        <!-- Content - 1 Start -->
        <div class="content-1 menu-height col-6 col-md-6 bg-white shadow-sm rounded">

            <div class="container pt-5 ps-5 pe-5">

                <!-- From Start -->
                <form action="./actions/auth.php" method="post">
                    <h1 class="text-center pb-3 text-dark">Login Page</h1>

                    <p style="color:<?php echo $status == true ? 'green':($status == false?"red":"black"); ?>"><?php echo $msg;?></p>

                    <input type="hidden" name="action" value='login'>
                    <div class="form-group text-dark"> Email : <br>
                        <input class="form-control bg-transparent" type="email" name="email" id="email" placeholder="Enter Your Email" required>
                        <span style="color:red;"><?php echo $emailError;?></span>
                    </div>
                    <br>
                    <div class="form-group text-dark"> Password : <br>
                        <input class="form-control bg-transparent" type="password" name="password" placeholder="Enter Your Password" required> 
                        <span style="color:red;"><?php echo $passwordError;?></span>
                    </div>

                    <br>

                    <div class="text-center">
                        <a href="forgot_password.php" class="text-dark">Forgot password</a>
                    </div>

                    <br>

                    <div class="d-grid">
                        <button type="submit" class="btn btn-lg btn-dark btn-block">Login</button>
                    </div> 


                    <div class="social_icon text-center pb-5 pt-4">
                        <a href="https://www.facebook.com/profile.php?id=100063525092558" class="me-4" target="_blank">
                            <i class="fa fa-facebook" aria-hidden="true"></i>
                        </a>
                        <a href="https://accounts.google.com/" target="_blank">
                        <i class="fa fa-google" aria-hidden="true"></i>
                        </a>
                    </div>

                    <p class="text-center pb-3 text-dark">didn't have an account? &nbsp; 
                        <button class="btn btn-outline-dark">
                            <a class="sign_up" href="signup.php">sign up</a>
                        </button>
                    </p>

                </form>
                <!-- From End -->

            </div>



        </div>
        <!-- Content - 1 End -->

        <!-- Content - 2 Start -->
        <div class="content-2 menu-height col-6 col-md-6">
            <div class="">
                <p class="text-center">&copy; Mainur Omayer || All right resarve..</p>
                <div class="my-menu text-center">
                    <img src=".//assets//img//information-management-illustration.png" alt="">
                </div>
            </div>
        </div>
        <!-- Content - 2 End -->
    
   
    </div>
     <!-- Main Div End -->

</body>
</html>