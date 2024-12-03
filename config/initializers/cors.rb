Rails.application.config.action_dispatch.default_headers = {
  'Access-Control-Allow-Origin' => '*',
  'Access-Control-Allow-Methods' => %w[GET POST PUT DELETE],
  'Access-Control-Allow-Headers' => %w[Content-Type]
}