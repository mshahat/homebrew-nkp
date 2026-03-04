class Nkpcli < Formula
  desc "The NKP CLI is the command-line tool for Nutanix Kubernetes Platform (NKP)."
  homepage "https://portal.nutanix.com/page/documents/details?targetId=Nutanix-Kubernetes-Platform-v2_16:Nutanix-Kubernetes-Platform-v2_16"
  url "https://portal.nutanix.com/page/documents/details?targetId=Release-Notes-Nutanix-Kubernetes-Platform-v2_16:Release-Notes-Nutanix-Kubernetes-Platform-v2_16"
  version "v2.17.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.d2iq.com/dkp/#{version}/nkp_#{version}_darwin_amd64.tar.gz"
      sha256 "e33d58dcae60b2217974eeb62c7b547a93832f18ef36993adfc93d05aa85fefc"
    end
    if Hardware::CPU.intel?
      url "https://downloads.d2iq.com/dkp/#{version}/nkp_#{version}_darwin_amd64.tar.gz"
      sha256 "e33d58dcae60b2217974eeb62c7b547a93832f18ef36993adfc93d05aa85fefc"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.d2iq.com/dkp/#{version}/nkp_#{version}_linux_amd64.tar.gz"
      sha256 "0002f54c88af54d085c8a50e9ad3d179717472e1470406f4832e0c09dff9b674"
    end
    if Hardware::CPU.arm?
      url "https://downloads.d2iq.com/dkp/#{version}/nkp_#{version}_linux_amd64.tar.gz"
      sha256 "0002f54c88af54d085c8a50e9ad3d179717472e1470406f4832e0c09dff9b674"
    end
  end

  def install
    bin.install "nkp"
  end

  test do
    # Validate install
    system "#{bin}/nkp", "version"
  end
end