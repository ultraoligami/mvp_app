document.addEventListener("DOMContentLoaded", () => {
    const btn = document.getElementById("ai-humor-btn");
    if (!btn) return;
  
    btn.addEventListener("click", async () => {
      const contentField = document.getElementById("post_content");
      const originalText = contentField.value;
  
      if (originalText.trim() === "") {
        alert("文章を入力してください！");
        return;
      }
  
      btn.disabled = true;
      btn.textContent = "AIが考え中…";
  
      const response = await fetch("/ai/humor", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": document.querySelector("[name='csrf-token']").content
        },
        body: JSON.stringify({ text: originalText })
      });
  
      const data = await response.json();
      contentField.value = data.humor;
  
      btn.disabled = false;
      btn.textContent = "AIでユーモアに変換";
    });
  });