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

# The following two blocks of code will create two "A" (host) records in the zone that we defined in the previous block

resource "aws_route53_record" "visitbg-server" {
  zone_id = "${aws_route53_zone.primary.zone_id}"
  name    = "server.visitibg.local"
  type    = "A"
  records = ["172.28.128.3"]
  ttl     = "30"
}

resource "aws_route53_record" "visitbg-www" {
  zone_id = "${aws_route53_zone.primary.zone_id}"
  name    = "www"
  type    = "A"
  records = ["172.28.128.3"]
  ttl     = "30"
}

# Here we define a datasource which will provide us with a way to gather information about the AWS Route53 zone that we created

data "aws_route53_zone" "selected" {
  name       = "visitbg.local"
  depends_on = ["aws_route53_zone.primary"]
}

# In the lines that follow, we consume information provided by the ```aws_route53_zone``` data source. 
# In the current example, we are going to take the hostnames of 4 NameServers and will resolve them to their IP addresses

data "dns_a_record_set" "visitbg_local_ns" {
  count      = 4
  host       = "${data.aws_route53_zone.selected.name_servers[count.index]}"
  depends_on = ["data.aws_route53_zone.selected"]
}
