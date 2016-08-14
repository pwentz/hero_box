let NewHero = React.createClass({
  getInitialState() {
    return { submittable: false }
  },

  handleClick() {
    if (this.state.submittable) {
      let newHero = { name: this.refs.name.value,
                      hometown: this.refs.hometown.value,
                      password: this.refs.password.value }

      this.createHero(newHero)
    }
    this.setState({ submittable: !this.state.submittable })
  },

  createHero(newHero) {
    $.ajax({
      url: '/api/v1/admin/heros',
      type: 'POST',
      data: { hero: newHero },
      success: (hero) => {
        this.props.handleSubmit(hero);
        console.log(`Successfully created ${hero.name}`)
      }
    })
  },

  render() {
    let hideElt = { display: 'none' }
    let name = this.state.submittable ? <input type='text' ref='name' placeholder='Please enter a name'/>
                                      : <input type='text' ref='name' style={hideElt} placeholder='Please enter a name'/>

    let hometown = this.state.submittable ? <input type='text' ref='hometown' placeholder='Please enter a hometown'/>
                                          : <input type='text' ref='hometown' style={hideElt} placeholder='Please enter a hometown'/>

    let password = this.state.submittable ? <input type='text' ref='password' placeholder='Please enter a password'/>
                                          : <input type='text' ref='password' style={hideElt} placeholder='Please enter a password'/>

    let buttonText = this.state.submittable ? 'Submit Hero'
                                        : 'Create Hero'
    return (
      <div>
        { name }
        <br/>
        { hometown }
        <br/>
        { password }
        <br/>
        <button onClick={this.handleClick} className='btn btn-success'>{buttonText}</button>
      </div>
    )
  }
})
