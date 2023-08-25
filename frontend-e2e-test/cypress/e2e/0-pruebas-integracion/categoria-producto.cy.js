describe("CRUD CategoriaProducto", () => {//Titulo
    //Antes que nada, abrir el navegador en el proyecto Frontend que es el puerto 8100
    beforeEach(() => {
        cy.visit("http://localhost:8100"); //Frontend de Produccion
    });

    //Servicio API - GetUsuarios()
    it("GetCategoriaProducto()", () => {
        cy.wait(1000);//Esperar 1 seg.
        cy.get("ion-tab-button").eq(1).click(); // click en el TAB de Categoria Producto
        cy.wait(1000);//Esperar 1 seg.

        cy.get("ion-item").should("be.visible")
        .should("not.have.length", "0"); //Verifica que exista al menos un (ion-item)
    });

    //Servicio API - AddCategoriaProducto(entidad)
    it("AddCategoriaProducto(entidad)", () => {
        cy.get("ion-tab-button").eq(1).click(); // click en el TAB de Categoria Producto
        cy.wait(1000);//Esperar 1 seg.

        cy.get("#nombre")
            .type("insertar nombre cypress", { delay: 100 })
            .should("have.value", "insertar nombre cypress");

        cy.wait(500);//Esperar medio seg.

        cy.get("#addCategoria").not("[disabled]").click();
    });
});