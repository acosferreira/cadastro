class CreateCreateNewsletters < ActiveRecord::Migration
  def self.up
    create_table :create_newsletters do |t|
      t.string :title
      t.string :content
      t.timestamps
    end
  end

  def self.down
    drop_table :create_newsletters
  end
end
