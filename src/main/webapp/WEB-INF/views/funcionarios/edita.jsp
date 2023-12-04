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
<title>Editar Funcion�rio</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>

<c:import url="../componentes/cabecalho.jsp" />


<div class="container mt-5">
	<form action="altera" method="POST"
		onsubmit="return validarDataNascimento()"
		class="bg-white p-4 shadow-sm rounded">
		<fieldset>
			<legend>Alterar funcion�rio:</legend>

			<input type="hidden" name="id" value="${funcionarios.id}" required>
			<input type="hidden" name="endereco.id"
				value="${funcionarios.endereco.id}" required>

			<div class="form-group">
				<label for="nome">Nome:<span class="text-danger">*</span></label> <input
					type="text" id="nome" name="nome" maxlength="150"
					pattern="[A-Za-z\s]+"
					title="Digite seu nome,  por favor, coloque sem acentua��o"
					required class="form-control" value="${funcionarios.nome}">
			</div>

			<div class="form-group">
				<label for="dataNascimento" class="d-block mt-3">Data de
					Nascimento:<span class="text-danger">*</span>
				</label>
				<fmt:formatDate pattern="dd/MM/yyyy"
					value="${funcionarios.dataNascimento}" var="dataFormatada" />
				<input type="text" id="dataNascimento" name="dataNascimento"
					pattern="^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/(19[5-9][0-9]|200[0-9])$"
					title="Formato inv�lido. Insira entre 01/01/1950 e 31/12/2009"
					required class="form-control" value="${dataFormatada}">
			</div>

			<div class="form-group">
				<label for="email">E-mail:</label> <input type="email" id="email"
					name="email" required class="form-control"
					value="${funcionarios.email}">
			</div>

			<div class="form-group">
				<label for="status">Status:<span class="text-danger">*</span></label>
				<select id="status" name="status" required class="form-select">
					<option value="true"
						<c:if test="${funcionarios.status eq 'true'}">selected</c:if>>Ativo</option>
					<option value="false"
						<c:if test="${funcionarios.status eq 'false'}">selected</c:if>>Inativo</option>
				</select>
			</div>

			<security:csrfInput />

			<div class="form-group">
				<a href="<c:url value='/funcionarios/lista' />"
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

<c:if test="${not empty mensagem}">
	<script>
		alert("${mensagem}");
	</script>
</c:if>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/js/validatedate.js"></script>


</body>
</html>
