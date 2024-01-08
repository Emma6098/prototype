import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["brand", "autreMarqueInput"];

  connect() {
    this.toggleAutreMarqueInput();
  }

  toggleAutreMarqueInput() {
    const selectedBrand = this.brandTarget.value;
    if (selectedBrand === "Autre marque") {
      this.autreMarqueInputTarget.classList.remove("hidden");
    } else {
      this.autreMarqueInputTarget.classList.add("hidden");
    }
  }

  document.addEventListener('DOMContentLoaded', function () {
    var brandDropdown = document.getElementById('article_brand');
    var autreMarqueInput = document.getElementById('autreMarqueInput');

    // Gérer la visibilité initiale lors du chargement de la page
    if (brandDropdown.value === 'Autre marque') {
      autreMarqueInput.classList.remove('hidden');
    }

    // Ajouter un écouteur d'événements pour détecter les changements dans le menu déroulant
    brandDropdown.addEventListener('change', function () {
      if (brandDropdown.value === 'Autre marque') {
        autreMarqueInput.classList.remove('hidden');
      } else {
        autreMarqueInput.classList.add('hidden');
      }
    });
  });
}
