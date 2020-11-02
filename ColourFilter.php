
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

    $sql = "SELECT DISTINCT Colours.ID, Colours.Colour FROM Stock INNER JOIN Colours ON Stock.ColourID = Colours.ID";
    $result = mysqli_query($con, $sql);

    if (!$result) {
      echo "No result";
    }

    echo "<option value=''>Mind</option>";
    while($row = mysqli_fetch_array($result)) {
      echo "<option value=" . $row['ID'] . ">" . $row['Colour'] . "</option>";
    }
    mysqli_close($con);
  ?>

</body>
</html>