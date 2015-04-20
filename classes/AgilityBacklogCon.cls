public class AgilityBacklogCon {

    public List<Agility_Story__c> stories {get; private set;}
    
    public AgilityBacklogCon(ApexPages.StandardController controller) {
		// Get all backlog stories
		this.stories = [select Id, Name, Status__c, Points__c, Sort_Order__c from Agility_Story__c WHERE Status__c NOT IN ('Completed','Canceled')];
    }

}