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
        form {
            max-width: 400px;
            background-color: #ffffff;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            height: 240px;
            display: flex;
            justify-content: center;
            flex-direction: column;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }

        select, input {
            width: 100%;
            padding: 16px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #336699;
            color: #ffffff;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #265985;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 20px;
            min-width: 1400px;
        }
        .part_one,
        .part_two,
        .part_three {
            min-width: 400px;
        }
        .part_two {
            padding: 0 30px;
            border-left: 1px solid #eee;
            border-right: 1px solid #eee;
        }
        .part_three {
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .part_three form {

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

        .weather-info-one {
            border: 1px solid #ccc;
            padding: 10px 60px;
            margin-bottom: 20px;
            background-color: #ffffff;
            display: flex;
            justify-content: space-between;
        }
        .weather-info {
            border: 1px solid #ccc;
            padding: 10px 10px 30px 10px;
            margin-bottom: 20px;
            background-color: #ffffff;

        }

        .weather-predic {
            display: flex;
            align-content: center;
            justify-content: center;
            flex-direction: column;
            border-radius: 6px;
            width: 250px;
            height: 160px;
            padding: 10px;
            margin-bottom: 20px;
            background-color: #2495f1b5;
            opacity: 0.9;
        }

        .center {
            text-align: center;
            font-size: 20px;
            margin: 0;
            height: 30%;
        }

        .flex {
            display: flex;
            justify-content: space-between;
            padding: 0 40px;
        }
    </style>
</head>
<body>
<%
    // 获取从服务端传递过来的天气预报数据
    ArrayOfString weatherData = (ArrayOfString) request.getAttribute("weatherData");
    List<String> weatherInfoList = weatherData.getString();
//    System.out.println(weatherInfoList);
%>

<div class="weather-info-one">
    <div class="part_one">
        <h1>天气预报</h1>

        <h3>实时天气情况：</h3>
        <p>城市：<%= weatherInfoList.get(0) %>
        </p>
        <p>时间：<%= weatherInfoList.get(3) %>
        </p>

        <h3>今日天气：</h3>
        <p><%= weatherInfoList.get(4) %>
        </p>
        <p><%= weatherInfoList.get(5) %>
        </p>
    </div>

    <div class="part_two">
        <h3 style="margin-top: 40px">今日指数</h3>
            <%
                String[] ss = weatherInfoList.get(6).split("。");
                for (int i = 0;i<ss.length;i++) {
                    System.out.println(ss[i]);
            %>
            <p><%= ss[i] %></p>
            <%
                }
            %>

    </div>

    <div class="part_three">
        <form action="query" method="post">
            <div>
                <label for="city">选择省会城市</label>
                <select id="city" name="cityName">
                    <option value="北京">北京</option>
                    <option value="天津">天津</option>
                    <option value="上海">上海</option>
                    <option value="重庆">重庆</option>
                    <option value="石家庄">石家庄</option>
                    <option value="太原">太原</option>
                    <option value="呼和浩特">呼和浩特</option>
                    <option value="沈阳">沈阳</option>
                    <option value="长春">长春</option>
                    <option value="哈尔滨">哈尔滨</option>
                    <option value="南京">南京</option>
                    <option value="南昌">南昌</option>
                    <option value="合肥">合肥</option>
                    <option value="杭州">杭州</option>
                    <option value="福州">福州</option>
                    <option value="南宁">南宁</option>
                    <option value="武汉">武汉</option>
                    <option value="长沙">长沙</option>
                    <option value="广州">广州</option>
                    <option value="成都">成都</option>
                    <option value="昆明">昆明</option>
                    <option value="南宁">南宁</option>
                    <option value="西安">西安</option>
                    <option value="兰州">兰州</option>
                    <option value="西宁">西宁</option>
                    <option value="银川">银川</option>
                    <option value="乌鲁木齐">乌鲁木齐</option>
                </select>
            </div>
            <div>
                <input type="submit" id="query" value="查询"/>
            </div>
        </form>
    </div>
</div>

<div class="weather-info">
    <h1 style="padding: 0 50px">未来5天的天气情况</h1>
    <div class="flex">
        <%
            // 遍历未来几天的天气信息
            for (int i = 7; i < weatherInfoList.size(); i += 5) {
        %>
        <div class="weather-predic">
            <h3 class="center">时间<%= weatherInfoList.get(i) %>
            </h3>
            <p class="center">温度：<%= weatherInfoList.get(i + 1) %>
            </p>
            <p class="center">风向/风力：<%= weatherInfoList.get(i + 2) %>
            </p>
        </div>
        <%
            }
        %>
    </div>
</div>
<script>
    function queryWeather() {
        var cityName = document.getElementById('city').value;

        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'query', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // displayWeather(xhr.responseText);
            }
        };
        xhr.send('cityName=' + cityName);
    }

    function displayWeather(weatherData) {
        // console.log(weatherData);
        var weatherInfoDiv = document.getElementById('weatherInfo');
        weatherInfoDiv.innerHTML = weatherData;
        weatherInfoDiv.style.display = 'block';
    }
</script>
</body>
</html>


