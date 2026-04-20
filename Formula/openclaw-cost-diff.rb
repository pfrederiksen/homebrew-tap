# typed: false
# frozen_string_literal: true

class OpenclawCostDiff < Formula
  include Language::Python::Virtualenv

  desc "Compare OpenClaw token usage and API cost"
  homepage "https://github.com/pfrederiksen/openclaw-cost-diff"
  url "https://files.pythonhosted.org/packages/source/o/openclaw-cost-diff/openclaw_cost_diff-0.1.0.tar.gz"
  sha256 "d06eedb2217daa599778a0dbda9d72e0b19f3c1c8513b81691ba6c140c27d316"
  license "MIT"

  depends_on "python-setuptools" => :build
  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "openclaw-cost-diff", shell_output("#{bin}/openclaw-cost-diff --help")
  end
end
