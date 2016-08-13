var Hero = React.createClass({
  getInitialState() {
    return { editable: false }
  },

  handleEdit() {
    if (this.state.editable) {
      var name = this.refs.name.value;
      var hometown = this.refs.hometown.value;
      var hero = { name: name, hometown: hometown, id: this.props.hero.id, role: this.props.hero.role }

      this.props.handleEdit(hero);
    }

    this.setState({ editable: !this.state.editable  })
  },

  editButton() {
    if (this.state.editable) {
      return 'Save Changes'
    }
    else {
      return 'Edit Hero'
    }
  },

  render() {
    var name = this.state.editable ? <input type='text'
                                            ref='name'
                                            defaultValue={this.props.hero.name}
                                          />
                                   : <h4>{++this.props.index}: {this.props.hero.name}</h4>

    var hometown = this.state.editable ? <input type='text'
                                            ref='hometown'
                                            defaultValue={this.props.hero.hometown}
                                          />
                                   : <p><strong>Hometown:</strong> {this.props.hero.hometown}</p>

    // var role = this.state.editable ? <input type='text'
    //                                         ref='role'
    //                                         defaultValue={this.props.hero.role}
    //                                       />
    //                                : <p><strong>Role:</strong> {this.props.hero.role}</p>

    return (
      <div>
        { name }
        { hometown }
        <p><strong>Role:</strong> {this.props.hero.role}</p>
        <button onClick={this.handleEdit}>{this.editButton()}</button>
        <button onClick={this.props.handleDelete}>Delete Hero</button>
      </div>
    )
  }
})
