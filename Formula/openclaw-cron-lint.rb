# typed: false
# frozen_string_literal: true

class OpenclawCronLint < Formula
  include Language::Python::Virtualenv

  desc "Lint OpenClaw cron job configurations for risky delivery patterns"
  homepage "https://github.com/pfrederiksen/openclaw-cron-lint"
  url "https://github.com/pfrederiksen/openclaw-cron-lint/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "ab01fbb84e3677a543d70d2adce0f529908e1f9895310cd2d27cc8f52ccfbdbb"
  license "MIT"

  depends_on "python-setuptools" => :build
  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    jobs = testpath/"jobs.json"
    jobs.write <<~JSON
      {
        "jobs": [
          {
            "id": "daily-digest",
            "name": "Daily digest",
            "sessionTarget": "isolated",
            "prompt": "Use the message tool to notify the user."
          }
        ]
      }
    JSON

    output = shell_output("#{bin}/openclaw-cron-lint #{jobs} --json --fail-on high", 1)
    assert_match "\"rule_id\": \"OC001\"", output
  end
end
