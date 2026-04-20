class OpenclawSessionGrep < Formula
  desc "Fast local search for OpenClaw session transcript JSONL files"
  homepage "https://github.com/pfrederiksen/openclaw-session-grep"
  url "https://files.pythonhosted.org/packages/source/o/openclaw-session-grep/openclaw_session_grep-0.1.2.tar.gz"
  sha256 "1f69538cbe716c13d1456c41574b2b883b69d2f68bb5004b8594fd5249cebc38"
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
