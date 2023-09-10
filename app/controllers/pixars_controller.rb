class PixarsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    def index
        @pixars = Pixar.all
        @pixars = @pixars.page(params[:page]).per(3)
        @rank_pixars = Pixar.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}.first(3)
    end
    def new
        @pixar = Pixar.new
      end
    
      def create
        pixar= Pixar.new(pixar_params)

        pixar.user_id = current_user.id  

        if pixar.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def show
        @pixar = Pixar.find(params[:id])
        @comments = @pixar.comments
        @comment = Comment.new
      end

        

      def edit
        @pixar = Pixar.find(params[:id])
      end

      def update
        pixar = Pixar.find(params[:id])
        if pixar.update(pixar_params)
          redirect_to :action => "show", :id => pixar.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        pixar= Pixar.find(params[:id])
        pixar.destroy
        redirect_to action: :index
      end

      private
      def pixar_params
        params.require(:pixar).permit(:name, :main, :mouse, :video, :image)
      end
    end
