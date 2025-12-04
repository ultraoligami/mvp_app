class AiController < ApplicationController
    protect_from_forgery except: :humor
  
    def humor
      client = OpenAI::Client.new
  
      response = client.chat(
        parameters: {
          model: "gpt-4o-mini",
          messages: [
            { role: "system", content: "入力文をユーモアのある文章に変換してください。過激・下品は禁止。" },
            { role: "user", content: params[:text] }
          ]
        }
      )
  
      humor_text = response.dig("choices", 0, "message", "content")
  
      render json: { text: humor_text }  # ← JS と一致させる
    end
  end