<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Editar Endereço</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>

<c:import url="../componentes/cabecalho.jsp" />


<div class="container mt-5">
	<form action="altera" method="POST"
		class="bg-white p-4 shadow-sm rounded">
		<fieldset>
			<legend>Alterar endereço:</legend>

			<input type="hidden" name="id" value="${endereco.id}" required>

			<input type="hidden" name="cep" value="${endereco.cep}" required>

			<input type="hidden" name="estado" value="${endereco.estado}" required>

			<input type="hidden" name="cidade" value="${endereco.cidade}" required>


			<div class="form-group">
				<label for="bairro">Bairro</label> <input type="text" name="bairro"
					pattern="[A-Za-z\s]+" title="Digite seu bairro" required
					class="form-control" value="${endereco.bairro}">
			</div>

			<div class="form-group">
				<label for="rua">Rua</label> <input type="text" name="rua"
					pattern="[A-Za-z0-9\s]+" title="Digite sua rua" required
					class="form-control" value="${endereco.rua}">
			</div>

			<div class="form-group">
				<label for="numero">Número</label> <input type="number"
					name="numero" maxlength="12" pattern="[0-9]+"
					title="Digite o número de seu endereço" class="form-control"
					value="${endereco.numero}">
			</div>


			<security:csrfInput />

			<div class="form-group">
				<a href="<c:url value='/endereco/lista' />"
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


