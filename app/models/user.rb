class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable

  has_many :projects, dependent: :destroy
  has_many :pledges, dependent: :destroy
  has_many :rewards, :through => :pledges
  has_many :comments, dependent: :destroy

  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end

end
