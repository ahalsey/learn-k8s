output "master_public_dns" {
    value = aws_instance.kube-master.public_dns
}

output "worker-0_public_dns" {
    value = aws_instance.kube-node-0.public_dns
}