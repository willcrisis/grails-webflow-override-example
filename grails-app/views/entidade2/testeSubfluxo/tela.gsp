<%@ page import="webflow.Entidade1" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'entidade2.label', default: 'Entidade1')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
    <g:form>
        <fieldset class="form">
            <div class="fieldcontain ${hasErrors(bean: entidade2Instance, field: 'outroCampo', 'error')} required">
                <label for="campo1">
                    <g:message code="entidade1.outroCampo.label" default="Outro Campo" />
                    <span class="required-indicator">*</span>
                </label>
                <g:textField name="outroCampo" required="" value="${entidade2Instance?.outroCampo}"/>
            </div>
            <div class="fieldcontain ${hasErrors(bean: entidade2Instance, field: 'maisUm', 'error')} required">
                <label for="campo3">
                    <g:message code="entidade1.maisUm.label" default="Mais Um" />
                    <span class="required-indicator">*</span>
                </label>
                <g:field name="maisUm" type="number" value="${entidade2Instance.maisUm}" required=""/>
            </div>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="voltar" value="${message(code: 'default.button.voltar.label', default: '<- Voltar')}" />
            <g:submitButton name="avancar" value="${message(code: 'default.button.avancar.label', default: 'Avançar ->')}" />
        </fieldset>
    </g:form>
</body>
</html>