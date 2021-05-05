
package dao.Services;

import dao.GenericDao;
import domains.AccountStatus;
import domains.Chat;
import domains.Employee;
import domains.EmployeeCategory;
import domains.Employer;
import domains.Jobs;
import domains.OfferStatus;
import domains.RequestJob;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Map;


public class servicesInterfaceImplementation implements servicesInterface{
  
  GenericDao gd=new GenericDao();
  EmployeeCategory ec=new EmployeeCategory();
  Employee employee=new Employee();
  Employer employer=new Employer();
  RequestJob requestjob=new RequestJob();
  
  Jobs job=new Jobs();
  
//  Date Format
  
  SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy");
  DateTimeFormatter formatter=DateTimeFormatter.ofPattern("dd/MM/yyyy");
  
  @Override
  public void createJob(String jobTittle,String Company , String employeeCategoryid, String description, Map<String, String> requirements, String deadline,String employerId) {
    if(jobTittle.isEmpty() || employeeCategoryid.isEmpty() || description.isEmpty() || deadline == null || requirements.isEmpty() || Company.isEmpty()){
      throw new IllegalArgumentException("null variable detected");
    }
    EmployeeCategory empc=(EmployeeCategory) gd.findById(ec, Integer.parseInt(employeeCategoryid));
    
    if(empc == null){
      throw new RuntimeException("invalid employee category");
    }
    
    LocalDate dueDate=LocalDate.parse(deadline);
    
    if(dueDate.isBefore(LocalDate.now())){
      throw new RuntimeException("Due Date can not be in future");
    }
    
    Employer emp=(Employer) gd.findById(employer, Integer.parseInt(employerId));
    
    if(emp == null){
      throw new RuntimeException("invalid employer");
    }
    
    try{
    gd.create(new Jobs(jobTittle,Company, empc, description, requirements, dueDate,emp));
    }catch(Exception ex){
      throw new RuntimeException(ex.getMessage());
    }
  }

  @Override
  public void requestJob(String jobId, Employee employee) {
  
    if(jobId == null || employee == null){
      throw new RuntimeException("null variable detected");
    }
    if(employee.getAccountStatus() == AccountStatus.Burned || employee.getAccountStatus() == AccountStatus.Reported){
      throw new RuntimeException("your account has unsolved issues");
    }
    
    Jobs jobs=(Jobs) gd.findById(job, Integer.parseInt(jobId));
    if(jobs == null){
      throw new RuntimeException("Invalid job id");
    }
    if(jobs.getDeadline().isBefore(LocalDate.now())){
      throw new RuntimeException("This job is overdue ");
    }
    
    gd.create(new RequestJob(jobs, employee));
  }

  @Override
  public void deny(String requestId) {
    RequestJob re=(RequestJob) gd.findById(requestjob, Integer.parseInt(requestId));
    
    
    try{
      re.setStatus(OfferStatus.Denied);
      gd.update(re);
    }catch(Exception ex){
      throw new RuntimeException(ex.getMessage());
    }
  }

  @Override
  public void acceptRequest(String requestID,String message) {
   if(requestID.isEmpty() || message.isEmpty()){
     throw new RuntimeException("Illegal Argument");
   }
   RequestJob rj=(RequestJob)gd.findById(requestjob, Integer.parseInt(requestID));
   
   if(rj == null){
     throw new RuntimeException("invalid request");
   }
   try{
     rj.setStatus(OfferStatus.Accepted);
     gd.update(rj);
     gd.create(new Chat(message, rj));
   }catch(Exception ex){
     throw new RuntimeException(ex.getMessage());
   }
  }

 
}
