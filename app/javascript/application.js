import Rails from "@rails/ujs";
Rails.start();

document.addEventListener("DOMContentLoaded", function () {
    const selector = document.getElementById("hole-count-selector");
  
    const updateHoleVisibility = () => {
      const count = parseInt(selector.value, 10);
      for (let i = 1; i <= 18; i++) {
        const holeDiv = document.getElementById(`hole-${i}`);
        holeDiv.style.display = i <= count ? "block" : "none";
      }
    };
  
    selector.addEventListener("change", updateHoleVisibility);
    updateHoleVisibility(); // initial call on page load
  });
  