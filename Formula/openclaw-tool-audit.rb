# typed: false
# frozen_string_literal: true

class OpenclawToolAudit < Formula
  include Language::Python::Virtualenv

  desc "Audit OpenClaw allowed tools against observed tool usage"
  homepage "https://github.com/pfrederiksen/openclaw-tool-audit"
  url "https://files.pythonhosted.org/packages/f8/b3/3bd86c655822e806156a4cf3d994850cfa2991bef376a44e4f2aade03190/openclaw_tool_audit-0.1.1.tar.gz"
  sha256 "1dc14269be3d3355303a399b4f2b8dae2a35043dc5438d38d7f061dda136b70c"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "openclaw-tool-audit 0.1.1", shell_output("#{bin}/openclaw-tool-audit --version")
  end
end
