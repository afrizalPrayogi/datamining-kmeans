<?php
// Generate data dummy
$data = [];
for ($i = 1; $i <= 60; $i++) {
    $c1 = rand(1000, 10000) / 100;
    $c2 = rand(1000, 10000) / 100;
    $c3 = rand(1000, 10000) / 100;
    $data[] = [
        "produk" => "Produk $i",
        "c1" => $c1,
        "c2" => $c2,
        "c3" => $c3
    ];
}

// Siapkan array untuk chart dan klasifikasi
$labels = [];
$cluster1 = [];
$cluster2 = [];
$cluster3 = [];
$colors1 = [];
$colors2 = [];
$colors3 = [];
$klasifikasi = [];

// Looping tiap produk
foreach ($data as $row) {
    $labels[] = $row['produk'];

    $c1 = $row['c1'];
    $c2 = $row['c2'];
    $c3 = $row['c3'];
    $min = min($c1, $c2, $c3);

    $cluster1[] = $c1;
    $cluster2[] = $c2;
    $cluster3[] = $c3;

    // Highlight cluster terdekat
    $colors1[] = $c1 == $min ? 'rgba(255, 99, 132, 0.9)' : 'rgba(255, 99, 132, 0.2)';
    $colors2[] = $c2 == $min ? 'rgba(54, 162, 235, 0.9)' : 'rgba(54, 162, 235, 0.2)';
    $colors3[] = $c3 == $min ? 'rgba(75, 192, 192, 0.9)' : 'rgba(75, 192, 192, 0.2)';

    // Klasifikasi cluster terpilih
    $mapping = ['c1' => $c1, 'c2' => $c2, 'c3' => $c3];
    $cluster_terpilih = array_search($min, $mapping); // hasil: c1 / c2 / c3
    $cluster_num = ($cluster_terpilih === false) ? 'Tidak diketahui' : 'Cluster ' . substr($cluster_terpilih, 1);

    $klasifikasi[] = [
        "produk" => $row['produk'],
        "cluster" => $cluster_num
    ];
}

// Output JSON untuk Chart.js
header('Content-Type: application/json');
echo json_encode([
    "labels" => $labels,
    "datasets" => [
        [
            "label" => "Cluster 1",
            "data" => $cluster1,
            "backgroundColor" => $colors1
        ],
        [
            "label" => "Cluster 2",
            "data" => $cluster2,
            "backgroundColor" => $colors2
        ],
        [
            "label" => "Cluster 3",
            "data" => $cluster3,
            "backgroundColor" => $colors3
        ]
    ],
    "klasifikasi" => $klasifikasi
]);
