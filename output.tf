output "zone_id" {
  value = "${aws_route53_zone.primary.zone_id}"
}

output "name_servers" {
  value = "${data.aws_route53_zone.selected.name_servers}"
}
