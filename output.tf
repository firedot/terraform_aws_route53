# The following code will give us the zone_id of the AWS Route53 zone that is created by the configuration in our main.tf

output "zone_id" {
  value = "${aws_route53_zone.primary.zone_id}"
}

# The following code will provide us with the FQDNs of the NameServers responsible for our AWS Route53 zone

output "name_servers" {
  value = "${aws_route53_zone.primary.name_servers}"
}

# The following block of code will give us the IP Addresses of the NameServers responsible for our AWS Route53 zone. 
# The addresses are resolved by the ```dns_a_record_set``` data source. 

output "name_server_ip" {
  value = "${data.dns_a_record_set.visitbg_local_ns.*.addrs}"
}
