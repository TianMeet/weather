import cn.com.webxml.ArrayOfString;
import cn.com.webxml.WeatherWS;
import cn.com.webxml.WeatherWSSoap;

import java.util.Scanner;

public class Client {
    public static void main(String[] args) {
        WeatherWS weatherWS = new WeatherWS();
        WeatherWSSoap weatherWSSoap = weatherWS.getWeatherWSSoap();
        Scanner sc = new Scanner(System.in);
        String name = sc.nextLine();
        ArrayOfString weather = weatherWSSoap.getWeather(name,null);
        if(weather != null){
            for(String messageString:weather.getString()){
                System.out.println(messageString);
            }
        }
    }
}
