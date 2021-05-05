
package domains;

import java.io.Serializable;
import javax.persistence.*;

@Entity
public class RequestJob implements Serializable {
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private int id;
  @ManyToOne
  private Jobs job;
  @ManyToOne
  private Employee employee;
  @Enumerated(EnumType.STRING)
  private OfferStatus status=OfferStatus.Pending;
  @Version
  private long version=1;

  public RequestJob() {
  }

  public RequestJob(int id, Jobs job, Employee employee) {
    this.id = id;
    this.job = job;
    this.employee = employee;
  }

  public RequestJob(Jobs job, Employee employee) {
    this.job = job;
    this.employee = employee;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public Jobs getJob() {
    return job;
  }

  public void setJob(Jobs job) {
    this.job = job;
  }

  public Employee getEmployee() {
    return employee;
  }

  public void setEmployee(Employee employee) {
    this.employee = employee;
  }

  public OfferStatus getStatus() {
    return status;
  }

  public void setStatus(OfferStatus status) {
    this.status = status;
  }

  public long getVersion() {
    return version;
  }

  public void setVersion(long version) {
    this.version = version;
  }
  
  

}
