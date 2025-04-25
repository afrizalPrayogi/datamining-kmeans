<?php
session_start();
include_once("../auth_check.php");
if (!isset($_SESSION["login"]) || $_SESSION["login"] !== true) {
    header("Location: ../login");
    exit;
}

// Ambil data barang dan atribut
$barang = query("SELECT * FROM data_barang ORDER BY id_barang");
$atribut = query("SELECT * FROM atribut ORDER BY id_atribut");
$cluster = query("SELECT * FROM cluster ORDER BY id_cluster");

if (!$barang || !$atribut || !$cluster) {
    die("Error fetching data from database.");
}

// Proses data untuk clustering
function processClustering($data) {
    $labels = [];
    $cluster1 = [];
    $cluster2 = [];
    $cluster3 = [];
    $colors1 = [];
    $colors2 = [];
    $colors3 = [];
    $klasifikasi = [];

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

    return [
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
    ];
}

// Ambil nilai barang untuk setiap atribut
$data = [];
foreach ($barang as $bar) {
    $row = [];
    foreach ($atribut as $attr) {
        $nilai = query("SELECT nilai FROM data_nilai_barang WHERE id_barang = " . $bar['id_barang'] . " AND id_atribut = " . $attr['id_atribut']);
        if ($nilai) {
            $row[] = $nilai[0]['nilai'];
        } else {
            $row[] = 0;
        }
    }
    $data[] = $row;
}

// Ambil nilai Cluster untuk setiap atribut dan iterasi
$initialCentroids = [];
foreach ($cluster as $cls) {
    $row = [];
    foreach ($atribut as $attr) {
        $nilai = query("SELECT nilai FROM nilai_cluster WHERE id_cluster = " . $cls['id_cluster'] . " AND id_atribut = " . $attr['id_atribut']);
        if ($nilai) {
            $row[] = $nilai[0]['nilai'];
        } else {
            $row[] = 0;
        }
    }
    $initialCentroids[] = $row;
}

// Default nilai K dan iterasi
$defaultIterations = 1000;

if (isset($_POST['iterasi'])) {
    $maxIterations = intval($_POST['iterasi']);
    if ($maxIterations <= 0) {
        $maxIterations = $defaultIterations;
    }
} else {
    $maxIterations = $defaultIterations;
}


// Dapatkan hasil clustering awal sebelum iterasi pertama
$initialResult = getInitialClusters($data, $initialCentroids);

// Jalankan algoritma K-Means
$result = kmeans($data, $initialCentroids, $maxIterations);
$centroids = $result['centroids'];
$clusters = $result['clusters'];
$history = $result['history'];
$actualIterations = $result['iteration'];

// Mengatur zona waktu
date_default_timezone_set('Asia/Jakarta');
if (isset($_POST['iterasi'])) {
    simpanhasilakhir($centroids, $clusters, $history, $_SESSION['id'], date('Y-m-d H:i:s'), $barang, $data, $atribut, $actualIterations);
}

$page = 'proses_perhitungan';

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/logo/toyicon.jpg">
    <title>Proses Perhitungan - Data Mining</title>
    <link href="../assets/dist/css/style.min.css" rel="stylesheet">
    <link href="../assets/node_modules/sweetalert2/dist/sweetalert2.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        body {
            font-family: Arial, sans-serif;
        }
        #chart-wrapper {
            overflow-x: auto;
            padding: 20px;
        }
        table {
            border-collapse: collapse;
            margin-top: 30px;
            width: 100%;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }
        th {
            background: #f0f0f0;
        }
    </style>
</head>

