document.addEventListener('DOMContentLoaded', () => {

  let showsUl = document.getElementById('shows')

  fetch('http://localhost:3000/api/v1/shows')
    .then(response => response.json())
    .then(shows => {

      let locations = []

      shows.forEach(show => {
        let showLi = document.createElement('li')
        showLi.innerHTML = `${show["artist"]["name"]} at ${show["venue"]["name"]}`
        showsUl.append(showLi)
        locations.push([show["venue"]["name"], show["venue"]["lat"], show["venue"]["long"]])
      })

      var map = L.map('map').setView([40.7128, -74.0060], 13);
      L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibGF1cmFlbGl6YWJldGg5MiIsImEiOiJjamd5OGtyOHIwMWl0MndyNGRsNmJkNW41In0.Y39YIj6lU_Sg6gEp6soLCA', {
        attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
        maxZoom: 18,
        id: 'mapbox.streets',
        accessToken: 'pk.eyJ1IjoibGF1cmFlbGl6YWJldGg5MiIsImEiOiJjamd5OGtyOHIwMWl0MndyNGRsNmJkNW41In0.Y39YIj6lU_Sg6gEp6soLCA'
        }).addTo(map);

      locations.forEach(location => {
        var marker = L.marker([location[1], location[2]]).bindPopup(location[0]).openPopup().addTo(map);
      })

  }) // end of fetch



}) // end of dom content loaded
