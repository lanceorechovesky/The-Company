class PostSubjectsController < ApplicationController

  def index
    @subject = PostSubject.all
  end

  def show
    @subject = find_sub
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
    @subject = find_sub
    @subject.comments.create com_data
    redirect_to post_subject_path(@subject)
  end

  def edit
    @subject = find_sub
  end

  def update
    @subject = find_sub
    @subject.update_attributes subject_data
    redirect_to post_subject_path(@subject)
  end

  def destroy
    @subject = find_sub
    @subject.delete
    redirect_to post_subjects_path
  end

  def destroy_comment
    @subject = find_sub
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





















