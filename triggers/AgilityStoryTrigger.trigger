trigger AgilityStoryTrigger on Agility_Story__c (before insert, after insert, before update, after update, before delete, after delete, after undelete) {
	new AgilityStoryTriggerHandler().run();
}