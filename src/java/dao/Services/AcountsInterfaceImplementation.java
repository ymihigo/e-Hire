
package dao.Services;

import dao.GenericDao;
import dao.daoControls.checkUniques;
import domains.Employee;
import domains.EmployeeCategory;
import domains.Employer;
import domains.Gender;
import domains.UserType;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Map;


public class AcountsInterfaceImplementation implements AccountsInterface{

  GenericDao gd=new GenericDao();
  
  Employee employee=new Employee();
  EmployeeCategory category=new EmployeeCategory();
  
//  SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy");
//  DateTimeFormatter formatter=DateTimeFormatter.ofPattern("dd/MM/yyyy");
  
  @Override
  public void newAccount(String LastName, String FirstName, String dateOfB, String email, String phone, String gender, String userType, String username, String password) {
  if(LastName.isEmpty() || FirstName.isEmpty() || dateOfB.isEmpty() || email.isEmpty() || phone.isEmpty() ||  gender.isEmpty() || userType.isEmpty() || username.isEmpty() || password.isEmpty()){
    throw new IllegalArgumentException("Please fill all requirements");
  }
  
    boolean b=new checkUniques().checkUniquiness(username);
  if(b == true){
    throw new RuntimeException("username taken");
  }
    LocalDate DoB=LocalDate.parse(dateOfB);
    
    if(DoB.isAfter(LocalDate.now()) || DoB.isEqual(LocalDate.now())){
      throw new RuntimeException("invalid dates of birth");
    }
    
    if(UserType.valueOf(userType) == UserType.Employee){
      try{
        gd.create(new Employee(UserType.Employee, LastName, FirstName, DoB, Gender.valueOf(gender), email, phone, username, password));
      }catch(Exception ex){
        throw new RuntimeException(ex.getMessage());
      }
    }
    if(UserType.valueOf(userType) == UserType.Employer){
      try{
        gd.create(new Employer(LastName, FirstName, DoB, Gender.valueOf(gender), email, phone, username, password));
      }catch(Exception ex){
        throw new RuntimeException(ex.getMessage());
      }
    }
  }

  @Override
  public void updateEmployee(Employee ee,String about,String categoryId, Map<String, String> skills, String lastName, String firstName, String dob,  String email, String phone, String password) {
     if(categoryId.isEmpty() || about.isEmpty() || lastName.isEmpty() || firstName.isEmpty() || dob.isEmpty() || email.isEmpty() || phone.isEmpty() || password.isEmpty()){
    throw new IllegalArgumentException("Please fill all requirements");
     }
     EmployeeCategory ec=(EmployeeCategory)gd.findById(category, Integer.parseInt(categoryId));
     
     if(ec == null){
       throw new RuntimeException("invalid category");
     }
     if(ee == null){
       throw new IllegalArgumentException("invalid user");
     }
    LocalDate DoB=LocalDate.parse(dob);
    
    if(DoB.isAfter(LocalDate.now()) || DoB.isEqual(LocalDate.now())){
      throw new RuntimeException("invalid dates of birth");
    }
    
    for(String a:skills.keySet()){
      if(a.isEmpty() || skills.get(a).isEmpty()){
        throw new IllegalArgumentException("Please fill out skills and level fields");
      }
    }
    try{
      ee.setAbout(about);
      ee.setSkills(skills);
      ee.setLastName(lastName);
      ee.setFirstName(firstName);
      ee.setDob(DoB);
      ee.setEmail(email);
      ee.setPhone(phone);
      ee.setPassword(password);
      ee.setCategory(ec);
      gd.update(ee);
      
    }catch(Exception ex){
      throw new RuntimeException(ex.getMessage());
    }
  }
  
}
