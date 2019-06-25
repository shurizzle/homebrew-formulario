# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class SpotifyDbusBridge < Formula
  desc "Apple Events to DBus bridge for Spotify"
  homepage "https://github.com/shurizzle/rust-macos-spotify-dbus-bridge"
  url "https://github.com/shurizzle/rust-macos-spotify-dbus-bridge/releases/download/v0.0.1/spotify-dbus-bridge-v0.0.1-x86_64-apple-darwin.tar.gz"
  sha256 "6a72adac9c5a693008a3ab6caf5aae05e3d3b8f1bbea6823df006c503a645d71"
  head "https://github.com/shurizzle/rust-macos-spotify-dbus-bridge"

  depends_on "dbus"

  def install
    (var/"log/spotify-dbus-bridge").mkpath
    bin.install "#{buildpath}/spotify-dbus-bridge"
  end

  plist_options :manual => "spotify-dbus-bridge"

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>Label</key>
      <string>#{plist_name}</string>
      <key>ProgramArguments</key>
      <array>
        <string>#{opt_bin}/spotify-dbus-bridge</string>
      </array>
      <key>EnvironmentVariables</key>
      <dict>
        <key>PATH</key>
        <string>#{HOMEBREW_PREFIX}/bin:/usr/bin:/bin:/usr/sbin:/sbin</string>
      </dict>
      <key>RunAtLoad</key>
      <true/>
      <key>KeepAlive</key>
      <true/>
      <key>StandardOutPath</key>
      <string>#{var}/log/spotify-dbus-bridge/yabai.out.log</string>
      <key>StandardErrorPath</key>
      <string>#{var}/log/spotify-dbus-bridge/yabai.err.log</string>
    </dict>
    </plist>
    EOS
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test rust-macos-spotify-dbus-bridge`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "true"
  end
end
