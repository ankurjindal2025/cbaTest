function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('Env in use :', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myVarName: 'test'
  }
  if (env == 'dev') {
   // TODO
  } else if (env == 'e2e') {
//TODO
  }
  return config;
}