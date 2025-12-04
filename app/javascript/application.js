import "@hotwired/turbo-rails"
Turbo.session.drive = false  // ← Turbo無効化（DELETEを確実に動かす）

import "controllers"
import "ai_humor"