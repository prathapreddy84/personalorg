global class Sample_RESTIntegration { 
   global Sample_RESTIntegration () {
      
   } 
   public String GetSumApi() {       
       String calloutResponse = '';
       HttpRequest req = new HttpRequest();
       HttpResponse res = new HttpResponse();
       Http http = new Http();
      String accessToken = '';       
      req.setMethod('GET');               
            String requestBody = 'https://maps.googleapis.com/maps/api/geocode/xml?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&sensor=false';
              // req.setEndpoint(requestBody+ '?' + urlParameters);
          req.setEndpoint(requestBody);
               try {
                   res = http.send(req);
                   accessToken = res.getBody();
                   System.debug('accessToken :' + accessToken );                    
                   System.debug(res.getstatuscode());
               }
               catch(System.CalloutException e) {
                   System.debug('Callout error: '+ e);
                   System.debug(res.toString());
               }
         return accessToken;  
       }
       }