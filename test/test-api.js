var expect  = require('chai').expect;
var request = require('request');

describe('API gateway:', function() {
    describe ('Hello page', function() {
        it('status 200', function(done) {
            request('http://localhost:3000/hello' , function(error, response, body) {
                expect(response.statusCode).to.equal(200);
                done();
            });
        });

        it('content', function(done) {
            request('http://localhost:3000/hello' , function(error, response, body) {
                expect(body).to.equal("{\"message\":\"Hello World!\"}");
                done();
            });
        });
    });

    describe ('non-exist page', function() {
        it('status 404', function(done){
            request('http://localhost:3000/non-exist', function(error, response, body) {
                expect(response.statusCode).to.equal(404);
                done();
            });
        });
    });

});
