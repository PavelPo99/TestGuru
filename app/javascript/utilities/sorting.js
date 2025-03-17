document.addEventListener('turbo:load', function() {
  const control = document.querySelector('.sort-by-title');
  if (!control) return;

  control.addEventListener('click', function() {
    alert('Click');
  });
});
