ActiveAdmin.register Match do
  index do
    column :id
    column :user
    bool_column2 :occupation
    column :title
    column :text
    column :created_at
    column :updated_at
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :occupation, :title, :text
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :occupation, :title, :text]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
