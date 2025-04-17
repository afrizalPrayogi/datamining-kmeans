<?php
require_once __DIR__ . '/../vendor/autoload.php';
require_once '../functions.php';

$barang = query("SELECT * FROM data_barang");

$mpdf = new \Mpdf\Mpdf();

$html = '<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Data Barang</title>
    <link rel="stylesheet" href="../assets/dist/css/print.css">
</head>
<body>
   <h1>Data Barang</h1>
   <table border="1" cellpadding="10" cellspacing="0">

        <tr>
            <th>ID Barang</th>
            <th>Nama Barang</th>
        </tr>';
foreach ($barang as $row) {
    $html .= '<tr>
            <td>' . $row["id_barang"] . ' </td>
            <td>' . $row["nama_barang"] . '</td>
        </tr>';
}

$html .= '</table>    
</body>
</html>';

$mpdf->WriteHTML($html);
$mpdf->Output('Data_Barang.pdf', 'I');
