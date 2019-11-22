class C < Formula
  url "https://www.w3.org/TR/PNG/iso_8859-1.txt"
  sha256 "3aff1954277c4fc27603346901e4848b58fe3c8bed63affe6086003dd6c2b9fe"

  :key_only

  depends_on "bo98/experimental/b"

  def install
    (buildpath/"test.c").write <<~EOS
      int CLib()
      {
        return 0;
      }
    EOS
    system "clang", "-dynamiclib",
                    "-L#{Formula["bo98/experimental/b"].opt_lib}", "-lB",
                    "-olibC.dylib",
                    "test.c"
    lib.install "libC.dylib"

    pkgshare.install "iso_8859-1.txt"
  end
end
