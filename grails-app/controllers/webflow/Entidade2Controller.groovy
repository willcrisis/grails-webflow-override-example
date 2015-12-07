package webflow

/**
 * Created with IntelliJ IDEA.
 * User: willian.krause
 * Date: 23/05/14
 * Time: 16:22
 * To change this template use File | Settings | File Templates.
 */
class Entidade2Controller extends Entidade1Controller {
    def testeSubfluxoFlow = {
        input {
            entidade(new Entidade2())
            pai(required: true)
        }
        iniciar {
            action {
                flow.entidade2Instance = flow.entidade
                flow.entidade2Instance.entidade1 = flow.pai
            }
            on('success').to 'tela'
        }
        tela {
            on('avancar') {
                flow.entidade2Instance = bindData(flow.entidade2Instance, params)
            }.to 'avancar'
            on('voltar') {
                flow.entidade2Instance = bindData(flow.entidade2Instance, params)
            }.to 'voltar'
        }
        avancar {
            output {
                filho {flow.entidade2Instance}
            }
        }
        voltar {
            output {
                filho {flow.entidade2Instance}
            }
        }
    }
}
