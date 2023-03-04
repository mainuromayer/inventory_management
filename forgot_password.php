<?php
include('./session/index.php');
$validation_errors = isset($_SESSION['validation_error']) ? $_SESSION['validation_error'] : [];
$emailError = array_key_exists('email',$validation_errors) ? $validation_errors['email']:"";
unset($_SESSION['validation_error']);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot password</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

    <link rel="stylesheet" href=".//assets//css//forgot_password.css">

</head>
<body>
    <div class="row mt-5 text-center">

        <div class="col-4 col-md-4 col-sm-12"></div>

        <div class="col-4 col-md-4 col-sm-12 bg-light">
            <form action="actions/auth.php" class="p-3" method="post">
            <h3 class="pb-4">Forgot Password</h3>
            <p style="color:<?php echo $status == true ? 'green':($status == false?"red":"black"); ?>"><?php echo $msg;?></p>
                <input type="hidden" name="action" value="forgot_password"/>

                <div class="form-group">
                    <input type="email" name="email" id="email" placeholder="Enter your Email" class="form-control" >
                    <span style="color:red"><?php echo $emailError;?></span>
                </div>

                <br>
                
                <div class="d-grid">
                    <button type="submit" class="btn btn-dark btn-block">Submit</button>
                </div>
            </form>
        </div>

        <div class="col-4 col-md-4 col-sm-12"></div>

    </div>
</body>
</html>