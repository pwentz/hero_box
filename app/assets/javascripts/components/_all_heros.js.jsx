var AllHeros = React.createClass({
  render() {
    var heros = this.props.heros.map((hero, index) => {
      return (
        <div key={hero.id}>
          <Hero hero={hero}
                index={index}
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
