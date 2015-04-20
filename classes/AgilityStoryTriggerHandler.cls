public class AgilityStoryTriggerHandler extends TriggerHandlerBase{
    
    public override void afterInsert(){
    	// Update sprint points  
    	AgilityStoryUtil.recalcSprintPoints(trigger.new);  
    }
    
    public override void beforeInsert(){}
    
    public override void afterUpdate(){
		// Update sprint points IF the points have changed                
    }
    
    public override void beforeUpdate(){}    
    
}