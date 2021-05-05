
package ServletControler;

import dao.GenericDao;
import dao.Services.AccountsInterface;
import dao.Services.AcountsInterfaceImplementation;
import dao.Services.servicesInterface;
import dao.Services.servicesInterfaceImplementation;
import domains.Employee;
import domains.Employer;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/controller")
public class Controller extends HttpServlet{
  @Override
  public void service(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
    
    PrintWriter out=response.getWriter();
    
    RequestDispatcher rd;
    HttpSession ss=request.getSession();
    
    String a=request.getParameter("a");
    
    
    AccountsInterface accountsInterface=new AcountsInterfaceImplementation();
    servicesInterface servicesInterface=new servicesInterfaceImplementation();
    
    switch(a){
      case "NewUser":
        String Lastname=request.getParameter("lastname");
        String Firstname=request.getParameter("firstname");
        String DOB=request.getParameter("dob");
        String Email=request.getParameter("email");
        String Phone=request.getParameter("phone");
        String Gender=request.getParameter("gender");
        String Role=request.getParameter("role");
        String Username=request.getParameter("username");
        String Password=request.getParameter("password");
        
        try{
          accountsInterface.newAccount(Lastname, Firstname, DOB, Email, Phone, Gender, Role, Username, Password);
        response.sendRedirect("login.jsp");
          
        }catch(Exception ex){
          request.setAttribute("Error", ex.getMessage());
          rd=request.getRequestDispatcher("Register.jsp");
          rd.forward(request, response);
        }
        break;
        
      case "login":
        String usr=request.getParameter("username");
        String pwd=request.getParameter("password");
        
        Employee e=(Employee) new GenericDao().loginEmployee(usr, pwd);
        Employer er=(Employer) new GenericDao().loginEmployer(usr, pwd);
        
        if(usr.equals("admin")&&pwd.equals("admin")){
          response.sendRedirect("AdminPanel.jsp");
        }
        
        if(e!=null && er==null){
          ss.setAttribute("EmployeeAccount", e);
          response.sendRedirect("Openings.jsp");
        }
        if(er != null && e==null ){
          ss.setAttribute("EmployerAccount", er);
          response.sendRedirect("employer.jsp");
        }
        else if(e == null && er == null){
          request.setAttribute("loginError","username and password don't match");
          rd=request.getRequestDispatcher("login.jsp");
          rd.forward(request, response);
        }
        
        break;
        
      case "updateEmployee":
        String LN=request.getParameter("lastname");
        String FN=request.getParameter("firstname");
        String dateOfBirth=request.getParameter("dob");
        String EML=request.getParameter("email");
        String PH=request.getParameter("phone");
        String PWD=request.getParameter("password");
        String ABT=request.getParameter("about");
        String categoryId=request.getParameter("categoryType");
        String[] Skills=request.getParameterValues("skills");
        String[] Levels=request.getParameterValues("level");
        
        Employee ee=(Employee)ss.getAttribute("EmployeeAccount");
        
        Map<String,String> skill=new HashMap<>();
        for(int i=0;i<Skills.length;i++){
          skill.put(Skills[i], Levels[i]);
        }
        try{
          accountsInterface.updateEmployee(ee, ABT, categoryId, skill, LN, FN,dateOfBirth,EML, PH, PWD);
          ss.setAttribute("EmployeeAccount", ee);
          response.sendRedirect("Openings.jsp");

        out.print(categoryId);

        }catch(Exception ex){
          request.setAttribute("Error",ex.getMessage());
          rd=request.getRequestDispatcher("settings.jsp");
          rd.forward(request, response);
        }
        break;
      case "createJob":
        String jobTittle=request.getParameter("jobTitle");
        String Company=request.getParameter("company");
        String employeecategoryid=request.getParameter("categoryType");
        String description=request.getParameter("description");
        
        String[] terms=request.getParameterValues("term");
        String[] conditions=request.getParameterValues("condition");
        
        Map<String, String> requires=new HashMap<>();
        
        for(int i=0;i<terms.length;i++){
          requires.put(terms[i], conditions[i]);
        }
        
        String deadline=request.getParameter("duedate");
        
        Employer emp=(Employer) ss.getAttribute("EmployerAccount");
        String employer=String.valueOf(emp.getId());
        
        try{
          servicesInterface.createJob(jobTittle, Company, employeecategoryid, description, requires, deadline, employer);
        
          ss.setAttribute("EmployerAccount", emp);
          response.sendRedirect("createjob.jsp");
        
        }catch(Exception ex){
          request.setAttribute("Error",ex.getMessage());
          rd=request.getRequestDispatcher("createjob.jsp");
          rd.forward(request, response);
        }
        break;
      case "apply":
        String jid=request.getParameter("jobid");
        Employee empl=(Employee) ss.getAttribute("EmployeeAccount");
        try{
          servicesInterface.requestJob(jid, empl);
          
          ss.setAttribute("EmployeeAccount", empl);
          response.sendRedirect("Openings.jsp");
          
        }catch(Exception ex){
          request.setAttribute("Error",ex.getMessage());
          rd=request.getRequestDispatcher("Openings.jsp");
          rd.forward(request, response);
        }
        break;
        
      case "deny":
        try{
          servicesInterface.deny(request.getParameter("requestId"));
          Employer em=(Employer) ss.getAttribute("EmployerAccount");
          ss.setAttribute("EmployerAccount", em);
          response.sendRedirect("employer.jsp");
        }catch(Exception ex){
          request.setAttribute("Error",ex.getMessage());
          rd=request.getRequestDispatcher("applications per job.jsp");
          rd.forward(request, response);
        }
        break;
        
      case "accept":
        try{
          servicesInterface.acceptRequest(request.getParameter("requestID"), request.getParameter("message"));
          Employer emm=(Employer) ss.getAttribute("EmployerAccount");
          ss.setAttribute("EmployerAccount", emm);
          response.sendRedirect("employer.jsp");
        }catch(Exception ex){
          request.setAttribute("Error",ex.getMessage());
          rd=request.getRequestDispatcher("employer.jsp");
          rd.forward(request, response);
        }
        break;
    }
  }
}
