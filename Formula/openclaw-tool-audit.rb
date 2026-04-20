# typed: false
# frozen_string_literal: true

class OpenclawToolAudit < Formula
  include Language::Python::Virtualenv

  desc "Audit OpenClaw allowed tools against observed tool usage"
  homepage "https://github.com/pfrederiksen/openclaw-tool-audit"
  url "https://files.pythonhosted.org/packages/34/9a/72c02b814d0a75aeb36e37ae7378c36e929dc0712dcb02a6f6c3399b0a71/openclaw_tool_audit-0.1.0-py3-none-any.whl"
  sha256 "d6eed55538363c3ca8c7978bd84ac79e06d6dd188a03c4493f8ab3972af8835d"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "openclaw-tool-audit 0.1.0", shell_output("#{bin}/openclaw-tool-audit --version")
  end
end
