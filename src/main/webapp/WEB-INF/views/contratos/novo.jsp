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
<title>Formalizar Contrato</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet">
</head>

<c:import url="../componentes/cabecalho.jsp" />


<div class="container mt-5 position-relative"
	style="margin-bottom: 6em;">
	<div class="row justify-content-center">
		<div class="col-md-8">
			<div class="form bg-white p-4 shadow">
				<div class="row">
					<div class="col-md-9">
						<form action="adiciona" method="POST"
							onsubmit="return validarDatas()">
							<div class="mt-4 mb-4">
								<h1>Formalize Contrato</h1>
								<p>Crie aqui novos contratos.</p>
							</div>

							<div class="form-group">
								<label for="empresa">Empresa:<span class="text-danger">*</span></label>
								<div class="input-group">
									<select id="empresa" name="empresa.id" required
										class="form-select">
										<option selected disabled>Selecione um empresa</option>
										<c:forEach var="empresa" items="${empresa}">
											<option value="${empresa.id}">${empresa.nome}</option>
										</c:forEach>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label for="funcionario">Funcionário:<span
									class="text-danger">*</span></label>
								<div class="input-group">
									<select id="funcionario" name="funcionarios.id" required
										class="form-select">
										<option selected disabled>Selecione um funcionário</option>
										<c:forEach var="funcionario" items="${funcionarios}">
											<option value="${funcionario.id}">${funcionario.nome}</option>
										</c:forEach>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label for="cargo">Cargo:<span class="text-danger">*</span></label>
								<div class="input-group">
									<select id="cargo" name="cargo.id" required class="form-select">
										<option selected disabled>Selecione um cargo</option>
										<c:forEach var="cargo" items="${cargo}">
											<option value="${cargo.id}">${cargo.nome}</option>
										</c:forEach>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label for="matricula">Matrícula:<span
									class="text-danger">*</span></label> <input type="text" id="matricula"
									name="matricula" class="form-control" required
									pattern="\d{9}-\d" maxlength="11"
									title="Digite 9 dígitos seguidos por um hífen e um dígito. Exemplo: 123456789-0">
								<small>Exemplo: 123456789-0</small>
								
							</div>

							<div class="form-group">
								<label for="dataInicio">Data Início:<span
									class="text-danger">*</span></label> <input type="text" id="dataInicio"
									name="dataInicio" required class="form-control">
							</div>

							<div class="form-group">
								<label for="dataEncerramento">Data Encerramento:<span
									class="text-danger">*</span></label> <input type="text"
									id="dataEncerramento" name="dataEncerramento" required
									class="form-control">
							</div>

							<div class="form-group">
								<label for="status">Status:<span class="text-danger">*</span></label>
								<select id="status" name="status" required class="form-control">
									<option selected disabled>Selecione um status</option>
									<option value="true">Ativo</option>
									<option value="false">Inativo</option>
									<option class="d-none" value="vencido">Vencido</option>
									<option class="d-none" value="arquivado">Arquivado</option>
									<option class="d-none" value="rescindido">Rescindido</option>
									<option class="d-none" value="renovado">Renovado</option>
								</select>
							</div>

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

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/js/validatedate.js"></script>

<script>
	$(document).ready(function() {
		$('#matricula').mask('999999999-9');
	});
</script>