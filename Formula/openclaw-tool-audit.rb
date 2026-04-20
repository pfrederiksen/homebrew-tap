# typed: false
# frozen_string_literal: true

class OpenclawToolAudit < Formula
  include Language::Python::Virtualenv

  desc "Audit OpenClaw allowed tools against observed tool usage"
  homepage "https://github.com/pfrederiksen/openclaw-tool-audit"
  url "https://files.pythonhosted.org/packages/47/15/bc93578b154e1c197bce343babc96c2f50ac4fe44f763266b657825ab8fe/openclaw_tool_audit-0.1.3.tar.gz"
  sha256 "23c979ab0c0309073deace676555ffe9f9c99672a4dce6bfe326cd34ea1e25bb"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match(/^openclaw-tool-audit \d+\.\d+\.\d+$/, shell_output("#{bin}/openclaw-tool-audit --version").strip)
  end
end
