
<%@ page import="webflow.Entidade1" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'entidade1.label', default: 'Entidade1')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<a href="#show-entidade1" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="show-entidade1" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list entidade1">

        <g:if test="${entidade1Instance?.campo1}">
            <li class="fieldcontain">
                <span id="campo1-label" class="property-label"><g:message code="entidade1.campo1.label" default="Campo1" /></span>

                <span class="property-value" aria-labelledby="campo1-label"><g:fieldValue bean="${entidade1Instance}" field="campo1"/></span>

            </li>
        </g:if>

        <g:if test="${entidade1Instance?.campo2}">
            <li class="fieldcontain">
                <span id="campo2-label" class="property-label"><g:message code="entidade1.campo2.label" default="Campo2" /></span>

                <span class="property-value" aria-labelledby="campo2-label"><g:fieldValue bean="${entidade1Instance}" field="campo2"/></span>

            </li>
        </g:if>

        <g:if test="${entidade1Instance?.campo3}">
            <li class="fieldcontain">
                <span id="campo3-label" class="property-label"><g:message code="entidade1.campo3.label" default="Campo3" /></span>

                <span class="property-value" aria-labelledby="campo3-label"><g:fieldValue bean="${entidade1Instance}" field="campo3"/></span>

            </li>
        </g:if>

        <g:if test="${entidade1Instance?.campo4}">
            <li class="fieldcontain">
                <span id="campo4-label" class="property-label"><g:message code="entidade1.campo4.label" default="Campo4" /></span>

                <span class="property-value" aria-labelledby="campo4-label"><g:formatDate date="${entidade1Instance?.campo4}" /></span>

            </li>
        </g:if>

        <g:if test="${filho?.outroCampo}">
            <li class="fieldcontain">
                <span id="outroCampo-label" class="property-label"><g:message code="entidade1.outroCampo.label" default="Outro Campo" /></span>

                <span class="property-value" aria-labelledby="outroCampo-label"><g:fieldValue bean="${filho}" field="outroCampo"/></span>

            </li>
        </g:if>

        <g:if test="${filho?.maisUm}">
            <li class="fieldcontain">
                <span id="maisUm-label" class="property-label"><g:message code="entidade1.maisUm.label" default="Mais Um" /></span>

                <span class="property-value" aria-labelledby="maisUm-label"><g:fieldValue bean="${filho}" field="maisUm"/></span>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${entidade1Instance?.id}" />
            <g:link class="edit" action="edit" id="${entidade1Instance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </fieldset>
    </g:form>
</div>
</body>
</html>
