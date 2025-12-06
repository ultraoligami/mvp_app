import { Controller } from "@hotwired/stimulus"
import * as bootstrap from "bootstrap"

// Connects to data-controller="popover"
export default class extends Controller {
  connect() {
    this.popover = new bootstrap.Popover(this.element, {
      trigger: "hover",
      placement: "top",
      html: true
    })
  }

  disconnect() {
    if (this.popover) this.popover.dispose()
  }
}