import "@hotwired/turbo-rails"
import "controllers"
import "ai_humor"

// ▼ Bootstrap を importmap 経由で読み込む
import * as bootstrap from "bootstrap"

// ▼ Tooltip 初期化
document.addEventListener("DOMContentLoaded", () => {
  const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
  tooltipTriggerList.forEach(el => new bootstrap.Tooltip(el));
});

// ▼ ハンバーガーメニュー
document.addEventListener("turbo:load", () => {
  const toggler = document.querySelector(".custom-toggler");
  const menuIcon = document.getElementById("menu-icon");
  const menu = document.getElementById("navbarNav");

  if (!toggler || !menuIcon || !menu) return;

  menuIcon.src =
    toggler.getAttribute("aria-expanded") === "true"
      ? "/assets/yotsuba_kare.PNG"
      : "/assets/yotsuba.PNG";

  toggler.addEventListener("click", () => {
    setTimeout(() => {
      const expanded = toggler.getAttribute("aria-expanded") === "true";

      menuIcon.src = expanded
        ? "/assets/yotsuba_kare.PNG"
        : "/assets/yotsuba.PNG";
    }, 10);
  });
});

// ▼ Popover 初期化
function initPopovers() {
  const popoverList = document.querySelectorAll('[data-bs-toggle="popover"]');
  popoverList.forEach((el) => {
    new bootstrap.Popover(el, {
      html: true,
      sanitize: false,
      placement: "top",
      trigger: "click"
    });
  });
}

document.addEventListener("turbo:load", initPopovers);
document.addEventListener("DOMContentLoaded", initPopovers);