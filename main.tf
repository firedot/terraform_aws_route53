# The following block of code defines the provider as well as the credentials needed to use it.

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.region_id}"
}

# The following block of code will create an AWS Route53 primary zone

resource "aws_route53_zone" "primary" {
  name = "visitbg.local"
}

# In the lines that follow, we will obtain information about the NameServers that are servicing our newly Rout53 Zone
# In the current example, we are going to take the hostnames of 4 NameServers and will resolve them to their IP addresses

data "dns_a_record_set" "visitbg_local_ns" {
  count      = 4
  host       = "${aws_route53_zone.primary.name_servers[count.index]}"
  depends_on = ["aws_route53_zone.primary"]
}
