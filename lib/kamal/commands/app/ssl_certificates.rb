module Kamal::Commands::App::SslCertificates
  def create_ssl_certificates_directory
    make_directory(config.proxy_ssl_certificates_directory)
  end

  def clean_up_ssl_certificates
    [ :find, config.proxy_ssl_certificates_directory, "-mindepth", "1", "-maxdepth", "1", "!", "-name", KAMAL.config.version, "-exec", "rm", "-rf", "{} +" ]
  end
end
