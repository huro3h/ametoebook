ActiveAdmin.register Article do
  permit_params :title, :writing_date, :theme, :detail, :url
end
