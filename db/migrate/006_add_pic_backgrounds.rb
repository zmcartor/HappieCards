class AddPicBackgrounds< ActiveRecord::Migration

  #fields used by paperclip
  def change
    add_column :backgrounds, :pic_file_name, :string
    add_column :backgrounds, :pic_content_type, :string
    add_column :backgrounds, :pic_updated_at, :datetime
  end
end
