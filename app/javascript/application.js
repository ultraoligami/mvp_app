import "@hotwired/turbo-rails"
Turbo.session.drive = false  // ← Turbo無効化（DELETEを確実に動かす）

import "controllers"
import "ai_humor"

document.addEventListener("turbo:load", () => {
  const toggler = document.querySelector(".custom-toggler");
  const menuIcon = document.getElementById("menu-icon");
  const menu = document.getElementById("navbarNav");

  if (!toggler || !menuIcon || !menu) return;

  // ▼ 初回ロード時の状態を反映
  menuIcon.src =
    toggler.getAttribute("aria-expanded") === "true"
      ? "/assets/yotsuba_kare.PNG"   // 開いている時
      : "/assets/yotsuba.PNG";       // 閉じている時

  // ▼ クリックされた瞬間にアイコン切り替え（遅延なし）
  toggler.addEventListener("click", () => {
    setTimeout(() => {
      const expanded = toggler.getAttribute("aria-expanded") === "true";

      menuIcon.src = expanded
        ? "/assets/yotsuba_kare.PNG"   // 開いた時の画像
        : "/assets/yotsuba.PNG";       // 閉じた時の画像
    }, 10);
  });
});