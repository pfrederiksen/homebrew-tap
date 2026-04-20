# typed: false
# frozen_string_literal: true

class OpenclawCostDiff < Formula
  include Language::Python::Virtualenv

  desc "Compare OpenClaw token usage and API cost"
  homepage "https://github.com/pfrederiksen/openclaw-cost-diff"
  url "https://files.pythonhosted.org/packages/source/o/openclaw-cost-diff/openclaw_cost_diff-0.1.1.tar.gz"
  sha256 "7dfadec8edd1878618cf03e5708b781d720e3e3ac1b487934fd767818cb7f525"
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
