  class ArticlesController < ApplicationController
    def show
      @article = Article.find(params[:id])
    end

    def index
      @articles = Article.all
    end

    def new
      @article = Article.new
    end




    def create
      #render plain: params[:article]
      @article = Article.new(article_params)
      if @article.save!
          flash[:notice] = "Article was created successfully."
          redirect_to article_path(@article.id)
      else
        render 'new'
      end
    end



       def edit
         @article = Article.find(params[:id])
       end

        def update
          @article = Article.find(params[:id])
          current_time = Time.zone.now.to_i
          created_at = @article.created_at.to_i
          if ((current_time - created_at)/1.hours).round.modulo(24) > 24
            if @article.update(article_params)
              flash[:notice] = "Article was updated successfully."
              flag = 1
              redirect_to articles_path
            else
              flag = 1
              render 'edit'
            end
          end
          if flag != 1
            flash[:notice] = "Sorry you cannot update data within 24hrs. Please wait!"
            redirect_to articles_path
            end
        end


    def destroy
      @article = Article.find(params[:id])
      if @article.destroy
        flash[:notice] = "Article was deleted successfully."
      end
      redirect_to articles_path
    end
    private
    def article_params
      params.require(:article).permit(:title, :description, :phone_number, :created_at, :updated_at)
    end

  end

