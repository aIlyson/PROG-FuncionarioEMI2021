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
	href="<c:url value="/resources/css/login.css" />">
</head>

<body>
	<div class="container" id="container">
		<div class="form-container sign-up-container">
			<form action="usuario/register" method="POST">
				<h1 class="welcome-ghots">Criar Conta</h1>
				<input type="email" name="username" placeholder="Digite seu email" />
				<input type="password" name="password" placeholder="Digite sua senha" />
				<button type="submit">Registrar</button>
			</form>
		</div>
		<div class="form-container sign-in-container">
			<form action="<c:url value='/login' />" method="post">
				<h1>Entrar</h1>
				<input type="email" name="username" placeholder="E-mail" /> <input
					type="password" name="password" placeholder="Digite sua senha" />
				<button>Entrar</button>
			</form>
		</div>
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-left">
					<h1 class="welcome-ghots">Bem-vindo de Volta!</h1>
					<p class="welcome-ghots">Faça login com suas informações
						pessoais</p>
					<button class="ghost" id="signIn">Entrar</button>
				</div>
				<div class="overlay-panel overlay-right">
					<h1 class="welcome-ghots">Olá, Amigo!</h1>
					<p class="welcome-ghots">Insira seus detalhes pessoais</p>
					<button class="ghost" id="signUp">Registrar</button>
				</div>
			</div>
		</div>
	</div>

	<script>
	const signUpButton = document.getElementById('signUp');
	const signInButton = document.getElementById('signIn');
	const container = document.getElementById('container');

	signUpButton.addEventListener('click', () => {
		container.classList.add("right-panel-active");
	});

	signInButton.addEventListener('click', () => {
		container.classList.remove("right-panel-active");
	});
	</script>