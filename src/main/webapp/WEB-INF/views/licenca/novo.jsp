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
<title>Nova Licença</title>
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
								<h1>Nova Licença</h1>
								<p>Autorize uma licença ao funcionário, permitindo o
									afastamento a partir da data de início até a data de término.</p>
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
								<label for="dataInicio">Data Início:<span
									class="text-danger">*</span></label>
								<div class="input-group">
									<input type="text" id="dataInicio" name="dataInicio"
										pattern="^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/(2000|20[0-2][0-9]|2040)$"
										title="Formato inválido. Insira entre 01/01/2000 e 31/12/2040"
										required class="form-control">
									<div class="input-group-append">
										<button class="btn btn-secondary" type="button" id="picker">Inserir
											data atual</button>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="dataFim">Data Encerramento:<span
									class="text-danger">*</span></label> <input type="text"
									id="dataEncerramento" name="dataFim"
									pattern="^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/(2000|20[0-2][0-9]|2040)$"
									title="Formato inválido. Insira entre 01/01/2000 e 31/12/2040"
									required class="form-control">
							</div>

							<div class="form-group">
								<label for="tipoLicenca">Tipo de licença: <span
									class="text-danger">*</span></label>
								<div class="input-group">
									<select id="tipoLicenca" name="tipoLicenca" required
										class="form-select">
										<option selected disabled>Selecione uma licença</option>
										<option value="Medica">Licença médica</option>
										<option value="Maternidade">Licença maternidade</option>
										<option value="Paternidade">Licença paternidade</option>
										<option value="Casamento">Licença casamento</option>
										<option value="Acidente">Afastamento por Acidente de
											Trabalho</option>
										<option value="Militar">Afastamento por Serviço
											Militar</option>
										<option value="Luto">Afastamento luto</option>
									</select>
								</div>
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
<script type="text/javascript" src="../resources/js/datepicker.js"></script>