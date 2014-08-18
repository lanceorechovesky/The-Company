class PostSubjectsController < ApplicationController
  before_action :find_sub, only: [:show, :create_comment, :edit, :update, :destroy, :destroy_comment]

  def index
    @subject = PostSubject.all
  end

  def show
    @comment = @subject.comments.new
  end

  def new
    @subject = PostSubject.new
  end

  def create
    @subject = PostSubject.create subject_data
    if @subject.save == true
      redirect_to post_subjects_path
    else
      render :new
    end
  end

  def create_comment
    @subject.comments.create com_data
    redirect_to post_subject_path(@subject)
  end

  def edit
  end

  def update
    @subject.update_attributes subject_data
    redirect_to post_subject_path(@subject)
  end

  def destroy
    @subject.delete
    redirect_to post_subjects_path
  end

  def destroy_comment
    @comment = find_com
    @comment.destroy
    redirect_to post_subject_path(@subject)
  end

private

  def find_com
    @comment = Comment.find params[:comment_id]
  end

  def find_sub
    @subject = PostSubject.find params[:id]
  end

  def subject_data
    params.require(:post_subject).permit(:subject, :disc)
  end

  def com_data
    params.require(:comment).permit(:body)
  end

end





















