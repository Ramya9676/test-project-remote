({
	  handlefirstcomment: function(component){
        console.log('handlefirstcomment');
            component.set("v.CommentFirst",false);
          component.set("v.Commentresponse",false);
          var fq1 = component.get("v.firstQuestion1");
           var fq2 = component.get("v.firstQuestion2");
           var fq3 = component.get("v.firstQuestion3");
           var fq4 = component.get("v.firstQuestion4");
          console.log('fqs'+fq1 + fq2 + fq3 +fq4);
          
          if(fq1 == true){
             
              var comment1=component.find("FCOM1").get("v.value");
              console.log('comment1'+comment1);
              if(comment1 == null || comment1 ==''){
                  component.set("v.CommentFirst",true);
                  component.set("v.Commentresponse",true);
              }
          }
          
            
          if(fq2 == true){
              
              var comment2=component.find("FCOM2").get("v.value");
              if(comment2 == null || comment2 ==''){
                  component.set("v.CommentFirst",true);
                  component.set("v.Commentresponse",true);
              }
          }
          
            
          if(fq3 == true){
             
              var comment3=component.find("FCOM3").get("v.value");
              if(comment3 == null || comment3 ==''){
                  component.set("v.CommentFirst",true);
                  component.set("v.Commentresponse",true);
              }
          }
          
            
          if(fq4 == true){
              
              var comment4=component.find("FCOM4").get("v.value");
              if(comment4 == null || comment4 ==''){
                  component.set("v.CommentFirst",true);
                  component.set("v.Commentresponse",true);
              }
          }
       
},
    
     handlesecondcomment: function(component){
        console.log('handlesecondcomment');
            component.set("v.Commentsecond",false);
          component.set("v.secondresponse",false);
          var sq1 = component.get("v.secondQuestion1");
           var sq2 = component.get("v.secondQuestion2");
           var sq3 = component.get("v.secondQuestion3");
           var sq4 = component.get("v.secondQuestion4");
          console.log('sqs'+sq1 + sq2 + sq3 +sq4);
          
          if(sq1 == true){
             
              var comment1=component.find("SC1").get("v.value");
              console.log('comment1'+comment1);
              if(comment1 == null || comment1 ==''){
                  component.set("v.Commentsecond",true);
                  component.set("v.secondresponse",true);
              }
          }
          
            
          if(sq2 == true){
              
              var comment2=component.find("SC2").get("v.value");
              if(comment2 == null || comment2 ==''){
                  component.set("v.Commentsecond",true);
                  component.set("v.secondresponse",true);
              }
          }
          
            
          if(sq3 == true){
             
              var comment3=component.find("SC3").get("v.value");
              if(comment3 == null || comment3 ==''){
                 component.set("v.Commentsecond",true);
                  component.set("v.secondresponse",true);
              }
          }
          
            
          if(sq4 == true){
              
              var comment4=component.find("SC4").get("v.value");
              if(comment4 == null || comment4 ==''){
                 component.set("v.Commentsecond",true);
                  component.set("v.secondresponse",true);
              }
          }
       
},
    
    handlethirdcomment: function(component){
        console.log('handlethirdcomment');
            component.set("v.Commentthird",false);
          component.set("v.thirdresponse",false);
          var sq1 = component.get("v.ThirdQuestion1");
           var sq2 = component.get("v.ThirdQuestion2");
           var sq3 = component.get("v.ThirdQuestion3");
           var sq4 = component.get("v.ThirdQuestion4");
          console.log('sqs'+sq1 + sq2 + sq3 +sq4);
          
          if(sq1 == true){
             
              var comment1=component.find("COM1").get("v.value");
              console.log('comment1'+comment1);
              if(comment1 == null || comment1 ==''){
                  component.set("v.Commentthird",true);
                  component.set("v.thirdresponse",true);
              }
          }
          
            
          if(sq2 == true){
              
              var comment2=component.find("COM2").get("v.value");
              if(comment2 == null || comment2 ==''){
                  component.set("v.Commentthird",true);
                  component.set("v.thirdresponse",true);
              }
          }
          
            
          if(sq3 == true){
             
              var comment3=component.find("COM4").get("v.value");
              if(comment3 == null || comment3 ==''){
                 component.set("v.Commentthird",true);
                  component.set("v.thirdresponse",true);
              }
          }
          
            
          if(sq4 == true){
              
              var comment4=component.find("COM4").get("v.value");
              if(comment4 == null || comment4 ==''){
                 component.set("v.Commentthird",true);
                  component.set("v.thirdresponse",true);
              }
          }
       
},
})