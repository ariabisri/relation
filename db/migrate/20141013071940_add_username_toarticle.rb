class AddUsernameToarticle < ActiveRecord::Migration
  def change
  	add_column :articles, :username, :string
  end
end
