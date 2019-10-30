describe('Home Page', () => {

  before(() => {
    cy.visit('/home')
  })

  it('should have title text', () => {
    cy.contains('Kent\'s Woodworking Shop')
  })

})