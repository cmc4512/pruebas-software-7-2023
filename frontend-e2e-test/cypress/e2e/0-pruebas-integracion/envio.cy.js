describe("CRUD Envio", () => {
    beforeEach(() => {
      cy.visit("http://localhost:8100");
    });
  
    it("GetEnvio()", () => {
      cy.get("ion-tab-button").eq(4).click();
      cy.wait(1000);
  
      cy.get("ion-item").should("be.visible");
    });
  
    it("AddEnvio()", () => {
      cy.get("ion-tab-button").eq(4).click();
      cy.wait(1000);
  
      cy.get("#nombreProducto input").type("Nombre Producto cypress", { force: true });
      cy.get("#direccion input").type("direccion cypress", { force: true });
      cy.get("#cantidad input").type("1", { force: true });
  
      cy.get("#addEnvio").not("[disabled]").click({ force: true });
    });
  
    it("UpdateEnvio()", () => {
      cy.get("ion-tab-button").eq(4).click();
      cy.wait(1000);
  
      cy.get("#nombreProducto input").clear().type("Nombre Producto actualizado", { force: true });
      cy.get("#direccion input").clear().type("direccion actualizado", { force: true });
      cy.get("#cantidad input").clear().type("2", { force: true });
  
    });
  
    it("DeleteEnvio()", () => {
      cy.get("ion-tab-button").eq(4).click();
      cy.wait(1000);

    });
  });