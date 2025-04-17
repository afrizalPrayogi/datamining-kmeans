<header class="topbar">
<nav class="navbar top-navbar navbar-expand-md bg-success navbar-dark">
    <!-- ============================================================== -->
    <!-- Logo -->
    <!-- ============================================================== -->
    <div class="navbar-header">
      <a class="navbar-brand" href="../dashboard/" style="display:flex; align-items:center; justify-content:center;">
        <!-- Logo icon --><b>
          <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
          <!-- Dark Logo icon -->
          <img id="responsive-element" src="../assets/images/logo/logo/toylogo.jpg" style="height: 10px; width: auto; " alt="homepage" class="" />
          <!-- Light Logo icon -->
          <img src="../assets/images/logo-light-icon.png" alt="homepage" class="light-logo" />
        </b>
        <!--End Logo icon -->
        <!-- Logo text --><span>
          <!-- dark Logo text -->
          <img src="../assets/images/logo/toylogo.jpg" style="height: 80px; width: auto;" alt="homepage" class="dark-logo" />
          <!-- Light Logo text -->
          <img src="../assets/images/logo/toylogo.jpg" class="light-logo" alt="homepage" /></span> </a>
    </div>
    <!-- ============================================================== -->
    <!-- End Logo -->
    <!-- ============================================================== -->
    <div class="navbar-collapse">
      <!-- ============================================================== -->
      <!-- toggle and nav items -->
      <!-- ============================================================== -->
      <ul class="navbar-nav me-auto">
        <!-- This is  -->
        <li class="nav-item">
          <a class="nav-link nav-toggler d-block d-md-none waves-effect waves-dark" href="javascript:void(0)"><i class="ti-menu"></i></a>
        </li>
        <li class="nav-item">
          <a class="nav-link sidebartoggler d-none d-lg-block d-md-block waves-effect waves-dark" href="javascript:void(0)"><i class="icon-menu"></i></a>
        </li>
      </ul>
    </div>
  </nav>
</header>

<script>
  const toggler = document.querySelector('.nav-toggler');
  toggler.addEventListener('click', () => {
    setTimeout(toggleLogoVisibility, 10); // Beri waktu agar kelas 'show' diterapkan
  });


  function handleResize() {
    const element = document.getElementById('responsive-element');
    if (window.innerWidth >= 768) {
      element.style.display = 'none';
    } else {
      element.style.display = 'block';
    }
  }

  // Panggil fungsi saat halaman dimuat dan saat di-resize
  handleResize();
  window.addEventListener('resize', handleResize);
</script>