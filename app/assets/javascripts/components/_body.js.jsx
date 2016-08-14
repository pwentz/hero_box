let Body = React.createClass({
  getInitialState() {
    return { heros: [] };
  },

  componentDidMount() {
    $.getJSON('/api/v1/admin/heros.json', (response) => { this.setState({ heros: response })} );
  },

  handleDelete(hero) {
    $.ajax({
      url: `/api/v1/admin/heros/${hero.id}`,
      type: 'DELETE',
      success: () => {
        console.log(`Successfully vanquished ${hero.name}!`)
        this.filterHeros(hero.id);
      }
    });
  },

  filterHeros(hero_id) {
    let newHeros = this.state.heros.filter((h) => { return h.id !== hero_id });
    this.setState({ heros: newHeros });
  },

  onUpdate(newHero) {
    $.ajax({
      url: `/api/v1/admin/heros/${newHero.id}`,
      type: 'PUT',
      data: { hero: newHero },
      success: () => {
        console.log(`Successfully edited hero #${newHero.id}`)
        this.updateHeros(newHero);
      }
    });
  },

  updateHeros(newHero) {
    let newHeros = this.state.heros.filter((h) => { return h.id !== newHero.id})
    newHeros.push(newHero)

    this.setState({ heros: newHeros })
  },

  render() {
    return (
      <div>
        <AllHeros heros={this.state.heros} handleDelete={this.handleDelete} handleEdit={this.onUpdate} />
      </div>
    )
  }
})
