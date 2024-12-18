({
    handlePOC : function(component, event, helper) {
         component.set("v.UCerrormsg1",false);
        component.set("v.UCerrormsg2",false);
        component.set("v.UCerrormsg3",false);
      
        var selectPS=component.find("selectItem1").get("v.value");
         var selectValue=component.find("selectItem1").get("v.value");
         var selectValue2=component.find("selectItem2").get("v.value");
         var selectValue3=component.find("selectItem3").get("v.value");
       var Usecase1=component.find("UC1").get("v.value");
         var Usecase2=component.find("UC2").get("v.value");
         var Usecase3=component.find("UC3").get("v.value");
       
        helper.handlefirstcomment(component);
        helper.handlesecondcomment(component);
         helper.handlethirdcomment(component);
      
        if(selectPS == null){
            
            component.set("v.errormsg",true);
        }
         if(selectPS != null){
            if(Usecase1 == ''){
                component.set("v.UCerrormsg1",true);
            }
        }
 if(selectValue2 !=null && (Usecase2 == null || Usecase2=='')){
             component.set("v.UCerrormsg2",true);
        }
        
        if(selectValue3 !=null && (Usecase3 == null || Usecase3=='')){
             component.set("v.UCerrormsg3",true);
        }
                
        if((selectValue != null) && selectValue == selectValue2 ){
             console.log('showerror'); 
             component.set("v.errormsgPS",true);
         }
        
         if((selectValue != null && selectValue2 !=null) && ((selectValue == selectValue3) || (selectValue2 == selectValue3)) ){
             console.log('showerror2');   
             component.set("v.errormsgPS2",true);
         }
        
        var errormsgPS = component.get("v.errormsgPS");
        var errormsgPS2 = component.get("v.errormsgPS2");
        var ucmessage1 =component.get("v.UCerrormsg1");
         var ucmessage2 =component.get("v.UCerrormsg2");
         var ucmessage3 =component.get("v.UCerrormsg3");
        var CommentsValue=component.get("v.Commentresponse");
        var CommentsValue2=component.get("v.secondresponse");
        var CommentsValue3=component.get("v.thirdresponse");
        console.log('myValue'+CommentsValue);
         console.log('myValue2'+CommentsValue2);
        console.log('myValue3'+CommentsValue3);
        console.log('ucmessage1'+ucmessage1);
        console.log('ucmessage2'+ucmessage2);
        console.log('ucmessage3'+ucmessage3);
        
         
         if(selectPS !=null && errormsgPS == false && errormsgPS == false && ucmessage1 == false && ucmessage2 == false && ucmessage3 == false && CommentsValue ==false && CommentsValue2 ==false && CommentsValue3 ==false){
              component.find('type').set('v.value', 'VAULT');
        component.find("pocForm").submit();
         }

    },
    
    handleLoad : function(component, event, helper) {
		console.log('handle handleLoad');
        component.set("v.showSpinner", false);
         component.set("v.disabled", false);
         component.set("v.disabledMain", true);
         
	},
    
     
	handleSuccess : function(component, event, helper) {
		console.log('record updated successfully');
        component.set("v.saved", true);
        component.set("v.showSpinner", false);
        component.set("v.enableSuccess", true);
	},
    ClickBack : function(component, event, helper) {
		
         window.location.reload();
	},
    
     ClickNext : function(component, event, helper) {
		console.log('ClickNext');
        component.set("v.showSpinner", true);
         component.set("v.disabled", false);
         component.set("v.disabledMain", true);
         
	},
    Clear : function(component, event, helper) {
		console.log('ClickNext');
        component.set("v.showSpinner", false);
         component.set("v.disabled", true);
         component.set("v.disabledMain", false);
         
	},
    
      Cancel : function(component, event, helper) {
        window.location.reload();
    },
    
handleChange1 : function(component, event, helper) { 
        
         component.set("v.firstQuestion1", false);
         component.set("v.firstQuestion2", false);
         component.set("v.firstQuestion3", false);
         component.set("v.firstQuestion4", false);
    		component.set("v.CommentFirst",false);
    
    
    
    
       
         var selectValue=component.find("selectItem1").get("v.value");
         var selectValue2=component.find("selectItem2").get("v.value");
         var selectValue3=component.find("selectItem3").get("v.value");
		console.log('selectValue'+selectValue);
      
        
         if(selectValue == 'Frequent your "change-only" backups by using an Optimized API approach'){
             
             component.set("v.firstQuestion1", true);
         }
         if(selectValue == 'Improve your RTO/RPO by using Vault multi-depth hierarchical restore'){
             
             component.set("v.firstQuestion2", true);
         }
         if(selectValue == 'Ready your sandboxes for functional testing with data and metadata'){
             
             component.set("v.firstQuestion3", true);
         }
         if(selectValue == 'Have your Salesforce environment within data limits with Vault archiving capability'){
             
             component.set("v.firstQuestion4", true);
         }
       
        },     
    
    handleChange2 : function(component, event, helper) { 
component.set("v.errormsgPS",false);
component.set("v.secondQuestion1", false);
         component.set("v.secondQuestion2", false);
         component.set("v.secondQuestion3", false);
         component.set("v.secondQuestion4", false);
        component.set("v.Commentsecond",false);
    
		 
		  var selectValue=component.find("selectItem1").get("v.value");
         var selectValue2=component.find("selectItem2").get("v.value");
         var selectValue3=component.find("selectItem3").get("v.value");
		console.log('selectValue'+selectValue);
		
		if((selectValue != null) && selectValue == selectValue2 ){
             console.log('showerror'); 
             component.set("v.errormsgPS",true);
         }
		 
		 if(selectValue2 == 'Frequent your "change-only" backups by using an Optimized API approach'){
             
             component.set("v.secondQuestion1", true);
         }
         if(selectValue2 == 'Improve your RTO/RPO by using Vault multi-depth hierarchical restore'){
             
             component.set("v.secondQuestion2", true);
         }
         if(selectValue2 == 'Ready your sandboxes for functional testing with data and metadata'){
             
             component.set("v.secondQuestion3", true);
         }
         if(selectValue2 == 'Have your Salesforce environment within data limits with Vault archiving capability'){
             
             component.set("v.secondQuestion4", true);
         }
},
    
    handleChange3 : function(component, event, helper) { 
component.set("v.errormsgPS2",false);
  component.set("v.ThirdQuestion1", false);
         component.set("v.ThirdQuestion2", false);
         component.set("v.ThirdQuestion3", false);
         component.set("v.ThirdQuestion4", false);
        component.set("v.Commentthird",false);
		  
		  var selectValue=component.find("selectItem1").get("v.value");
         var selectValue2=component.find("selectItem2").get("v.value");
         var selectValue3=component.find("selectItem3").get("v.value");
		console.log('selectValue'+selectValue);
		  if((selectValue != null && selectValue2 !=null) && ((selectValue == selectValue3) || (selectValue2 == selectValue3)) ){
             console.log('showerror2');   
             component.set("v.errormsgPS2",true);
         }
		 
		
         
         if(selectValue3 == 'Frequent your "change-only" backups by using an Optimized API approach'){
             
             component.set("v.ThirdQuestion1", true);
         }
         if(selectValue3 == 'Improve your RTO/RPO by using Vault multi-depth hierarchical restore'){
             
             component.set("v.ThirdQuestion2", true);
         }
         if(selectValue3 == 'Ready your sandboxes for functional testing with data and metadata'){
             
             component.set("v.ThirdQuestion3", true);
         }
         if(selectValue3 == 'Have your Salesforce environment within data limits with Vault archiving capability'){
             
             component.set("v.ThirdQuestion4", true);
         }
},
  
})