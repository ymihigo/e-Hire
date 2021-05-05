
package domains;

import java.io.Serializable;
import java.time.LocalDate;
import javax.persistence.*;

@Entity
public class Employer extends Person implements Serializable{
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private int id;
  @Enumerated(EnumType.STRING)
  private UserType type;
  @Enumerated(EnumType.STRING)
  private AccountStatus accountStatus;
  @Version
  private long version=1;

  public Employer() {
  }

  public Employer(int id, UserType type, AccountStatus accountStatus, String lastName, String firstName, LocalDate dob, Gender gender, String email, String phone, String username, String password) {
    super(lastName, firstName, dob, gender, email, phone, username, password);
    this.id = id;
    this.type = type;
    this.accountStatus = accountStatus;
  }

  public Employer(String lastName, String firstName, LocalDate dob, Gender gender, String email, String phone, String username, String password) {
    super(lastName, firstName, dob, gender, email, phone, username, password);
    this.type = UserType.Employer;
    this.accountStatus = AccountStatus.Active;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public UserType getType() {
    return type;
  }

  public void setType(UserType type) {
    this.type = type;
  }

  public AccountStatus getAccountStatus() {
    return accountStatus;
  }

  public void setAccountStatus(AccountStatus accountStatus) {
    this.accountStatus = accountStatus;
  }

  public long getVersion() {
    return version;
  }

  public void setVersion(long version) {
    this.version = version;
  }
  
  
  
}
