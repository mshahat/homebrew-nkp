class Nkpcli < Formula
  desc "The NKP CLI is the command-line tool for Nutanix Kubernetes Platform (NKP)."
  homepage "https://portal.nutanix.com/page/documents/details?targetId=Nutanix-Kubernetes-Platform-v2_16:Nutanix-Kubernetes-Platform-v2_16"
  url "https://portal.nutanix.com/page/documents/details?targetId=Release-Notes-Nutanix-Kubernetes-Platform-v2_16:Release-Notes-Nutanix-Kubernetes-Platform-v2_16"
  version "v2.17.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.d2iq.com/dkp/#{version}/nkp_#{version}_darwin_amd64.tar.gz"
      sha256 "330e8101d4cd0052147821cdf16117c928a942963806457072b64a458b1925f8"
    end
    if Hardware::CPU.intel?
      url "https://downloads.d2iq.com/dkp/#{version}/nkp_#{version}_darwin_amd64.tar.gz"
      sha256 "330e8101d4cd0052147821cdf16117c928a942963806457072b64a458b1925f8"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.d2iq.com/dkp/#{version}/nkp_#{version}_linux_amd64.tar.gz"
      sha256 "d234bec8a34b6a12818d2a88cb105994faaaaa31b4ad5f7b75b00338c68ae5ae"
    end
    if Hardware::CPU.arm?
      url "https://downloads.d2iq.com/dkp/#{version}/nkp_#{version}_linux_amd64.tar.gz"
      sha256 "d234bec8a34b6a12818d2a88cb105994faaaaa31b4ad5f7b75b00338c68ae5ae"
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