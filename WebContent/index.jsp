<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Pretty Style</title>
    
    <link rel="stylesheet" href="App/lib/bootstrap/4.4.1/css/bootstrap.min.css">

    <link rel="stylesheet" href="App/styles/global/index.css">
    <link rel="stylesheet" href="App/styles/global/header.css">
    
    <link rel="stylesheet" href="App/styles/home.css">
    <link rel="stylesheet" href="App/styles/sign-in.css">
    <link rel="stylesheet" href="App/styles/sign-up-simple.css">
    <link rel="stylesheet" href="App/styles/sign-up-business.css">
    <link rel="stylesheet" href="App/styles/product-details.css">
    <link rel="stylesheet" href="App/styles/payments-steps.css">
    <link rel="stylesheet" href="App/styles/favorites.css">
    <link rel="stylesheet" href="App/styles/cart.css">
    <!-- thanks -->
    <link rel="stylesheet" href="App/styles/profile.css">
    <!-- catalogo -->
    <link rel="stylesheet" href="App/styles/save-address.css">
    <link rel="stylesheet" href="App/styles/profile-address.css">
    <!-- requests -->
    <link rel="stylesheet" href="App/styles/global/responsive.css">
  </head>
  <body>
  	<c:import url="App/components/header.jsp" />
  	<div class="container">
  		<c:import url="App/pages/sign-up-simple.jsp"/>
  		<c:import url="App/pages/sign-up-business.jsp"/>
  		<c:import url="App/pages/sign-in.jsp"/>
	    <c:import url="App/pages/home.jsp"/>
	    <c:import url="App/pages/product-details.jsp"/>
	    <c:import url="App/pages/payments-steps.jsp"/>
	    <c:import url="App/pages/favorites.jsp"/>
	    <c:import url="App/pages/cart.jsp"/>
	    <!-- thanks -->
	    <c:import url="App/pages/profile.jsp"/>
	    <!-- catalogo -->
	    <c:import url="App/pages/save-address.jsp"/>
	    <c:import url="App/pages/profile-address.jsp"/>
	    <!-- requests -->
  	</div>
    <script src="App/lib/jquery/3.4.1/jquery-3.4.1.min.js"></script>
    <script src="App/lib/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  </body>
</html>
