document.addEventListener('DOMContentLoaded', () => {



  let showsList = document.getElementById('shows')

  fetch('http://localhost:3000/api/v1/shows')
    .then(response => response.json())
    .then(shows => {

      let locations = []

      shows.forEach(show => {
        let showLi = document.createElement('li')
        showLi.innerHTML =
        `<div class="collapsible-header"><b>${show["artist"]["name"]}</b>&nbspat&nbsp<b>${show["venue"]["name"]}</b></div>`
        showLi.innerHTML += `
        <div class="collapsible-body">
        <div class="row">
        <div style="height:300px" class="col s4 card-panel grey lighten-5 z-depth-2 center"><p><br><img src="images/sportlights.png" height=65px></p><b>Venue:</b><p>${show["venue"]["name"]}</p><p>${show["venue"]["address"]}</p><p>${show["venue"]["city"]}, ${show["venue"]["state_code"]}, ${show["venue"]["zip"]}</p></div>
        <div style="height:300px" class="col s4 card-panel grey lighten-5 z-depth-2 center"><br><img src="images/microphone.png" height=65px></p><b>Artist:</b><p>${show["artist"]["name"]}</p><p>Insert Bio Here</p><p>Insert URL here</p></div>
        <div style="height:300px" class="col s4 card-panel grey lighten-5 z-depth-2 center"><br><img src="images/music-festival-poster.png" height=65px></p><b>Setlist:</b><p>Insert Setlist Here</p></div>
        </div>`
        showsList.append(showLi)
        locations.push([show["artist"]["name"], show["venue"]["name"], show["venue"]["address"], show["venue"]["lat"], show["venue"]["long"]])
      })

      var map = L.map('map').setView([40.748, -73.985], 13);
      L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibGF1cmFlbGl6YWJldGg5MiIsImEiOiJjamd5OGtyOHIwMWl0MndyNGRsNmJkNW41In0.Y39YIj6lU_Sg6gEp6soLCA', {
        attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
        maxZoom: 18,
        id: 'mapbox.streets',
        accessToken: 'pk.eyJ1IjoibGF1cmFlbGl6YWJldGg5MiIsImEiOiJjamd5OGtyOHIwMWl0MndyNGRsNmJkNW41In0.Y39YIj6lU_Sg6gEp6soLCA'
        }).addTo(map);

      locations.forEach(location => {
        var marker = L.marker([location[3], location[4]]).bindPopup(`<center> <b>${location[0]}</b><br>${location[1]}<br>${location[2]}</center>`).openPopup().addTo(map);
      })


  }) // end of fetch



}) // end of dom content loaded
