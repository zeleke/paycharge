<?php
include_once "init.php";

function add_pardon() {
    global $db;

    $p = $db->prepare("INSERT INTO pardons(acct_id, lf_stop, expiry, comments) VALUES(:acct_id, :lf_stop, :expiry, :comments)");

    try {
        $e = $p->execute(array(
            ":acct_id" => $_POST['acct_id'],
            ":lf_stop" => date("Y-m-d H:i:s", strtotime($_POST['lf_stop'])),
            ":expiry" => date("Y-m-d H:i:s", strtotime($_POST['expiry'])),
            ":comments" => $_POST['comments']
        ));
        $insert_id = $db->lastInsertId();
        $r = $db->prepare("SELECT * FROM pardons WHERE id=:id");
        $r->execute(array(":id" => $insert_id));
        $res = $r->fetch();
        $res_j = json_encode($res);
        echo $res_j;
    } catch(PDOException $except) {
        echo "Error: " . $except.getMessage();
    }
}

function delete_pardon() {
    global $db;

    $d = $db->prepare("DELETE FROM pardons WHERE id=:id");
    $d->execute(array(":id" => $_POST['id']));
}

function main() {
    switch($_POST['mode']){
    case 'del':
        delete_pardon();
        break;
    case 'add':
        add_pardon();
        break;
    }
}

main();

?>
