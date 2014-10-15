class Article < ActiveRecord::Base
	validates :title, presence: true,
                    length: { minimum: 5 }
  validates :content, presence: true,
                      length: { minimum: 10 }
  validates :username, presence: true
  validates :status, presence: true
default_scope {where(status: 'active')}
has_many :comments, dependent: :destroy



end
