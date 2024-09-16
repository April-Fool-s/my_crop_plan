if (navigator.serviceWorker) {
  navigator.serviceWorker.register('/service_worker.js', { scope: './' })
    .then(function(reg) {
      console.log('[Companion]', 'Service worker registered!');
    })
    .catch(function(error) {
      console.error('[Companion]', 'Service worker registration failed:', error);
    });
}
