# typed: false
# frozen_string_literal: true

class OpenclawToolAudit < Formula
  include Language::Python::Virtualenv

  desc "Audit OpenClaw allowed tools against observed tool usage"
  homepage "https://github.com/pfrederiksen/openclaw-tool-audit"
  url "https://files.pythonhosted.org/packages/1f/34/e8608e9d1285fdcdfd6039bfd7d46b7d62ea029b517116aaec27a63f782e/openclaw_tool_audit-0.1.4.tar.gz"
  sha256 "5a8f2d1b3c1b9e2b0bb0270e7ff563438d53bb13b25a6a2e3477f6be2955cd57"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match(/^openclaw-tool-audit \d+\.\d+\.\d+$/, shell_output("#{bin}/openclaw-tool-audit --version").strip)
  end
end
