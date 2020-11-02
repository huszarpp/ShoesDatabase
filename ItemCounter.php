
<!DOCTYPE html>
<html>
<head>

</head>
<body>
  <?php
    $con = mysqli_connect('localhost','root','peter','Shoes');
    if (!$con) {
      die('Could not connect: ' . mysqli_error($con));
    }

    $sql = "SELECT COUNT(*) FROM Stock";
    $result = mysqli_query($con, $sql);

    $row = mysqli_fetch_array($result);
    echo $row[0];

    mysqli_close($con);
  ?>

</body>
</html>