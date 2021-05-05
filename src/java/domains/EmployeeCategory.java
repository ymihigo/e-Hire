
package domains;

import java.io.Serializable;
import javax.persistence.*;

@Entity
public class EmployeeCategory implements Serializable {
  @Id
  @GeneratedValue(strategy =GenerationType.AUTO)
  private int id;
  @Column(unique = true)
  private String categoryName;
  @Version
  private long version=1;

  public EmployeeCategory() {
  }

  public EmployeeCategory(int id, String categoryName) {
    this.id = id;
    this.categoryName = categoryName;
  }

  public EmployeeCategory(String categoryName) {
    this.categoryName = categoryName;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getCategoryName() {
    return categoryName;
  }

  public void setCategoryName(String categoryName) {
    this.categoryName = categoryName;
  }

  public long getVersion() {
    return version;
  }

  public void setVersion(long version) {
    this.version = version;
  }
  
  
}
