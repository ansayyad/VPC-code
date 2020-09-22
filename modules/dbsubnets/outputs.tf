  
output "route_table_id" {
  value = ["${aws_route_table.database_rt.*.id}"]
}

output "database_subnet_ids" {
  value = "${aws_subnet.database_subnet.*.id}"
}