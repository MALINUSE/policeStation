class Declaration < ActiveRecord::Base
  belongs_to :user
  belongs_to :quartier
  belongs_to :engin
end
