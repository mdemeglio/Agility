public class AgilityStoryUtil {
    
    public static void recalcSprintPoints(List<Agility_Story__c> storyList){
        
        string logTag = '[recalcSprintPoints]';
        Set<Id> sprintIdSet = new Set<Id>();
        
        for(Agility_Story__c story:storyList){
        	if(story.Agility_Sprint__c == null || story.Points__c == null) continue;
            sprintIdSet.add(story.Agility_Sprint__c);            
        }
        
        system.debug(logTag + 'sprintIdSet size: [' + sprintIdSet.size() + ']');
        
        List<Agility_Sprint__c> updateList = new List<Agility_Sprint__c>();
        
        AggregateResult[] arList = [select Agility_Sprint__c Sprint, sum(Points__c) from Agility_Story__c where Agility_Sprint__c IN :sprintIdSet GROUP BY Agility_Sprint__c];
        for(AggregateResult ar:arList){
            
            string sprintId = (string)ar.get('Sprint');
            decimal pointsTotal = ((decimal)ar.get('expr0'));
            system.debug(logTag + 'Sprint [' + sprintId + ' has [' + pointsTotal + '] total story points.');
            Agility_Sprint__c sprint = new Agility_Sprint__c(Id = sprintId, Total_Story_Points__c = pointsTotal);
            updateList.add(sprint);
        }        
        
        if(!updateList.isEmpty()){
            upsert(updateList);
        }
    }
    
}