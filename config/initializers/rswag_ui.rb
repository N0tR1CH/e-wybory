require 'rswag/ui'
Rswag::Ui.configure do |c|


  if Rails.env.development?

  end

  c.swagger_endpoint '/api-docs/v1/swagger.yaml', 'API V1 Docs'
end