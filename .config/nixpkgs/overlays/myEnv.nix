self: super: {
  myEnv = super.buildEnv {
    name = "myEnv";
    paths = [
      # A Python 3 interpreter with some packages
      (self.python3.withPackages (
        ps: with ps; [
          pyflakes
          pytest
          black
        ]
      ))

      # Some other packages we'd like as part of this env
      self.mypy
      self.black
      self.ripgrep
      self.tmux
    ];
  };
}
