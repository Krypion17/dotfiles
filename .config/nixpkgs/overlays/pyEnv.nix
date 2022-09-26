self: super: {
  pyEnv = super.buildEnv {
    name = "pyEnv";
    paths = [
      (self.python3.withPackages (
        ps: with ps; [
          numpy
        ]
        ))
    ];
  };
}
