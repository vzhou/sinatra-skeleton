class CreateTables < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.timestamps
    end

    create_table :pins do |t|
      t.string :pinurl
      t.string :title
      t.text :description
      t.integer :likes
      t.timestamps
    end

    create_table :comments do |t|
      t.text :comment
      t.timestamps
    end  

  end

end
