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
    

      const updateBorder = () => {
        const confirmNotEmpty = confirmation.value.length > 0;
        const isMatch = password.value === confirmation.value;
        
        confirmation.classList.remove('border-danger', 'border-success');
        password.classList.remove('border-danger', 'border-success');
        
        if (confirmNotEmpty) {
          if (isMatch) {
            confirmation.classList.add('border-success');
            password.classList.add('border-success');
          } else {
            confirmation.classList.add('border-danger');
            password.classList.add('border-danger');
          }
        }
      };

      password.addEventListener('input', updateBorder);
      confirmation.addEventListener('input', updateBorder);
    }
  }
})
