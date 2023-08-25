describe("CRUD Producto", () => {//Titulo
    //Antes que nada, abrir el navegador en el proyecto Frontend que es el puerto 8100
    beforeEach(() => {
        cy.visit("http://localhost:8100"); //Frontend de Produccion
    });

    //Servicio API - GetUsuarios()
    it("GetProductos()", () => {
        cy.wait(1000);//Esperar 1 seg.
        cy.get("ion-tab-button").eq(2).click(); // click en el TAB de categoria producto
        cy.wait(1000);//Esperar 1 seg.

        cy.get("ion-item").should("be.visible")
        .should("not.have.length", "0"); //Verifica que exista al menos un (ion-item)
    });

    //Servicio API - AddUsuario(entidad)
    it("AddProducto(entidad)", () => {
        cy.get("ion-tab-button").eq(2).click(); // click en el TAB de categoria producto
        cy.wait(1000);//Esperar 1 seg.

        cy.get("#nombreProducto")
            .type("insertar nombreProducto cypress", { delay: 100 })
            .should("have.value", "insertar nombreProducto cypress");

        cy.wait(500);//Esperar medio seg.

        cy.get("#idCategoria")
           .type("insertar idCategoria cypress", { delay: 100 })
           .should("have.value", "insertar idCategoria cypress");

           cy.wait(500);//Esperar medio seg.

        cy.get("#addproducto").not("[disabled]").click();
    });
});