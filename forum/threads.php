<?php 
include "partials/_dbconnect.php"
?>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css" class="css">
    <title>Welcome to iDiscuss Forum</title>
</head>

<body>

    <?php include"partials/_header.php" ?>
    <?php include"partials/_dbconnect.php" ?>
    <?php 
    $id=$_GET['catid'];
    $sql ="SELECT * FROM `categories` WHERE category_ID=$id";
    $result =mysqli_query($conn, $sql);

    while($row =mysqli_fetch_assoc($result)){
        $catname= $row['category_name'];
        $catdesc =$row['category_description'];
    }
    
    ?>
     <?php
    $showalert=false;
    if($_SERVER["REQUEST_METHOD"] == "POST"){
        $th_title=$_POST['title'];
        $th_desc=$_POST['desc'];
        $sql="INSERT INTO `thread` (`thread_id`, `thread_title`, `thread_desc`, `thread_cat_id`, `thread_user_id`, `time`) VALUES ( '$th_title', '$th_desc', '$id', '0', current_timestamp())";
        $result= mysqli_query($conn,$sql);
        $showalert= true;
        if($showalert){
            echo '<div class="alert alert-success alert-dismissible fade show" role="alert">
          <strong>Success!</strong> Your comment has been succesfully posted.
          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>';
        }
            
    }
    ?>
    


    <!-- category  -->
    <div class="container my-3">
        <div class="jumbotron ">
            <h1 class="display-4"> Welcome to <?php echo $catname;?></h1>
            <p class="lead"><?php echo $catdesc; ?></p>
            <hr class="my-4">
            <p>his is a platform to solve issues and doubts
                No Spam / Advertising / Self-promote in the forums. ...
                Do not post copyright-infringing material. ...
                Do not post “offensive” posts, links or images. ...
                Do not cross post questions. ...
                Do not PM users asking for help. ...
                Remain respectful of other members at all times.


            </p>

            <a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a>
            </p>
        </div>
       
        <div class="container">
            <h1 class="py-2">Start the discussion </h2>
                <form action="<?php echo $_SERVER['REQUEST_URI']?>" method="post">
                    <div class="form-group">

                        <label for="exampleInputEmail1">Problem Title</label>
                        <input type="text" class="form-control" id="title" name="title" aria-describedby="emailHelp"
                            placeholder="">
                        <small class="form-text text-muted">Keep the problem title as short and accurate.</small>
                    </div>
                    <div class="form-group mt-2">
                        <label for="exampleFormControlTextarea1">Ellaborate the issue..</label>
                        <textarea class="form-control" id="desc" name="desc" rows="3"></textarea>
                    </div>


                    <button type="submit" class="btn btn-success mt-2">Submit</button>
                </form>

        </div>

        <div class="ques container" id="ques">
            <h3 class="text-center">Browse questions</h3>
            <?php 
    $id=$_GET['catid'];
    $sql ="SELECT * FROM `thread` where thread_cat_id=$id";
    $result =mysqli_query($conn, $sql);
    $noresult= true;

    while($row =mysqli_fetch_assoc($result)){
        $noresult=false;
        $id= $row['thread_id'];
        $title= $row['thread_title'];
        $desc =$row['thread_desc'];
        $thread_time =$row['time'];

       echo '<div class="media">
        <img class="align-self-center mr-3 mt-2 " src="img/user.jpg" width="30px;" alt="..">
        <div class="media-body" style="float:center;">
        <p class="font-weight-bold my-0">Anonymous user at ' . $thread_time . ' </p>
        <h5 class="mt-0  "><a href="thread.php?threadid=' . $id . '">' . $title. '</a></h5>
            ' . $desc. ' 

        </div>
    </div>';
    }
    //echo var_dump($noresult);
    if($noresult){
        echo 
        '<div class="jumbotron jumbotron-fluid mt-3">
        <div class="container">
          <h1 class="display-4">No Questions Found</h1>
          <p class="lead">Be the first one to ask question...</p>
          
        </div>
      </div>';
    }
    
    ?>



            <?php include"partials/footer.php" ?>

            <!-- Optional JavaScript; choose one of the two! -->

            <!-- Option 1: Bootstrap Bundle with Popper -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
                crossorigin="anonymous">
            </script>

            <!-- Option 2: Separate Popper and Bootstrap JS -->
            <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js" integrity="sha384-lpyLfhYuitXl2zRZ5Bn2fqnhNAKOAaM/0Kr9laMspuaMiZfGmfwRNFh8HlMy49eQ" crossorigin="anonymous"></script>
    -->
</body>

</html>