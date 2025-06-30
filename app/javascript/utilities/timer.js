document.addEventListener("turbo:load", function() {
  const timerElement = document.getElementById("timer");
  if (!timerElement) return;

  const initialMinutes = parseInt(timerElement.dataset.minutes) || 0;
  const initialSeconds = parseInt(timerElement.dataset.seconds) || 0;
  let totalSeconds = initialMinutes * 60 + initialSeconds;

  function updateTimer() {
    if (totalSeconds <= 0) {
      clearInterval(timerInterval);
      
      const redirectUrl = timerElement.dataset.timeoutUrl;
      if (redirectUrl && redirectUrl !== 'undefined') {
        window.location.href = redirectUrl;
      }
      return;
    }

    totalSeconds--;
    
    const minutes = Math.floor(totalSeconds / 60);
    const seconds = totalSeconds % 60;
    
    timerElement.textContent = `${minutes}:${seconds.toString().padStart(2, "0")}`;
  }

  const timerInterval = setInterval(updateTimer, 1000);

  document.addEventListener("turbo:before-visit", () => {
    clearInterval(timerInterval);
  });
});
