class Kamal::Cli::App::SslCertificates
  attr_reader :host, :sshkit
  delegate :upload!, :execute, to: :sshkit

  def initialize(host, sshkit)
    @host = host
    @sshkit = sshkit
  end

  def run
    if KAMAL.config.ssl_certificate_path && KAMAL.config.ssl_private_key_path
      execute *KAMAL.app.create_ssl_certificates_directory
      upload! KAMAL.config.ssl_certificate_path, File.join(KAMAL.config.proxy_ssl_certificates_directory, KAMAL.config.version, "cert.pem"), mode: "0600"
      upload! KAMAL.config.ssl_private_key_path, File.join(KAMAL.config.proxy_ssl_certificates_directory, KAMAL.config.version, "key.pem"), mode: "0600"
    end
  end
end
