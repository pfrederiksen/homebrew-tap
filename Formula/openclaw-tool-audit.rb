# typed: false
# frozen_string_literal: true

class OpenclawToolAudit < Formula
  include Language::Python::Virtualenv

  desc "Audit OpenClaw allowed tools against observed tool usage"
  homepage "https://github.com/pfrederiksen/openclaw-tool-audit"
  url "https://files.pythonhosted.org/packages/source/o/openclaw-tool-audit/openclaw_tool_audit-0.1.0.tar.gz"
  sha256 "b0064605d8c03979603b683698e89936eb87463ec26da414617f2365a1c3786b"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "openclaw-tool-audit 0.1.0", shell_output("#{bin}/openclaw-tool-audit --version")
  end
end
