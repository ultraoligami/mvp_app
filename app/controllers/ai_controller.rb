class AiController < ApplicationController
    protect_from_forgery except: :humor
  
    def humor
      client = OpenAI::Client.new
  
      response = client.chat(
        parameters: {
          model: "gpt-4o-mini",
          messages: [
            { role: "system", content: "入力文をユーモアのある文章に変換してください。過激・下品は禁止。一言ネタや軽いボケ程度にする。文章は長くしすぎない（1〜2行）。言いすぎない、ちょうど良い“あるあるユーモア”にする。Twitterでいいねが付きやすいネタ感のある内容にする。" },
            { role: "user", content: params[:text] }
          ]
        }
      )
  
      humor_text = response.dig("choices", 0, "message", "content")
  
      render json: { text: humor_text }  # ← JS と一致させる
    end
  end