# typed: false
# frozen_string_literal: true

class OpenclawToolAudit < Formula
  include Language::Python::Virtualenv

  desc "Audit OpenClaw allowed tools against observed tool usage"
  homepage "https://github.com/pfrederiksen/openclaw-tool-audit"
  url "https://files.pythonhosted.org/packages/34/41/6f8313fbd7f5239e1b88f4c0463fa5e9223b212a2c198cc69c06c1862b48/openclaw_tool_audit-0.1.2.tar.gz"
  sha256 "a954acb77c950d5de827c4efbb07fb057369f7c0b86ab86b5f4bbaf156ed4e00"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "openclaw-tool-audit 0.1.2", shell_output("#{bin}/openclaw-tool-audit --version")
  end
end
