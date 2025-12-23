class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, except: [ :show, :edit, :update, :destroy ]
  before_action :set_comment, only: [ :show, :edit, :update, :destroy ]

  # GET /comments or /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = @article.comments.build
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    @comment = @article.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @article, notice: "Comment was successfully created."
    else
      render :new, notice: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to article_path(@comment.article), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy!

    redirect_to article_path(@comment.article), notice: "Comment was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = if params[:article_id]
                    Article.find(params[:article_id])
                  elsif @comment&.article
                    @comment.article
                  end
    end
    def set_comment
      @comment = if params[:id]
                    Comment.find(params[:id])
                  elsif @article
                    @article.comments.build(comment_params)
                  end
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:content)
    end
end
