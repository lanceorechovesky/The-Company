class PostsController < ApplicationController

  def index
    @subject = find_sub
    @post = @subject.posts.all
  end

  def show
    @subject = find_sub
    @post = find_post
    @comment = @post.comments.new
  end

  def new
    @subject = find_sub
    @post = Post.new
  end

  def create
    @subject = find_sub
    @post = @subject.posts.new(post_data)
    if @post.save == true
      redirect_to post_subject_posts_path(@subject)
    else
      render :new
    end
  end

  def create_comment
    @subject = find_sub
    @post = find_post
    @post.comments.create com_data
    redirect_to post_subject_post_path(@subject, @post)
  end

  def edit
    @subject = find_sub
    @post = find_post
  end

  def update
    @subject = find_sub
    @post = find_post
    @post.update_attributes post_data
    redirect_to post_subject_post_path(@subject, @post)
  end

  def destroy
    @subject = find_sub
    @post = find_post
    @post.delete
    redirect_to post_subject_posts_path(@subject)
  end

  def destroy_comment
    @subject = find_sub
    @post = find_post
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
    params.require(:post).permit(:title, :body, :workflow_state, :post_subject_id)
  end

  def com_data
    params.require(:comment).permit(:body)
  end

end
