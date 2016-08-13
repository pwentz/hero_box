var Hero = React.createClass({
  render() {
    return (
      <div>
        <h4>{++this.props.index}: {this.props.hero.name}</h4>
        <p><strong>Hometown:</strong> {this.props.hero.hometown}</p>
        <p><strong>Role:</strong> {this.props.hero.role}</p>
        <button>Edit Hero</button>
        <button onClick={this.props.handleDelete}>Delete Hero</button>
      </div>
    )
  }
})
