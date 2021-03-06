<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<link rel="shortcut icon" href="<%=request.getContextPath()%>/favicon.ico" type="image/x-icon" />

		<title>Pretty Style - Etapas de Pagamento</title>
    
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
			<div class="payments-steps-container">
			  	<div class="container">
			  		<div class="col-sm-12 header">
			  			<div class="row">
							<div class="col-md-3 cartDiv">
								<div class="myCart active">
									Meu carrinho
									<img src="../../assets/icons/check.svg" alt="Check">
								</div>
							</div>
							<div class="col-md-3 identityDiv">
								<div class="identity active">
									Identificação
									<img src="../../assets/icons/check.svg" alt="Check">
								</div>
							</div>
							<div class="col-md-3 paymentDiv">
								<div class="payment active">
									Pagamento
									<img src="../../assets/icons/check.svg" alt="Check">
								</div>
							</div>
							<div class="col-md-3 thankyouDiv">
								<div class="thankyou">
									Obrigado!
									<img src="../../assets/icons/check.svg" alt="Check">
								</div>
							</div>
						</div>
						<hr />
			  		</div>
			  		<div class="jumbotron main">
			  			<div class="col-md-12">
			  				<div class="row">
			  					<div class="col-md-7 column-location">
			  						<div class="jumbotron location">
			  							<div class="location-header">Endereço de Entrega</div>
			  							<div class="location-body">
			  								<div class="location-body-content">
			  									<label class="location-name" id="addressRecipient">${address.recipient}</label>
			  									<div>
			  										<label>Endereço: </label><span id="addressPlace">${address.place}, ${address.number}</span>
			  									</div>
			  									<div>
			  										<label>Bairro: </label><span id="addressNeighborhood">${address.neighborhood}</span>
			  									</div>
			  									<div>
			  										<label>Cidade: </label><span id="addressCity">${address.city}</span>
			  									</div>
			  									<div>
			  										<label>Complemento: </label><span id="addressComplement">${address.complement}</span>
			  									</div>
			  									<div>
			  										<label>CEP: </label><span id="addressZip">${address.zip}</span>
			  									</div>
			  								</div>
			  								<div class="location-body-actions">
			  									<input id="addressOlder" type="hidden" value="${address.id}">
			  									<button type="button" data-toggle="modal" data-target="#update-address">Alterar endereço de entrega</button>
			  								</div>
			  							</div>
			  							<hr />
		 								<label>Opções de entrega: </label>
			  						</div>
			  					</div>
			  					<div class="col-md-5 column-resume">
			  						<div class="jumbotron resume">
			  							<div class="resume-header">Resumo do Pedido</div>
			  							<div class="resume-body">
			  								<div class="resume-items">
			  									<div class="labels">
			  										<label>${cart.quantity} produtos</label>
			  										<label>Frete</label>
			  									</div>
			  									<div class="values">
			  										<label><fmt:formatNumber value="${cart.totalItems}" type="currency" currencySymbol="R$"/></label>
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
			  										<label>15 Dias</label>
			  										<span>úteis</span>
			  									</div>
			  								</div>
			  							</div>
			  						</div>
			  					</div>
			  				</div>
			  				<hr />
			  				<div class="row">
			  					<div class="col-md-12">
			  						<div class="jumbotron payments-methods">
			  							<div class="row header">
			  								<label>Formas de pagamento</label>
			  							</div>
			  							<div class="row methods">
			  								<div class="col-md-6 credit-card-div">
			  									<div class="credit-card">
				  									<img src="../../assets/icons/credit-card.svg" alt="Cartão de crédito">
				  									<label>Cartão de crédito</label>
				  									<button type="button" onclick="handleSwitchPaymentMethodToCreditCard();">Selecione</button>
				  								</div>
			  								</div>
			  								<div class="col-md-6 bank-slip-div">
			  									<div class="bank-slip">
				  									<img src="../../assets/icons/bank-slip.svg" alt="Boleto bancário">
				  									<label>Boleto bancário</label>
				  									<button type="button" onclick="handleSwitchPaymentMethodToBankSlip();">Selecione</button>
				  								</div>
			  								</div>
			  							</div>
			  							<hr />
			  							<div class="credit-or-bank">
			  								<div id="credit-card" class="jumbotron credit-card-method">
				  								<form action="/PrettyStyle/controller.do?path=paymentsteps&command=Pay" method="POST" name="add-request-by-credit-card">
				  									<input id="total-price-without-discount" name="totalPriceWithoutDiscount" type="hidden" value="${cart.total}" />
			  										<input id="total-price-with-discount" name="totalPriceWithDiscount" type="hidden" value="${cart.bankSlip}" />
				  									<input type="hidden" value="creditCard" name="paymentType">
				  									<div class="inputs">
				  										<div class="row">
				  											<div class="col-md-4">
				  												<label for="number-credit-card" >Número do cartão</label>
				  											</div>
				  											<div class="col-md-8">
				  												<input class="form-control" id="number-credit-card" name="cardNumber" />
				  											</div>
				  										</div>
				  										<div class="row">
				  											<div class="col-md-4">
				  												<label for="printed-name-credit-card">Nome impresso no cartão</label>
				  											</div>
				  											<div class="col-md-8">
				  												<input class="form-control" id="printed-name-credit-card" name="cardName" />
				  											</div>
				  										</div>
				  										<div class="row">
				  											<div class="col-md-4">
				  												<label for="mounth-shelf-life-credit-card">Validade</label>
				  											</div>
				  											<div class="col-md-4">
				  												<input class="form-control" id="mounth-shelf-life-credit-card" name="validateMonth" />
				  											</div>
				  											<div class="col-md-4">
				  												<input class="form-control" id="year-shelf-life-credit-card" name="validateYear" />
				  											</div>
				  										</div>
				  										<div class="row">
				  											<div class="col-md-4">
				  												<label for="number-parcels">Parcelar em</label>
				  											</div>
				  											<div class="col-md-4">
				  												<select class="form-control" id="number-parcels" name="cardParcels">
				  													<option value="0">N° de parcelas</option>
				  													<option value="1">1 (<fmt:formatNumber value="${cart.bankSlip}" type="currency" currencySymbol="R$"/>)</option>
				  													<option value="2">2 (<fmt:formatNumber value="${parcela2}" type="currency" currencySymbol="R$"/>)</option>
				  													<option value="3">3 (<fmt:formatNumber value="${parcela3}" type="currency" currencySymbol="R$"/>)</option>
				  													<option value="4">4 (<fmt:formatNumber value="${parcela4}" type="currency" currencySymbol="R$"/>)</option>
				  													<option value="5">5 (<fmt:formatNumber value="${parcela5}" type="currency" currencySymbol="R$"/>)</option>
				  													<option value="6">6 (<fmt:formatNumber value="${parcela6}" type="currency" currencySymbol="R$"/>)</option>
				  													<option value="7">7 (<fmt:formatNumber value="${parcela7}" type="currency" currencySymbol="R$"/>)</option>
				  													<option value="8">8 (<fmt:formatNumber value="${parcela8}" type="currency" currencySymbol="R$"/>)</option>
				  													<option value="9">9 (<fmt:formatNumber value="${parcela9}" type="currency" currencySymbol="R$"/>)</option>
				  													<option value="10">10 (<fmt:formatNumber value="${parcela10}" type="currency" currencySymbol="R$"/>)</option>
				  													<option value="11">11 (<fmt:formatNumber value="${parcela11}" type="currency" currencySymbol="R$"/>)</option>
				  													<option value="12">12 (<fmt:formatNumber value="${parcela12}" type="currency" currencySymbol="R$"/>)</option>
				  												</select>
				  											</div>
				  											<div class="col-md-1">
				  												<label for="cvv-credit-card">CVV</label>
				  											</div>
				  											<div class="col-md-3">
				  												<input class="form-control" id="cvv-credit-card" name="cardCvv" />
				  											</div>
				  										</div>
				  									</div>
				  									<div class="pay-and-total">
				  										<label style="color: #ffffff;"><fmt:formatNumber value="${cart.total}" type="currency" currencySymbol="R$"/></label>
				  										<button type="submit">Pagar</button>
				  										<label id="total-price">Total: <fmt:formatNumber value="${cart.total}" type="currency" currencySymbol="R$"/></label>
				  									</div>
			  									</form>
			  								</div>
			  								<div id="bank-slip" class="jumbotron bank-slip-method" style="display: none;">
			  									<form action="/PrettyStyle/controller.do?path=paymentsteps&command=Pay" method="POST" name="add-request-by-bank-slip">
			  										<input type="hidden" value="bankSlip" name="paymentType">
			  										<input id="total-price-with-discount-bank-slip" name="totalPriceWithDiscount" type="hidden" value="${cart.bankSlip}" />
				  									<div class="inputs">
				  										<div class="row">
					  										<div class="col-md-1">
					  											<div class="image-area">
						  											<img src="../../assets/icons/print.svg" alt="Impressora">
					  											</div>
					  										</div>
					  										<div class="col-md-11">
					  											<div class="label-area">
					  												<label>Imprima o boleto e pague no banco.</label>
					  											</div>
					  										</div>
					  									</div>
					  									<div class="row">
					  										<div class="col-md-1">
					  											<div class="image-area">
						  											<img src="../../assets/icons/bank.svg" alt="Banco">
					  											</div>
					  										</div>
					  										<div class="col-md-11">
					  											<div class="label-area">
					  												<label>ou pague pela internet utilizando o código de barras do boleto.</label>
					  											</div>
					  										</div>
					  									</div>
					  									<div class="row">
					  										<div class="col-md-1">
					  											<div class="image-area">
						  											<img src="../../assets/icons/calendar.svg" alt="Calendário">
					  											</div>
					  										</div>
					  										<div class="col-md-11">
					  											<div class="label-area">
					  												<label>o prazo de validade do boleto é de 1 dia útil.</label>
					  											</div>
					  										</div>
					  									</div>
				  									</div>
				  									<div class="pay-and-total">
				  										<label style="color: #ffffff;"><fmt:formatNumber value="${cart.total}" type="currency" currencySymbol="R$"/></label>
				  										<button type="submit">Pagar</button>
				  										<label>Total: <fmt:formatNumber value="${cart.total}" type="currency" currencySymbol="R$"/></label>
				  									</div>
			  									</form>
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
 		<div class="modal fade" id="update-address" tabindex="-1" role="dialog" aria-labelledby="modalLabel">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="modalLabel">Alterar endereço principal<label class="lblProductName"></label></h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class= col-md-12>
								<div class="form-group">
									<strong>Selecione o endereço a ser entregue:</strong>
								</div>
								<table class="table table-stripped">
									<thead>
										<tr>
											<th></th>
											<th>Destinatário</th>
											<th>Endereço</th>
											<th>CEP</th>
										</tr>
									</thead>
									<tbody id="modal-addresses-content"></tbody>
								</table>
								<input id="addressUpdate" type="hidden" value="">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<div style="display: flex; justify-content: space-between; align-items: center;">
							<div>
								<button type="submit" class="btn btn-primary" onclick="handleUpdateDefaultAddress();">Alterar</button>
								<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
 		<c:import url="../../components/footer.jsp" />
		
		<script src="../../lib/jquery/1.9.1/jquery-1.9.1.min.js"></script>
		<script src="../../lib/jquery-validation/jquery.validate.min.js"></script>
		<script src="../../lib/bootstrap/4.4.1/js/bootstrap.min.js"></script>
		<script src="../../lib/sweetalert/sweetalert.min.js"></script>
		<script src="../../lib/mask/jquery.mask.js"></script>
		
		<script src="script.js"></script>
	</body>
</html>
