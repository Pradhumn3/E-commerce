ActiveAdmin.register Address do
  # filter :user_id, :as => :string
  filter :user_id, :as => :select, :collection => User.all.map {|user| [user.name, user.id]}
  filter :house_no, :as => :string
  filter :area, :as => :string
  filter :land_mark, :as => :string
  filter :city, :as => :string
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :house_no, :area, :land_mark, :user_id, :city
  #
  # or
  #
  # permit_params do
  #   permitted = [:house_no, :area, :land_mark, :user_id, :city]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
