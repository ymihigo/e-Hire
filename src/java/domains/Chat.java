
package domains;

import java.io.Serializable;
import java.time.LocalDate;
import javax.persistence.*;

@Entity
public class Chat implements Serializable{
  @Id
  @GeneratedValue(strategy =GenerationType.AUTO)
  private int id;
  @Column(nullable = false)
  private String message;
  @ManyToOne
  private RequestJob requestJob;
  @Version
  private long version=1;

  public Chat() {
  }

  public Chat(int id, String message, RequestJob requestJob) {
    this.id = id;
    this.message = message;
    this.requestJob = requestJob;
  }

  public Chat(String message, RequestJob requestJob) {
    this.message = message;
    this.requestJob = requestJob;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getMessage() {
    return message;
  }

  public void setMessage(String message) {
    this.message = message;
  }

  public RequestJob getRequestJob() {
    return requestJob;
  }

  public void setRequestJob(RequestJob requestJob) {
    this.requestJob = requestJob;
  }

  public long getVersion() {
    return version;
  }

  public void setVersion(long version) {
    this.version = version;
  }

  
}
