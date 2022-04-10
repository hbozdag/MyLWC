AnimalsCallout.fetchAnimals();
DoctorStrangeCallout.fetchVideoDetails('aWzlQ2N6qqg');

Account acc = [SELECT Id, Name FROM Account LIMIT 1][0];
String accJSON = JSON.serialize(acc);
system.debug('accJSON: '+accJSON);

Account accRec = (Account)JSON.deserialize(accJSON, Account.class);
system.debug('accRec: '+accRec);

String jsonStr = '{"animals":["majestic badger","fluffy bunny","scary bear","chicken"],"city": "NY",  "open": false,  "attendance": 2000}';
AnimalsCalloutResponse resp = (AnimalsCalloutResponse)JSON.deserializeStrict(jsonStr, AnimalsCalloutResponse.class);