public class AgilityTestUtils {

    public static Agility_Story__c createStory(string name, boolean insertRecord){
        Agility_Story__c s = new Agility_Story__c(Name = name);
        if(insertRecord) insert(s);
        return s;
    }
    
    public static Agility_Task__c createTask(Agility_Story__c story, String name, Decimal duration, boolean insertRecord){
        Agility_Task__c t = new Agility_Task__c(Name = name, Agility_Story__c = story.Id, Duration__c = duration);
        if(insertRecord) insert(t);
        return t;
    }   
    
    public static Agility_Time_Entry__c createTimeEntry(Agility_Task__c task, Decimal duration, Boolean insertRecord){
        Agility_Time_Entry__c te = new Agility_Time_Entry__c(Agility_Task__c = task.Id, Duration__c = duration);
        if(insertRecord) insert(te);
        return te;
    }
    
}