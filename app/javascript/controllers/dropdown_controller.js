import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "menu" ]

  connect() {
    console.log("Dropdown controller connected")
  }

  toggle() {
    this.menuTarget.classList.toggle("hidden")
  }

  hide(event) {
    if (this.element.contains(event.target)) {
      return
    }
    this.menuTarget.classList.add("hidden")
  }
}
