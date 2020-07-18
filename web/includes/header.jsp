<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%
session = request.getSession(false);
String usuarioo = (String)session.getAttribute("usuario");
if(session == null || usuarioo == null ) {
    response.sendRedirect("/login.jsp"); %>
    <jsp:forward page="../login.jsp" />
<%}else{}%>
<%  String message = null;
    String sessionID = null;
    Cookie[] cookies = request.getCookies();
    if(cookies != null){
        for(Cookie cookie : cookies){
            if(cookie.getName().equals("welcome")) message = cookie.getValue();
            if(cookie.getName().equals("SESSIONID")) sessionID = cookie.getValue();
        }
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Daria Mar</title>

    <!-- Bootstrap Core CSS -->
    <!--<link href="css/bootstrap.min.css" rel="stylesheet">-->
    <link rel="stylesheet" href="css/bootstrap-4.3.1.min.css">

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- jQuery -->
    <script src="js/validacion.js" type="text/javascript"></script>
    <script src="js/jquery.js"></script>
</head>
<body class="fixed-nav sticky-footer" id="page-top">