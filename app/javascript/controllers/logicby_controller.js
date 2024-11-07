import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="logicby"
export default class extends Controller {
  connect() {
  }

  updateDividers(event){
    var dividers = document.querySelectorAll(event.target.dataset.target)
    for(let divider of dividers){
      divider.innerHTML = event.target.value
    }
  }

}
