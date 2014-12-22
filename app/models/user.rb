class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #mount_uploader :avatar, AvatarUploader 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_uniqueness_of :name
  has_many :posts, :dependent => :destroy
  acts_as_followable
  acts_as_follower
  #mount_uploader :avatar, AvatarUploader
 end
