
package domains;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;
import javax.persistence.*;

@Entity
public class Employee extends Person implements Serializable{
  @Id
  @GeneratedValue(strategy =GenerationType.AUTO)
  private int id;
  @ManyToOne
  private EmployeeCategory category;
  private String about;
  @Enumerated(EnumType.STRING)
  private UserType type=UserType.Employee;
  @ElementCollection
  private Map<String,String> skills=new HashMap<>();
  @Enumerated(EnumType.STRING)
  private AccountStatus accountStatus=AccountStatus.Active;

  public Employee() {
  }


  public Employee(int id, EmployeeCategory category, String about, UserType type, String lastName, String firstName, LocalDate dob, Gender gender, String email, String phone, String username, String password) {
    super(lastName, firstName, dob, gender, email, phone, username, password);
    this.id = id;
    this.category = category;
    this.about = about;
    this.type = type;
  }

  public Employee(EmployeeCategory category, String about, UserType type, String lastName, String firstName, LocalDate dob, Gender gender, String email, String phone, String username, String password) {
    super(lastName, firstName, dob, gender, email, phone, username, password);
    this.category = category;
    this.about = about;
    this.type = type;
  }

  public Employee( UserType type, String lastName, String firstName, LocalDate dob, Gender gender, String email, String phone, String username, String password) {
    super(lastName, firstName, dob, gender, email, phone, username, password);
    this.type = type;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public EmployeeCategory getCategory() {
    return category;
  }

  public void setCategory(EmployeeCategory category) {
    this.category = category;
  }

  public String getAbout() {
    return about;
  }

  public void setAbout(String about) {
    this.about = about;
  }

  public UserType getType() {
    return type;
  }

  public void setType(UserType type) {
    this.type = type;
  }

  public Map<String, String> getSkills() {
    return skills;
  }

  public void setSkills(Map<String, String> skills) {
    this.skills = skills;
  }

  public AccountStatus getAccountStatus() {
    return accountStatus;
  }

  public void setAccountStatus(AccountStatus accountStatus) {
    this.accountStatus = accountStatus;
  }


  
  
}
