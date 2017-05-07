ActiveAdmin.register Block do

permit_params :title, :show_title, :body, :position, :display, :class_suffix, :order, :is_published

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
        column :show_title
        column :is_published
        column :position, :sortable => :block
        column :order
        column :class_suffix
        actions
    end

    form do |f|
        f.inputs "Details" do
            f.input :title, :label => "Title"
            f.input :show_title, :label => "Show title?"
            f.input :body, as: :html_editor, :label => "Body"
            f.input :position, :label => "Position", :as => :select, :collection => [["Jumbotron", "jumbotron"], ["Block", "block"]]
            f.input :display, :label => "Display", :as => :select, :collection => [["All Pages", "all"], ["Home Page Only", "home"], ["All Except Home Page", "nohome"]]
            f.input :order, :label => "Order"
            f.input :class_suffix, :label => "Class suffix"
            f.input :is_published, :label => "Is published?"
            f.actions
        end
    end

end
