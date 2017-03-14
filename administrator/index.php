<?php
mysqli_report(MYSQLI_REPORT_STRICT);
$db_connection = new mysqli("localhost","root","raffo","adplify_manager");
$result = $db_connection->query("SELECT id,name FROM users");
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>ADPLify Administrator</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="./css/bootstrap.min.css">
  <script src="./js/jquery.min.js"></script>
  <script src="./js/bootstrap.min.js"></script>

</head>
<body>

<div class="container">
  <div class="jumbotron">
    <h1>ADPLify BATCH Administrator </h1>
    <p>Amministrazione temporanea per inserimento BATCH.</p>
  </div>

  <form action="test.php" method="POST">
	   <div class="form-group">
	      <label for="id_schedulazione">Schedulazione</label>
	      <select class="form-control" id="id_schedulazione" name="id_schedulazione">
	         <option value="-1">New Batch</option>
	         <option value="1">Modify Batch</option>
	      </select>
	    </div>

	<div class="form-group">
      <label for="hostname">Hostname</label>
      <input type="text" class="form-control" id="hostname" name="hostname" value="devadplify">
    </div>
     <div class="form-group">
      <label for="id_user">Utente</label>
      <select class="form-control" id="id_user" name="id_user">
      <?php

        $result = $db_connection->query("SELECT id,name FROM users");
        while($row = $result->fetch_assoc())
          {

              echo  "<option value=\"".$row['id'] ."\">".$row['name']."(".$row['id'].")" ."</option><br>";
          }
      ?>
      </select>

      <div class="form-group">
      <label for="id_batch">Batch</label>
      <select class="form-control" id="id_batch" name="id_batch">
      <?php
        $db_connection->select_db("adplify_scheduler");
        $result = $db_connection->query("SELECT id_batch,descr_batch FROM batch_lib");
        while($row = $result->fetch_assoc())
          {

              echo  "<option value=\"".$row['id_batch'] ."\">".$row['descr_batch']."(".$row['id_batch'].")" ."</option><br>";
          }
      ?>
      </select>
    </div>

    <div class="form-group">
      <label for="type_schedulazione">Tipo schedulazione</label>
      <select class="form-control" id="type_schedulazione" name="type_schedulazione">
      <?php
        $db_connection->select_db("adplify_scheduler");
        $result = $db_connection->query("SELECT id_type_schedulazione,descrizione FROM sc_type_schedulazione_lib");
        while($row = $result->fetch_assoc())
          {

              echo  "<option value=\"".$row['id_type_schedulazione'] ."\">".$row['descrizione']."(".$row['id_type_schedulazione'].")" ."</option><br>";
          }
      ?>
      </select>
    </div>

    <div class="form-group">
      <label for="frequenza">Frequenza</label>
      <input type="text" class="form-control" id="frequenza" name="frequenza" placeholder="10800">
    </div>

    <div class="form-group">
      <label for="stato_schedulazione">Stato Schedulazione</label>
      <select class="form-control" id="stato_schedulazione" name="stato_schedulazione">
      <?php
        $db_connection->select_db("adplify_scheduler");
        $result = $db_connection->query("SELECT id_stato_schedulazione,descrizione FROM sc_stato_schedulazione_lib");
        while($row = $result->fetch_assoc())
          {

              echo  "<option value=\"".$row['id_stato_schedulazione'] ."\">".$row['descrizione']."(".$row['id_stato_schedulazione'].")" ."</option><br>";
          }
      ?>
      </select>
    </div>

 <div class="form-group">
      <label for="time_start">Start Time</label>
      <input type="text" class="form-control" id="time_start" name="time_start" placeholder="2017-03-15 09:00:00">
    </div>

	    <button type="submit" class="btn btn-success">Submit</button>
  </form>

</div>

</body>
</html>