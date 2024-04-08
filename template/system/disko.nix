{libs ? import ../libs, ...}:
libs.diskSetup {
  device = "/dev/sda";
  ssd = true;
  swapCapacity = "2G";
}
