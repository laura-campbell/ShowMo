class Page {

  // static map (el) {
  //
  // }

  static login (el) {
    el.innerHTML = `
    <div class="section no-pad blue-header">
      <h5>Login</h5>
    </div>
    <br><br>
    <div class="container">
      <h5>Login To Your Acount</h5>
      <p>If you do not have an account, please <a href="#" id="createLink"><strong>create an account</strong></a>.</p>
      <br>
      <form>
        <label>Email Address</label>
        <input type="text" placeholder = "name@example.com" >
        <button class="btn waves-effect waves-light" type="submit" name="action">Login
          <i class="material-icons right">send</i>
        </button>
      </form>
    </div>
    <br><br>`
    let createLink = document.getElementById('createLink')
    createLink.addEventListener('click', () => {
      Page.createAccount (el)
    })
  }

  static createAccount (el) {
    el.innerHTML = `
    <div class="section no-pad teal-header">
      <h5>Join The Party</h5>
    </div>
    <br><br>
    <div class="container">
      <h5>Create A New Account</h5>
      <p>If you already have an account, please <a href="#" id="loginLink"><strong>login</strong></a>.</p>
      <br>
      <form>
        <label>Email Address</label>
        <input type="text" placeholder = "name@example.com" >
        <label>Phone</label>
        <input type="text" placeholder = "555-555-5555" >
        <button class="btn waves-effect waves-light" type="submit" name="action">Sign Up
          <i class="material-icons right">send</i>
        </button>
      </form>
    </div>
    <br><br>`
    let loginLink = document.getElementById('loginLink')
    loginLink.addEventListener('click', () => {
      Page.login (el)
    })
  }

  static artist (el) {
    el.innerHTML = `
    <div class="section no-pad teal-header">
      <h5>Artist</h5>
    </div>
    <br><br>
    <div class="container">
      <h5>NAME GOES HERE</h5>
      <br>
      <form>
        <label>Email Address</label>
        <input type="text" placeholder = "name@example.com" >
        <label>Phone</label>
        <input type="text" placeholder = "555-555-5555" >
        <button class="btn waves-effect waves-light" type="submit" name="action">Sign Up
          <i class="material-icons right">send</i>
        </button>
      </form>
    </div>
    <br><br>`
    let loginLink = document.getElementById('loginLink')
    loginLink.addEventListener('click', () => {
      Page.login (el)
    })
  }

}
