// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"

// Funcionalidad para cerrar mensajes flash
function setupFlashMessages() {
  // Cerrar mensaje al hacer clic en el botón
  document.querySelectorAll('.close-button').forEach(button => {
    button.addEventListener('click', (e) => {
      const flashMessage = e.target.closest('.flash-message');
      if (flashMessage) {
        flashMessage.style.opacity = '0';
        setTimeout(() => flashMessage.remove(), 300);
      }
    });
  });

  // Cerrar automáticamente después de 5 segundos
  document.querySelectorAll('.flash-message').forEach(message => {
    setTimeout(() => {
      message.style.opacity = '0';
      setTimeout(() => message.remove(), 300);
    }, 5000);
  });
}

// Ejecutar al cargar la página
document.addEventListener('DOMContentLoaded', setupFlashMessages);
// Ejecutar después de cada navegación con Turbo
document.addEventListener('turbo:load', setupFlashMessages);
