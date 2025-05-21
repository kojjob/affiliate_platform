import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "suggestions"]
  static values = { 
    debounceDelay: { type: Number, default: 300 },
    minQueryLength: { type: Number, default: 2 }
  }

  connect() {
    this.debounceTimer = null
    this.currentQuery = ""
    this.boundHandleOutsideClick = this.handleOutsideClick.bind(this)
    document.addEventListener('click', this.boundHandleOutsideClick)
  }

  disconnect() {
    if (this.debounceTimer) {
      clearTimeout(this.debounceTimer)
    }
    document.removeEventListener('click', this.boundHandleOutsideClick)
  }

  query(event) {
    const query = event.target.value.trim()
    this.currentQuery = query
    
    // Clear existing timer
    if (this.debounceTimer) {
      clearTimeout(this.debounceTimer)
    }
    
    // Debounce the search
    this.debounceTimer = setTimeout(() => {
      this.performSearch(query)
    }, this.debounceDelayValue)
  }

  performSearch(query) {
    if (query.length < this.minQueryLengthValue) {
      this.hideSuggestions()
      return
    }
    
    // Here you would typically make an API call to fetch search results
    // For now, we'll simulate with static data
    this.updateSuggestions(query)
  }

  updateSuggestions(query) {
    // Mock search results - replace with actual API call
    const mockResults = [
      { name: "iPhone 15 Pro", category: "Electronics" },
      { name: "Nike Air Max", category: "Fashion" },
      { name: "MacBook Pro", category: "Electronics" },
      { name: "Coffee Maker", category: "Home & Kitchen" }
    ].filter(item => 
      item.name.toLowerCase().includes(query.toLowerCase()) ||
      item.category.toLowerCase().includes(query.toLowerCase())
    )
    
    if (mockResults.length > 0) {
      this.renderSuggestions(mockResults)
      this.showSuggestions()
    } else {
      this.hideSuggestions()
    }
  }

  renderSuggestions(results) {
    const suggestionsHTML = `
      <div class="p-2">
        <div class="text-xs text-slate-500 px-2 py-1">Search results</div>
        <div class="space-y-1">
          ${results.map(result => `
            <div class="px-2 py-1 text-sm text-slate-700 hover:bg-slate-50 rounded cursor-pointer flex items-center justify-between">
              <span>${result.name}</span>
              <span class="text-xs text-slate-400">${result.category}</span>
            </div>
          `).join('')}
        </div>
      </div>
    `
    this.suggestionsTarget.innerHTML = suggestionsHTML
  }

  showSuggestions() {
    this.suggestionsTarget.classList.remove("hidden")
  }

  hideSuggestions() {
    this.suggestionsTarget.classList.add("hidden")
  }

  handleOutsideClick(event) {
    if (!this.element.contains(event.target)) {
      this.hideSuggestions()
    }
  }
}
