<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Editar Empresa</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>

<c:import url="../componentes/cabecalho.jsp" />


<div class="container mt-5">
	<form action="altera" method="POST"
		class="bg-white p-4 shadow-sm rounded">
		<fieldset>
			<legend>Alterar dados da empresa:</legend>
			<input type="hidden" name="id" value="${empresa.id}" required>


			<div class="form-group">
				<label for="razao">Razão social:<span class="text-danger">*</span></label><br />
				<input id="razao" type="text" name="razao" maxlength="150"
					class="form-control" value="${empresa.razao}" required>
			</div>

			<div class="form-group">
				<label for="nome">Nome Fantasia:<span class="text-danger">*</span></label>
				<input type="text" id="nome" name="nome" maxlength="150"
					pattern="[A-Za-z\s]+"
					title="Digite o nome,  por favor, coloque sem acentuação" required
					class="form-control" value="${empresa.nome}">
			</div>

			<div class="form-group">
				<label for="email">E-mail:</label> <input type="email" id="email"
					name="email" maxlength="100" required class="form-control"
					value="${empresa.email}">
			</div>


			<security:csrfInput />

			<div class="form-group">
				<a href="<c:url value='/empresa/lista' />"
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

</body>
</html>


