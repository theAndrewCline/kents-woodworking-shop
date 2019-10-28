describe('navigation', () => {
  it('should be able to navigate home', () => {
    cy.visit('/')
    cy.get('nav')
      .contains('Home')
      .click()

    cy.url()
      .should('include', '/home')
  })

  it('should be able to navigate About', () => {
    cy.visit('/')
    cy.get('nav')
      .contains('About')
      .click()

    cy.url()
      .should('include', '/about')
  })

  it('should be able to navigate Projects', () => {
    cy.visit('/')
    cy.get('nav')
      .contains('Projects')
      .click()

    cy.url()
      .should('include', '/projects')
  })
})