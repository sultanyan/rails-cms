ActiveAdmin.register Page do

permit_params :title, :section_id, :body, :order, :is_published, :menu_display, :featured

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
    index do
        column :id
        column :title, :sortable => :title
        column :section, :sortable => :section
        column :created_at, :sortable => :created_at
        column :featured
        column :order
        actions
    end

    # Change the create form
    form do |f|
        f.inputs "Details" do
            f.input :title, :label => "Title"
            f.input :section, :label => "Choose the section"
            f.input :body, as: :html_editor, :label => "Main content"
            f.input :order, :label => "Page order"
            f.input :is_published, :label => "Is published"
            f.input :featured, :label => "Is featured?"
            f.input :menu_display, :label => "Display in menu"
            f.actions
        end
    end

end
