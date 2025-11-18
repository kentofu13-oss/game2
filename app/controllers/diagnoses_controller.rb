class DiagnosesController < ApplicationController
  def diagnose
    @mygame = Mygame.new
  end

  def result
    q1 = params[:mygame][:question1]  # ジャンル
    q2 = params[:mygame][:question2]  # プレイスタイル
    q3 = params[:mygame][:question3]  # プレイ人数
    q4 = params[:mygame][:question4]  # 雰囲気・世界観

    # --- ① ジャンルで絞る ---
    @recommended_games = Mygame.where(genre: q1)

    # --- ② プレイ人数で絞る ---
    if q3.present?
      @recommended_games = @recommended_games.where(num_players: q3)
    end

    # --- ③ 結果が無い時の処理 ---
    if @recommended_games.empty?
      @recommended_game = Mygame.order("RANDOM()").first
    else
      @recommended_game = @recommended_games.sample
    end

    @result_genre = q1
  end

end
