<%@ page import="webflow.Entidade1" %>



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

