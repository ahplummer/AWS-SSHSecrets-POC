#Put your output vars here...
output "publicIP" {
   value = aws_instance.regularserver.public_ip
}
output "SecretARN" {
    value = aws_secretsmanager_secret.instancekey.arn
}