({
	ClickAR : function(component, event, helper) {
		 component.set("v.Showmain", false);
      component.set("v.ShowAR", true);
        component.set("v.ShowVault", false);
	},
    
    ClickVault : function(component, event, helper) {
		component.set("v.Showmain", false);
      component.set("v.ShowAR", false);
        component.set("v.ShowVault", true);
	}
})