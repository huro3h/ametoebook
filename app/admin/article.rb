ActiveAdmin.register Article do
  permit_params :title, :writing_date, :theme, :detail, :url, :name, :status

  index do
    selectable_column
    id_column
    column :title
    column :theme
    column :name
    column :status
    column :url
    column :writing_date
    actions
  end
end
