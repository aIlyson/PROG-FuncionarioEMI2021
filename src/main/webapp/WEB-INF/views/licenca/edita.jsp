<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Editar Dados Licen�a</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>

<c:import url="../componentes/cabecalho.jsp" />


<div class="container mt-5">
	<form action="altera" method="POST" onsubmit="return validarDatas()"
		class="bg-white p-4 shadow-sm rounded">
		<fieldset>
			<legend>Alterar dados da licen�a:</legend>

			<input type="hidden" name="id" value="${licencaafastamento.id}"
				required> <input type="hidden" name="funcionarios.id"
				value="${licencaafastamento.funcionarios.id}" required> <input
				type="hidden" name="tipoLicenca"
				value="${licencaafastamento.tipoLicenca}" required>

			<div class="form-group">
				<label for="dataInicio" class="d-block mt-3">Data Inicial:<span
					class="text-danger">*</span>
				</label>
				<fmt:formatDate pattern="dd/MM/yyyy"
					value="${licencaafastamento.dataInicio}" var="dataFormatada" />
				<input type="text" id="dataInicio" name="dataInicio"
					pattern="^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/(2000|20[0-2][0-9]|2040)$"
					title="Formato inv�lido. Insira entre 01/01/2000 e 31/12/2040"
					required class="form-control" value="${dataFormatada}">
			</div>

			<div class="form-group">
				<label for="dataFim" class="d-block mt-3">Data de
					Encerramento:<span class="text-danger">*</span>
				</label>
				<fmt:formatDate pattern="dd/MM/yyyy"
					value="${licencaafastamento.dataFim}" var="dataFormatada" />
				<input type="text" id="dataEncerramento" name="dataFim"
					pattern="^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/(2000|20[0-2][0-9]|2040)$"
					title="Formato inv�lido. Insira entre 01/01/2000 e 31/12/2040"
					required class="form-control text-danger" value="${dataFormatada}">
			</div>

			<security:csrfInput />

			<div class="form-group">
				<a
					href="<c:url value='/licenca/licencasFuncionario?id=${licencaafastamento.funcionarios.id}' />"
					class="btn btn-secondary btn-lg"> <span class="fas fa-times"></span>
					Cancelar
				</a>
				<button type="submit" class="btn btn-primary btn-lg">
					<span class="fas fa-refresh"></span> Atualizar
				</button>
			</div>
		</fieldset>
	</form>
</div>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/js/validatedate.js"></script>

</body>
</html>
