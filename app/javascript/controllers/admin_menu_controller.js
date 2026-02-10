import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["label", "aside", "main"]
    static values = { collapsed: Boolean }

    connect() {
        this.update()
    }

    toggle() {
        this.collapsedValue = !this.collapsedValue
        this.update()
    }

    update() {
        this.asideTarget.classList.toggle("col-lg-2", !this.collapsedValue)
        this.asideTarget.classList.toggle("col-lg-1", this.collapsedValue)

        this.mainTarget.classList.toggle("col-lg-10", !this.collapsedValue)
        this.mainTarget.classList.toggle("col-lg-11", this.collapsedValue)
    }
}
