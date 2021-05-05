
package dao;

import domains.Chat;
import domains.Employee;
import domains.Employer;
import domains.Jobs;
import domains.OfferStatus;
import domains.RequestJob;
import java.util.List;
import org.hibernate.*;


public class GenericDao {
  SessionFactory sf=HibernateUtil.getSessionFactory();
  Session ss=null;
  Transaction tx=null;
  
  
  public void create(Object obj){
    try{
      ss=sf.openSession();
      tx=ss.beginTransaction();
      ss.save(obj);
      tx.commit();
    }catch(HibernateException ex){
      tx.rollback();
      throw new RuntimeException(ex.getMessage());
    }finally{
      ss.close();
    }
  }
  
  public void update(Object obj){
      try{
      ss=sf.openSession();
      tx=ss.beginTransaction();
      ss.update(obj);
      tx.commit();
    }catch(HibernateException ex){
      tx.rollback();
      throw new RuntimeException(ex.getMessage());
    }finally{
      ss.close();
    }
  }
  
  public Object findById(Object obj,int id){
    try{
      ss=sf.openSession();
      Object o=(Object) ss.get(obj.getClass(), id);
      return o;
    }catch(HibernateException ex){
      throw new RuntimeException(ex.getMessage());
    }finally{
      ss.close();
    }
  }
   public Object findById(Object obj,String id){
    try{
      ss=sf.openSession();
      Object o=(Object) ss.get(obj.getClass(), id);
      return o;
    }catch(HibernateException ex){
      throw new RuntimeException(ex.getMessage());
    }finally{
      ss.close();
    }
  }
   public List printAll(Object o){
     try{
       ss=sf.openSession();
       List<Object> lio=(List<Object>) ss.createCriteria(o.getClass()).list();
       return lio;
     }catch(HibernateException ex){
       throw new RuntimeException(ex.getMessage());
     }finally{
       
     }
   }
   
   public Employee findEmployeeByUsername(String username){
     try{
       ss=sf.openSession();
       String hql="from Employee where username ='"+username+"'";
       Query query=ss.createQuery(hql);
       
       return (Employee) query.uniqueResult();
       
     }catch(HibernateException ex){
       throw new RuntimeException(ex.getMessage());
     }finally{
       ss.close();
     }
   }
   
   public Employer findEmployerByUsername(String username){
     try{
       ss=sf.openSession();
       String hql="from Employer where username ='"+username+"'";
       Query query=ss.createQuery(hql);
       
       return (Employer) query.uniqueResult();
       
     }catch(HibernateException ex){
       throw new RuntimeException(ex.getMessage());
     }finally{
       ss.close();
     }
   }
   
   public Employee loginEmployee(String username,String password){
     try{
       ss=sf.openSession();
       String hql="from Employee where username = '"+username+"' and password ='"+password+"'";
       Query query=ss.createQuery(hql);
       return (Employee) query.uniqueResult();
     }catch(HibernateException ex){
       throw new RuntimeException(ex.getMessage());
     }finally{
       ss.close();
     }
   }
   
   public Employer loginEmployer(String username,String password){
     try{
       ss=sf.openSession();
       String hql="from Employer where username = '"+username+"' and password ='"+password+"'";
       Query query=ss.createQuery(hql);
       return (Employer) query.uniqueResult();
     }catch(HibernateException ex){
       throw new RuntimeException(ex.getMessage());
     }finally{
       ss.close();
     }
   }
   
   public List printJobPerEmployer(int id){
     try{
       ss=sf.openSession();
       String hql="from Jobs where employer_id ="+id+"";
       Query query=ss.createQuery(hql);
       return (List<Jobs>) query.list();
     }catch(HibernateException ex){
       throw new RuntimeException(ex.getMessage());
     }finally{
       ss.close();
     }
   }
   
   public List printApplicantsPerJob(int id){
     try{
       ss=sf.openSession();
       String hql="from RequestJob where job_id="+id+" and status='"+OfferStatus.Pending+"'";
       Query query=ss.createQuery(hql);
       return (List<RequestJob>) query.list();
     }catch(Exception ex){
       throw new RuntimeException(ex.getMessage());
     }finally{
       ss.close();
     }
   }
   
   public List print_All_Pending_ApplicationPerEmployer(int id){
     try{
       ss=sf.openSession();
       String hql="from RequestJob where employee_id="+id+" and status='"+OfferStatus.Pending+"'";
       Query query=ss.createQuery(hql);
       return (List<RequestJob>) query.list();
     }catch(Exception ex){
       throw new RuntimeException(ex.getMessage());
     }finally{
       ss.close();
     }
   }
      public List print_All_Denied_ApplicationPerEmployer(int id){
     try{
       ss=sf.openSession();
       String hql="from RequestJob where employee_id="+id+" and status='"+OfferStatus.Denied+"'";
       Query query=ss.createQuery(hql);
       return (List<RequestJob>) query.list();
     }catch(Exception ex){
       throw new RuntimeException(ex.getMessage());
     }finally{
       ss.close();
     }
   }
         public List print_All_Accepted_ApplicationPerEmployer(int id){
     try{
       ss=sf.openSession();
       String hql="from RequestJob where employee_id="+id+" and status='"+OfferStatus.Accepted+"'";
       Query query=ss.createQuery(hql);
       return (List<RequestJob>) query.list();
     }catch(Exception ex){
       throw new RuntimeException(ex.getMessage());
     }finally{
       ss.close();
     }
   }
   
    public Chat getchat(int id){
      try{
        ss=sf.openSession();
        String hql="from Chat where requestjob_id = "+id+"";
        Query query=ss.createQuery(hql);
        return (Chat) query.uniqueResult();
      }catch(HibernateException ex){
        throw new RuntimeException(ex.getMessage());
      }finally{
        ss.close();
      }
    }
}
