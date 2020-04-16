<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />

    <title>Pretty Style - Produtos desejáveis</title>
    
    <link rel="stylesheet" href="App/lib/bootstrap/4.4.1/css/bootstrap.min.css">

    <link rel="stylesheet" href="App/styles/index.css">
    <link rel="stylesheet" href="App/styles/header.css">
    
    <link rel="stylesheet" href="App/pages/favorites/styles.css">
    <link rel="stylesheet" href="App/styles/responsive.css">
  </head>
  <body>
  	<c:import url="../../components/header.jsp" />
  	<div class="container">
		<div class="favorites-container">
			<div class="container">
				<div class="col-md-12 header">
					<div class="row content">
						<div class="title">
							<label>Favoritos</label>
						</div>
						<div class="line">
							<hr />
						</div>
					</div>
				</div>
				<div class="jumbotron main">
					<div class="col-md-12 content">
						<div class="row">
							<div class="col-md-11">
								<div class="product-details-area">
									<div class="product-photo-area">
										<img src="App/assets/img/jbl.png" alt="JBL Flip 3 Portable">
									</div>
									<div class="product-info">
										<label>JBL Flip 3 Portable</label>
										<span>Uma caixa de som com 30 watts de potência.</span>
										<div class="stars">
											<span class="star yellow-star">&nbsp;</span>
											<span class="star yellow-star">&nbsp;</span>
											<span class="star yellow-star">&nbsp;</span>
											<span class="star yellow-star">&nbsp;</span>
											<span class="star gray-star">&nbsp;</span>
										</div>
										<div class="content">
											<span>Preço: </span>
											<label>R$ 160,00</label>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-1 like">
								<div class="like-product">
									<div class="favorite">
								        <div class="favorite-icon">
								        	<img src="App/assets/icons/white-heart.svg">
							        	</div>
									</div>
								</div>
							</div>
						</div>
						<hr />
						<div class="row">
							<div class="col-md-11">
								<div class="product-details-area">
									<div class="product-photo-area">
										<img src="App/assets/img/jbl.png" alt="JBL Flip 3 Portable">
									</div>
									<div class="product-info">
										<label>JBL Flip 3 Portable</label>
										<span>Uma caixa de som com 30 watts de potência.</span>
										<div class="stars">
											<span class="star yellow-star">&nbsp;</span>
											<span class="star yellow-star">&nbsp;</span>
											<span class="star yellow-star">&nbsp;</span>
											<span class="star yellow-star">&nbsp;</span>
											<span class="star gray-star">&nbsp;</span>
										</div>
										<div class="content">
											<span>Preço: </span>
											<label>R$ 160,00</label>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-1 like">
								<div class="like-product">
									<div class="favorite">
								        <div class="favorite-icon">
								        	<img src="App/assets/icons/white-heart.svg">
							        	</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		
	<script src="App/lib/jquery/1.9.1/jquery-1.9.1.min.js"></script>
	<script src="App/js/general.js"></script>
	<!-- <script src="App/pages/favorites/utils.js"></script> -->
	</body>
</html>
