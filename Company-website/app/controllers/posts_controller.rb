class PostsController < ApplicationController
  before_action :find_sub, only: [:index, :show, :new, :create, :edit, :update, :destroy, :create_comment, :destroy_comment]
  before_action :find_post, only: [:show, :edit, :update, :destroy, :create_comment, :destroy_comment]

  def index
    @post = @subject.posts.all
  end

  def show
    @comment = @post.comments.new
  end

  def new
    @post = Post.new
    @tag = Tag.all
  end

  def create
    @post = @subject.posts.new(post_data)
    if @post.save == true
      redirect_to post_subject_posts_path(@subject)
    else
      render :new
    end
  end

  def create_comment
    @post.comments.create com_data
    redirect_to post_subject_post_path(@subject, @post)
  end

  def edit
    @tag = Tag.all
  end

  def update
    @post.update_attributes post_data
    redirect_to post_subject_post_path(@subject, @post)
  end

  def destroy
    @post.delete
    redirect_to post_subject_posts_path(@subject)
  end

  def destroy_comment
    @comment = find_com
    @comment.destroy
    redirect_to post_subject_post_path(@subject, @post)
  end

private
  def find_com
    @comment = Comment.find params[:comment_id]
  end

  def find_sub
    @subject = PostSubject.find params[:post_subject_id]
  end

  def find_post
    @post = Post.find params[:id]
  end

  def post_data
    params.require(:post).permit(:title, :body, :workflow_state, :post_subject_id, tag_ids: [])
  end

  def com_data
    params.require(:comment).permit(:body)
  end

end
