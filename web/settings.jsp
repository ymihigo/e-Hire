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
    EmployeeCategory category=new EmployeeCategory();
    GenericDao gd=new GenericDao();
    
    if(session.getAttribute("EmployeeAccount") == null){
      request.setAttribute("loginError","please login first");
      rd=request.getRequestDispatcher("login.jsp");
      rd.forward(request, response);
    }else{
      
      Employee employee=(Employee)session.getAttribute("EmployeeAccount");
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
                          <form class="user" action="controller?a=updateEmployee" method="POST">
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" name="lastname"
                                            placeholder="Family name" value="<%=employee.getLastName()%>">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user" name="firstname"
                                               placeholder="Surname" value="<%=employee.getFirstName()%>">
                                    </div>
                                  <div class="form-group col-sm-12">
                                        <label for="dob">Date of birth</label>
                                        <input type="date" class="form-control form-control-user" name="dob"
                                               placeholder="Date of birth" value="<%=employee.getDob()%>" required="">
                                    </div>
                                </div>
                                <div class="form-group">
                                  <input type="email" class="form-control form-control-user" name="email" placeholder="Email Address" value="<%=employee.getEmail()%>" required="">
                                </div>
                                <div class="form-group">
                                  <input type="text" class="form-control form-control-user" name="phone"
                                        placeholder="Phone Number" value="<%=employee.getPhone()%>">
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-12">
                                        <input type="password" class="form-control form-control-user"
                                               name="password" placeholder="Password" value="<%=employee.getPassword()%>" required="">
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