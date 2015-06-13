<?php
include_once "init.php";

function main() {
    global $db;
    $add = $db->prepare("INSERT INTO ledger(acct_id, cash, wf, comments) SELECT accounts.id, :cash, :wf, :comments FROM accounts WHERE accounts.alias=:alias AND accounts.current=1");

    try {
        $p = $add->execute(array(
            ":cash" => floatval($_POST['cash']),
            ":wf" => isset($_POST['what_for']) ? $_POST['what_for'] : NULL,
            ":comments" => $_POST['comments'],
            ":alias" => $_POST['alias']
        ));
        if($p)
            echo "success";
    } catch(PDOException $e) {
        echo "Error: " . $e.getMessage();
    }
}

main();

?>
