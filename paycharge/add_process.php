<?php
include_once "init.php";

function main() {
    if(empty($_POST)) {
        echo "empty post";
        return;
    }
    global $db;
    $n = $db->prepare("SELECT names FROM accounts WHERE alias=:alias AND current=1");
    $b = $db->prepare("SELECT SUM(cash) AS bal, accounts.id FROM ledger INNER JOIN accounts ON accounts.alias=:alias WHERE accounts.current=1 AND ledger.acct_id=accounts.id");
    $new = $db->prepare("INSERT INTO ledger(acct_id, cash, tender, serial, time, comments) SELECT accounts.id, :cash, :tender, :serial, :time, :comments FROM accounts WHERE accounts.alias=:alias AND accounts.current=1");

    try {
        switch($_POST['mode']) {
        case 'names':
            $n->execute(array(
                ":alias" => $_POST['val']
            ));
            $q = $n->fetchColumn();
            echo $q;
            break;
        case 'bal':
            $b->execute(array(
                ":alias" => $_POST['alias']
            ));
            $real_bal = floatval($b->fetchColumn());
            $new_bal = $real_bal - floatval($_POST['cash']);
            echo money_format("%+.2n", $new_bal);
            break;
        case 'send_new':
            $cash = floatval($_POST['cash']) * -1; //reverse for payment
            $e = $new->execute(array(
                ":cash" => $cash,
                ":tender" => $_POST['tender'],
                ":serial" => $_POST['serial'],
                ":time" => date("Y-m-d H:i:s", strtotime($_POST['time'])),
                ":comments" => $_POST['comments'],
                ":alias" => $_POST['alias']
            ));
            if($e) echo "success";
            break;
        }
    } catch(PDOException $except) {
        echo "Error: " . $except->getMessage();
    }
}

main();

?>
