<?php
include_once "init.php";

function doit() {
    global $db;
    if(empty($_POST)) {
        return;
    }
    $n = $db->prepare("UPDATE accounts SET names=:names WHERE id=:id");
    $r = $db->prepare("UPDATE recurring SET cash=:cash WHERE id=:id");
    $p = $db->prepare("UPDATE accounts SET phone=:phone WHERE id=:id");

    switch($_POST['name']) {
    case 'names':
        $n->execute(array(
            ":names" => $_POST['value'],
            ":id" => $_POST['pk']
        ));
        break;
    case 'rent':
        $r->execute(array(
            ":cash" => $_POST['value'],
            ":id" => $_POST['pk']
        ));
        break;
    case 'phone':
        $p->execute(array(
            ":phone" => $_POST['value'],
            ":id" => $_POST['pk']
        ));
        break;
    }
}

doit();
?>
