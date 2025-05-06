document.addEventListener('turbo:load', function() {
  const testPassageUrlPattern = /\/test_passages\/\d+$/;

  if (testPassageUrlPattern.test(document.URL)) {
    const progress_bars = document.querySelector('.progress-bar');

    const totalQuestion = progress_bars.dataset.totalQuestion
    let currentQuestion = progress_bars.dataset.currentQuestion

    let progress_test = (100 / totalQuestion) * (currentQuestion - 1)
    progress_bars.style = "width: " + progress_test + "%"
    progress_bars.setAttribute('aria-valuenow', progress_test)
  }
})
