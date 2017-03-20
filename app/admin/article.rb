ActiveAdmin.register Article do
  permit_params :title, :writing_date, :theme, :detail, :url

  index do
    selectable_column
    id_column
    column :title
    column :theme
    column :url
    column :writing_date
    actions
  end
end
