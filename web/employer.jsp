<%@page import="java.util.List"%>
<%@page import="domains.EmployeeCategory"%>
<%@page import="domains.Jobs"%>
<%@page import="dao.GenericDao"%>
<%@page import="domains.Employer"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>E-hire | Employer</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">
  
  
    <%
    GenericDao gd=new GenericDao();
    Jobs jobs=new Jobs();
    
    RequestDispatcher rd;
    
    EmployeeCategory category=new EmployeeCategory();
    
    if(session.getAttribute("EmployerAccount") == null){
      request.setAttribute("loginError","please login first");
      rd=request.getRequestDispatcher("login.jsp");
      rd.forward(request, response);
    }else{
      
      Employer employer=(Employer)session.getAttribute("EmployerAccount");
    %>

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="employer.jsp">
                <div class="sidebar-brand-text mx-3"><img src="img/small.png" style="width: 170px;"></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="createjob.jsp">
                    <i class="fas fa-plus fa-fw"></i>
                    <span>Create job</span>
                </a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">


            <!-- Divider -->
            <hr class="sidebar-divider">


            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="createdjobs.jsp">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Created jobs</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">
                      
                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%=employer.getLastName()+" "+employer.getFirstName()%></span>
                                <img class="img-profile rounded-circle"
                                    src="img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Advertise with us!</h1>
                    </div>

      

                    <div class="row">


                        <div class="col-lg-6">

                         
            <ul class="nav-item  no-arrow mx-1" style="text-align: end;"><br><br><br>
                            
                        
                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                              
                          <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Create job!</h1>
                            </div>
                              <form class="user" action="controller?a=#" method="POST">
                                <div class="form-group">
                                    <div class="col-sm-12 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" name="jobTitle"
                                            placeholder="Job Tittle">
                                    </div>
                                </div>
                                    <div class="form-group">
                                    <div class="col-sm-12">
                                        <input type="text" class="form-control form-control-user" name="company"
                                               placeholder="Company">
                                    </div>
                                    </div>
                                  <div class="form-group row">
                                    <div class="col-sm-6">
                                      <label>Category</label>
                                    </div>
                                  <div class="col-sm-6">
                                    <select  class="form-control" name="categoryType" >
                                      <%
                                        List<EmployeeCategory> ec=(List<EmployeeCategory>)gd.printAll(category);
                                        
                                        for(EmployeeCategory emc:ec){%>
                                        <option value="<%=emc.getId()%>"><%=emc.getCategoryName()%></option>
                                        <%}
                                        %>
                                    </select>
                                    </div>
                                </div>
                                    <div class="form-group">
                                      <div class="col-sm-12">
                                        <label for="dob">Date of birth</label>
                                        <input type="date" class="form-control form-control-user" name="dob"
                                               placeholder="Date of birth">
                                      </div>
                                    </div>
                                <div class="form-group">
                                  <input type="email" class="form-control form-control-user" name="email" placeholder="Email Address" required="">
                                </div>
                                <div class="form-group">
                                  <input type="text" class="form-control form-control-user" name="phone"
                                        placeholder="Phone Number">
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-12">
                                        <input type="password" class="form-control form-control-user"
                                               name="password" placeholder="Password" required="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-12">
                                      <textarea class="form-control form-control-user" name="about" placeholder="something about you" required=""></textarea>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6">Skill</div>
                                    <div class="col-sm-6">Skill level</div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6">
                                      <input type="text" name="skills" class="form-control form-control-user" placeholder="skill" required="">
                                    </div>
                                    <div class="col-sm-6">
                                      <input type="text" name="level" class="form-control form-control-user" placeholder="level" required="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6">
                                      <input type="text" name="skills" class="form-control form-control-user" placeholder="skill" required="">
                                    </div>
                                    <div class="col-sm-6">
                                      <input type="text" name="level" class="form-control form-control-user" placeholder="level" required="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6">
                                      <input type="text" name="skills" class="form-control form-control-user" placeholder="skill" required="">
                                    </div>
                                    <div class="col-sm-6">
                                      <input type="text" name="level" class="form-control form-control-user" placeholder="level" required="">
                                    </div>
                                </div>
                            <input type="submit" value="Update Account" class="btn btn-primary btn-user btn-block">
                            </form>
                                   
                                </div>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-success">
                                            <i class="fas fa-donate text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 7, 2019</div>
                                        $290.29 has been deposited into your account!
                                    </div>
                                </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-warning">
                                            <i class="fas fa-exclamation-triangle text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 2, 2019</div>
                                        Spending Alert: We've noticed unusually high spending for your account.
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                            </div>
                        </li>
                        </div>

                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->
            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; e-Hire 2021</span> 
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>
    <%}%>
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

</body>

</html>