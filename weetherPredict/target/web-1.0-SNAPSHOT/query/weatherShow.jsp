<%--
  Created by IntelliJ IDEA.
  User: xingkong
  Date: 2023/10/28
  Time: 14:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="cn.com.webxml.ArrayOfString" %>

<html>
<head>
    <title>天气预报</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 20px;
        }

        h2 {
            color: #333333;
        }

        h3 {
            color: #336699;
        }

        p {
            color: #666666;
        }

        h1 {
            color: #336699;
        }

        .weather-info {
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 20px;
            background-color: #ffffff;
        }
    </style>
</head>
<body>

<%
    // 获取从服务端传递过来的天气预报数据
    ArrayOfString weatherData = (ArrayOfString) request.getAttribute("weatherData");
    List<String> weatherInfoList = weatherData.getString();
%>

<div class="weather-info">
<h2>天气预报</h2>

<h3>实时天气情况：</h3>
<p>城市：<%= weatherInfoList.get(0) %></p>
<p>时间：<%= weatherInfoList.get(3) %></p>

<h3>今日天气：</h3>
<p><%= weatherInfoList.get(4) %></p>
<p><%= weatherInfoList.get(5) %></p>
<p><%= weatherInfoList.get(6) %></p>
</div>

<div class="weather-info">
<h1>未来5天的天气情况</h1>
<%
    // 遍历未来几天的天气信息
    for (int i = 7; i < weatherInfoList.size(); i += 5) {
%>
<div class="weather-info">
    <h3>时间<%= weatherInfoList.get(i) %></h3>
    <p>温度：<%= weatherInfoList.get(i + 1) %></p>
    <p>风向/风力：<%= weatherInfoList.get(i + 2) %></p>
</div>
<%
    }
%>
</div>
</body>
</html>


