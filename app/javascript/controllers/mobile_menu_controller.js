import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="mobile-menu"
export default class extends Controller {

  static targets = ["icon", "menu"]

  connect() {
  }

  toggle() {
    if(this.iconTargets[0].classList.contains("hidden")){
      this.iconTargets[0].classList.remove("hidden")
      this.iconTargets[0].classList.add("block")
    } else {
      this.iconTargets[0].classList.remove("block")
      this.iconTargets[0].classList.add("hidden")
    }
    if(this.iconTargets[1].classList.contains("hidden")){
      this.iconTargets[1].classList.remove("hidden")
      this.iconTargets[1].classList.add("block")
    } else {
      this.iconTargets[1].classList.remove("block")
      this.iconTargets[1].classList.add("hidden")
    }
    if(this.menuTarget.classList.contains("hidden")){
      this.menuTarget.classList.remove("hidden")
      this.menuTarget.classList.add("block")
    } else {
      this.menuTarget.classList.remove("block")
      this.menuTarget.classList.add("hidden")
    }
  }
}
