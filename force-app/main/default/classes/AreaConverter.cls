public with sharing class AreaConverter {
   @InvocableMethod(label='Convert Area' description='Convert area from square metre(sqm) to square feet(sft) or square yard(sqyd)')
   public static List<ConversionResponse> convertArea(List<ConversionRequest> requests) {
      // Retrieve the date for which we want to check the weather
      Integer sqm = (Integer) requests[0].area;
      String areaType = (String) requests[0].toAreaType;
      Decimal convertedArea;
      if(areaType == 'sft'){
            convertedArea = sqm * 10.763911105;
      } else if (areaType == 'sqyd') {
            convertedArea = sqm * 1.19598993;
      }
      // Create the response for Copilot
      ConversionResponse response = new ConversionResponse();
      response.area = 'It is ' + convertedArea + ' ' + areaType;
      return new List<ConversionResponse>{ response };
   }

   public class ConversionRequest {
      @InvocableVariable(required=true description='Numeric value of Area in square metre(sqm). If the area is not given, try and query the property__c record from the given context using QueryRecords and use the Area__c field value for the area')
      public Decimal area;
      @InvocableVariable(required=true description='To be converted to area type, either square feet(sft) or square yard(sqyd)')
      public String toAreaType;
   }

   public class ConversionResponse {
      @InvocableVariable(required=true description='Converted area in square feet(sft) or square yard(sqyd)')
      public String area;
   }

}