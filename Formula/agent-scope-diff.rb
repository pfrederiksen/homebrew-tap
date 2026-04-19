# typed: false
# frozen_string_literal: true

class AgentScopeDiff < Formula
  include Language::Python::Virtualenv

  desc "Risk-focused diffs for agent manifests and tool permission snapshots"
  homepage "https://github.com/pfrederiksen/agent-scope-diff"
  url "https://github.com/pfrederiksen/agent-scope-diff/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "3966acf99c88791f7e1193ce393d63f07b1a28845ad5f36a22cbe33c93717c98"
  license "MIT"

  depends_on "python-setuptools" => :build
  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    before = testpath/"before.json"
    after = testpath/"after.json"
    before.write <<~JSON
      {
        "tools": [
          { "name": "read_file" }
        ]
      }
    JSON
    after.write <<~JSON
      {
        "tools": [
          { "name": "read_file" },
          { "name": "shell" }
        ]
      }
    JSON

    output = shell_output("#{bin}/agent-scope-diff #{before} #{after} --no-color --summary-only")
    assert_match "finding", output
  end
end
