
import dao.Services.servicesInterface;
import dao.Services.servicesInterfaceImplementation;
import org.testng.annotations.Test;


public class tester {
  servicesInterface i=new servicesInterfaceImplementation();
  
  @Test
  public void testcreate(){
    i.deny("143");
  }
}
