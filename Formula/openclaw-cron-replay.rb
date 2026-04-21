# typed: false
# frozen_string_literal: true

class OpenclawCronReplay < Formula
  include Language::Python::Virtualenv

  desc "Replay OpenClaw cron job formatting and delivery decisions locally"
  homepage "https://github.com/pfrederiksen/openclaw-cron-replay"
  url "https://github.com/pfrederiksen/openclaw-cron-replay/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "c60d938f913e7d5866494395f9a5c28661d541243c5a4951f560381e80c2d3aa"
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
            "id": "digest",
            "delivery_mode": "announce",
            "prompt": "Summarize the digest."
          }
        ]
      }
    JSON

    output = shell_output("#{bin}/openclaw-cron-replay --job digest --jobs #{jobs}")
    assert_match "Delivery interpretation:", output
    assert_match "mode: announce", output
  end
end
