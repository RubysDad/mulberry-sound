class AddUsernameToPodcast < ActiveRecord::Migration[5.1]
  def change
    add_column :podcasts, :username, :string
  end
end
