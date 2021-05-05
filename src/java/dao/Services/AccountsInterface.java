
package dao.Services;

import domains.Employee;
import java.util.Map;


public interface AccountsInterface {
  public void newAccount(String LastName,String FirstName,String dateOfB,String email,String phone,String gender,String userType,String username,String password);
  public void updateEmployee(Employee e,String about,String categoryId,Map<String, String> skills, String lastName, String firstName, String dob, String email, String phone, String password);
}
