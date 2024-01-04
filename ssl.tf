# SSL Encryption Configuration

resource "aws_db_option_group" "rds_option_group" {
  name = "rds-option-group"

  option {
    option_name = "MYSQL_SSL"
    option_settings = [
      {
        name  = "CACERT"
        value = "/path/to/cacertificate.pem"
      },
      {
        name  = "CERT"
        value = "/path/to/certificate.pem"
      },
      {
        name  = "KEY"
        value = "/path/to/key.pem"
      },
    ]
  }
}
