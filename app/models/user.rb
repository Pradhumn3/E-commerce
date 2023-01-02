class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :addresses, dependent: :destroy  
  has_many :orders, dependent: :destroy
  has_one :cart, dependent: :destroy 
  has_one :user_subcription, dependent: :destroy
  
  accepts_nested_attributes_for :addresses, :allow_destroy => true
  after_create :create_rozarpay_customer

  private 
  
  def create_rozarpay_customer
    response = RazorpayServices.create_customer(self)
    self.update_column(:razorpay_customer_id, response.as_json["attributes"]["id"]) 
  end
end
