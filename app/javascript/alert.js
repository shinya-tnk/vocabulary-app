document.addEventListener('turbolinks:load', () => {
  const alert = document.getElementById('alert');
  const mask = document.getElementById('mask');
  const fadeOutAlert = () => {
    const timer_id = setInterval(() => {
      const alertOpacity = alert.style.opacity;
      const maskOpacity = mask.style.opacity;
      if (alertOpacity > 0 || maskOpacity > 0) {
        alert.style.opacity = alertOpacity - 0.05;
        mask.style.opacity = maskOpacity - 0.05;
      } else {
        alert.style.display = 'none';
        mask.style.display = 'none';
        clearInterval(timer_id);
      };
  }, 30);
}
if (alert !== null) {
  mask.classList.remove('hidden');
  alert.style.opacity = 1;
  mask.style.opacity = 1;
  setTimeout(fadeOutAlert, 2000);
};
})