let Power = React.createClass({
  getInitialState() {
    return { cart: this.props.cart.contents }
  },

  handleCart() {
    $.ajax({
      url: '/api/v1/cart_powers/',
      type: 'POST',
      data: { power_id: this.props.power.id },
      success: (cartPower) => {
        this.handleCartUpdate(cartPower);
      }
    });
  },

  handleCartUpdate(cartPower) {
    let newCart = this.state.cart.concat(cartPower);
    this.setState({ cart: newCart })
  },

  render() {
    let mostRecent = this.state.cart[0] ? `${this.props.power.name} is in your cart!`
                                        : 'Empty'
    return (
      <div className='jumbotron'>
        <div className='row'>
          <h5>{this.props.power.name}</h5>
          <p><strong>Cost:</strong> {this.props.power.cost}</p>
          <p><strong>Cart:</strong> {mostRecent}</p>
          <div className='col-md-4 col-md-offset-8'>
            <img src={this.props.power.image_url} className='center-block img-rounded img-responsive'></img>
          </div>
        </div>
        <hr/>
        <button onClick={this.handleCart}>Add to Cart</button>
        <a href={`/admin/powers/${this.props.power.id}/edit`} className='btn btn-lg btn-warning'>Edit Power</a>
        <a href={`/admin/powers/${this.props.power.id}`} method='DELETE' className='btn btn-lg btn-danger'>Destroy Power</a>
      </div>
    )
  }
})
