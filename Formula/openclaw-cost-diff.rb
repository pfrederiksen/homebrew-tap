# typed: false
# frozen_string_literal: true

class OpenclawCostDiff < Formula
  include Language::Python::Virtualenv

  desc "Compare OpenClaw token usage and API cost"
  homepage "https://github.com/pfrederiksen/openclaw-cost-diff"
  url "https://github.com/pfrederiksen/openclaw-cost-diff/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "0ec1117b3212c54be80560ce2e781185c3b422568e897a2c67d351069afbc8ff"
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
