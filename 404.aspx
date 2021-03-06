﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="404.aspx.cs" Inherits="Display_404" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>中国海洋大学信息科学与工程学院</title>
    <link rel="shortcut icon" href="images/blogo.png" />
</head>
<style type="text/css">
    html {
        height: 99%;
    }

    body {
        height: 99%;
    }

    .not-find {
        width: 100%;
        /*height: 100%;*/
        background: url(../Display/images/404.gif) no-repeat;
        background-size: 100%;
        overflow: hidden;
    }

        .not-find h1 {
		font-family: Microsoft Yahei;
            display: block;
            width: 240px;
            margin: 0 auto;
            font-size: 30px;
            color: #333;
            margin-top: 580px;
            letter-spacing: 2px;
        }

        .not-find span {
            display: block;
            color: #fff;
            background: url(../Display/images/404-button.png) center no-repeat;
            width: 380px;
            height: 98px;
            line-height: 98px;
            margin: 0 auto;
            text-align: center;
            font-size: 26px;
            letter-spacing: 2px;
            /*font-weight: bold;*/
            margin-top: 70px;
        }

        .not-find a {
            display: block;
            width: 380px;
            height: 98px;
            color: #fff;
            text-decoration: none;
        }

    @media screen and (max-width: 1366px) {
        .not-find h1 {
            margin-top: 430px;
        }

        .not-find span {
            margin-top: 40px;
        }
    }
</style>
<body>
    <form id="form1" runat="server">
        <div class="not-find">
            <h1>hey 你走丢了喔</h1>
            <span><a href="../Display/Index.aspx">返回首页</a></span>
        </div>
    </form>
</body>
</html>
