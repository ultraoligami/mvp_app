pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"

pin_all_from "app/javascript/controllers", under: "controllers"
pin "ai_humor"

# ▼ Popper（Bootstrap の collapse に必須）
pin "@popperjs/core", to: "https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/esm/popper.min.js"

# ▼ Bootstrap（必ず esm.min.js を使う）
pin "bootstrap", to: "https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.esm.min.js"

# ▼ Chart.js（3系 UMD 版）… Chartkick が期待しているやつ
pin "Chart.bundle", to: "https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.js"

# ▼ Chartkick 本体（unpkg 経由の安定版）
pin "chartkick", to: "https://unpkg.com/chartkick@5.0.1/dist/chartkick.js"