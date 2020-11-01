trigger CSSProject on workshopday__Grant_Funding__c (before insert,before update) {

    for(workshopday__Grant_Funding__c gf:trigger.new) {
        
        if(	gf.workshopday__CSS_Project__c=='Yes'){
            
            if(gf.workshopday__Online_Center__c!='a084W00001eMelKQAS'){
                gf.addError('for CSS project,online center must be only CSS');
            }
        }
        
        }
    }