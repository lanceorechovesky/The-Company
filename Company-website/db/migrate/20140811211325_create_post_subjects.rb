class CreatePostSubjects < ActiveRecord::Migration
  def change
    create_table :post_subjects do |t|
      t.string :subject
      t.timestamps
    end
  end
end
