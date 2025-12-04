class AiController < ApplicationController
    protect_from_forgery except: :humor
  
    def humor
      client = OpenAI::Client.new
  
      user_text = params[:text]
  
      response = client.chat(parameters: {
        model: "gpt-4o-mini",
        messages: [
          { role: "system", content: "あなたはツッコミのキレがよい面白いライターです。文章をユーモアのある軽いトーンに書き換えてください。" },
          { role: "user", content: user_text }
        ]
      })
  
      humor_text = response.dig("choices", 0, "message", "content")
  
      render json: { humor: humor_text }
    end
  end