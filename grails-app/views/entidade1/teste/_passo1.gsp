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
            <div class="fieldcontain ${hasErrors(bean: entidade1Instance, field: 'campo1', 'error')} required">
                <label for="campo1">
                    <g:message code="entidade1.campo1.label" default="Campo1" />
                    <span class="required-indicator">*</span>
                </label>
                <g:textField name="campo1" required="" value="${entidade1Instance?.campo1}"/>
            </div>

            <div class="fieldcontain ${hasErrors(bean: entidade1Instance, field: 'campo2', 'error')} ">
                <label for="campo2">
                    <g:message code="entidade1.campo2.label" default="Campo2" />

                </label>
                <g:textField name="campo2" value="${entidade1Instance?.campo2}"/>
            </div>

        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="avancar" value="${message(code: 'default.button.avancar.label', default: 'Avançar ->')}" />
        </fieldset>
    </g:form>
</div>
</body>
</html>
