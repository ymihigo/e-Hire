 
package domains;

import java.io.Serializable;
import java.time.LocalDate;
import javax.persistence.*;


@MappedSuperclass
public class Person implements Serializable{
  private String lastName;
  private String firstName;
  private LocalDate dob;
  @Enumerated(EnumType.STRING)
  private Gender gender;
  @Column(unique = true)
  private String email;
  @Column(unique = true)
  private String phone;
  @Column(unique = true)
  private String username;
  private String password;

  public Person() {
  }

  public Person(String lastName, String firstName, LocalDate dob, Gender gender, String email, String phone, String username, String password) {
    this.lastName = lastName;
    this.firstName = firstName;
    this.dob = dob;
    this.gender = gender;
    this.email = email;
    this.phone = phone;
    this.username = username;
    this.password = password;
  }

  public String getLastName() {
    return lastName;
  }

  public void setLastName(String lastName) {
    this.lastName = lastName;
  }

  public String getFirstName() {
    return firstName;
  }

  public void setFirstName(String firstName) {
    this.firstName = firstName;
  }

  public LocalDate getDob() {
    return dob;
  }

  public void setDob(LocalDate dob) {
    this.dob = dob;
  }

  public Gender getGender() {
    return gender;
  }

  public void setGender(Gender gender) {
    this.gender = gender;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }
  
  
}
