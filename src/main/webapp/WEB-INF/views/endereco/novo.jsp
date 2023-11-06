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
<title>Adicionar Endereço</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet">
</head>

<c:import url="../componentes/cabecalho.jsp" />

<div class="container mt-5 mb-5 position-relative">
	<div class="row justify-content-center">
		<div class="col-md-7">
			<div class="form bg-white p-4 shadow">
				<div class="row">
					<div class="col-md-8">
						<form action="adiciona" method="POST">
							<div class="mt-4 mb-4">
								<h1>Adicionar Endereços</h1>
								<p>Cadastrar aqui novos endereços.</p>
							</div>

							<div class="form-group">
								<label for="cidade">Cidade:</label> <input type="text"
									id="cidade" name="cidade" required class="form-control">
							</div>

							<div class="form-group">
								<label for="estado">Estado:</label> <input type="text"
									id="estado" name="estado" required class="form-control">
							</div>

							<div class="form-group">
								<label for="numero">Número:</label> <input type="text"
									id="numero" name="numero" required class="form-control">
							</div>

							<div class="form-group">
								<label for="cep">CEP:</label> <input type="text" id="cep"
									name="cep" pattern="[0-9]{8}" required class="form-control">
							</div>

							<div class="form-group">
								<label for="bairro">Bairro:</label> <input type="text"
									id="bairro" name="bairro" required class="form-control">
							</div>

							<div class="form-group">
								<label for="rua">Rua:</label> <input type="text" id="rua"
									name="rua" required class="form-control">
							</div>

							<security:csrfInput />

							<button class="btn btn-primary" type="submit">Criar</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<c:import url="../componentes/footer.jsp" />