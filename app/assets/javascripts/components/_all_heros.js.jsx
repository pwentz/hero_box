var AllHeros = React.createClass({
  onUpdate(hero) {
    this.props.handleEdit(hero);
  },

  render() {
    var heros = this.props.heros.map((hero, index) => {
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
      <div>
        {heros}
      </div>
    )
  }
})
