import { Controller } from "@hotwired/stimulus"



// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    marker: Object
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/samiam246/clf1nmmpx003q01p9f3ppkjl8"
    })
    this.#addMarkerToMap()
    this.#fitMapToMarker()
  }
  #addMarkerToMap() {
    this.markerValue((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    });
  }
  #fitMapToMarker() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markerValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
