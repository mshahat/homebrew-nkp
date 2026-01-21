class NkpcliAT216 < Formula
  desc "The NKP CLI is the command-line tool for Nutanix Kubernetes Platform (NKP)."
  homepage "https://portal.nutanix.com/page/documents/details?targetId=Nutanix-Kubernetes-Platform-v2_16:Nutanix-Kubernetes-Platform-v2_16"
  url "https://portal.nutanix.com/page/documents/details?targetId=Release-Notes-Nutanix-Kubernetes-Platform-v2_16:Release-Notes-Nutanix-Kubernetes-Platform-v2_16"
  version "v2.15.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.d2iq.com/dkp/#{version}/nkp_#{version}_darwin_amd64.tar.gz"
      sha256 "dcba9913178aca70dd201032695fdc48f4da5230d706614d3e5cb04a51298d04"
    end
    if Hardware::CPU.intel?
      url "https://downloads.d2iq.com/dkp/#{version}/nkp_#{version}_darwin_amd64.tar.gz"
      sha256 "dcba9913178aca70dd201032695fdc48f4da5230d706614d3e5cb04a51298d04"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.d2iq.com/dkp/#{version}/nkp_#{version}_linux_amd64.tar.gz"
      sha256 "771945400c6068e85d2e031d897b9c0b59057394b351e3c6618ecfd01bd32bbf"
    end
    if Hardware::CPU.arm?
      url "https://downloads.d2iq.com/dkp/#{version}/nkp_#{version}_linux_amd64.tar.gz"
      sha256 "771945400c6068e85d2e031d897b9c0b59057394b351e3c6618ecfd01bd32bbf"
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