class User < ApplicationRecord
  before_create :update_sign_in_at
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :birth, :gender, presence: true
  validates :name, presence: true, length: { maximum: 25 }
  validates :phone, uniqueness: true, 
                numericality: { only_integer: true },
                length: { is: 10, message: "Must be 10 digits" }
                
  has_many :blocked_relationships, class_name: "Relationship", 
            foreign_key: "blocked_id", dependent: :destroy
  has_many :blockers, through: :blocked_relationships, source: :blocker

  has_many :blocker_relationships, class_name: "Relationship", 
            foreign_key: "blocker_id", dependent: :destroy
  has_many :blockeds, through: :blocker_relationships, source: :blocked

  def block(other_user)
  	blockers << other_user
  end

  def unblock(other_user)
  	blockers.delete(other_user)
  end

  def is_blocked?(other_user)
  	blockers.exists?(other_user.id)
  end

  private
  def update_sign_in_at
    self.last_sign_in_at =Time.now
    self.current_sign_in_at =Time.now
  end
end
