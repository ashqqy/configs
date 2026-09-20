{
  swapDevices = [
    {
      device = "/swapfile";
      size = 20480;
    }
  ];

  boot.resumeDevice = "/dev/disk/by-uuid/33ab28fd-2d64-4dc9-abc4-d04d4bf4f87a";
  boot.kernelParams = [ "resume_offset=103057408" ];
}
