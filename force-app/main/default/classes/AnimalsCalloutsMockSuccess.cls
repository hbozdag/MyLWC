@isTest

public with sharing class AnimalsCalloutsMockSuccess implements HttpCalloutMock {

    //this mock class is always the same. take it and use it

    public HttpResponse respond(HttpRequest request){

        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setStatusCode(200);
        response.setBody('{"animals":["Gorilla","Lion","Monkey","Snakes"]}');
        return response;

    }

}
