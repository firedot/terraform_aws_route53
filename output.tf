output "zone_id" {
  value = "${aws_route53_zone.primary.zone_id}"
}

output "name_servers" {
  value = "${aws_route53_zone.primary.name_servers}"
}

output "name_server_ip" {
  value = "${data.dns_a_record_set.visitbg_local_ns.*.addrs}"
}
