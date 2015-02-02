class Post < ActiveRecord::Base
  belongs_to :author
  has_one :term_relationship
end
