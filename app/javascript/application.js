//= require rails-ujs
document.addEventListener("DOMContentLoaded", function () {
    $('.file-table').DataTable({});
    const flashMessages = document.querySelectorAll('.flash-message');
    flashMessages.forEach((message) => {
        setTimeout(() => {
        message.classList.remove('show');
        setTimeout(() => message.remove(), 500);
        }, 3000);
    });
});

document.addEventListener("DOMContentLoaded", () => {
    const modal = document.getElementById("shareModal");
    const modalCloseBtn = document.getElementById("closeModal");
    const publicUrlInput = document.getElementById("public-url");
    const copyUrlBtn = document.getElementById("copy-url-btn");
  
    // Listen for share button clicks
    document.querySelectorAll(".btn-share").forEach((btn) => {
      btn.addEventListener("ajax:success", (event) => {
      	debugger;
        const url = event.detail[0].public_url; // Get public URL from response
        publicUrlInput.value = url;
        modal.style.display = "block";
      });
    });
  
    // Close modal
    modalCloseBtn.onclick = () => {
      modal.style.display = "none";
    };
  
    window.onclick = (event) => {
      if (event.target === modal) {
        modal.style.display = "none";
      }
    };
  
    // Copy URL to clipboard
    copyUrlBtn.onclick = () => {
      publicUrlInput.select();
      document.execCommand("copy");
      alert("Copied to clipboard!");
    };
  });
