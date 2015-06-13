<?php
include_once "init.php";
?>
<html>
<head>
<title>Add charge</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</head><body>

<div class="alert alert-success alert-dismissible" role="alert" style="display:none" id="msg_ctn">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close" aria-hidden="true">&times;</button><span id="msg"></span>
</div>

<p><button type="button" class="btn btn-primary btn-lg" id="new_charge" style="display:none">New charge</button></p>

<h1>Add charge</h1>
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
        <label for="cash">Amount</label>
        <input type="text" class="form-control" name="cash" id="cash" placeholder="0.00">
    </div>
    <div class="form-group checkbox">
        <label class="checkbox">
            <input type="checkbox" name="wf" value="LF">
            This is a <b>Late fee</b> charge
        </label>
        <label class="checkbox">
            <input type="checkbox" name="wf" value="RENT">
            This is a <b>rent</b> charge
        </label>
    </div>
    <div class="form-group" id="date_ctn" style="display:none">
        <label for="date">Date</label>
        <input type="text" class="form-control" id="date" value="<?php echo date("m/d/Y"); ?>" name="date">
    </div>

    <div class="form-group">
        <label for="comments">Comments</label>
        <textarea name="comments" id="comments" class="form-control" placeholder="E.g., Rent charge for <?php echo date("M Y"); ?>&#x2026;Late fee charge for <?php echo date("M jS, Y"); ?>&#x2026;Eviction court costs"></textarea>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
</form>


<script>
Date.prototype.toMySQL = function() {
    return this.getFullYear().toString() + '-' + ('0' + this.getMonth().toString()).slice(-2) + '-' + ('0' + this.getDate().toString()).slice(-2) + ' ' + ('0' + this.getHours().toString()).slice(-2) + ':' + ('0' + this.getMinutes().toString()).slice(-2) + ('0' + this.getSeconds().toString()).slice(-2);
}

$("#add").submit(function(e) {
    e.preventDefault();
    
    var data = $(this).serializeArray();

    //Calculate wf
    var wf_str = false;
    if($("[name='wf']:checked").length) {
        //wf indeed selected
        var dt = new Date($("#date").val());
        var date_str = dt.getFullYear().toString() + ('0' + (dt.getMonth() + 1).toString()).slice(-2) + ('0' + dt.getDate().toString()).slice(-2);
        var wf_str = $("[name='wf']:checked").val() + "#" + date_str;
        console.log(wf_str);

        //Put this in the post data
        data.push({
            name: "what_for",
            value: wf_str
        });
    }

    //POST it
    $.ajax({
        method: "POST",
        url: "charge_process.php",
        data: data
    }).done(function(c) {
        console.log(c);
        if(c == "success") {
            $("#msg_ctn").show();
            $("#msg").html("<b>Charge added successfully</b>");
            $("#new_charge").show();
        }
    });
});

//Single check for rent/late fee what_for
$("[name='wf']").change(function() {
    $("[name='wf']").not(this).prop("checked", false);
});

//Add the date for rent/lf wf
$("[name='wf']").change(function() {
    if(this.checked) {
        $("#date_ctn").show();
    } else if(!this.checked) {
        $("#date_ctn").hide();
    }
});

//New charge button
$("#new_charge").click(function() {
    window.location.reload(true);
});
</script>
</body></html>
