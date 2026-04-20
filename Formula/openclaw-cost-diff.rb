# typed: false
# frozen_string_literal: true

class OpenclawCostDiff < Formula
  include Language::Python::Virtualenv

  desc "Compare OpenClaw token usage and API cost"
  homepage "https://github.com/pfrederiksen/openclaw-cost-diff"
  url "https://github.com/pfrederiksen/openclaw-cost-diff/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "6bdefc52c4b14b32ff2c42d06acfa32c8c8abff4c12b8328dd7de9e55bbd44d0"
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
