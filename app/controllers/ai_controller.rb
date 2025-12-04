class AiController < ApplicationController
    require "openai"
  
    protect_from_forgery except: :humor
  
    def humor
      client = OpenAI::Client.new(access_token: ENV["OPENAI_API_KEY"])
  
      user_text = params[:text]
  
      response = client.chat(
        parameters: {
          model: "gpt-4o-mini",
          messages: [
            { role: "system", content: "入力文をユーモアのある文章に変換してください。過激・下品・攻撃的は禁止。" },
            { role: "user", content: user_text }
          ],
          max_tokens: 150
        }
      )
  
      ai_text = response.dig("choices", 0, "message", "content")
  
      render json: { humor_text: ai_text }
    end
  end