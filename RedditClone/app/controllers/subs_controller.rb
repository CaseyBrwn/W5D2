class SubsController < ApplicationController
    before_action :require_login

    def index
        @subs = Sub.all
        render :index
    end

    def show
        @sub = Sub.find_by(id: params[:id])
        @post_subs = @sub.post_subs.includes(:post)
        render :show
    end

    def new
        @sub = Sub.new
        render :new
    end

    def create
        @sub = Sub.new(sub_params)
        @sub.moderator_id = current_user.id
        if @sub.save
            redirect_to sub_url(@sub)
        else
            flash.now[:errors]=@sub.errors.full_messages
            render :new
        end
    end

    def edit
        @sub = Sub.find_by(id: params[:id])
        render :edit
    end

    def update
        @sub = Sub.find_by(id: params[:id])
        if current_user.id == @sub.moderator_id && @sub.update(sub_params)
            redirect_to sub_url(@sub)
        else
            flash.now[:errors]=@sub.errors.full_messages
            render :edit
        end
    end

    def destroy
        @sub = Sub.find_by(id: params[:id])
        if current_user.id == @sub.moderator_id
            @sub.destroy
            redirect_to subs_url
        else
            flash[:errors] = ["You aren't the mod of this site"]
            redirect_to subs_url
        end
    end

    def sub_params
        params.require(:sub).permit(:title, :description)
    end
end
