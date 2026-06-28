# typed: false
# frozen_string_literal: true

require "language/python"

class TinkAgent < Formula
  include Language::Python::Virtualenv

  desc "Use a Teenage Engineering EP-2350 Ting mic as an AI-agent voice controller"
  homepage "https://github.com/tajchert/tink-agent"
  url "https://github.com/tajchert/tink-agent/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "1f8faa82bc9e2954163a2e8749d3d0b7c5eab7a484bca9d513b629e0ff79a7e2"
  license "MIT"

  depends_on :macos
  depends_on "numpy"
  depends_on "portaudio"
  depends_on "python@3.14"

  resource "six" do
    url "https://files.pythonhosted.org/packages/b7/ce/149a00dd41f10bc29e5921b496af8b574d8413afcd5e30dfa0ed46c2cc5e/six-1.17.0-py2.py3-none-any.whl"
    sha256 "4721f391ed90541fddacab5acf947aa0d3dc7d27b2e1e8eda2be8970586c3274"
  end

  resource "pycparser" do
    url "https://files.pythonhosted.org/packages/0c/c3/44f3fbbfa403ea2a7c779186dc20772604442dde72947e7d01069cbe98e3/pycparser-3.0-py3-none-any.whl"
    sha256 "b727414169a36b7d524c1c3e31839a521725078d7b2ff038656844266160a992"
  end

  resource "cffi" do
    url "https://files.pythonhosted.org/packages/eb/56/b1ba7935a17738ae8453301356628e8147c79dbb825bcbc73dc7401f9846/cffi-2.0.0.tar.gz"
    sha256 "44d1b5909021139fe36001ae048dbdde8214afa20200eda0f64c068cac5d5529"
  end

  resource "pyobjc-core" do
    url "https://files.pythonhosted.org/packages/bd/8a/cfa4f56939d554dbb342ec6e5226a441e2f552bc2002a0ddf7705bb11bef/pyobjc_core-12.2.1-cp314-cp314-macosx_10_15_universal2.whl"
    sha256 "2b8fc0531c27277325e113ac00b8a72a82e6145f0a88175b9425d8de814ff69a"
  end

  resource "pyobjc-framework-Cocoa" do
    url "https://files.pythonhosted.org/packages/ec/c8/b90baa8f3592eded79b4be98fb59d2b8dc16b62361e34292bd95806ebd9f/pyobjc_framework_cocoa-12.2.1-cp314-cp314-macosx_10_15_universal2.whl"
    sha256 "b386c324d64ae565c1f6b7dfb77be68f640a1c7c23caa6966ab661131f519561"
  end

  resource "pyobjc-framework-CoreText" do
    url "https://files.pythonhosted.org/packages/c6/d8/d1178bb1ba3bb7a0d7a55db460aa89f2a8b232ed7eaf76cb402923cacf2d/pyobjc_framework_coretext-12.2.1-cp314-cp314-macosx_10_15_universal2.whl"
    sha256 "d0b3b0467a23dbc2a39d0839e7100cc98b429fb7d52a471bd65477f46bb4c9e5"
  end

  resource "pyobjc-framework-Quartz" do
    url "https://files.pythonhosted.org/packages/8b/5d/85ffd9d433989205d572a50d625c63b29c05e0c5235a725f15ae1023672c/pyobjc_framework_quartz-12.2.1-cp314-cp314-macosx_10_15_universal2.whl"
    sha256 "ceb56939c337b36d9d81185ade31f77dc52c85cf79bb16e53e9b32f54b6bb3f5"
  end

  resource "pyobjc-framework-ApplicationServices" do
    url "https://files.pythonhosted.org/packages/8b/47/cd2bd76b862686c0aa78568ed9dff175764353c209a3096c72d6e2a9b151/pyobjc_framework_applicationservices-12.2.1-cp314-cp314-macosx_10_15_universal2.whl"
    sha256 "a1c0ee536cb8bd7f5a811165ec323a9207b1e8dad9534fe2081f767fb90b0411"
  end

  resource "rumps" do
    url "https://files.pythonhosted.org/packages/b2/e2/2e6a47951290bd1a2831dcc50aec4b25d104c0cf00e8b7868cbd29cf3bfe/rumps-0.4.0.tar.gz"
    sha256 "17fb33c21b54b1e25db0d71d1d793dc19dc3c0b7d8c79dc6d833d0cffc8b1596"
  end

  resource "pynput" do
    url "https://files.pythonhosted.org/packages/6d/98/bbeb760852adb27f166ce1617f0e51aabb15f21b1e60ea703f2aed3c78ac/pynput-1.8.2-py2.py3-none-any.whl"
    sha256 "8cc38cf13a6ab2749cb375678be8a0fd705d7ce49c8001ff5db4007a723bbef1"
  end

  resource "sounddevice" do
    url "https://files.pythonhosted.org/packages/56/f9/c037c35f6d0b6bc3bc7bfb314f1d6f1f9a341328ef47cd63fc4f850a7b27/sounddevice-0.5.5-py3-none-macosx_10_6_x86_64.macosx_10_6_universal2.whl"
    sha256 "05eb9fd6c54c38d67741441c19164c0dae8ce80453af2d8c4ad2e7823d15b722"
  end

  def install
    app = libexec/"app"
    app.install Dir["*"]

    venv = virtualenv_create(libexec/"venv", "python3.14")
    resources.each do |r|
      if r.downloader.basename.to_s.end_with?(".whl")
        target = buildpath/r.downloader.basename
        cp r.cached_download, target
      else
        target = r
      end
      venv.pip_install target
    end

    (bin/"tink-agent").write <<~EOS
      #!/bin/bash
      export PYTHONPATH="#{app}${PYTHONPATH:+:$PYTHONPATH}"
      exec "#{libexec}/venv/bin/python" -m tink_agent "$@"
    EOS

    (bin/"tink-agent-install").write <<~EOS
      #!/bin/bash
      export TINK_AGENT_REPO="#{app}"
      export TINK_AGENT_PYTHON="#{libexec}/venv/bin/python"
      exec "#{app}/packaging/install.sh" "$@"
    EOS

    (bin/"tink-agent-uninstall").write <<~EOS
      #!/bin/bash
      export TINK_AGENT_REPO="#{app}"
      export TINK_AGENT_PYTHON="#{libexec}/venv/bin/python"
      exec "#{app}/packaging/uninstall.sh" "$@"
    EOS
  end

  def caveats
    <<~EOS
      Start the menu-bar agent with:
        tink-agent-install

      Stop and remove the LaunchAgent with:
        tink-agent-uninstall

      Grant Microphone and Accessibility permissions to the Homebrew Python
      framework if macOS prompts for them.
    EOS
  end

  test do
    assert_match "tink-agent #{version}", shell_output("#{bin}/tink-agent --version")
    system libexec/"venv/bin/python", "-c", <<~PYTHON
      import numpy
      import sounddevice
      import pynput
      import rumps
    PYTHON
  end
end
