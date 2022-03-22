class Moderator < ApplicationRecord
  belongs_to :user

   searchkick word_middle: [:id, :first_name, :last_name, :email]

  def search_data
  {
    id: id,
    first_name: first_name,
    last_name: last_name,
    email: email,
  }
  end
end
