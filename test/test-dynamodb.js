var AWS = require("aws-sdk");
const should = require("should")

AWS.config.update({
region: "ap-southeast-2",
endpoint: "http://localhost:8000"
});

describe ("Check create table opration", function() {
    describe("create table", function() {
        it("should create a table if not existing", function() {
            var dynamodb = new AWS.DynamoDB();
            // var serverlessdynamodb = require('serverless-dynamodb-client');
            // var dynamodb = serverlessdynamodb.raw;
            
            var params = {
                TableName : "Movies",
                KeySchema: [       
                    { AttributeName: "year", KeyType: "HASH"},  //Partition key
                    { AttributeName: "title", KeyType: "RANGE" }  //Sort key
                ],
                AttributeDefinitions: [       
                    { AttributeName: "year", AttributeType: "N" },
                    { AttributeName: "title", AttributeType: "S" }
                ],
                ProvisionedThroughput: {       
                    ReadCapacityUnits: 1, 
                    WriteCapacityUnits: 1
                }
            };
            
            let create = dynamodb.createTable(params, function(err, data) {
                if (err) {
                    should.not.exist(data)
                } else {
                    should.exist(data);
                    data.TableDescription.should.have.property("TableName", "Movies");
                }
                done();
            });
        })
    })
})
