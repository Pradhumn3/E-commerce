ActiveAdmin.register Plan do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :plan_name, :description, :period, :billing_cycle, :amount, :razorpay_plan_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:plane_name, :description, :period, :billing_cycle, :amount, :razorpay_plan_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
