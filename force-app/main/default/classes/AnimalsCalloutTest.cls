@isTest

public with sharing class AnimalsCalloutTest {
    
    @isTest
    static void calloutSuccess(){

        // 1st param is interface type: HttpCalloutMock.class 
        //2nd param instance of the mock class
        Test.setMock(HttpCalloutMock.class, new AnimalsCalloutsMockSuccess());
       

        Test.startTest();
        //make the callout from the main class
        HttpResponse response= AnimalsCallout.fetchAnimals();
        Test.stopTest();

        System.assertEquals(200, response.getStatusCode(), 'The status code must be 200');
        
        
    }

    
    @isTest
    static void calloutFailure(){

        // 1st param is interface type: HttpCalloutMock.class 
        //2nd param instance of the mock class
        Test.setMock(HttpCalloutMock.class, new AnimalsCalloutsMockFailure());
       

        Test.startTest();
        //make the callout from the main class
        HttpResponse response= AnimalsCallout.fetchAnimals();
        Test.stopTest();

        System.assertEquals(404, response.getStatusCode(), 'The status code must be 404');
        
        
    }
}
