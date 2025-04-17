<?php
require_once __DIR__ . '/../vendor/autoload.php';
require_once '../functions.php';

$barang = query("SELECT * FROM data_barang");
$atribut = query("SELECT * FROM atribut");

$mpdf = new \Mpdf\Mpdf([
    'margin_left' => 10,
    'margin_right' => 10,
    'margin_top' => 20,
    'margin_bottom' => 20,
]);

$html = '<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Data Nilai Barang</title>
    <style>
        body {
            font-family: sans-serif;
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
   <h1>Data Nilai barang</h1>
   <table>
       <tr>
           <th>Nama barang</th>';

foreach ($atribut as $row) {
    $html .= '<th>' . $row["nama_atribut"] . '</th>';
}

$html .= '</tr>';

foreach ($barang as $rows) {
    $html .= '<tr>
                <td>' . $rows["nama_barang"] . '</td>';
    foreach ($atribut as $row) {
        $nilaibarang = query("SELECT * FROM data_nilai_barang WHERE id_barang = " . $rows['id_barang'] . " AND id_atribut = " . $row['id_atribut']);
        $nilai = isset($nilaibarang[0]["nilai"]) ? $nilaibarang[0]["nilai"] : '-';
        $html .= '<td>' . $nilai . '</td>';
    }
    $html .= '</tr>';
}

$html .= '</table>    
</body>
</html>';

$mpdf->WriteHTML($html);
$mpdf->Output('data_nilaibarang.pdf', 'I');
