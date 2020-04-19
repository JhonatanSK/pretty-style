//document.addEventListener('DOMContentLoaded', function() {
//	let stars = document.querySelectorAll('.star');
//	stars.forEach(function(star) {
//		star.addEventListener('click', setRating);
//	});

//	let rating = parseInt(document.querySelector('.stars').getAttribute('data-rating'));
//	let target = stars[rating - 1];
//	target.dispatchEvent(new MouseEvent('click'));
//});

function parseJwt(token) {
	var base64Url = token.split('.')[1];
	var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
	var jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
		return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
	}).join(''));

	return JSON.parse(jsonPayload);
};

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
		
		if (star === span) {
			match = true;
			num = index + 1;
		}
	});
	document.querySelector('.stars').setAttribute('data-rating', num);
}

function AlertaAvisoConfirm(title, question, url, type, method) {
	swal({
		title: title,
		text: question,
		type: type,
		showCancelButton: true,
		confirmButtonText: "Sim",
		confirmButtonColor: "#3CB371",
		cancelButtonText: "N\u00e3o",
		closeOnConfirm: false,
		closeOnCancel: true
	}, function (isConfirm) {
		if (!isConfirm) return;
		$.ajax({
			url: url, type: method,
			success: function (data) {
				if (data.success) {
					swal({
						title: 'Sucesso!', text: data.message, type: "success"
					}, function () {
						//Load();
						document.location.reload(true);
					});
				} else {
					swal({
						title: "Erro", text: "Ocorreu um erro ao deletar o registro!", type: "error"
					});
				}
			},
			error: function (data) {
				swal("Erro", data.message, "error");
			}
		});
	});
}

function handleShowModal() {
	if ($('#login-modal').hasClass('inactive')) {
		$('#login-modal').removeClass('inactive');
		$('#login-modal').addClass('active');
	} else {
		$('#login-modal').removeClass('active');
		$('#login-modal').addClass('inactive');
	}
};
