<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.10.2/umd/popper.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/nav.css"/>">
<script type="text/javascript"
	src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<script src="https://kit.fontawesome.com/5b7b618a87.js"
	crossorigin="anonymous"></script>
</head>
<body>

	<nav class="navbar navbar-expand-lg bg-light" data-bs-theme="light">
		<div class="container-fluid position-relative">
			<a class="navbar-brand"> <img
				src="<c:url value="/resources/imagens/2.png" />" alt="Logo">
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarColor03"
				aria-controls="navbarColor03" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarColor03">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link active"
						href="/projetoweb">Pagina inicial <span
							class="visually-hidden"></span></a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Cadastro </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="<c:url value="/empresa/novo" />">Empresa</a>
							<a class="dropdown-item"
								href="<c:url value="/funcionarios/novo" />">Funcionario</a> <a
								class="dropdown-item" href="<c:url value="/cargo/novo" />">Cargo</a>
							<a class="dropdown-item" href="<c:url value="/endereco/novo" />">Endereço</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Contratos </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="<c:url value="/contratos/novo" />">Formalizar
								contratos</a> <a class="dropdown-item"
								href="<c:url value="/contratos/lista" />">Monitorar
								contratos</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Férias e Licenças </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="<c:url value="/ferias/novo" />">Nova
								férias</a> <a class="dropdown-item"
								href="<c:url value="/ferias/lista" />">Supervisionar férias</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item"
								href="<c:url value="/licensaafastamento/novo" />">Novo
								licença</a> <a class="dropdown-item"
								href="<c:url value="/licensaafastamento/lista" />">Supervisionar
								licença</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Relatório </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="<c:url value="/empresa/lista" />">Empresa</a>
							<a class="dropdown-item"
								href="<c:url value="/funcionarios/lista" />">Funcionario</a> <a
								class="dropdown-item" href="<c:url value="/cargo/lista" />">Cargo</a>
							<a class="dropdown-item" href="<c:url value="/endereco/lista" />">Endereço</a>
						</div></li>
				</ul>

				<a href="https://github.com/aIlyson" target="_blank"
					class="icon d-none d-lg-block"> <i class="fab fa-github"></i>
				</a>
			</div>
		</div>
	</nav>