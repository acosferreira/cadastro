class AddColumnFotoPessoa < ActiveRecord::Migration
  def self.up
     add_column :pessoas, :picture_file_name, :string, :limit=>255
     add_column :pessoas, :picture_content_type, :string, :limit=>255
     add_column :pessoas, :picture_file_size, :integer
     add_column :pessoas, :picture_updated_at , :datetime

  end

  def self.down
    remove_column :pessoas, :picture_file_name
    remove_column :pessoas, :picture_content_type
    remove_column :pessoas, :picture_file_size
    remove_column :pessoas, :picture_updated_at

  end
end
