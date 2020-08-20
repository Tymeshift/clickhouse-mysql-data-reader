<?php
$mysqli = new mysqli("35.232.137.29", "root", "Mister007", "tymeapp_tymeshift");
$stringTemplate = "tymeapp_tymeshift.temp_audit_events_for_account_id_";

/* check connection */
if ($mysqli->connect_errno) {
    printf("Connect failed: %s\n", $mysqli->connect_error);
    exit();
}

$query = "SELECT SUBSTRING_INDEX(TABLE_NAME,'id_',-1) FROM information_schema.tables where table_name LIKE 'temp_audit_events_for_account_id_%';";
$result = $mysqli->query($query);

/* numeric array */
$accounts = $result->fetch_all();

$total = $result->num_rows;
$jobSize = $total / 4;
$file = file_get_contents('./job.yaml');
$targetTables = [];
$ids = [];
foreach ($accounts as $key => $accountID) {
    $targetTables[] = $stringTemplate.$accountID[0];
    $ids[] = $accountID[0];
    if(count($targetTables) >= $jobSize || $key == $total - 1) {
        $id = $accountID[0];
        $changed = preg_replace('/\{TABLES\}/', implode(",", $targetTables), $file);
        $changed = preg_replace('/\{NAME\}/', $id, $changed);
        file_put_contents("ids-$id.txt", implode(",", $ids));
        file_put_contents("job-$id.yaml", $changed);
        $targetTables = [];
        $ids = [];
    }
}