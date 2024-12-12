trigger FunTrigger on Fun__c (before insert, before update, after insert, after update) {

    // Trigger logic for validation and processing
    
    // Before Insert or Update - Validation for Email and Mobile No
    if (Trigger.isBefore) {
        if (Trigger.isInsert || Trigger.isUpdate) {
            for (Fun__c funObj : Trigger.new) {
                // Validate Mobile Number (Ensure it contains exactly 10 digits)
                if (funObj.Mobile_No__c != null) {
                    // Use Pattern and Matcher for regex matching
                    Pattern p = Pattern.compile('\\d{10}');
                    Matcher m = p.matcher(funObj.Mobile_No__c);
                    if (!m.matches()) {
                        funObj.Mobile_No__c.addError('Mobile number must be exactly 10 digits.');
                    }
                }

                // Validate Email (Basic check to see if it contains '@')
                if (funObj.Email__c != null && !funObj.Email__c.contains('@')) {
                    funObj.Email__c.addError('Invalid email format.');
                }

                // Check if Currency is provided
                if (funObj.CurrencyIsoCode == null) {
                    funObj.CurrencyIsoCode.addError('Currency is required.');
                }
            }
        }
    }

    // After Insert - Perform actions like logging or updating other related records
    if (Trigger.isAfter && Trigger.isInsert) {
        // Example: Log the creation of a new Fun__c record
        for (Fun__c funObj : Trigger.new) {
            System.debug('New Fun__c record created: ' + funObj.Name + ' with Currency: ' + funObj.CurrencyIsoCode);
        }
    }

    // After Update - Perform actions based on field changes
    if (Trigger.isAfter && Trigger.isUpdate) {
        for (Integer i = 0; i < Trigger.new.size(); i++) {
            Fun__c oldFun = Trigger.old[i];
            Fun__c newFun = Trigger.new[i];
            
            // Example: Check if Currency has changed
            if (oldFun.CurrencyIsoCode != newFun.CurrencyIsoCode) {
                System.debug('Currency changed from ' + oldFun.CurrencyIsoCode + ' to ' + newFun.CurrencyIsoCode);
            }
        }
    }
}