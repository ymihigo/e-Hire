
package domains;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;
import javax.persistence.*;


@Entity
public class Jobs implements Serializable{
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private int id;
  private String jobTittle;
  private String Company;
  @ManyToOne
  private EmployeeCategory category;
  private String description;
  @ElementCollection
  private Map<String,String> requirements=new HashMap<>();
  private LocalDate deadline;
  @Enumerated(EnumType.STRING)
  private Job_Offer_Status status=Job_Offer_Status.Due;
  @ManyToOne
  private Employer employer;
  @Version
  private long version=1;

  public Jobs() {
  }

  public Jobs(int id, String jobTittle, String Company, EmployeeCategory category, String description, Map<String, String> requirements, LocalDate deadline,Employer employer) {
    this.id = id;
    this.jobTittle = jobTittle;
    this.Company = Company;
    this.category = category;
    this.description = description;
    this.requirements = requirements;
    this.deadline = deadline;
    this.employer=employer;
  }

  public Jobs(String jobTittle, String Company, EmployeeCategory category, String description, Map<String, String> requirements, LocalDate deadline,Employer employer) {
    this.jobTittle = jobTittle;
    this.Company = Company;
    this.category = category;
    this.description = description;
    this.requirements = requirements;
    this.deadline = deadline;
    this.employer=employer;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getJobTittle() {
    return jobTittle;
  }

  public void setJobTittle(String jobTittle) {
    this.jobTittle = jobTittle;
  }

  public String getCompany() {
    return Company;
  }

  public void setCompany(String Company) {
    this.Company = Company;
  }

  public EmployeeCategory getCategory() {
    return category;
  }

  public void setCategory(EmployeeCategory category) {
    this.category = category;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public Map<String, String> getRequirements() {
    return requirements;
  }

  public void setRequirements(Map<String, String> requirements) {
    this.requirements = requirements;
  }

  public LocalDate getDeadline() {
    return deadline;
  }

  public void setDeadline(LocalDate deadline) {
    this.deadline = deadline;
  }

  public Job_Offer_Status getStatus() {
    return status;
  }

  public void setStatus(Job_Offer_Status status) {
    this.status = status;
  }

  public Employer getEmployer() {
    return employer;
  }

  public void setEmployer(Employer employer) {
    this.employer = employer;
  }

  
  public long getVersion() {
    return version;
  }

  public void setVersion(long version) {
    this.version = version;
  }
  
  
}
