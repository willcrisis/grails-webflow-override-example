package webflow

import org.springframework.dao.DataIntegrityViolationException

class Entidade1Controller {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "teste", params: params)
    }

    def testeFlow = {
        inicio {
            action {
                flow.entidade1Instance = new Entidade1()
            }
            on('success').to 'passo1'
        }
        passo1 {
            on('avancar') {
                flow.entidade1Instance = bindData(flow.entidade1Instance, params)
                flow.operacao = 'avancar'
            }.to 'passo2'
        }
        passo2 {
            subflow(action: 'testeSubfluxo', input: [operacao: {flow.operacao}, pai: {flow.entidade1Instance}, entidade: {flow.filho}])
            on('avancar') {
                flow.filho = currentEvent?.attributes?.filho
            }.to 'passo3'
            on('voltar') {
                flow.filho = currentEvent?.attributes?.filho
            }.to 'passo1'
        }
        passo3 {

            on('finalizar') {
                flow.entidade1Instance = bindData(flow.entidade1Instance, params)
            }.to 'fim'
            on ('voltar') {
                flow.entidade1Instance = bindData(flow.entidade1Instance, params)
                flow.operacao = 'voltar'
            }.to 'passo2'
        }
        fim()
    }

    def testeSubfluxoFlow = {
        input {
            operacao(required: true)
        }
        inicio {
            action {
                flow.operacao == 'avancar' ? avancar() : voltar()
            }
            on("avancar").to 'avancar'
            on("voltar").to 'voltar'
        }
        avancar()
        voltar()
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [entidade1InstanceList: Entidade1.list(params), entidade1InstanceTotal: Entidade1.count()]
    }

    def create() {
        [entidade1Instance: new Entidade1(params)]
    }

    def save() {
        def entidade1Instance = new Entidade1(params)
        if (!entidade1Instance.save(flush: true)) {
            render(view: "create", model: [entidade1Instance: entidade1Instance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'entidade1.label', default: 'Entidade1'), entidade1Instance.id])
        redirect(action: "show", id: entidade1Instance.id)
    }

    def show(Long id) {
        def entidade1Instance = Entidade1.get(id)
        if (!entidade1Instance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'entidade1.label', default: 'Entidade1'), id])
            redirect(action: "list")
            return
        }

        [entidade1Instance: entidade1Instance]
    }

    def edit(Long id) {
        def entidade1Instance = Entidade1.get(id)
        if (!entidade1Instance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'entidade1.label', default: 'Entidade1'), id])
            redirect(action: "list")
            return
        }

        [entidade1Instance: entidade1Instance]
    }

    def update(Long id, Long version) {
        def entidade1Instance = Entidade1.get(id)
        if (!entidade1Instance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'entidade1.label', default: 'Entidade1'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (entidade1Instance.version > version) {
                entidade1Instance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'entidade1.label', default: 'Entidade1')] as Object[],
                          "Another user has updated this Entidade1 while you were editing")
                render(view: "edit", model: [entidade1Instance: entidade1Instance])
                return
            }
        }

        entidade1Instance.properties = params

        if (!entidade1Instance.save(flush: true)) {
            render(view: "edit", model: [entidade1Instance: entidade1Instance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'entidade1.label', default: 'Entidade1'), entidade1Instance.id])
        redirect(action: "show", id: entidade1Instance.id)
    }

    def delete(Long id) {
        def entidade1Instance = Entidade1.get(id)
        if (!entidade1Instance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'entidade1.label', default: 'Entidade1'), id])
            redirect(action: "list")
            return
        }

        try {
            entidade1Instance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'entidade1.label', default: 'Entidade1'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'entidade1.label', default: 'Entidade1'), id])
            redirect(action: "show", id: id)
        }
    }
}
