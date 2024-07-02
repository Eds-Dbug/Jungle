/// <reference types="cypress" />

// Welcome to Cypress!
//
// This spec file contains a variety of sample tests
// for a todo list app that are designed to demonstrate
// the power of writing tests in Cypress.
//
// To learn more about how Cypress works and
// what makes it such an awesome testing tool,
// please read our getting started guide:
// https://on.cypress.io/introduction-to-cypress

describe('example to-do app', () => {
  beforeEach(() => {
    // Cypress starts out with a blank slate for each test
    // so we must tell it to visit our website with the `cy.visit()` command.
    // Since we want to visit the same URL at the start of all our tests,
    // we include it in our beforeEach function so that it runs before each test
    cy.visit('/')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("will add a product to the cart and the cart count should increase by 1", () => {
    cy.get('.end-0 > .nav-link').invoke('text').then((s) => {
      expect(s).to.be.a('string')
      expect(s.trim()).to.equals('My Cart (0)');
    })
    cy.get(':nth-child(1) > div > .button_to > .btn').click();
    cy.get('.end-0 > .nav-link').invoke('text').then((s) => {
      expect(s).to.be.a('string')
      expect(s.trim()).to.equals('My Cart (1)');
    })
  })

})
