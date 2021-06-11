class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :email
      t.string :password_digest
      t.string :comment
      t.text :user_name
      t.text :my_image
      t.date :birthday
      t.integer :gender

      t.timestamps
    end
  end
end
