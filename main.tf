provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.region_id}"
}

resource "aws_route53_zone" "primary" {
  name = "visitbg.local"
}

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

data "aws_route53_zone" "selected" {
  name = "visitbg.local."
}
