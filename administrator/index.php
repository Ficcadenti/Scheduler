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
        $result = $db_connection->query("SELECT * FROM sc_type_schedulazione_lib");
        while($row = $result->fetch_assoc())
          {
              echo  "<option value=\"".$row['id_type_schedulazione'] ."\">".$row['descr_type_schedulazione']."(".$row['id_type_schedulazione'].")" ."</option><br>";
          }
      ?>
      </select>
    </div>

    <div class="form-group">
      <label for="download_report_type">Download Report Type</label>
      <select class="form-control" id="download_report_type" name="download_report_type">
      <?php
        $db_connection->select_db("adplify_scheduler");
        $result = $db_connection->query("SELECT * FROM batch_type_lib");
        while($row = $result->fetch_assoc())
          {
              echo  "<option value=\"".$row['id_download_report_type'] ."\">".$row['descrizione']."(".$row['id_download_report_type'].")" ."</option><br>";
          }
      ?>
      </select>
    </div>
    
    <div class="form-group">
       <div class="row">
        <div class="col-sm-3"><b>Abilita Anagrafiche</b></div>
        <div class="col-sm-9">
      		<div class="btn-group" data-toggle="buttons">
                <label class="btn btn-default">
                    <input type="radio" id="abilita_anagrafiche" name="abilita_anagrafiche" checked="checked" value="1" /> Si
                </label> 
                <label class="btn btn-default">
                    <input type="radio" id="abilita_anagrafiche" name="abilita_anagrafiche" value="0" /> No
                </label> 
            </div>
          </div>
          </div>
    </div>
    
    <div class="form-group">
       <div class="row">
        <div class="col-sm-3"><b>Abilita Metriche</b></div>
        <div class="col-sm-9">
      		<div class="btn-group" data-toggle="buttons">
                <label class="btn btn-default">
                    <input type="radio" id="abilita_metriche" name="abilita_metriche" checked="checked" value="1" /> Si
                </label> 
                <label class="btn btn-default">
                    <input type="radio" id="abilita_metriche" name="abilita_metriche" value="0" /> No
                </label> 
            </div>
          </div>
          </div>
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
        $result = $db_connection->query("SELECT id_stato_schedulazione,descr_stato_schedulazione FROM sc_stato_schedulazione_lib");
        while($row = $result->fetch_assoc())
          {

              echo  "<option value=\"".$row['id_stato_schedulazione'] ."\">".$row['descr_stato_schedulazione']."(".$row['id_stato_schedulazione'].")" ."</option><br>";
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