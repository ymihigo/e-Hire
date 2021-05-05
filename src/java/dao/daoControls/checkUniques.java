
package dao.daoControls;

import dao.GenericDao;
import domains.Employee;
import domains.Employer;



public class checkUniques {
  
  
  public boolean checkUniquiness(String username){
    Employee employee=new GenericDao().findEmployeeByUsername(username);
    Employer employer=new GenericDao().findEmployerByUsername(username);
    return employee != null || employer != null;
  }
}
