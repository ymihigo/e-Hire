<%@page import="domains.RequestJob"%>
<%@page import="java.util.Map"%>
<%@page import="domains.EmployeeCategory"%>
<%@page import="java.util.List"%>
<%@page import="domains.Employee"%>
<%@page import="domains.Jobs"%>
<%@page import="dao.GenericDao"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Register</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">
    <%
      
    RequestDispatcher rd;
    GenericDao gd=new GenericDao();
    
    Employee emp=new Employee();
    
    if(request.getParameter("applicantId") == null){
      request.setAttribute("loginError","please login first");
      rd=request.getRequestDispatcher("login.jsp");
      rd.forward(request, response);
    }else{
      int appid=Integer.parseInt(request.getParameter("applicantId"));
      Employee employee=(Employee)gd.findById(emp, appid);
      RequestJob reque=new RequestJob();
      RequestJob reqj=(RequestJob)gd.findById(reque, Integer.parseInt(request.getParameter("requestid")));
    %>

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image">
                        
                        <div class="p-5">
                                    <div class="text-center">
                                <img src="img/logob.png" style="width: 300px;    margin: 100px 0 0 0;"></div>
                              </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Update your Account!</h1>
                            </div>
                          <form class="user" action="controller?a=accept&&requestID=<%=reqj.getId()%>" method="POST">
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" name="lastname"
                                            placeholder="Family name" value="<%=employee.getLastName()%>" disabled="">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user" name="firstname"
                                               placeholder="Surname" value="<%=employee.getFirstName()%>" disabled="">
                                    </div>
                                  <div class="form-group col-sm-12">
                                        <label for="dob">Date of birth</label>
                                        <input type="date" class="form-control form-control-user" name="dob"
                                               placeholder="Date of birth" value="<%=employee.getDob()%>" disabled="">
                                    </div>
                                </div>
                                <div class="form-group">
                                  <input type="email" class="form-control form-control-user" name="email" placeholder="Email Address" value="<%=employee.getEmail()%>" disabled="">
                                </div>
                                <div class="form-group">
                                  <input type="text" class="form-control form-control-user" name="phone"
                                         placeholder="Phone Number" value="<%=employee.getPhone()%>" disabled="">
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6">
                                      <label>Category</label>
                                    </div>
                      
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-12">
                                      <textarea class="form-control form-control-user" name="about" placeholder="<%=employee.getAbout()%>" readonly="" ></textarea>
                                    </div>
                                </div>
                               <div class="form-group row">
                                    <div class="col-sm-12">
                                      <textarea class="form-control form-control-user" name="message" placeholder="tell applicant something" required=""></textarea>
                                    </div>
                                </div>
                            <input type="submit" value="Accept" class="btn btn-primary btn-user btn-block">
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
       <!--start-->
<%}%>
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

     <script>
           if ( window.history.replaceState ) {
                window.history.replaceState( null, null, window.location.href );
             }
     </script>
</body>

</html>