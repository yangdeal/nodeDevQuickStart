var expect  = require('chai').expect;
var request = require('request');

describe('Status and content', function() {
    describe ('Main page', function() {
        it('Main page status', function(done) {
            request('http://localhost:3000/hello' , function(error, response, body) {
                expect(response.statusCode).to.equal(200);
                done();
            });
        });

        it('Main page content', function(done) {
            request('http://localhost:3000/hello' , function(error, response, body) {
                expect(body).to.equal("{\"message\":\"Hello World!\"}");
                done();
            });
        });
    });

    describe ('About page', function() {
        it('status', function(done){
            request('http://localhost:3000/about', function(error, response, body) {
                expect(response.statusCode).to.equal(404);
                done();
            });
        });
    });

});
