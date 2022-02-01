function fn() {
 var env = karate.env; // get system property 'karate.env'
 karate.log('karate.env system property was:', env);
 if (!env) {
   env = 'IOS';
 }
 var config = {
   env: env,
   myVarName: 'MyObservatory',
   baseUrl: 'https://pda.weather.gov.hk/locspc/data/fnd_e.xml'   //9-Day forecast endpoint ENG - IOS
}

 if (env == 'Android') {
    config.baseUrl = 'https://pda.weather.gov.hk/locspc/android_data/fnd_e.xml' ;  //9-Day forecast endpoint ENG - Android
 }

 return config;
}