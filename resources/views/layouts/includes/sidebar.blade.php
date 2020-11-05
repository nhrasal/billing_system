 <!-- Side Navbar -->
 <nav class="side-navbar">
      <div class="side-navbar-wrapper">
        <!-- Sidebar Header    -->
        <div class="sidenav-header d-flex align-items-center justify-content-center">
          <!-- User Info-->
          <div class="sidenav-header-inner text-center"><img src="{{asset(Auth::user()->image ?? '/img/avatar-7.jpg')}}" alt="person" class="img-fluid rounded-circle">
            <h2 class="h5">{{Auth::user()->name ?? ''}}</h2><span>Web Developer</span>
          </div>
          <!-- Small Brand information, appears on minimized sidebar-->
          <div class="sidenav-header-logo"><a href="{{route('dashboard')}}" class="brand-small text-center"> <strong>B</strong><strong class="text-primary">D</strong></a></div>
        </div>
        <!-- Sidebar Navigation Menus-->
        <div class="main-menu">
          <h5 class="sidenav-heading">Main</h5>
          <ul id="side-main-menu" class="side-menu list-unstyled">                  
            <li><a href="{{route('dashboard')}}"> <i class="icon-home"></i>Home</a></li>
            <li><a href="{{route('category')}}"> <i class="icon-home"></i>Category</a></li>
            <li><a href="{{route('subcategory')}}"> <i class="icon-home"></i>SubCategory</a></li>
            <li><a href="{{route('employee')}}"> <i class="icon-home"></i>Employee</a></li>
            <li><a href="{{route('project')}}"> <i class="icon-home"></i>Project</a></li>
            <!-- <li><a href="{{route('subcategory')}}"> <i class="icon-home"></i>SubCategory</a></li> -->
            <!-- <li><a href="forms.html"> <i class="icon-form"></i>Forms</a></li>
            <li><a href="charts.html"> <i class="fa fa-bar-chart"></i>Charts</a></li>
            <li><a href="tables.html"> <i class="icon-grid"></i>Tables</a></li> -->
            <li><a href="#exampledropdownDropdown" aria-expanded="false" data-toggle="collapse"> <i class="fa fa-bar-chart"></i>Billing </a>
              <ul id="exampledropdownDropdown" class="collapse list-unstyled ">
                <li><a href="{{route('expense')}}">Expense</a></li>
                <li><a href="{{route('expense.create')}}">Create Expense</a></li>
                <li><a href="#">Bill Paper</a></li>
              </ul>
            </li>
            <li><a href="#income" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>Income </a>
              <ul id="income" class="collapse list-unstyled ">
                <li><a href="#">Income</a></li>
                <li><a href="#">Create Income</a></li>
                <li><a href="#">Income Paper</a></li>
              </ul>
            </li>
            <!-- <li><a href="login.html"> <i class="icon-interface-windows"></i>Login page</a></li> -->
            <li> <a href="#"> <i class="icon-mail"></i>Demo
                <div class="badge badge-warning">6 New</div></a></li>
          </ul>
        </div>
        <!-- <div class="admin-menu">
          <h5 class="sidenav-heading">Second menu</h5>
          <ul id="side-admin-menu" class="side-menu list-unstyled"> 
            <li> <a href="#"> <i class="icon-screen"> </i>Demo</a></li>
            <li> <a href="#"> <i class="icon-flask"> </i>Demo
            <div class="badge badge-info">Special</div></a></li>
            <li> <a href=""> <i class="icon-flask"> </i>Demo</a></li>
            <li> <a href=""> <i class="icon-picture"> </i>Demo</a></li>
          </ul>
        </div> -->
      </div>
    </nav>