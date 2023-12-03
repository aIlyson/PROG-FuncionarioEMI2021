<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/login.css" />">
<script src="https://kit.fontawesome.com/5b7b618a87.js"
	crossorigin="anonymous"></script>
</head>

<body>

	<div class="github-logo">
		<a href="https://github.com/aIlyson" target="_blank" class="icon">
			<i class="fab fa-github"></i>
		</a>
	</div>

	<div class="container" id="container">

		<div class="form-container sign-up-container">
			<div class="form-image-container">
				<img src="<c:url value="/resources/imagens/2.png" />" alt="Logo">
			</div>
			<form action="usuario/register" method="POST">
				<h1 class="welcome-ghots" style="color: #0D0D0D;">Criar Conta</h1>
				<input type="email" name="email" placeholder="Email" required />
				<div class="password-container">
					<input type="password" name="senha" id="senha" placeholder="Senha"
						pattern=".{6,}" title="A senha deve ter pelo menos 6 caracteres"
						required oninput="verificarForcaSenha(this.value)" /><i
						class="fas fa-eye-slash" id="sign-toggle-password"></i>
				</div>
				<div id="nivelSenha"></div>
				<button type="submit">Registrar</button>
			</form>
		</div>

		<div class="form-container sign-in-container">
			<div class="form-image-container">
				<img src="<c:url value="/resources/imagens/2.png" />" alt="Logo">
			</div>
			<form action="<c:url value='/login' />" method="post">
				<h1>Entrar</h1>
				<input name="username" id="username" placeholder="E-mail" />
				<div class="password-container">
					<input type="password" name="password" id="password"
						placeholder="Senha" required pattern=".{6,}"
						title="A senha deve ter pelo menos 6 caracteres"
						placeholder="Senha" /> <i class="fas fa-eye-slash"
						id="toggle-password"></i>
				</div>
				<button>Entrar</button>
			</form>
		</div>

		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-left">
					<h1 class="welcome-ghots">Olá de novo!</h1>
					<p class="welcome-ghots">Bem-vindo de volta! Por favor, faça o login usando sua conta</p>
					<button class="ghost" id="signIn">Entrar</button>
				</div>
				<div class="overlay-panel overlay-right">
					<h1 class="welcome-ghots">Olá, Amigo! Você não tem conta?</h1>
					<p class="welcome-ghots">Por favor, forneça suas informações pessoais para efetuar o login</p>
					<button class="ghost" id="signUp">Registrar</button>
				</div>
			</div>
		</div>

	</div>

	<div class="icons-container d-none d-lg-flex">
		<a href="https://www.instagram.com/rodrigoalencar.04/" target="_blank"
			class="icon m-0"> <i class="fab fa-instagram"></i> <span>Rodrigo</span>
		</a> <a href="https://www.instagram.com/anaflavix_/" target="_blank"
			class="icon m-0"> <i class="fab fa-instagram"></i> <span>Ana
				Flávia</span>
		</a> <a href="https://www.instagram.com/alyssonms_/" target="_blank"
			class="icon m-0"> <i class="fab fa-instagram"></i> <span>Alysson</span>
		</a> <a href="https://www.instagram.com/eu_alanamirele/" target="_blank"
			class="icon m-0"> <i class="fab fa-instagram"></i> <span>Alana</span>
		</a> <a href="https://www.instagram.com/luiz.hcc/" target="_blank"
			class="icon m-0"> <i class="fab fa-instagram"></i> <span>Luiz
				H.</span>
		</a>
	</div>

	<script type="text/javascript"
		src="<c:url value='/resources/js/login.js' />"></script>

</body>

</html>

<!-- 
   /\_/\
  ( o.o )
   > ^ <
   ~~~~~~~~ Swao
-->
