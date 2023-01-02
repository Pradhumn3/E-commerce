class Plan < ApplicationRecord
  after_save :create_plan

  def create_plan
    response = RazorpayServices.create_plan(self)
    self.update_column(:razorpay_plan_id, response.as_json["attributes"]["id"])  
  end
end
