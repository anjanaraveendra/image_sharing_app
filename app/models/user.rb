class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :gallery_attachments
  has_many :galleries
  has_many :galleries, through: :gallery_attachments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_messageable

  def mailboxer_name
    self.first_name
  end

  def mailboxer_email(object)
    self.email
  end
  
end
