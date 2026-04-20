class OpenclawSessionGrep < Formula
  desc "Fast local search for OpenClaw session transcript JSONL files"
  homepage "https://github.com/pfrederiksen/openclaw-session-grep"
  url "https://files.pythonhosted.org/packages/source/o/openclaw-session-grep/openclaw_session_grep-0.1.1.tar.gz"
  sha256 "9e7958d6ceafd70e698324a8017df2905325c0ae6732dc250a59b74b72d09426"
  license "MIT"

  depends_on "python@3.12"

  def install
    libexec.install "src/openclaw_session_grep"
    (bin/"openclaw-session-grep").write <<~SH
      #!/bin/bash
      export PYTHONPATH="#{libexec}:${PYTHONPATH:-}"
      exec "#{Formula["python@3.12"].opt_bin}/python3.12" -m openclaw_session_grep "$@"
    SH
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/openclaw-session-grep --version")
  end
end
