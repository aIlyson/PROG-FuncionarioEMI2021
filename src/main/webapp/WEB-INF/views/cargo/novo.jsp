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
<title>Adicionar Cargos</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet">
</head>

<c:import url="../componentes/cabecalho.jsp" />


<div class="container mt-5 position-relative" style="margin-bottom: 6em;">
	<div class="row justify-content-center">
		<div class="col-md-6">
			<div class="form bg-white p-4 shadow">
				<div class="row">
					<div class="col-md-8">
						<form action="adiciona" method="POST">
							<div class="mt-4 mb-4">
								<h1>Adicionar Cargos</h1>
								<p>Para cadastrar um novo cargo, informe o nome e salário aqui.</p>
							</div>

							<div class="form-group">
								<label for="nome">Nome:<span class="text-danger">*</span></label> <input type="text" id="nome"
									name="nome" maxlength="50" pattern="[A-Za-z\s]+"
									title="Digite seu nome,  por favor, coloque sem acentuação" required class="form-control">
							</div>

							<div class="form-group">
								<label for="salario">Salário:<span class="text-danger">*</span></label>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">R$</span>
									</div>
									<input type="number" id="salario" name="salario"
										pattern="[0-9]+(\.[0-9]{1,2})?" min="0" max="9999999" required
										class="form-control" />
								</div>
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

<c:if test="${not empty mensagem}">
	<script>
		alert("${mensagem}");
	</script>
</c:if>

<c:import url="../componentes/footer.jsp" />