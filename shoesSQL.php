
<!DOCTYPE html>
<html>
<head>

</head>
<body>
  <?php
    $colourID = intval($_GET['colourID']);
    $sizeID = intval($_GET['sizeID']);
    $order = $_GET['order'];


    $con = mysqli_connect('localhost','root','peter','Shoes');
    if (!$con) {
      die('Could not connect: ' . mysqli_error($con));
    }

    $sql = "SELECT  Stock.ID, Supply.PictureURL, Supply.Name, Supply.Brand, Supply.PriceOld, Supply.PriceRecent,
                    Supply.DateOfArrival, Colours.Colour, Sizes.Size FROM Stock
            INNER JOIN Supply ON Stock.SupplyID = Supply.ID
            INNER JOIN Colours ON Stock.ColourID = Colours.ID
            INNER JOIN Sizes ON Stock.SizeID = Sizes.ID";

    if ( boolval($colourID) || boolval($sizeID) ) {
      $sql .= " WHERE";
      
      if ( boolval($colourID) ) {
      $sql .= " ColourID = '" . $colourID . "' AND";
      }
      
      if ( boolval($sizeID) ) {
        $sql .= " SizeID = '" . $sizeID . "'";
      } else {
        $sql = substr($sql, 0, -4);
      }
    }
    
    $sql .= " ORDER BY ";

    if ( boolval($order) ) {
      $sql .= $order;
      if ( $order == "DateOfArrival" ) {
        $sql .= " DESC";
      }
    } else {
      $sql .= "ID";
    }

    $sql .= " LIMIT 0, 8";
    
    $result = mysqli_query($con, $sql);

    while($row = mysqli_fetch_array($result)) {
      echo '<div class="item">';
      echo '<img src="' . $row['PictureURL'] . '" alt="">';
      echo '<div class="footer">';
      echo '<span class="name">' . $row['Name'] . '</span><br>';
      echo '<span class="brand">' . $row['Brand'] . '</span><br>';
      echo '<span class="price-container">';
      if ($row['PriceOld'] != '') {
        echo '<s class="price-old">' . $row['PriceOld'] . ' Ft</s>';
      }  
      echo '<span class="price-recent">' . $row['PriceRecent'] . ' Ft</span>';
      echo '</span>';
      echo '</div>';
      echo '</div>';
    }
    mysqli_close($con);
  ?>

</body>
</html>