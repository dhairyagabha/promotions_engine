import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-navigation"
export default class extends Controller {
  navigate(event) {
    window.location = event.target.options[event.target.selectedIndex].dataset.url
  }
}
