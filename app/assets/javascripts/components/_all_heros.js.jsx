let AllHeros = React.createClass({
  onUpdate(hero) {
    this.props.handleEdit(hero);
  },

  render() {
    let heros = this.props.heros.map((hero, index) => {
      return (
        <div key={hero.id}>
          <Hero hero={hero}
                index={index}
                handleEdit={this.onUpdate}
                handleDelete={this.props.handleDelete.bind(null, hero)} />
        </div>
      )
    });
    return (
      <div className='row' id='all-heroes'>
        {heros}
      </div>
    )
  }
})
