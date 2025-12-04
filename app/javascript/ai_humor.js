document.addEventListener("turbo:load", () => {
    const btn = document.getElementById("ai-humor-btn");
    const textarea = document.getElementById("post_content");
  
    if (!btn || !textarea) return;
  
    btn.addEventListener("click", async () => {
      btn.disabled = true;
      btn.innerText = "変換中...";
  
      const response = await fetch("/ai/humor", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content
        },
        body: JSON.stringify({ text: textarea.value })
      });
  
      const data = await response.json();
  
      textarea.value = data.text;  // ← “text” に統一
  
      btn.disabled = false;
      btn.innerText = "AIでユーモアに変換";
    });
  });