resource "google_compute_instance" "nexus" {
  name         = "nexus-instance"
  machine_type = "e2-medium"
  zone         = var.zone
  tags         = ["nexus-app"]

  # boot disk specifications
  boot_disk {
    initialize_params {
      image = "nexus-base" // use image built with Packer
    }
  }

  # networks to attach to the VM
  network_interface {
    network = "default"
    access_config {
      // Ephemeral public IP
    }
  }
}

resource "google_compute_project_metadata" "nexus" {
  metadata = {
    ssh-keys = "nexus-user:${file("~/.ssh/nexus-user.pub")}"
  }
}

resource "google_compute_firewall" "nexus" {
  name    = "allow-nexus-tcp-9292"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }
  target_tags = ["nexus-app"]
}
