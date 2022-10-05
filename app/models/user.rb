class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :addresses, dependent: :destroy  
  has_many :orders, dependent: :destroy
  has_one :cart, dependent: :destroy 
  accepts_nested_attributes_for :addresses, :allow_destroy => true
end
