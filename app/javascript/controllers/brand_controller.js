import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["brandInput", "autreMarqueInput"];

  connect() {
    console.log("Hello from brand controller");
    this.toggleAutreMarqueInput();
    this.addBrandChangeListener();
  }

  addBrandChangeListener() {
      const brandSelect = this.brandInputTarget.querySelector('select');

      brandSelect.addEventListener('change', () => {
        this.toggleAutreMarqueInput();
      });
    }

  toggleAutreMarqueInput() {
    const selectedBrand = this.brandInputTarget.querySelector('select').value;
    if (selectedBrand === "Autre marque") {
      this.autreMarqueInputTarget.classList.remove("hidden");
    } else {
      this.autreMarqueInputTarget.classList.add("hidden");
    }
  }

}
