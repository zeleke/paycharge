<?php
include_once "init.php";

class schedule {
    static $rent = 1;
    static $lf_init = 6;
    static $lf_init_cash = 40.00;
    static $lf_incr_cash = 5.00;
}

function lf_amount($t) {
    //Takes time variable $t
    //Returns float cash value

    $day = date('j', $t);
    if($day == schedule::$lf_init) {
        return schedule::$lf_init_cash;
    }
    if($day > schedule::$lf_init) {
        return schedule::$lf_incr_cash;
    }
    if($day < schedule::$lf_init) {
        return NULL;
    }
}

function charge_all_rent() {
    global $db;

    //Charge stmt
    $chg = $db->prepare("INSERT INTO ledger(acct_id, cash, time, wf, comments) VALUES(:acct_id, :cash, :time, :wf, :comments)");
    $dup = $db->prepare("SELECT COUNT(*) AS cnt FROM ledger WHERE wf=:wf AND acct_id=:acct_id");
    $find_accts = $db->prepare("SELECT accounts.id AS acct_id, recurring.cash AS rent, alias FROM accounts LEFT JOIN recurring ON recurring.acct_id=accounts.id WHERE accounts.current=1 AND NOT EXISTS (SELECT ledger.wf FROM ledger WHERE ledger.acct_id=accounts.id AND ledger.wf=:wf)");


    //Base data
    ////Set up wf
    $wf = "RENT#" . date("Ym");
    ////Set up comments
    $comments = "Rent charged for " . date("M Y");
    $p = array(
        ":time" => date("Y-m-d H:i:s"),
        ":wf" => $wf,
        ":comments" => $comments
    );

    //Cycle through recurring
    //foreach($db->query("SELECT recurring.cash AS rent, acct_id, accounts.alias AS alias FROM recurring INNER JOIN accounts ON accounts.id=recurring.acct_id WHERE accounts.current=1") as $r) {
    //}

    try {
        $db->beginTransaction();
        //foreach($db->query("SELECT accounts.id AS acct_id, alias, recurring.cash AS rent FROM accounts INNER JOIN recurring ON accounts.id=recurring.acct_id WHERE accounts.current=1") as $a)

        $find_accts->execute(array(":wf" => $wf)); //Get accounts needing to be charged rent

        while($a = $find_accts->fetch()) {
            if(intval($a['rent']) == 0) //Skip employees
                continue;

            //Charge rent
            $p2 = array(
                ":acct_id" => $a['acct_id'],
                ":cash" => $a['rent']
            );
            $p3 = array_merge($p, $p2);
            $chg->execute($p3);

            //Commentary
            logger("Charging rent for #{$a['alias']}, \${$a['rent']}, $wf, $comments...");


        }
        $db->commit();
    } catch(PDOException $except) {
        echo "Error: " . $except.getMessage();
        $db->rollBack();
    }
}

function charge_all_lf() {
    global $db;

    //Stmts
    $chg = $db->prepare("INSERT INTO ledger(acct_id, cash, time, wf, comments) VALUES(:acct_id, :cash, :time, :wf, :comments)");
    //$nondup = $db->prepare("SELECT * FROM accounts WHERE accounts.current=1 AND NOT EXISTS (SELECT ledger.wf FROM ledger WHERE ledger.wf=:wf AND ledger.acct_id=accounts.id)"); //doesn't check for neg balances
    $nondup = $db->prepare("SELECT accounts.*, (SELECT SUM(cash) FROM ledger WHERE ledger.acct_id=accounts.id) AS bal FROM accounts WHERE accounts.current=1 AND (SELECT SUM(cash) FROM ledger WHERE ledger.acct_id=accounts.id) > 0 AND NOT EXISTS (SELECT ledger.wf FROM ledger WHERE ledger.wf=:wf AND ledger.acct_id=accounts.id)"); //doesn't check for pardons

    logger("hi");

    //Iterate through dates to make sure all late fees were charged
    //starts with today, goes back to the first of the month
    try {
        $db->beginTransaction();
        logger("hi");
        for($t = time(), $bound = schedule::$lf_init - 1, $day = date('j', $t); $day > $bound; $t -= 86400, $day = date('j', $t)) {
            logger("hi");
            logger("Time: $t; Day: $day;");
            //Set up wf
            $wf = "LF#" . date("Ymd", $t);

            //Set up comments
            $comments = "Late fee charged for " . date("M jS, Y");

            //Determine late fee charge
            $lf_cash = lf_amount($t);
            if($lf_cash == NULL) {
                continue;
            }

            //Check and charge all accounts for this day
            ////Get which accounts
            $nondup->execute(array(
                ":wf" => $wf
            ));

            ////Now iterate
            while($w = $nondup->fetch()) {
                //Charge all these
                $chg->execute(array(
                    ":acct_id" => $w['id'],
                    ":cash" => $lf_cash,
                    ":time" => date("Y-m-d H:i:s", $t),
                    ":wf" => $wf,
                    ":comments" => $comments
                ));
                echo var_dump($chg);
            }
        }
        $db->commit();
    } catch(PDOException $except) {
        echo "Error: " . $except.getMessage();
        $db->rollBack();
    }
}

//charge_all_lf();
charge_all_rent();

?>
