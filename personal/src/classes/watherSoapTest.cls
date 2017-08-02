public class watherSoapTest
{
    public static void test()
    {
        wsCdyneComWeatherws.WeatherSoap a=new wsCdyneComWeatherws.WeatherSoap();
        wsCdyneComWeatherws.ArrayOfWeatherDescription data=a.GetWeatherInformation();
        system.debug('>>>>'+data);
        wsCdyneComWeatherws.WeatherDescription[] test=data.WeatherDescription;
        for(integer i=0;i<test.size();i++)
        {
           // system.debug('>>>>Description'+test[i].Description);
            // system.debug('>>>>PictureURL'+test[i].PictureURL);
           //  system.debug('>>>>WeatherID'+test[i].WeatherID);
        }
        wsCdyneComWeatherws.WeatherReturn forcast=a.GetCityWeatherByZIP('01001');
          system.debug('>>>>WeatherID'+forcast);
    }
}