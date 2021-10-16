
const options = {method: 'GET', headers: {Accept: 'application/json', APIKEY: 'MF5K7cUboM8PfTGFyhy7RvcBY6ZA2KPw'}};

fetch('https://api.securitytrails.com/v1/domain/oracle.com', options)
  .then(response => response.json())
  .then(response => console.log(response))
  .catch(err => console.error(err));