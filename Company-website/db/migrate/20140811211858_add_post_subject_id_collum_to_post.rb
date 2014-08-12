class AddPostSubjectIdCollumToPost < ActiveRecord::Migration
  def change
    add_column :posts, :post_subject_id, :integer
  end
end
