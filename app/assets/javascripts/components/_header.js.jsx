let Header = React.createClass({
  render() {
    return(
      <div className='row'>
        <div className='panel panel-default col-md-4'>
          <div className='panel-body'>
            <div className='row'>
              <div className='col-md-8 text-center'>
                <h5>{ this.props.currentHero.name }</h5>
                <h6>Unredeemed crimes left: {this.props.unredeemedCrimes}</h6>
                <p className='login'>
                  <a href='/logout' method='DELETE'>logout</a>
                </p>
                <p className='dashboard_btn'>
                  <a href='/login' className='btn btn-sm btn-success'>Back to Dashboard</a>
                </p>
                <div className='dropdown action_buttons'>
                  <button className='btn btn-warning center-block dropdown-toggle'
                    type='button' data-toggle='dropdown' aria-haspopup='true'
                    aria-expanded='true'>Actions</button>
                  <ul className='dropdown-menu'>
                    <li><a href='/admin/heros/new'>Create New Hero</a></li>
                    <li><a href='/admin/powers/new'>Create Power</a></li>
                    <li><a href='/admin/powers'>Potential Powers</a></li>
                  </ul>
                </div>
              </div>
              <div className='col-md-4'>
                <img src={this.props.currentHero.image_url} className='center-block img-circle img-responsive'></img>
              </div>
            </div>
          </div>
        </div>
      </div>
    )
  }
})
