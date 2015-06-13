<?php
include_once "init.php";

?>
<html>
<head>
<title>Rentroll</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link href="//cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.0/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet"/>
<script src="//cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.0/bootstrap3-editable/js/bootstrap-editable.min.js"></script>
</head><body>

<h1>Rentroll</h1>

<table class="table table-striped table-condensed" id="rentroll">
<thead>
    <th class="col-sm-1"><b>Unit</b></th>
    <th class="col-sm-4"><b>Name(s)</b></th>
    <th class="col-sm-2"><b>Phone number</b></th>
    <th class="col-sm-3"><b>Rent</b></th>
    <th class="col-sm-2"><b>Balance</b></th>
</thead>
<?php
foreach($db->query("SELECT alias, recurring.cash AS rent, names, recurring.id AS recur_pk, accounts.id AS acct_pk, SUM(ledger.cash) AS balance, phone FROM accounts INNER JOIN recurring ON recurring.acct_id=accounts.id LEFT JOIN ledger ON ledger.acct_id=accounts.id WHERE accounts.current=1 GROUP BY alias ORDER BY alias ASC") as $r):
?>
<tr>
    <td><?=$r['alias']?></td>
    <td><a href="#" class="names" data-pk="<?=$r['acct_pk']?>"><?=$r['names']?></a></td>
    <td><a href="#" class="phone" data-pk="<?=$r['acct_pk']?>"><?=$r['phone']?></a></td>
    <td><a href="#" class="rent" data-pk="<?=$r['recur_pk']?>" data-value="<?=$r['rent']?>"><?php echo money_format("%.2n", floatval($r['rent'])); ?></a></td>
    <td class="bal" data-val="<?=$r['balance']?>"><?php echo money_format("%.2n", floatval($r['balance'])); ?></td>
</tr>
<?php endforeach; ?>

</table>


<script>
$(document).ready(function() {
    $("#rentroll .names").editable({
        name: "names",
        url: "fix_rentroll.php"
    });
    $("#rentroll .rent").editable({
        name: "rent",
        url: "fix_rentroll.php"
    });
    $("#rentroll .phone").editable({
        name: "phone",
        url: "fix_rentroll.php"
    });

    //Add colors to balance fields
    $(".bal").each(function(i, el) {
        var v = $(el).data("val");
        var bal = parseFloat(v == "" ? 0.0 : v);
        if(bal <= 0) {
            //Green!
            $(this).css("background-color", "#dff0d8");
        } else if(bal > 0 && bal <= 300) {
            //Yellow
            $(this).css("background-color", "rgb(252,248,227");
        } else if(bal > 300 && bal <= 900) {
            //Orange
            $(this).css("background-color", "rgb(255,204,153)");
        } else if(bal > 900) {
            //Red -- pending eviction!
            $(this).css("background-color", "rgb(255,102,102)");
        }
    });
});


</script>

</body>
</html>
