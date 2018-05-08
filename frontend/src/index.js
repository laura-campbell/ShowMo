document.addEventListener('DOMContentLoaded', () => {

  let showsUl = document.getElementById('shows')

  fetch('http://localhost:3000/api/v1/shows')
    .then(response => response.json())
    .then(shows => {

      console.log("shows json response", shows);
      shows.forEach(show => {
        let showLi = document.createElement('li')
        showLi.innerHTML = `${show["artist"]["name"]} at ${show["venue"]["name"]}`
        showsUl.append(showLi)
      })
    }) // end of fetch

}) // end of dom content loaded