<body class="skin-megna fixed-layout">
    <div class="preloader">
        <div class="loader">
            <div class="loader__figure"></div>
            <p class="loader__label">Data Mining</p>
        </div>
    </div>
    <div id="main-wrapper">
        <?php require_once '../partials/header.php'; ?>
        <?php require_once '../partials/sidebar.php'; ?>
        <div class="page-wrapper">
            <div class="container-fluid">
                <div class="row page-titles">
                    <div class="col-md-5 align-self-center">
                        <h4 class="text-themecolor">Proses Perhitungan</h4>
                    </div>
                    <div class="col-md-7 align-self-center text-end">
                        <div class="d-flex justify-content-end align-items-center">
                            <ol class="breadcrumb justify-content-end">
                                <li class="breadcrumb-item"><a href="../dashboard">Home</a></li>
                                <li class="breadcrumb-item">Proses Perhitungan</li>
                                <li class="breadcrumb-item active">Iterasi</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Proses Perhitungan</h4>
                                        <form class="mt-4" method="POST" action="">
                                            <div class="form-group col-sm-3">
                                                <label for="iterasi" class="form-label">Masukkan Iterasi</label>
                                                <input type="number" name="iterasi" class="form-control" id="iterasi" placeholder="Jumlah Iterasi" required>
                                            </div>
                                            <button type="submit" name="submit" class="btn waves-effect waves-light btn-rounded btn-primary"><i class="fas fa-cogs"></i> Proses</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- Hasil Clustering -->
                            <?php if (isset($_POST['submit'])) : ?>
                                <!-- Tabel Hasil Clustering Sebelum Iterasi Pertama -->
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="card-title">Hasil Clustering Sebelum Iterasi Pertama</h4>
                                            <h6 class="card-subtitle">Centroid Awal</h6>
                                            <div class="table-responsive">
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>Cluster</th>
                                                            <?php foreach ($atribut as $atr) : ?>
                                                                <th><?= $atr['nama_atribut']; ?></th>
                                                            <?php endforeach; ?>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <?php foreach ($initialCentroids as $index => $centroid) : ?>
                                                            <tr>
                                                                <td>Cluster <?= $index + 1 ?></td>
                                                                <?php foreach ($centroid as $value) : ?>
                                                                    <td><?= number_format($value) ?></td>
                                                                <?php endforeach; ?>
                                                            </tr>
                                                        <?php endforeach; ?>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <h6 class="card-subtitle mt-3">Cluster Awal</h6>
                                            <div class="table-responsive">
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>Nama Barang</th>
                                                            <?php foreach ($atribut as $atr) : ?>
                                                                <th><?= $atr['nama_atribut']; ?></th>
                                                            <?php endforeach; ?>
                                                            <?php foreach ($cluster as $cls) : ?>
                                                                <th><?= $cls['nama_cluster']; ?></th>
                                                            <?php endforeach; ?>
                                                            <th>Jarak Terdekat</th>
                                                            <th>Cluster</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <?php foreach ($initialResult['clusters'] as $clusterId => $clusterData) : ?>
                                                            <?php foreach ($clusterData as $dataIndex) : ?>
                                                                <tr>
                                                                    <td><?= $barang[$dataIndex]['nama_barang'] ?></td>
                                                                    <?php foreach ($data[$dataIndex] as $value) : ?>
                                                                        <td><?= number_format($value) ?></td>
                                                                    <?php endforeach; ?>
                                                                    <?php
                                                                    $distances = $initialResult['distances'][$dataIndex];
                                                                    foreach ($distances as $distance) : ?>
                                                                        <td><?= number_format($distance, 3) ?></td>
                                                                    <?php endforeach; ?>
                                                                    <td><?= number_format(min($distances), 3) ?></td>
                                                                    <td>Cluster <?= array_search(min($distances), $distances) + 1 ?></td>
                                                                </tr>
                                                            <?php endforeach; ?>
                                                        <?php endforeach; ?>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Tabel Hasil Iterasi -->
                                <?php foreach ($history as $iteration) : ?>
                                    <div class="col-12">
                                        <div class="card">
                                            <div class="card-body">
                                                <h4 class="card-title">Proses Iterasi <?= $iteration['iteration']; ?></h4>
                                                <h6 class="card-subtitle">Centroid</h6>
                                                <div class="table-responsive">
                                                    <table class="table table-bordered">
                                                        <thead>
                                                            <tr>
                                                                <th>Nama Cluster</th>
                                                                <?php foreach ($atribut as $atr) : ?>
                                                                    <th><?= $atr['nama_atribut']; ?></th>
                                                                <?php endforeach; ?>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <?php
                                                            $centroids = $iteration['centroids'];
                                                            ksort($centroids);
                                                            foreach ($iteration['centroids'] as $index => $centroid) : ?>
                                                                <tr>
                                                                    <td><?= $cluster[$index]['nama_cluster'] ?></td>
                                                                    <?php foreach ($centroid as $value) : ?>
                                                                        <td><?= number_format($value, 3) ?></td>
                                                                    <?php endforeach; ?>
                                                                </tr>
                                                            <?php endforeach; ?>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <h6 class="card-subtitle mt-3">Hasil Proses Iterasi <?= $iteration['iteration']; ?></h6>
                                                <div class="table-responsive" style="overflow-y: hidden">
                                                    <table class="table table-bordered table-striped" data-bs-toggle="table" data-height="250" data-mobile-responsive="true">
                                                        <thead>
                                                            <tr>
                                                                <th>Nama Barang</th>
                                                                <?php foreach ($atribut as $atr) : ?>
                                                                    <th><?= $atr['nama_atribut']; ?></th>
                                                                <?php endforeach; ?>
                                                                <?php foreach ($cluster as $cls) : ?>
                                                                    <th><?= $cls['nama_cluster']; ?></th>
                                                                <?php endforeach; ?>
                                                                <th>Jarak Terdekat</th>
                                                                <th>Cluster</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <?php 
                                                            $productDistance = [];
                                                            foreach ($iteration['clusters'] as $clusterId => $clusterData) : 
                                                            
                                                            ?>
                                                                <?php foreach ($clusterData as $dataIndex) : 
                                                                    $productDistance[$dataIndex]['produk'] = $barang[$dataIndex]['nama_barang']; 
                                                                ?>
                                                                    <tr>
                                                                        <td><?= $barang[$dataIndex]['nama_barang'] ?></td>
                                                                        <?php foreach ($data[$dataIndex] as $value) : ?>
                                                                            <td><?= number_format($value) ?></td>
                                                                        <?php endforeach; ?>
                                                                        <?php
                                                                        $distances = [];
                                                                        foreach ($iteration['centroids'] as $centroid) {
                                                                            $distances[] = calculateDistance($data[$dataIndex], $centroid);
                                                                        }
                                                                        ksort($distances);
                                                                        $no = 1;
                                                                        foreach ($distances as $distance) : 
                                                                            
                                                                            $productDistance[$dataIndex]['c'. $no] = number_format($distance, 3);
                                                                            $no++;
                                                                        ?>
                                                                            <td><?= number_format($distance, 3) ?></td>
                                                                        <?php endforeach; ?>
                                                                        <td><?= number_format(min($distances), 3) ?></td>
                                                                        <td>Cluster <?= array_search(min($distances), $distances) + 1 ?></td>
                                                                    </tr>
                                                                <?php endforeach; ?>
                                                            <?php endforeach; ?>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                <?php endforeach; ?>

                                <!-- grafik iterasi -->

                                <?php  
                                    $processedData = processClustering($productDistance);
                                ?>

                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <h2 class="card-title">Grafik Jarak Produk ke Masing-Masing Cluster</h2>
                                            <div id="chart-wrapper">
                                                <canvas id="kmeansChart" height="400"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <script>
                                    const data = <?php echo json_encode($processedData); ?>;

                                    const count = data.labels.length;
                                    const canvas = document.getElementById('kmeansChart');
                                    canvas.width = count * 50;

                                    new Chart(canvas.getContext('2d'), {
                                        type: 'bar',
                                        data: {
                                            labels: data.labels,
                                            datasets: data.datasets
                                        },
                                        options: {
                                            responsive: false,
                                            plugins: {
                                                title: {
                                                    display: true,
                                                    text: 'Visualisasi Jarak ke Cluster'
                                                },
                                                legend: {
                                                    position: 'top'
                                                }
                                            },
                                            scales: {
                                                x: {
                                                    title: {
                                                        display: true,
                                                        text: 'Produk'
                                                    }
                                                },
                                                y: {
                                                    beginAtZero: true,
                                                    title: {
                                                        display: true,
                                                        text: 'Jarak'
                                                    }
                                                }
                                            }
                                        }
                                    });
                                </script>
                            <?php endif; ?>
                        </div> <!-- /.row -->
                    </div><!-- /.container-fluid -->
                </div>
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- footer -->
        <!-- ============================================================== -->
        <?php require_once '../partials/footer.php'; ?>
        <!-- ============================================================== -->
        <!-- End footer -->
        <!-- ============================================================== -->
    </div>
    

    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <script src="../assets/node_modules/jquery/dist/jquery.min.js"></script>
    <script src="../assets/node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/dist/js/perfect-scrollbar.jquery.min.js"></script>
    <script src="../assets/dist/js/waves.js"></script>
    <script src="../assets/dist/js/sidebarmenu.js"></script>
    <script src="../assets/node_modules/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <script src="../assets/node_modules/sparkline/jquery.sparkline.min.js"></script>
    <script src="../assets/dist/js/custom.min.js"></script>
    <script src="../assets/node_modules/sweetalert2/dist/sweetalert2.all.min.js"></script>
    <script src="../assets/node_modules/sweetalert2/sweet-alert.init.js"></script>
</body>
