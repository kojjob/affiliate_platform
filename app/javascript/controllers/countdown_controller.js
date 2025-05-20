import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["hours", "minutes", "seconds"]

  connect() {
    this.startCountdown()
  }

  startCountdown() {
    // Set initial time (24 hours from now)
    this.endTime = new Date().getTime() + (24 * 60 * 60 * 1000)
    
    this.timer = setInterval(() => {
      this.updateCountdown()
    }, 1000)
  }

  updateCountdown() {
    const now = new Date().getTime()
    const timeLeft = this.endTime - now

    if (timeLeft > 0) {
      const hours = Math.floor((timeLeft % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60))
      const minutes = Math.floor((timeLeft % (1000 * 60 * 60)) / (1000 * 60))
      const seconds = Math.floor((timeLeft % (1000 * 60)) / 1000)

      this.hoursTarget.textContent = hours.toString().padStart(2, '0')
      this.minutesTarget.textContent = minutes.toString().padStart(2, '0')
      this.secondsTarget.textContent = seconds.toString().padStart(2, '0')
    } else {
      // Timer expired
      this.hoursTarget.textContent = "00"
      this.minutesTarget.textContent = "00"
      this.secondsTarget.textContent = "00"
      clearInterval(this.timer)
    }
  }

  disconnect() {
    if (this.timer) {
      clearInterval(this.timer)
    }
  }
}