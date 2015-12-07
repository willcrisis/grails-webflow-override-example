
<%@ page import="webflow.Entidade1" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'entidade1.label', default: 'Entidade1')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-entidade1" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-entidade1" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="campo1" title="${message(code: 'entidade1.campo1.label', default: 'Campo1')}" />
					
						<g:sortableColumn property="campo2" title="${message(code: 'entidade1.campo2.label', default: 'Campo2')}" />
					
						<g:sortableColumn property="campo3" title="${message(code: 'entidade1.campo3.label', default: 'Campo3')}" />
					
						<g:sortableColumn property="campo4" title="${message(code: 'entidade1.campo4.label', default: 'Campo4')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${entidade1InstanceList}" status="i" var="entidade1Instance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${entidade1Instance.id}">${fieldValue(bean: entidade1Instance, field: "campo1")}</g:link></td>
					
						<td>${fieldValue(bean: entidade1Instance, field: "campo2")}</td>
					
						<td>${fieldValue(bean: entidade1Instance, field: "campo3")}</td>
					
						<td><g:formatDate date="${entidade1Instance.campo4}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${entidade1InstanceTotal}" />
			</div>
		</div>
	</body>
</html>
