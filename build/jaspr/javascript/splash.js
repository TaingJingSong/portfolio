document.addEventListener('mousemove', (e) => {
  const glow = document.getElementById('cursor-glow');
  if (glow) {
    glow.style.top = e.clientY + 'px';
    glow.style.left = e.clientX + 'px';
  }
});

(function () {
  const fill = document.getElementById('progress_fill');
  const loader = document.getElementById('loading_indicator');
  let progress = 0;
  const MAX_AUTO = 90;

  // Animate the progress bar
  const interval = setInterval(() => {
    const step = Math.random() * 10 + 2;
    progress = Math.min(progress + step, MAX_AUTO);
    if (fill) fill.style.width = progress + '%';
    if (progress >= MAX_AUTO) clearInterval(interval);
  }, 200);

  // The function that fades out and removes the splash screen
  window.dismissLoader = function() {
    clearInterval(interval);
    if (fill) fill.style.width = '100%';
    setTimeout(() => {
      if (loader) {
        loader.classList.add('hidden');
        // Remove it from the DOM entirely so it doesn't block clicks
        setTimeout(() => loader.remove(), 500);
      }
    }, 200);
  };

  // 1. AUTO-DISMISS: Hide the loader the exact moment the Jaspr app is fully loaded in the browser!
  window.addEventListener('load', window.dismissLoader);

  // 2. FALLBACK: If something goes wrong, force it to hide after 5 seconds anyway.
  setTimeout(window.dismissLoader, 5000);
})();