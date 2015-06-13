<?php
include_once "init.php";

//Unit selector
$all_aliases = $db->prepare("SELECT alias, id AS acct_id FROM accounts WHERE current=1");
$all_aliases->execute();

//Dates
$today = date("m/d/Y");
$end_of_month = date("m/t/Y");

//Print pardons
$plist = $db->prepare("SELECT alias, pardons.*, IF(lf_stop > CURDATE(),false,true) AS active FROM pardons LEFT JOIN accounts ON accounts.id=pardons.acct_id WHERE expiry >= CURDATE() ORDER BY active DESC, lf_stop DESC");
$plist->execute();
?>
<html>
<head>
<title>Add pardon</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</head><body>
<div class="alert alert-success" id="msg" role="alert" style="display:none"></div>
<h1>Add late fee pardon</h1>

<form role="form" id="add">
    <div class="form-group">
        <label for="alias">
            Unit
        </label>
        <select name="alias" id="alias" class="form-control">
            <?php while($a = $all_aliases->fetch()):?>
            <option value="<?=$a['alias']?>" data-acct_id="<?=$a['acct_id']?>"><?=$a['alias']?></option>
            <?php endwhile; ?>
        </select>
    </div>
    <div class="form-group">
        <label for="lf_stop">
            Stop late fees
        </label>
        <input type="text" class="form-control" name="lf_stop" id="lf_stop" value="<?=$today?>">
    </div>
    <div class="form-group">
        <label for="expiry">
            Expiry
        </label>
        <input type="text" class="form-control" name="expiry" id="expiry" value="<?=$end_of_month?>">
    </div>
    <div class="form-group">
        <label for="comments">
            Comments
        </label>
        <textarea name="comments" id="comments" class="form-control" placeholder="Justify giving this bum a break on late fees"></textarea>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
</form>

<h2>Pardons</h2>

<table role="table" class="table table-striped">
    <thead>
        <th>Unit</th>
        <th>Active</th>
        <th>Pardon from</th>
        <th>Expiry</th>
        <th>Comments</th>
        <th></th>
    </thead>
<?php while($p = $plist->fetch()): ?>
    <tr>
        <td><?=$p['alias']?></td>
        <td data-active="<?=$p['active']?>" class="active"><?php echo $p['active'] ? "Active" : "Not active yet"; ?></td>
        <td><?php echo date("M jS, Y", strtotime($p['lf_stop'])); ?></td>
        <td><?php echo date("M jS, Y", strtotime($p['expiry'])); ?></td>
        <td><?=$p['comments']?></td>
        <td>
            <button type="button" class="btn btn-danger del" data-id="<?=$p['id']?>" data-toggle="modal" data-target="#confirm_del">
                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
            </button>
        </td>
    </tr>
<?php endwhile; ?>
</table>

<div id="confirm_del" class="modal fade" role="dialog" aria-labelledby="cd_title" aria-hidden="true" tabindex="-1" data-backdrop="static">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="cd_title">Really delete?</h4>
            </div>
            <div class="modal-body">
                This will delete the record of this late fee pardon permanently. Are you sure?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default no" data-dismiss="modal">No</button>
                <button type="button" class="btn btn-danger yes">Yes, delete this pardon</button>
            </div>
        </div>
    </div>
</div>

<script>
$(document).ready(function() {
    $(".active").each(function() {
        if($(this).data("active")) {
            $(this).css("background-color", "rgb(255,255,204)");
        } else {
            $(this).css("background-color", "rgb(204,204,204)");
        }
    });
});

$("#add").submit(function(e) {
    e.preventDefault();

    var d = $(this).serializeArray();
    var acct_id = $("#alias option:selected").data("acct_id");
    var alias = $("#alias option:selected").val();
    d.push({
        name: 'acct_id',
        value: acct_id
    });
    d.push({
        name: 'mode',
        value: 'add'
    });

    $.ajax({
        method: "POST",
        url: "pardon_process.php",
        data: d
    }).done(function(c) {
        var j = JSON.parse(c);
        $("#msg").show();
        $("#msg").html("<b>Pardon successfully added.</b> #" + alias + " pardoned as of " + j.lf_stop + ". Expiry on " + j.expiry + ".");
    });
});

$(".del").click(function(e) {
    e.preventDefault();
});

$("#confirm_del").on("show.bs.modal", function(e) {
    var button = $(e.relatedTarget);
    var id = $(button).data("id");
    var d = {
        mode: 'del',
        id: id
    };
    var _this = this;
    $(this).find(".yes").click(function(e) {
        $.ajax({
            method: "POST",
            url: "pardon_process.php",
            data: d
        }).done(function(c) {
            $(button).closest("tr").fadeOut();
            $(_this).modal('hide');
        });
    });
});
</script>

</body></html>
