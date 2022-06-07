function fn() 
{    
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) 
  {
    env = 'qa';
  }
  var config = 
  {
    BaseUrl: 'https://api.realworld.io/api/'
  }
   if(env == 'dev')
   {
        config.userEmail = 'karatemahu@test.com'
        config.userPassword = 'karate1234'
        config.baseURL = 'https://reqres.in/api/dev'

        
   }
 
   if (env == 'qa') 
  {
    config.userEmail = 'qamahu2@test.com'
    config.userPassword = 'qamahu12345678'
    config.baseURL = 'https://api.realworld.io/api/'
  }

return config;
}

