resource "null_resource" "build-antivirus-from-source" {
  provisioner "local-exec" {
    command = "bash ${path.module}/scripts/build-antivirus-from-source.sh"
  }
}