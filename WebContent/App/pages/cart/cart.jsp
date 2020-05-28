<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="shortcut icon" href="/PrettyStyle/favicon.ico" type="image/x-icon" />
	
	<title>Pretty Style - Carrinho</title>
	
	<link rel="stylesheet" href="../../lib/bootstrap/4.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="../../lib/sweetalert/sweetalert.css">
	
	<link rel="stylesheet" href="../../styles/index.css">
	<link rel="stylesheet" href="../../styles/header.css">
	<link rel="stylesheet" href="../../styles/footer.css">
	<link rel="stylesheet" href="../../styles/responsive.css">
	
	<link rel="stylesheet" href="styles.css">
	</head>
	<body>
		<c:import url="../../components/header.jsp" />
		<div id="main-content" class="container">
			<div class="cart-container">
				<div class="container">
					<div class="col-md-12 header">
						<div class="row content">
							<div class="title">
								<label>Produtos no Carrinho</label>
							</div>
							<div class="line">
								<hr />
							</div>
						</div>
					</div>
					<div class="jumbotron main">
						<c:if test="${empty cart.items}">
							<div class="empty-cart">
								<strong>Seu carrinho está vazio.</strong>
							</div>
						</c:if>
						<c:if test="${not empty cart.items}">
							<div class="row">
								<div id="content" class="col-md-7 content">
									<c:forEach var="item" items="${cart.items}">
										<div class="row">
											<div class="col-md-12">
												<div class="product-details-area">
													<div class="product-photo-area">
														<img onclick="window.location.href='/PrettyStyle/controller.do?path=productdetails&command=ViewProduct&id_product=${item.product.id}'" src="${item.product.photos[0].url}" alt="${item.product.name}">
													</div>
													<div class="product-info">
														<label>${item.product.name}</label>
														<!-- <div class="stars">
															<span class="star yellow-star">&nbsp;</span>
															<span class="star yellow-star">&nbsp;</span>
															<span class="star yellow-star">&nbsp;</span>
															<span class="star yellow-star">&nbsp;</span>
															<span class="star gray-star">&nbsp;</span>
														</div> -->
														<div class="content">
															<span>Preço: </span>
															<label class="unitValue">
																<fmt:formatNumber value="${item.product.price}" type="currency" currencySymbol="R$" />
															</label>
														</div>
														<div class="quantity">
															<span>Quantidade: </span>
															<input class="form-control quantityInput" style="margin-left: 5px; width: 60px; height: 22px;" maxlength="3" value="${item.quantity}" onblur="handleUpdateQuantity(${item.id}, ${item.product.id}, ${item.quantity},this);" />
														</div>
													</div>
												</div>
											</div>
										</div>
										<hr id="linha" />
									</c:forEach>
								</div>
								<div class="col-md-5">
									<div class="jumbotron resume">
										<div class="resume-header">Resumo do Pedido</div>
										<div class="resume-body">
											<div class="resume-items">
												<div class="labels">
													<label id="lblQuantity">${cart.quantity} produtos</label>
													<label>Frete</label>
												</div>
												<div class="values">
													<label id="lblTotalValues"><fmt:formatNumber value="${cart.totalItems}" type="currency" currencySymbol="R$"/></label>
			  										<label><fmt:formatNumber value="${cart.frete}" type="currency" currencySymbol="R$"/></label>
												</div>
											</div>
											<hr />
											<div class="resume-total">
												<div class="labels">
													<label class="total-of-request">Total:</label>
												</div>
												<div class="values">
													<label class="total-value-of-request"><fmt:formatNumber value="${cart.total}" type="currency" currencySymbol="R$"/></label>
			  										<span class="total-installment">em até 12x sem juros</span>
			  										<span class="total-with-discount"><fmt:formatNumber value="${cart.bankSlip}" type="currency" currencySymbol="R$"/> à vista no boleto</span>
												</div>
											</div>
											<hr />
											<div class="resume-deadline">
												<div class="labels">
													<label class="total-of-deadline">Prazo para entrega:</label>
												</div>
												<div class="values">
													<label>15 Dias</label> <span>úteis</span>
												</div>
											</div>
											<div class="resume-button">
												<button id="id-user" type="button" onclick="window.location.href='/PrettyStyle/controller.do?path=paymentsteps&command=PayStep'">CONTINUAR</button>
											</div>
											<hr />
											<div class="resume-freight">
												<label class="total-of-deadline">Calcular frete e prazo:</label>
												<input class="form-control" maxlength="8" placeholder="digite o cep" value="${zip}" />
												<button type="button">OK</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<c:import url="../../components/footer.jsp" />
	
		<script src="../../lib/jquery/1.9.1/jquery-1.9.1.min.js"></script>
	
		<script src="script.js"></script>
	</body>
</html>
