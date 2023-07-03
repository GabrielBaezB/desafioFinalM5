class AddUserAvatarToTweets < ActiveRecord::Migration[7.0]
  def change
    add_column :tweets, :userAvatar, :string
  end
end
