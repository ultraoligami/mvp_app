document.addEventListener("turbo:load", () => {
    const button = document.getElementById("ai-humor-btn");
    const contentField = document.getElementById("post_content");
  
    if (!button || !contentField) return;
  
    button.addEventListener("click", async () => {
      button.disabled = true;
      button.innerText = "生成中…";
  
      const text = contentField.value;
  
      const res = await fetch("/ai/humor", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": document
            .querySelector('meta[name="csrf-token"]')
            .getAttribute("content")
        },
        body: JSON.stringify({ text: text })
      });
  
      const data = await res.json();
      contentField.value = data.humor_text;
  
      button.disabled = false;
      button.innerText = "AIでユーモアに変換";
    });
  });