public class LeadTriggerhelper{

  public static void insertbefore(List<Lead> leadlst){
      for(Lead ld:leadlst){
          if(ld.phone==null){
             ld.phone='45651454784';
          }
       }
  } 
  public static void updatebefore(List<Lead> leadnwlst,Map<id,Lead> newmap){
      for(Lead ld:leadnwlst){
          if(ld.phone==null){
             ld.phone='45651454784';
          }
       }
  } 
}