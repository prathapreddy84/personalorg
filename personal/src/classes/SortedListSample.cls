public class SortedListSample {   
    public List<Test__c> memList {get;set;}
    List<MemberWrapper> memberWrapperList = new List<MemberWrapper>();
    public SortedListSample() {
    }
    public void show()
    {
    memberWrapperList.clear();

        memList = new List<Test__c>();
        memList = [SELECT Name, score__c FROM Test__c];
        
        for(Test__c mem : memList){
            memberWrapperList.add(new MemberWrapper(mem));
        }
        
        memberWrapperList.sort();
        memList.clear();
        
        for(MemberWrapper MW : memberWrapperList){
            memList.add(MW.member);
        }
    }
    
    public class MemberWrapper implements Comparable {

        public Test__c member = new Test__c();
        
        // Constructor
        public MemberWrapper(Test__c memberRecord) {
            member = memberRecord;
        }
        
        // Compare members based on the Member__c Age.
        public Integer compareTo(Object compareTo) {
            // Cast argument to MemberWrapper
            MemberWrapper compareTomember = (MemberWrapper)compareTo;
            
            // The return value of 0 indicates that both elements are equal.
            Integer returnValue = 0;
            if (member.score__c > compareTomember.member.score__c ) {
                // Set return value to a negative value.
                returnValue = -1;
            } else if (member.score__c < compareTomember.member.score__c ) {
                // Set return value to a positive value.
                returnValue = 1;
            }
            
            return returnValue;       
        }
    }
}