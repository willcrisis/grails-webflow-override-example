package webflow



import org.junit.*
import grails.test.mixin.*

@TestFor(Entidade1Controller)
@Mock(Entidade1)
class Entidade1ControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/entidade1/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.entidade1InstanceList.size() == 0
        assert model.entidade1InstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.entidade1Instance != null
    }

    void testSave() {
        controller.save()

        assert model.entidade1Instance != null
        assert view == '/entidade1/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/entidade1/show/1'
        assert controller.flash.message != null
        assert Entidade1.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/entidade1/list'

        populateValidParams(params)
        def entidade1 = new Entidade1(params)

        assert entidade1.save() != null

        params.id = entidade1.id

        def model = controller.show()

        assert model.entidade1Instance == entidade1
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/entidade1/list'

        populateValidParams(params)
        def entidade1 = new Entidade1(params)

        assert entidade1.save() != null

        params.id = entidade1.id

        def model = controller.edit()

        assert model.entidade1Instance == entidade1
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/entidade1/list'

        response.reset()

        populateValidParams(params)
        def entidade1 = new Entidade1(params)

        assert entidade1.save() != null

        // test invalid parameters in update
        params.id = entidade1.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/entidade1/edit"
        assert model.entidade1Instance != null

        entidade1.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/entidade1/show/$entidade1.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        entidade1.clearErrors()

        populateValidParams(params)
        params.id = entidade1.id
        params.version = -1
        controller.update()

        assert view == "/entidade1/edit"
        assert model.entidade1Instance != null
        assert model.entidade1Instance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/entidade1/list'

        response.reset()

        populateValidParams(params)
        def entidade1 = new Entidade1(params)

        assert entidade1.save() != null
        assert Entidade1.count() == 1

        params.id = entidade1.id

        controller.delete()

        assert Entidade1.count() == 0
        assert Entidade1.get(entidade1.id) == null
        assert response.redirectedUrl == '/entidade1/list'
    }
}
