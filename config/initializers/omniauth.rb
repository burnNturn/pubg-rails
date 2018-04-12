OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '158309731849-ah2svhnb9ggsimhsnvsdkekkmank862o.apps.googleusercontent.com', '7vGi92WnE4nmIzaK7-waVBfH', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
  provider :discord, '433079804770779146', 'Ow12Vm4o8IDsNNDQDNkYAXSe5qli6uhj'
end