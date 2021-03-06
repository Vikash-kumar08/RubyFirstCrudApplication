          class ArticlesController < ApplicationController
            $x = 0
            def show
              @article = Article.find(params[:id])
            end

            def index
              @articles = Article.all
            end

            def new
              @article = Article.new
              $x = params[:id]
            end


              def create
                #render plain: params[:article]
                @article = Article.new(article_params)
                @article.user_id = $x
                #phone_number = @article.phone_number
                # if validates_phone_number(get_digits(phone_number))

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
                  phone_number = @article.phone_number
                  current_time = Time.zone.now.to_i
                  created_at = @article.created_at.to_i
                  t1= ((current_time - created_at)/1.hours).round.modulo(24)
                  # t2 = (validates_phone_number(get_digits(phone_number)))
                  if (t1 < 24)
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
                    flash[:alert] = "Sorry you can only update data which created within  24 hrs"
                    render 'edit'
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
              params.require(:article).permit(:title, :description, :phone_number, :created_at, :updated_at,:user_id)
            end

              def get_digits(phone)
                digits = Array.new
                while phone!=0
                  r= (phone % 10)
                  digits.push(r)
                  phone = phone/10
                end
                return (digits.reverse)
              end

                  def validates_phone_number(arr)
                    if arr[0] == 0 || arr[0] == 1
                      return false
                    end
                    if arr[1] == 9
                      return false
                    end
                    if (arr[0] + arr[1] == 37) || (arr[0] + arr[1] == 96)
                      return false
                    end
                    if (arr[1] + arr[2] == 11)
                      return false
                    end
                    if (arr[3] == 0) || (arr[3] == 1)
                      return false
                    end

                    return true

                  end
          end

