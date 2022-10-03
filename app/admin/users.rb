ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :phone_no
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :phone_no]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :name, 
                :email, 
                :phone_no

  filter :name
  filter :email
  filter :phone_no
  filter :created_at
  filter :updated_at

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :phone_no
    column :addresses do |address|
      link_to "View Address ", admin_address_path(address)
    end
    column :created_at
    column :updated_at
    
    actions
  end

  # form do |f|
  #   f.input :name
  #   f.input :email
  #   f.input :phone_no
  #   f.inputs do
  #     f.has_many :addresses,
  #                 new_record: 'Add Address',
  #                 remove_record: 'Remove Address',
  #                 allow_destroy: -> (c) { c.author?(current_admin_user) } do |b|

  #       b.input :house_no
  #       b.input :area
  #       b.input :land_mark
  #       b.input :city
  #     end
  #   end
  #   f.actions
  # end
end

