# INSTALL EC2 API
class ec2api {

package { "ec2-api-tools":
  ensure  => latest,
  require  => Exec['apt-get update'],
}

}

