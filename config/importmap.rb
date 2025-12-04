# Pin npm packages by running ./bin/importmap
pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"

# AIユーモア JS
pin "ai_humor"

# Stimulus controllers
pin_all_from "app/javascript/controllers", under: "controllers"

# Bootstrap（必須）
pin "bootstrap", to: "bootstrap.min.js", preload: true

# Popper（Bootstrapで必要）
pin "@popperjs/core", to: "@popperjs--core.js"