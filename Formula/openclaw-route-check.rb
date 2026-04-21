class OpenclawRouteCheck < Formula
  include Language::Python::Virtualenv

  desc "Static routing checks for OpenClaw messages, cron jobs, and announce deliveries"
  homepage "https://github.com/pfrederiksen/openclaw-route-check"
  url "https://files.pythonhosted.org/packages/source/o/openclaw-route-check/openclaw_route_check-0.1.1.tar.gz"
  sha256 "c257609bd4088eef9a1562c3b0a52ae4189de2b8bbd886a5b769495f070e46b1"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"openclaw-route-check", "--session", "agent:main:telegram:group:-1003710118964"
  end
end
