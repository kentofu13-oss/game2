class MygamesController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create]

    def index
        if params[:diagnose]
            redirect_to action: :diagnose and return
        end
        
        @mygames = Mygame.all

        if params[:tag]
            Tag.create(name: params[:tag])
        end

        if params[:tag_ids]
                @mygames = []
                params[:tag_ids].each do |key, value|      
                    @mygames += Tag.find_by(name: key).mygames if value == "1"
                end
            @mygames.uniq!
        end

        if params[:tag_ids]
            @mygames = []
            params[:tag_ids].each do |key, value|
                if value == "1"
                    tag_mygames = Tag.find_by(name: key).mygames
                    @mygames = @mygames.empty? ? tag_mygames : @mygames & tag_mygames
                end
            end
        end
    end

    def new
        @mygame = Mygame.new
    end

    def create
        @mygame = current_user.mygames.build(mygame_params)
        if @mygame.save
            flash[:notice] = "投稿が完了しました"
            redirect_to mygame_path(@mygame)
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show
        @mygame = Mygame.find(params[:id])
    end

    def diagnose
        @mygame = Mygame.new
    end

    def result
        @mygame = Mygame.new(mygame_params)

        # DB の Mygame から診断用に候補を取得
        candidates = Mygame.all.to_a

        # ジャンルで絞る
        if @mygame.question1.present?
            candidates.select! { |g| g.genre.include?(@mygame.question1) }
        end

        # プレイ人数で絞る
        if @mygame.question3.present?
            candidates.select! { |g| g.num_players == @mygame.question3 }
        end

        # ランダムで1つ選ぶ
        @recommended_game = candidates.sample

        @result_genre = @mygame.question1
    end

    private
    def mygame_params
        params.require(:mygame).permit(:title, :genre, :price, :num_players, :question1, :question2, :question3, :question4, :image, tag_ids: [], platforms: [])
    end
end
