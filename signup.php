<?php
require("./session/index.php");
$validation_errors = isset($_SESSION['validation_errors']) ? $_SESSION['validation_errors']:[];

$nameError = array_key_exists('name',$validation_errors) ? $validation_errors['name']:"";
$phoneError = array_key_exists('phone',$validation_errors) ? $validation_errors['phone']:"";
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
    <title>SignUP</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

    <link rel="stylesheet" href=".//assets//css//login.css">
    
</head>
    <body>
        <h3 class="logo pt-4 text-center">Inventory Management System</h3>
        <p class="text-center pb-3">The faster you fill up, the faster you get a ticket</p>

        <div class="container d-flex pt-4 pb-4">
            <div class="col-3 col-md-3"></div>
            
            <!-- Main Content Start -->
            <div class="col-6 col-md-6 bg-white shadow-sm rounded">
                <div class="card">
                    <div class="card-header">
                        <p class="text-custom card-title text-center">Sign Up Form</p>
                    </div>
                    <div class="card-body">

                        <!-- From Start -->
                        <form action="./actions/auth.php" method="post">
                            <input type="hidden" name="action" value="signup">
                            <div class="form-group">
                                <label for="name">Name:</label>
                                    <input type="text" class="form-control" id="name" name="name">
                                    <span class="text-danger"><?php echo $nameError; ?></span>
                            </div>
                            <div class="form-group">
                                <label for="phone">Phone:</label>
                                    <input type="text" class="form-control" id="phone" name="phone">
                                    <span class="text-danger"><?php echo $phoneError; ?></span>
                            </div>
                            <div class="form-group">
                                <label for="email">Email:</label>
                                    <input type="email" class="form-control" id="email" name="email">
                                    <span class="text-danger"><?php echo $emailError; ?></span>
                            </div>
                            <div class="form-group">
                                <label for="password">Password:</label>
                                    <input type="password" class="form-control" id="password" name="password">
                                <span class="text-danger"><?php echo $passwordError; ?></span>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="mt-4 btn btn-success">SignUp</button>
                            </div>
                        </form>
                        <!-- From End -->

                    </div>
                </div>
            </div>
            <!-- Main Content End -->

            <div class="col-3 col-md-3"></div>
        </div>
    </body>
</html>