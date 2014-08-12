class AddDefColumnToPostSubjects < ActiveRecord::Migration
  def change
    add_column :post_subjects, :disc, :text
  end
end
