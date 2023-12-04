function verificarForcaSenha(senha) {
	var numeros = /([0-9])/;
	var alfabeto = /([a-zA-Z])/;
	var chEspeciais = /([~,!,@,#,$,%,^,&,*,-,_,+,=,?,>,<])/;
	var nivelSenha = document.getElementById('nivelSenha');

	if (senha.trim() === "" || senha.length < 6) {
		if (senha.trim() === "") {
			nivelSenha.textContent = "";
			nivelSenha.style.color = "";
		} else {
			nivelSenha.textContent = "Mínimo de 6 caracteres";
			nivelSenha.style.color = "#0D0D0D";
		}
		return;
	}

	var forca = 0;

	forca += senha.length >= 12 ? 3 : (senha.length >= 8 ? 2 : 1);

	forca += senha.match(numeros) ? 2 : 0;
	forca += senha.match(alfabeto) ? 2 : 0;
	forca += senha.match(chEspeciais) ? 3 : 0;

	forca += (senha.match(/[A-Z]/) && senha.match(/[a-z]/)) ? 2 : 0;

	(forca >= 10) && ((nivelSenha.textContent = "Complexidade: Muito Segura") && (nivelSenha.style.color = "#2E5AAC"));
	(forca >= 6 && forca < 10) && ((nivelSenha.textContent = "Complexidade: Segura") && (nivelSenha.style.color = "#287D3C"));
	(forca >= 4 && forca < 6) && ((nivelSenha.textContent = "Complexidade: Moderada") && (nivelSenha.style.color = "#B95000"));
	(forca < 4) && ((nivelSenha.textContent = "Complexidade: Fraca") && (nivelSenha.style.color = "#DA1414"));
}

document.addEventListener('DOMContentLoaded', function() {
	const togglePassword = document.getElementById('toggle-password');
	const passwordFields = document.querySelectorAll('input[type="password"]');

	togglePassword.addEventListener('click', function() {
		passwordFields.forEach(function(passwordField) {
			const currentType = passwordField.getAttribute('type');
			const newType = currentType === 'password' ? 'text' : 'password';
			passwordField.setAttribute('type', newType);
		});

		togglePassword.classList.toggle('fa-eye');
	});


const signTogglePassword = document.getElementById('sign-toggle-password');
const signPasswordFields = document.querySelectorAll('input[type="password"]');

signTogglePassword.addEventListener('click', function () {
    signPasswordFields.forEach(function (passwordField) {
        const currentType = passwordField.getAttribute('type');
        const newType = currentType === 'password' ? 'text' : 'password';
        passwordField.setAttribute('type', newType);
    });

    signTogglePassword.classList.toggle('fa-eye');
});

	const signUpButton = document.getElementById('signUp');
	const signInButton = document.getElementById('signIn');
	const container = document.getElementById('container');

	signUpButton.addEventListener('click', () => {
		container.classList.add("right-panel-active");
	});

	signInButton.addEventListener('click', () => {
		container.classList.remove("right-panel-active");
	});
});