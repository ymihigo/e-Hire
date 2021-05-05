
package dao.Services;

import domains.Employee;
import java.util.Map;

public interface servicesInterface {
  public void createJob(String jobTittle, String Company,String employeecategoryid, String description, Map<String, String> requirements, String deadline,String employer);
  public void requestJob(String jobId, Employee employee);
  public void acceptRequest(String requestID,String message);
  public void deny(String requestId);
}
