describe("Carrito Compra", () => {
    beforeEach(() => {
        cy.visit("http://localhost:8100"); // Asegúrate de ajustar la URL correcta
        cy.wait(1000);
    });

    it("Verificar lista de Carrito Compra", () => {
        cy.get("ion-tab-button").eq(3).click(); // Click en el TAB de Carrito Compra
        cy.wait(1000);

        cy.get("ion-item").should("be.visible").should("not.have.length", 0);
    });

    it("Verificar lista de Detalle Carrito", () => {
        cy.get("ion-tab-button").eq(3).click(); // Click en el TAB de Detalle Carrito
        cy.wait(1000);

        cy.get("ion-item").should("be.visible").should("not.have.length", 0);
    });
});