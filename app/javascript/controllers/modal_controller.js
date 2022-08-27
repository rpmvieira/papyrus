import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  hideModal() {
    this.element.parentElement.removeAttribute("src") // it might be nice to also remove the modal SRC
    this.element.remove()
  }
}

// export default class extends Controller {
//   static targets = ["modal"]

//   // hide modal
//   // action: "turbo-modal#hideModal"
//   hideModal() {
//     this.element.parentElement.removeAttribute("src")
//     // Remove src reference from parent frame element
//     // Without this, turbo won't re-open the modal on subsequent click
//     this.modalTarget.remove()
//   }

//   // hide modal on successful form submission
//   // action: "turbo:submit-end->turbo-modal#submitEnd"
//   submitEnd(e) {
//     if (e.detail.success) {
//       this.hideModal()
//     }
//   }

//   // hide modal when clicking ESC
//   // action: "keyup@window->turbo-modal#closeWithKeyboard"
//   closeWithKeyboard(e) {
//     if (e.code == "Escape") {
//       this.hideModal()
//     }
//   }

//   // hide modal when clicking outside of modal
//   // action: "click@window->turbo-modal#closeBackground"
//   closeBackground(e) {
//     if (e && this.modalTarget.contains(e.target)) {
//       return;
//     }
//     this.hideModal()
//   }
// }





// // import { Controller } from "stimulus"
// import { Controller } from "@hotwired/stimulus"

// export default class extends Controller {
//   connect() {
//     document.addEventListener('turbo:submit-end', this.handleSubmit)
//   }

//   disconnect() {
//     document.removeEventListener('turbo:submit-end', this.handleSubmit)
//   }

//   close() {
//     // Remove the modal element so it doesn't blanket the screen
//     this.element.remove()

//     // Remove src reference from parent frame element
//     // Without this, turbo won't re-open the modal on subsequent clicks
//     this.element.closest("turbo-frame").src = undefined
//   }

//   handleKeyup(e) {
//     if (e.code == "Escape") {
//       this.close()
//     }
//   }

//   handleSubmit = (e) => {
//     if (e.detail.success) {
//       this.close()
//     }
//   }
// }
