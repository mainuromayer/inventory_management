<?php
include('./session/index.php');
$validation_errors = isset($_SESSION['validation_error']) ? $_SESSION['validation_error'] : [];
$passwordError = array_key_exists('password',$validation_errors) ? $validation_errors['password']:"";
unset($_SESSION['validation_error']);
$id = null;
if(isset($_GET['id']) && !empty($_GET['id'])){
    $id = $_GET['id'];
}
else{
    header("Location:./errors/");
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Password Reset</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

    <link rel="stylesheet" href=".//assets//css//password_reset.css">
</head>
<body>
    <div class="row mt-5 text-center">

    <div class="col-4 col-md-4 col-sm-12"></div>

    <div class="col-4 col-md-4 col-sm-12 bg-light">
        <form action="actions/auth.php" class="p-3" method="post">
            <h3 class="pb-4">Forgot Password</h3>
            <p style="color:<?php echo $status == true ? 'green':($status == false?"red":"black"); ?>"><?php echo $msg;?></p>
            <input type="hidden" name="action" value="password_reset"/>
            <input type="hidden" name="id" value="<?php echo $id;?>"/>

            <div class="form-group">
            <input type="password" name="password" id="password" placeholder="Enter your Password"  class="form-control">
                <span style="color:red"><?php echo $passwordError;?></span>
            </div>

            <br>
            
            <div class="d-grid">
                <button type="submit" class="btn btn-dark btn-block">Submit</button>
            </div>
        </form>
    </div>

    <div class="col-4 col-md-4 col-sm-12"></div>

    </div>














    </form>
</body>
</html>