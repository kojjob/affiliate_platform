import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    "salesSlider", "salesValue",
    "priceSlider", "priceValue", 
    "rateSelect",
    "monthlyRevenue", "monthlyCommission", "yearlyCommission"
  ]

  connect() {
    this.calculate()
  }

  calculate() {
    const sales = parseInt(this.salesSliderTarget.value)
    const price = parseInt(this.priceSliderTarget.value)
    const rate = parseFloat(this.rateSelectTarget.value) / 100

    // Update display values
    this.salesValueTarget.textContent = sales
    this.priceValueTarget.textContent = price.toLocaleString()

    // Calculate earnings
    const monthlyRevenue = sales * price
    const monthlyCommission = monthlyRevenue * rate
    const yearlyCommission = monthlyCommission * 12

    // Update results
    this.monthlyRevenueTarget.textContent = monthlyRevenue.toLocaleString()
    this.monthlyCommissionTarget.textContent = monthlyCommission.toLocaleString()
    this.yearlyCommissionTarget.textContent = yearlyCommission.toLocaleString()
  }
}