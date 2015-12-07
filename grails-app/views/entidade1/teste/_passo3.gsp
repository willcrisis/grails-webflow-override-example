<%@ page import="webflow.Entidade1" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'entidade1.label', default: 'Entidade1')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<a href="#create-entidade1" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="create-entidade1" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${entidade1Instance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${entidade1Instance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form>
        <fieldset class="form">
            <div class="fieldcontain ${hasErrors(bean: entidade1Instance, field: 'campo3', 'error')} required">
                <label for="campo3">
                    <g:message code="entidade1.campo3.label" default="Campo3" />
                    <span class="required-indicator">*</span>
                </label>
                <g:field name="campo3" type="number" value="${entidade1Instance.campo3}" required=""/>
            </div>
            <div class="fieldcontain ${hasErrors(bean: entidade1Instance, field: 'campo4', 'error')} required">
                <label for="campo4">
                    <g:message code="entidade1.campo4.label" default="Campo4" />
                    <span class="required-indicator">*</span>
                </label>
                <g:datePicker name="campo4" precision="day"  value="${entidade1Instance?.campo4}"  />
            </div>

        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="voltar" value="${message(code: 'default.button.voltar.label', default: '<- Voltar')}" />
            <g:submitButton name="finalizar" value="${message(code: 'default.button.finalizar.label', default: 'Finalizar')}" />
        </fieldset>
    </g:form>
</div>
</body>
</html>
