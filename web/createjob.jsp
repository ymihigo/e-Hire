<%@page import="domains.Employer"%>
<%@page import="dao.GenericDao"%>
<%@page import="java.util.List"%>
<%@page import="domains.EmployeeCategory"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Dashboard</title>

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
    EmployeeCategory category=new EmployeeCategory();
    
    RequestDispatcher rd;
    
    
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
            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="employer.jsp">
                <div class="sidebar-brand-text mx-3"><img src="img/small.png" style="width: 170px;"></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="createjob.jsp">
                    <i class="fas fa-plus fa-fw"></i>
                    <span>Create job</span>
                </a>
            </li>

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
                
                <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Create an open opportunity!</h1>
                            </div>
                          <form class="user" action="controller?a=createJob" method="POST">
                                
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
                                      <textarea class="form-control form-control-user" name="description" placeholder="job description" required=""></textarea>
                                    </div>
                                </div>
                                        
                                        <div class="form-group row">
                                    <div class="col-sm-6">Terms</div>
                                    <div class="col-sm-6">Condition</div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6">
                                      <input type="text" name="term" class="form-control form-control-user" placeholder="term" required="">
                                    </div>
                                    <div class="col-sm-6">
                                      <input type="text" name="condition" class="form-control form-control-user" placeholder="condition" required="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6">
                                      <input type="text" name="term" class="form-control form-control-user" placeholder="term" required="">
                                    </div>
                                    <div class="col-sm-6">
                                      <input type="text" name="condition" class="form-control form-control-user" placeholder="condition" required="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6">
                                      <input type="text" name="term" class="form-control form-control-user" placeholder="term" required="">
                                    </div>
                                    <div class="col-sm-6">
                                      <input type="text" name="condition" class="form-control form-control-user" placeholder="condition" required="">
                                    </div>
                                </div>
                                        
                            <div class="form-group">
                                  <div class="form-group col-sm-12">
                                        <label for="dob">Due Date</label>
                                        <input type="date" class="form-control form-control-user" name="duedate" id="dob" required="">
                                  </div>
                            </div>
                                       
                            <center>
                            <div class="col-sm-4">
                            <input type="submit" value="POST" class="btn btn-primary btn-user btn-block">
                            </div>
                            </center>
                            </form>
                                    <%
                              if(request.getAttribute("Error") != null){
                            %>
                              <label style="color: red;"><%=request.getAttribute("Error")%></label>
                             <% }
                              %>
                        </div>
                    </div>
                </div>
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

    <!-- Page level plugins -->
    <script src="vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/chart-area-demo.js"></script>
    <script src="js/demo/chart-pie-demo.js"></script>

</body>

</html>