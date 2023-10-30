package com.weather.servlet;

import cn.com.webxml.ArrayOfString;
import cn.com.webxml.WeatherWS;
import cn.com.webxml.WeatherWSSoap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/query")
public class QueryWeatherServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 设置默认的城市名称为成都
        String defaultCity = "成都";

        WeatherWS weatherWS = new WeatherWS();
        WeatherWSSoap weatherWSSoap = weatherWS.getWeatherWSSoap();
        ArrayOfString weather = weatherWSSoap.getWeather(defaultCity, null);

        if (weather != null) {
            // 将天气信息设置为request属性
            req.setAttribute("weatherData", weather);
            // 转发请求到JSP页面
            req.getRequestDispatcher("query/weatherShow.jsp").forward(req, resp);
        } else {
            resp.getWriter().write("未找到城市天气信息");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF-8");
        String cityName = "成都";
        cityName = req.getParameter("cityName");
//        System.out.println(cityName);

        WeatherWS weatherWS = new WeatherWS();
        WeatherWSSoap weatherWSSoap = weatherWS.getWeatherWSSoap();
        ArrayOfString weather = weatherWSSoap.getWeather(cityName, null);
//        System.out.println(weather.getString());
        if (weather != null) {
            // 将天气信息设置为request属性
            req.setAttribute("weatherData", weather);
            // 转发请求到JSP页面
            req.getRequestDispatcher("query/weatherShow.jsp").forward(req, resp);
        } else {
            resp.getWriter().write("未找到城市天气信息");
        }
    }
}
