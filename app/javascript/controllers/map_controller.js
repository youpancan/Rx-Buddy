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
      style: "mapbox://styles/samiam246/clf6y2apg000b01nd5qvj8dpa"
    })
    this.#addMarkerToMap()
    this.#fitMapToMarker()
  }
  #addMarkerToMap() {
    const popup = new mapboxgl.Popup().setHTML(this.markerValue.info_window_html)
    const customMarker = document.createElement("div")
    customMarker.innerHTML = this.markerValue.marker_html
    new mapboxgl.Marker()
      .setLngLat([ this.markerValue.lng, this.markerValue.lat ])
      .setPopup(popup) // Add this
      .addTo(this.map)
}
#fitMapToMarker() {
  const bounds = new mapboxgl.LngLatBounds()
  bounds.extend([ this.markerValue.lng, this.markerValue.lat ])
  this.map.fitBounds(bounds, { padding: 70, maxZoom: 17, duration: 900 })

    }
  }
