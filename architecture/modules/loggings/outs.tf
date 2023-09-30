output "log_groups" {
  value = aws_cloudwatch_log_group.logging
}

output "log_streams" {
  value = aws_cloudwatch_log_stream.logging
}
