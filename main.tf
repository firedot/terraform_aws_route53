provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.region_id}"
}

resource "aws_route53_zone" "primary" {
  name = "visitbg.local"
}

resource "aws_route53_record" "visitbg-ns" {
  zone_id = "${aws_route53_zone.primary.zone_id}"
  name    = "server.visitibg.local"
  type    = "A"
  records = ["192.168.0.100"]
  ttl     = "30"
}
