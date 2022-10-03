ActiveAdmin.register Product do
  permit_params :name, :price, :description, :quantity, :image
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :price, :description, :quantity
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :price, :description, :quantity]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  filter :name
  filter :price
  filter :created_at

  index do
    selectable_column
    id_column
    column :name
    column :price
    column :description
    column :quantity
    actions
  end

  show do
    attributes_table do
      row :name
      row :price
      row :description
      row :quantity
      row :image do |ad|         
        image_tag(ad.image, size: "400x400") if ad.image.attached?
      end
    end
  end

  form do |f|
    f.inputs :name
    f.inputs  :price
    f.inputs  :description
    f.inputs  :quantity
    f.input :image, as: :file
    f.actions
  end
end
