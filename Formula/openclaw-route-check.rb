class OpenclawRouteCheck < Formula
  include Language::Python::Virtualenv

  desc "Static routing checks for OpenClaw messages, cron jobs, and announce deliveries"
  homepage "https://github.com/pfrederiksen/openclaw-route-check"
  url "https://files.pythonhosted.org/packages/source/o/openclaw-route-check/openclaw_route_check-0.1.2.tar.gz"
  sha256 "81d5d98a659430c816e2fa60c394ced346bd608c3d2192edfa5f4d7bc1be4938"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"openclaw-route-check", "--session", "agent:main:telegram:group:-1003710118964"
  end
end
