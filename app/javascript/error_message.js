document.addEventListener('turbolinks:load', () => {
  const errorMessage = document.getElementById('error_explanation');
  const mask = document.getElementById('mask');
  const fadeOutErrorMessage = () => {
    const timer_id = setInterval(() => {
      const opacity = errorMessage.style.opacity;
      const maskOpacity = mask.style.opacity;
      if (opacity > 0 || maskOpacity > 0) {
        errorMessage.style.opacity = opacity - 0.05;
        mask.style.opacity = maskOpacity - 0.05;
      } else {
        errorMessage.style.display = 'none';
        mask.style.display = 'none';
        clearInterval(timer_id);
      };
  }, 30);
}
if (errorMessage !== null) {
  mask.classList.remove('hidden');
  errorMessage.style.opacity = 1;
  mask.style.opacity = 1;
  setTimeout(fadeOutErrorMessage, 1000);
};
})