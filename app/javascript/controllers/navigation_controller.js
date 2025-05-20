import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["mobileMenu"]

  toggleMobile() {
    this.mobileMenuTarget.classList.toggle("hidden")
  }

  connect() {
    // Close mobile menu when clicking outside
    document.addEventListener("click", (event) => {
      if (!this.element.contains(event.target)) {
        this.mobileMenuTarget.classList.add("hidden")
      }
    })
  }
}