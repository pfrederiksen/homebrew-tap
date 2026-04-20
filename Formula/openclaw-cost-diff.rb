# typed: false
# frozen_string_literal: true

class OpenclawCostDiff < Formula
  include Language::Python::Virtualenv

  desc "Compare OpenClaw token usage and API cost"
  homepage "https://github.com/pfrederiksen/openclaw-cost-diff"
  url "https://github.com/pfrederiksen/openclaw-cost-diff/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "2bfb061ff8d23d3aa3540e0ffa4ec520d1a62a3239cd9b752e23eb197566cde4"
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
