describe("CRUD Producto", () => {//Titulo
    //Antes que nada, abrir el navegador en el proyecto Frontend que es el puerto 8100
    beforeEach(() => {
        cy.visit("http://localhost:8100"); //Frontend de Produccion
    });

    //Servicio API - GetProducto()
    it("GetCategoriaProducto()", () => {
        cy.wait(1000);//Esperar 1 seg.
        cy.get("ion-tab-button").eq(2).click(); // click en el TAB de Producto
        cy.wait(1000);//Esperar 1 seg.

        cy.get("ion-item").should("be.visible")
        .should("not.have.length", "0"); //Verifica que exista al menos un (ion-item)
    });

    //Servicio API - AddCategoriaProducto(entidad)
    it("AddCategoriaProducto(entidad)", () => {
        cy.get("ion-tab-button").eq(2).click(); // click en el TAB de Producto
        cy.wait(1000);//Esperar 1 seg.

        cy.get("#nombre")
            .type("insertar nombre cypress", { delay: 100 })
            .should("have.value", "insertar nombre cypress");

        cy.wait(500);//Esperar medio seg.

        cy.get("#idCategoria").not("[disabled]").click();
    });
});