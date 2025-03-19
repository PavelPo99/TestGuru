document.addEventListener('turbo:load', function() {
  if (document.URL.includes('gurus/sign_up')) {
    const password = document.getElementById('user_password')
    const confirmation = document.getElementById('user_password_confirmation')
    const message = document.getElementById('message')

    if (password && confirmation && message) {
      const check = () => {
        if (password.value === confirmation.value) {
          message.style.color = 'green'
          message.textContent = 'matching'
        } else {
          message.style.color = 'red'
          message.textContent = 'not matching'
        }
      }

      password.addEventListener('input', check)
      confirmation.addEventListener('input', check)
    }
  }
})
