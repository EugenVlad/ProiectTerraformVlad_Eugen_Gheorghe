resource "null_resource" "ping_test" {
  depends_on = [azurerm_linux_virtual_machine.mtc-vm]

  triggers = {
    vm1_ip = azurerm_public_ip.mtc-ip[0].ip_address
    vm2_ip = azurerm_public_ip.mtc-ip[1].ip_address
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      host        = azurerm_public_ip.mtc-ip[0].ip_address
      user        = azurerm_linux_virtual_machine.mtc-vm[0].admin_username
      private_key = file(var.ssh_private_key_path)  # Folosește cheia privată
    }

    inline = [
      "echo 'Starting ping test...'",  # Mesaj de debug
      "ping -c 4 ${self.triggers.vm2_ip}",
      "if [ $? -eq 0 ]; then echo 'Ping test successful'; else echo 'Ping test failed'; fi"
    ]
  }
}