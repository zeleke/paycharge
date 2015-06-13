<?php
include_once "init.php";
?>
<html>
<head>
<title>Add payment</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</head><body>
<div id="msg_ctn" style="display:none" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-hidden=true">&times;</button>
    <span id="msg"></span>
</div>
<p><button type="button" class="btn btn-primary btn-lg" id="new_pmt" style="display:none;margin:1em">New payment</button></p>

<h1 id="title">Add payment</h1>
<form role="form" id="add">
    <div class="form-group">
        <label for="alias">Unit</label>
        <select name="alias" id="alias" class="form-control">
        <?php foreach($db->query("SELECT alias FROM accounts WHERE current=1 ORDER BY alias ASC") as $unit): ?>
            <option value="<?=$unit['alias']?>"><?=$unit['alias']?></option>
        <?php endforeach; ?>
        </select>
    </div>
    <div class="form-group">
        <label for="cash">Payment</label>
        <input type="text" class="form-control" name="cash" id="cash" placeholder="0.00">
    </div>
    <div class="form-group">
        <label for="tender">Tender</label>
        <select name="tender" id="tender" class="form-control">
            <option value="cash">cash</option>
            <option value="money order">money order</option>
            <option value="check">check</option>
            <option value="card">Square</option>
        </select>
    </div>
    <div class="form-group" style="display:none" id="serial_ctn">
        <label for="serial">Serial</label>
        <input type="text" class="form-control" name="serial" id="serial" placeholder="Serial numer on money order">
    </div>
    <div class="form-group">
        <label for="time">Date and time</label>
        <input type="text" class="form-control" id="time" name="time" value="<?php echo date("m/d/Y h:ia"); ?>">
    </div>
    <div class="form-group">
        <label for="comments">Comments</label>
        <textarea class="form-control" id="comments" name="comments" placeholder="E.g., <?php echo date("M Y"); ?> rent"></textarea>
    </div>
    <button type="submit" class="btn btn-default">Submit</button>
</form>

<div id="receipt" style="display:none">
<h2>Receipt</h2>
<p><h4>Names</h4><span id="names"></span></p>
<p><h4>Balance</h4><span id="balance"></span></p>
</div>

<script>
$(document).ready(function() {
});

$("#add").submit(function(e) {
    e.preventDefault();
    var d = $(this).serializeArray();
    d.push({
        name: "mode",
        value: "send_new"
    });

    $.ajax({
        method: "POST",
        data: d,
        url: "add_process.php"
    }).done(function(c) {
        $("#msg_ctn").show().removeClass().addClass("alert alert-success");
        $("#msg").html("Payment added successfully!");
        $("#new_pmt").show();
    });
});

$("#alias").change(function() {
    var data = {
        mode: "names",
        val: $(this).val()
    };
    $.ajax({
        method: "POST",
        url: "add_process.php",
        data: data
    }).done(function(c) {
        $("#receipt").show();
        $("#names").html(c);
    });
});

$("#cash").blur(function() {
    var data = {
        mode: "bal",
        cash: $(this).val(),
        alias: $("#alias").val()
    };
    $.ajax({
        method: "POST",
        url: "add_process.php",
        data: data
    }).done(function(c) {
        $("#receipt").show();
        $("#balance").html(c);
        $("#alias").triggerHandler("change");
    });
});

$("#tender").change(function() {
    if($(this).val() == "money order") {
        $("#serial_ctn").show();
    }
});
</script>
</body></html>
