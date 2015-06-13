<?php
include_once "init.php";

$is_one = isset($_GET['unit']);

$all = $db->prepare("SELECT accounts.alias, ledger.comments, cash AS transaction, ledger.acct_id AS l_acct_id, (SELECT SUM(cash) FROM ledger WHERE acct_id=l_acct_id) AS bal_now, ledger.time AS instance, (SELECT SUM(cash) FROM ledger WHERE time<=instance AND acct_id=l_acct_id) AS bal_then FROM ledger JOIN accounts ON accounts.id=ledger.acct_id WHERE accounts.current=1 GROUP BY ledger.id ORDER BY instance DESC");

$one = $db->prepare("SELECT accounts.alias, ledger.comments, cash AS transaction, ledger.acct_id AS l_acct_id, (SELECT SUM(cash) FROM ledger WHERE acct_id=l_acct_id) AS bal_now, ledger.time AS instance, (SELECT SUM(cash) FROM ledger WHERE time<=instance AND acct_id=l_acct_id) AS bal_then FROM ledger JOIN accounts ON accounts.id=ledger.acct_id WHERE accounts.current=1 AND alias=:alias GROUP BY ledger.id ORDER BY instance DESC");

if($is_one) {
    $one->execute(array(":alias" => $_GET['unit']));
} else {
    $all->execute();
}

?>
<html>
<head>
<title>View ledger</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link href="//cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.0/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet"/>
<script src="//cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.0/bootstrap3-editable/js/bootstrap-editable.min.js"></script>
<script src="jquery.timeago.js"></script>
<style>
.money {
    text-align: right !important;
}
.dt_f {
    display: none;
}
@media print {
    .dt {
        display: none;
    }
    .dt_f {
        display: block;
    }
}
</style>
</head><body>
<h1>Ledger <?php if($is_one) echo "for #{$_GET['unit']}"; ?></h1>

<table class="table table-striped table-condensed table-bordered">
    <thead>
        <?php if(!$is_one): ?><th><b>Unit</b></th><?php endif; ?>
        <th class="money"><b>Transaction</b></th>
        <th class="text-center"><b>Date and time</b></th>
        <th class="text-center"><b>Comments</b></th>
        <th class="money"><b>Balance at the time</b></th>
        <th class="money"><b>Balance now</b></th>
    </thead>
    <?php //while($s = ($is_one == true ? $one->fetch() : $db->query($all)) ): ?>
    <?php while( $s = ($is_one ? $one->fetch() : $all->fetch()) ): ?>
    <tr>
        <?php if(!$is_one): ?><td><?=$s['alias']?></td><?php endif; ?>
        <td class="money"><?php echo money_format("%+.2n", floatval($s['transaction'])); ?></td>
        <?php $dt = date("M jS, Y h:ia", strtotime($s['instance'])); $iso = date('c', strtotime($s['instance'])); ?>
        <td class="text-center"><span class="dt_f"><?=$dt?></span><a class="timeago dt" title="<?=$iso?>" data-toggle="popover" data-trigger="focus" role="button" tabindex="0"><?=$dt?></a></td>
        <td class="text-center"><?=$s['comments']?></td>
        <td class="money"><?php echo money_format("%+.2n", floatval($s['bal_then'])); ?></td>
        <td class="money"><?php echo money_format("%+.2n", floatval($s['bal_now'])); ?></td>
    </tr>
    <?php endwhile; ?>
</table>


<script>
$(document).ready(function() {
    $(".timeago").timeago();
    $("[data-toggle='popover']").popover();

    //Adds the timeago to the popover
    $(".timeago, [data-toggle='popover']").each(function() { $(this).attr("data-content", this.innerHTML); });
});
</script>

</body></html>
