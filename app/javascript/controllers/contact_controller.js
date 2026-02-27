import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    "name", "email", "message",
    "nameError", "emailError", "messageError"
  ]

  // -------------------------
  // Blur validation (existing)
  // -------------------------
  validate(event) {
    this.validateField(event.target)
  }

  // -------------------------
  // Submit validation (NEW)
  // -------------------------
  submit(event) {
    console.log('submit..')
    let valid = true

    this.validateAllFields()

    if (this.hasErrors()) {
      event.preventDefault()
      this.focusFirstInvalidField()
    }
  }

  // -------------------------
  // Turbo submit end
  // -------------------------
  submitEnd(event) {
    if (event.detail.success) {
      this.clearErrors()
    }
  }

  // -------------------------
  // Validation helpers
  // -------------------------
  validateAllFields() {
    this.validateField(this.nameTarget)
    this.validateField(this.emailTarget)
    this.validateField(this.messageTarget)
  }

  validateField(field) {
    const value = field.value.trim()
    let error = ""

    if (field === this.nameTarget && value === "") {
      error = "Name is required"
    }

    if (field === this.emailTarget) {
      if (value === "") {
        error = "Email is required"
      } else if (!value.match(/^\S+@\S+\.\S+$/)) {
        error = "Invalid email format"
      }
    }

    if (field === this.messageTarget && value.length < 10) {
      error = "Message must be at least 10 characters"
    }

    this.errorTargetFor(field).textContent = error
  }

  hasErrors() {
    return (
      this.nameErrorTarget.textContent !== "" ||
      this.emailErrorTarget.textContent !== "" ||
      this.messageErrorTarget.textContent !== ""
    )
  }

  focusFirstInvalidField() {
    if (this.nameErrorTarget.textContent !== "") {
      this.nameTarget.focus()
    } else if (this.emailErrorTarget.textContent !== "") {
      this.emailTarget.focus()
    } else if (this.messageErrorTarget.textContent !== "") {
      this.messageTarget.focus()
    }
  }

  clearErrors() {
    this.nameErrorTarget.textContent = ""
    this.emailErrorTarget.textContent = ""
    this.messageErrorTarget.textContent = ""
  }

  errorTargetFor(field) {
    if (field === this.nameTarget) return this.nameErrorTarget
    if (field === this.emailTarget) return this.emailErrorTarget
    if (field === this.messageTarget) return this.messageErrorTarget
  }
}
