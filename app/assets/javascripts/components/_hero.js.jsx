let Hero = React.createClass({
  getInitialState() {
    return { editable: false }
  },

  handleEdit() {
    if (this.state.editable) {
      let hero = { name: this.refs.name.value, hometown: this.refs.hometown.value,
                   id: this.props.hero.id, role: this.props.hero.role,
                   image_url: this.props.hero.image_url }

      this.props.handleEdit(hero);
    }

    this.setState({ editable: !this.state.editable  })
  },

  editButton() {
    if (this.state.editable) {
      return 'Submit'
    }
    else {
      return 'Edit Hero'
    }
  },

  render() {
    let name = this.state.editable ? <input type='text'
                                            ref='name'
                                            defaultValue={this.props.hero.name}
                                          />
                                   : <h4>{++this.props.index}: {this.props.hero.name}</h4>

    let hometown = this.state.editable ? <input type='text'
                                            ref='hometown'
                                            defaultValue={this.props.hero.hometown}
                                          />
                                   : <p><strong>Hometown:</strong> {this.props.hero.hometown}</p>

    // let role = this.state.editable ? <input type='text'
    //                                         ref='role'
    //                                         defaultValue={this.props.hero.role}
    //                                       />
    //                                : <p><strong>Role:</strong> {this.props.hero.role}</p>

    return (
      <div className='card col-md-3'>
        <div className='card-block text-center'>
          <a className='thumbnail' href={`/admin/heros/${this.props.hero.id}`} >
            <img src={this.props.hero.image_url} className='center-block '></img>
          </a>
          { name }
          { hometown }
          <p><strong>Role:</strong> {this.props.hero.role}</p>
          <button onClick={this.handleEdit} className='btn btn-warning'>{this.editButton()}</button>
          <br/>
          <button onClick={this.props.handleDelete} className='btn btn-danger'>Delete Hero</button>
        </div>
      </div>
    )
  }
})
