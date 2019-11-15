const initGoogleImage = () => {
    console.log('test api')

    var request = require('request');

    var headers = {
      'apikey': '3fdac450-07a2-11ea-a905-d5a710eb7980'
    };

    var options = {
      url: 'https://app.zenserp.com/api/v2/search?q=boats&hl=en&gl=US&location=United%20States&search_engine=google.com',
      headers: headers
    };

    function callback(error, response, body) {
      if (!error && response.statusCode == 200) {
        console.log(body);
      }
    }

    request(options, callback);

}

export default initGoogleImage
