class Nkp < Formula
  desc "The NKP CLI is the command-line tool for Nutanix Kubernetes Platform (NKP)."
  homepage "https://portal.nutanix.com/page/documents/details?targetId=Nutanix-Kubernetes-Platform-v2_16:Nutanix-Kubernetes-Platform-v2_16"
  url "https://portal.nutanix.com/page/documents/details?targetId=Release-Notes-Nutanix-Kubernetes-Platform-v2_16:Release-Notes-Nutanix-Kubernetes-Platform-v2_16"
  version "v2.16.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.d2iq.com/dkp/#{version}/nkp_#{version}_darwin_amd64.tar.gz"
      sha256 "d8d922549ec4c1d75a60879b39f1940ce88d0293bae32e2ec9543f94c1fd8713"
    end
    if Hardware::CPU.intel?
      url "https://downloads.d2iq.com/dkp/#{version}/nkp_#{version}_darwin_amd64.tar.gz"
      sha256 "d8d922549ec4c1d75a60879b39f1940ce88d0293bae32e2ec9543f94c1fd8713"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://downloads.d2iq.com/dkp/#{version}/nkp_#{version}_linux_amd64.tar.gz"
      sha256 "7a016cc138fe1dd56e9ba5dcf8819984b82d8b31ab5473e447de70a8223dec71"
    end
    if Hardware::CPU.arm?
      url "https://downloads.d2iq.com/dkp/#{version}/nkp_#{version}_linux_amd64.tar.gz"
      sha256 "7a016cc138fe1dd56e9ba5dcf8819984b82d8b31ab5473e447de70a8223dec71"
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