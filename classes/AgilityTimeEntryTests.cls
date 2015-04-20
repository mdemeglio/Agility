@isTest
public class AgilityTimeEntryTests {

    static testMethod void createTest(){}    
    
    static testMethod void updateTest(){}
    
    static testMethod void deleteTest(){}
    
    static testMethod void timeEntryUpdatesStoryStatus(){
        // When a new time entry is added, the story should be set to "Started"
        Agility_Story__c testStory = AgilityTestUtils.createStory('Test Story',true);
        Agility_Task__c testTask = AgilityTestUtils.createTask(testStory, 'Test Task #1', 8, true);
        
        Test.startTest();
        Agility_Time_Entry__c testEntry = AgilityTestUtils.createTimeEntry(testTask,4,true);
        Test.stopTest();
        
        Agility_Story__c storyResult = [select Status__c from Agility_Story__c where id = :testStory.Id];
        system.assertEquals('Started',storyResult.Status__c);
    }
}