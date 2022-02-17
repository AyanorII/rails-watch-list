import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="list"
export default class extends Controller {
  static targets = [ "grid" ];
  connect() {
    console.log("ListController connected");
  }

  expand() {
    this.gridTarget.classList.toggle("expanded");
    this.gridTarget.classList.toggle("collapsed");
  }
}
