
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

    $sql = "SELECT DISTINCT Sizes.ID, Sizes.Size FROM Stock INNER JOIN Sizes ON Stock.SizeID = Sizes.ID";
    $result = mysqli_query($con, $sql);

    if (!$result) {
      echo "No result";
    }

    echo "<option value=''>Mind</option>";
    while($row = mysqli_fetch_array($result)) {
      echo "<option value=" . $row['ID'] . ">" . $row['Size'] . "</option>";
    }
    mysqli_close($con);
  ?>

</body>
</html>