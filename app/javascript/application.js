// ✅ Turbo・Stimulus・独自JS
import "@hotwired/turbo-rails"
import "controllers"
import "ai_humor"

// ✅ Chartkick + Chart.js（importmap の "Chart.bundle" を読むだけでOK）
import "chartkick"
import "Chart.bundle"

// ✅ Bootstrap（importmap.rb で pin 済み）
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

  if (!toggler || !menuIcon) return;

  toggler.addEventListener("click", () => {
    setTimeout(() => {
      const expanded = toggler.getAttribute("aria-expanded") === "true";
      menuIcon.src = expanded ? "/assets/yotsuba_kare.PNG" : "/assets/yotsuba.PNG";
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

// ==============================
// 🐾 右下マスコット：画像 & セリフをランダムに設定
// ==============================
function initFloatingMascot() {
  const imgEl  = document.getElementById("floating-mascot-image");
  const textEl = document.getElementById("floating-mascot-text");

  if (!imgEl || !textEl) return;

  // 画像4種類（ファイル名は実際の名前に合わせて変更OK）
  const mascotImages = [
    "/assets/mascot1.png",
    "/assets/mascot2.png",
    "/assets/mascot3.png",
    "/assets/mascot4.png"
  ];

  // セリフ3パターン
  const messages = [
    "今日もお疲れ様やね〜",
    "今日も寒いやんね〜",
    "えらいやんね〜"
  ];

  // ランダムに1つずつ選択
  const randomImage = mascotImages[Math.floor(Math.random() * mascotImages.length)];
  const randomText  = messages[Math.floor(Math.random() * messages.length)];

  imgEl.src = randomImage;
  textEl.textContent = randomText;
}


document.addEventListener("turbo:load", initPopovers);
document.addEventListener("DOMContentLoaded", initPopovers);