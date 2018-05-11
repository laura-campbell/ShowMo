document.addEventListener('DOMContentLoaded', () => {

  let contentContainer = document.getElementById('content')

  // for the nav
  // let signInButton = document.getElementById('sign-in-button')
  // signInButton.addEventListener('click', () => {
  //   Page.login(contentContainer)
  // })

  // for the sidebar nav
  // let signInSidebar = document.getElementById('sign-in-sidebar')
  // signInSidebar.addEventListener('click', () => {
  //   Page.login(contentContainer)
  // })

  let showsList = document.getElementById('shows')
  fetch('http://localhost:3000/api/v1/shows')
    .then(response => response.json())
    .then(shows => {

      let locations = []

      shows.forEach(show => {
        let showLi = document.createElement('li')
        showLi.setAttribute("class", "collection-item avatar")
        showLi.innerHTML =

//         `<div class="collapsible-header"><b>
//         <img src="${show["artist"]["songkick_img"]}" height="30" width="30" alt="" class="circle">
//         <h6>${show["artist"]["name"]}</b>&nbspat&nbsp<b>${show["venue"]["name"]}</b></h6><img src="http://${show["venue"]["songkick_img"]}" height="30" width="30" alt="" class="circle"></div>`
//         showLi.innerHTML += `
//         <div class="collapsible-body">
//         <div class="row">
//         <div style="height:300px" class="col s4 card-panel grey lighten-5 z-depth-2 center"><p><br><img src="images/sportlights.png" height=65px></p><b>Venue:</b><p><a target="_blank" href= "${show["venue"]["songkick_url"]}">${show["venue"]["name"]}</a></p></div>
//         <div style="height:300px" class="col s4 card-panel grey lighten-5 z-depth-2 center"><br><img src="images/microphone.png" height=65px></p><b>Artist:</b><p><a target="_blank" href= "${show["artist"]["songkick_url"]}">${show["artist"]["name"]}</a></p></div>
//         <div style="height:300px" class="col s4 card-panel grey lighten-5 z-depth-2 center"><br><img src="images/music-festival-poster.png" height=65px></p><b>Date: </b>${show["date"].split('-')[1]}-${show["date"].split('-')[2]}-${show["date"].split('-')[0]}<br><b>Time: </b> ${show["time"].split(':')[0]-12}:${show["time"].split(':')[1]} PM <br><b>Setlist:</b><p>Insert Setlist Here</p></div>
//         </div>`

          `
          <img src="${show.artist.songkick_img}" alt="" class="circle" style="top:19px;">
          <div style="position: relative; top:8px; ">
          <span class="title" style="font-size:18px; line-height:18px;"><strong>${show["artist"]["name"]}</strong></span><br>
          <span>${show["venue"]["name"]} &middot; ${show["date"].split('-')[1]}/${show["date"].split('-')[2]}</span>
          </div>
          <a href="#!" class="secondary-content something" style="position: relative; top:-23px;"><i class="material-icons" data-phone="${show.id}">phone_iphone</i></a>
          <button id="modal-button" data-target="modal1" class="btn modal-trigger right something" style="position:relative; bottom:30px; right:40px;">Details</button>`

        // let modalButton = document.getElementById('modal-button')
        //
        // modalButton.addEventListener('click', function () {


        // let modalContent = document.getElementById('modal1')
        // modalContent.innerHTML =

      // })

// NEED TO PUT THIS OUTSIDE THE LOOP OR ANYTHING



        // `<div class="collapsible-header"><b>
        // <i class="material-icons">music_note</i>
        // <h6>${show["artist"]["name"]}</b>&nbspat&nbsp<b>${show["venue"]["name"]}</b></h6></div>`
        // showLi.innerHTML += `
        // <div class="collapsible-body">
        // <div class="row">
        // <div style="height:300px" class="col s4 card-panel grey lighten-5 z-depth-2 center"><p><br><img src="images/sportlights.png" height=65px></p><b>Venue:</b><p><a target="_blank" href= "${show["venue"]["songkick_url"]}">${show["venue"]["name"]}</a></p></div>
        // <div style="height:300px" class="col s4 card-panel grey lighten-5 z-depth-2 center"><br><img src="images/microphone.png" height=65px></p><b>Artist:</b><p><a target="_blank" href= "${show["artist"]["songkick_url"]}">${show["artist"]["name"]}</a></p></div>
        // <div style="height:300px" class="col s4 card-panel grey lighten-5 z-depth-2 center"><br><img src="images/music-festival-poster.png" height=65px></p><b>Date: </b>${show["date"].split('-')[1]}-${show["date"].split('-')[2]}-${show["date"].split('-')[0]}<br><b>Time: </b> ${show["time"].split(':')[0]-12}:${show["time"].split(':')[1]} PM <br><b>Setlist:</b><p>Insert Setlist Here</p></div>
        // </div>`

        showsList.append(showLi)
        let thisMap = document.getElementById('map')
        showLi.addEventListener('click', function(e) {
          L.popup().setLatLng([show["venue"]["lat"], show["venue"]["long"]]).setContent(`<center><b>${show["artist"]["name"]}</b><br>${show["venue"]["name"]}<br>${show["date"].split('-')[1]}/${show["date"].split('-')[2]}</center>`).openOn(map);
          map.setView([show["venue"]["lat"], show["venue"]["long"]], 13);
          let modalContent = document.querySelector('.modal-content')
          modalContent.innerHTML = `<h4 class="blue-grey-text text-darken-2" align="center"><strong>${show["artist"]["name"]}</strong></h4>
                      <p align="center" class="flow-text"><img src=${show["artist"]["songkick_img"]}></p>
                      <h5 align="center"><strong><i class="material-icons">event</i></strong>${show["date"].split('-')[1]}/${show["date"].split('-')[2]}
                      &nbsp;&nbsp;&nbsp;&nbsp;<strong><i class="material-icons">access_time</i></strong>${show["time"].split(':')[0]-12}:${show["time"].split(':')[1]} PM
                      <br><br><strong><i class="material-icons">location_on</i></strong>${show["venue"]["name"]}</h5>
                      <br>
                      <h6 align="center"><a target=_blank href=${show["venue"]["website"]}>Find Tickets<br><img height=80px src='images/music.png'></a><h6>
                      <br>
                      <p align="center"><strong>Phone #: </strong>${show["venue"]["phone"]}
                      <br><br><strong>Address: </strong><br>${show["venue"]["street"]}<br> ${show["venue"]["city"]}, ${show["venue"]["state_code"]} ${show["venue"]["zip"]}</p>
                      <p align="center"><strong>Capacity: </strong>${show["venue"]["capacity"].toLocaleString()} people</p>
                      <p align="center"><img src="http://${show["venue"]["songkick_img"]}"></p>
                      <p align="center"></strong>${show["venue"]["description"]}</p>
                      <br>
                    </div>
                    <div class="modal-footer">
                    <a href="#!" class="modal-close waves-effect waves-green btn-flat">Close</a>`
        });
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
        marker.addEventListener("click", function (){
          map.setView([location[2], location[3]], 13);
        })})

      }) // end of fetch


  })  // end of dom content loaded
