output "webserver_seurity_group_id" {
  value = "${aws_security_group.webserver.id}"
}

output "database_seurity_group_id" {
  value = "${aws_security_group.database.id}"
}