document.addEventListener('DOMContentLoaded', () => {



  let showsList = document.getElementById('shows')

  fetch('http://localhost:3000/api/v1/shows')
    .then(response => response.json())
    .then(shows => {

      let locations = []

      shows.forEach(show => {
        let showLi = document.createElement('li')
        showLi.innerHTML =
        `<div class="collapsible-header"><b>
        <i class="material-icons">music_note</i>
        <h6>${show["artist"]["name"]}</b>&nbspat&nbsp<b>${show["venue"]["name"]}</b></h6></div>`
        showLi.innerHTML += `
        <div class="collapsible-body">
        <div class="row">
        <div style="height:300px" class="col s4 card-panel grey lighten-5 z-depth-2 center"><p><br><img src="images/sportlights.png" height=65px></p><b>Venue:</b><p><a target="_blank" href= "${show["venue"]["songkick_url"]}">${show["venue"]["name"]}</a></p></div>
        <div style="height:300px" class="col s4 card-panel grey lighten-5 z-depth-2 center"><br><img src="images/microphone.png" height=65px></p><b>Artist:</b><p><a target="_blank" href= "${show["artist"]["songkick_url"]}">${show["artist"]["name"]}</a></p></div>
        <div style="height:300px" class="col s4 card-panel grey lighten-5 z-depth-2 center"><br><img src="images/music-festival-poster.png" height=65px></p><b>Date: </b>${show["date"].split('-')[1]}-${show["date"].split('-')[2]}-${show["date"].split('-')[0]}<br><b>Time: </b> ${show["time"].split(':')[0]-12}:${show["time"].split(':')[1]} PM <br><b>Setlist:</b><p>Insert Setlist Here</p></div>
        </div>`
        showsList.append(showLi)
        locations.push([show["artist"]["name"], show["venue"]["name"], show["venue"]["lat"], show["venue"]["long"], show["date"].split('-')[1] + `/` + show["date"].split('-')[2] + `/` + show["date"].split('-')[0]])
      })

      let setCenter = [40.748, -73.985]

      var map = L.map('map').setView(setCenter, 13);
      L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibGF1cmFlbGl6YWJldGg5MiIsImEiOiJjamd5OGtyOHIwMWl0MndyNGRsNmJkNW41In0.Y39YIj6lU_Sg6gEp6soLCA', {
        attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
        maxZoom: 18,
        id: 'mapbox.streets',
        accessToken: 'pk.eyJ1IjoibGF1cmFlbGl6YWJldGg5MiIsImEiOiJjamd5OGtyOHIwMWl0MndyNGRsNmJkNW41In0.Y39YIj6lU_Sg6gEp6soLCA'
        }).addTo(map);

      locations.forEach(location => {
        var marker = L.marker([location[2], location[3]]).bindPopup(`<center> <b>${location[0]}</b><br>${location[1]}<br>${location[4]}</center>`).openPopup().addTo(map);
        marker.addEventListener("click", function (e){
          map.setView([location[2], location[3]], 13);
        });
        let headers = document.querySelectorAll('.collapsible-header')
        headers.forEach(header => {
          header.addEventListener('click', function() {
            console.log(header.innerHTML)
            // let popup =
            // L.bindPopup(header).openPopup();


        //   let Artists = document.querySelectorAll('h6')
        //   Artists.forEach(artist => {
        //     if artist.innerText ===
        //   })
        //   console.log(currentArtist)
        //   marker.openPopup()
        //
      })
      })
      })




  }) // end of fetch


}) // end of dom content loaded
