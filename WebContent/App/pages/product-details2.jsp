<div class="product-details-container">
	<div class="container">
		<div class="col-md-12 header">
			<div class="row content">
				<div class="title">
					<label>Detalhes do produto</label>
				</div>
				<div class="line">
					<hr />
				</div>
			</div>
		</div>
		<div class="jumbotron main">
			<div class="col-md-12 content">
				<div class="row">
					<div class="col-md-5">
						<div class="product-photo-area">
							<img src="App/assets/icons/arrow-left.svg" alt="Arrow left" class="arrow-left">
							<div class="jumbotron product-photo">
								<img src="App/assets/img/jbl.png" alt="JBL Flip 3">
								<div class="next-circles">
									<div class="circle-next active"></div>
									<div class="circle-next"></div>
									<div class="circle-next"></div>
								</div>
							</div>
							<img src="App/assets/icons/arrow-right.svg" alt="Arrow right" class="arrow-right">
						</div>
					</div>
					<div class="col-md-7">
						<div class="row title-product">
							<div>
								<label>JBL Flip 3 Portable</label>
								<span>Uma caixa de som com 30 watts de potência.</span>
								<div class="stars">
									<span>&nbsp;</span>
								</div>
							</div>
							<div></div>
						</div>
						<div class="row price-product"></div>
						<div class="row info-product"></div>
						<div class="row button-area"></div>
					</div>
				</div>
				<!-- <div class="card border border-secondary" style="width: auto; height: auto">
					<div class="row" style="padding: 4vh">
						<div class="col-md-4">
							<div class="row">
								<a class="col-md-1 setas" href="#">❮</a>
								<div class="card border border-primary col-md-10" style="width: 1000px; height: 430px;">
									<img src="App/assets/img/jbl.png" style="width: 100%; height: 92%;" alt="" />
									<div class="pagination">
										<a href="#" class="active" style="border-radius: 30px;"></a>
										<a href="#" style="border-radius: 30px;"></a>
										<a href="#" style="border-radius: 30px;"></a>
										<a href="#" style="border-radius: 30px;"></a>
										<a href="#" style="border-radius: 30px;"></a>
										<a href="#" style="border-radius: 30px;"></a>
									</div>
								</div>
								<a class="col-md-1 setas" href="#">❯</a>
							</div>
						</div>
						<div class="col-md-8">
							<div class="row">
								<div class="col-md-12">
									<div class="produto col-md-10" style="font-size: 6vh; float: left">JBL Flip 3 Portable</div>
									<div class="icone col-md-2" style="float: right; font-size: 4vh">
										<img class=src=App/assets/icons/heart.svg style="width: 100%; height: 100%;" alt="" />
									</div>
									<div class="descricao col-md-12" style="float: left">Uma caixa de som com 30 watts de potencia</div>
									<div class="stars col-md-12" data-rating="0">
										<span class="star">&nbsp;</span>
										<span class="star">&nbsp;</span>
										<span class="star">&nbsp;</span>
										<span class="star">&nbsp;</span>
										<span class="star">&nbsp;</span>
									</div>
								</div>
								<div class="col-md-6" style="padding: 4vh;">
									<div class="row">
										<div class="col-md-3" style="font-size: 3vh">Preço:</div>
										<div class="col-md-9" style="font-size: 3vh; font-weight: bold;">R$ 250,00</div>
									</div>
									<br>
									<div class="row col-md-12">
										Quantidade:
										<select class="col-md-2" id="quantidade">
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
										</select>
									</div>
								</div>
								<div class="col-md-6" style="padding: 4vh;">
									<div class="form-group">
										<label for="InputCep">Calcular frete e prazos</label>
									</div>
									<div>
										<input class="button-cep" id="InputCep" aria-describedby="emailHelp" placeholder="Digite o CEP">
										<button type="button" class="btn btn-primary" style="border-radius: 30px;">OK</button>
									</div>
								</div>
								<div class="col-md-12">
									<hr />
								</div>
								<div class="col-md-6">
									<p>Mais informações</p>
								</div>
								<div class="col-md-6">
									Esse produto é vendido e entregue por
									<p class="text-primary">PrettyStyle</p>
								</div>
							</div>
							<div class="botão" style="">
								<button type="button" class="btn btn-primary btn-lg btn-block" style="border-radius: 30px; margin: 30px auto;">COMPRAR</button>
							</div>
						</div>
					</div>
				</div> -->
			</div>
		</div>
	</div>
</div>

<script>
	//initial setup
	document.addEventListener('DOMContentLoaded', function() {
		let stars = document.querySelectorAll('.star');
		stars.forEach(function(star) {
			star.addEventListener('click', setRating);
		});

		let rating = parseInt(document.querySelector('.stars').getAttribute(
				'data-rating'));
		let target = stars[rating - 1];
		target.dispatchEvent(new MouseEvent('click'));
	});

	function setRating(ev) {
		let span = ev.currentTarget;
		let stars = document.querySelectorAll('.star');
		let match = false;
		let num = 0;
		stars.forEach(function(star, index) {
			if (match) {
				star.classList.remove('rated');
			} else {
				star.classList.add('rated');
			}
			//are we currently looking at the span that was clicked
			if (star === span) {
				match = true;
				num = index + 1;
			}
		});
		document.querySelector('.stars').setAttribute('data-rating', num);
	}
</script>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
