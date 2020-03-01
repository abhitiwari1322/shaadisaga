class NewsController < ApplicationController
    before_action :set_user, :except =>  [:index]
    skip_before_action :verify_authenticity_token

    def index
        @user = nil
        if params[:user_id]
            @user = User.find(params[:user_id])
        end
    end
    def all_news
        deleted_news_ids = UserNews.where(user_id: @user.id, is_deleted: UserNews::IS_DELETED).pluck(:news_id)
        @newsfeeds = News.where.not(id: deleted_news_ids).order(created_at: :desc)
    end
    def show
        @newsfeed = News.where(id: params[:id]).first
    end

    def my_news
        read_news_ids = UserNews.where(user_id: @user.id, is_read: UserNews::IS_READ).where.not(is_deleted: UserNews::IS_DELETED).pluck(:news_id)
        @newsfeeds = News.where(id: read_news_ids).order(created_at: :desc)
    end

    def mark_as_read
        user_news = UserNews.where(user_id: params[:user_id],news_id: params[:news_id]).first_or_create   
        user_news.is_read = UserNews::IS_READ
        user_news.save
        redirect_to all_news_news_index_path(user_id: @user.id)
    end

    def mark_as_delete
        user_news = UserNews.where(user_id: params[:user_id],news_id: params[:news_id]).first_or_create
        user_news.is_deleted = UserNews::IS_DELETED
        user_news.save
        redirect_to all_news_news_index_path(user_id: @user.id), notice: "Deleted news with id: #{user_news.news_id}"
    end

    private

    def set_user
        user_id = params[:user_id]
        @user = User.find(user_id)
    end

end
