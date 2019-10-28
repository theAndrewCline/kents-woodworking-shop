describe('sanity', () => {
  it('should exist', () => {
    cy.visit('/')
    expect(true).to.equal(true)
  })
})