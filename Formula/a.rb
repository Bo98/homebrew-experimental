class A < Formula
  url "https://www.w3.org/TR/PNG/iso_8859-1.txt"
  sha256 "3aff1954277c4fc27603346901e4848b58fe3c8bed63affe6086003dd6c2b9fe"

  :keg_only

  def install
    (buildpath/"test.c").write <<~EOS
      int ALib()
      {
        return 0;
      }
    EOS
    system "clang", "-dynamiclib", "-olibA.dylib", "test.c"
    lib.install "libA.dylib"

    pkgshare.install "iso_8859-1.txt"
  end
end
