{
  lib,
  newScope,
  beamPackages,
  buildGleam,
  fetchgit,
}:

let
  inherit (beamPackages) buildMix buildRebar3 fetchHex;
in

lib.makeScope newScope (self: {
  directories = buildGleam {
    name = "directories";
    version = "1.2.0";
    otpApplication = "directories";

    src = fetchHex {
      pkg = "directories";
      version = "1.2.0";
      sha256 = "sha256-0TCQz832dZuHIX6N3XOnWQOnABSKgsHTN5nzM+JJv54=";
    };

    beamDeps = with self; [
      envoy
      gleam_stdlib
      platform
      simplifile
    ];
  };

  envoy = buildGleam {
    name = "envoy";
    version = "1.1.0";
    otpApplication = "envoy";

    src = fetchHex {
      pkg = "envoy";
      version = "1.1.0";
      sha256 = "sha256-hQ2p0p0uWYdzWHKitcgQNRRtf+Ge/EhhKeREQNA/2DI=";
    };

    beamDeps = with self; [
      gleam_stdlib
    ];
  };

  exception = buildGleam {
    name = "exception";
    version = "2.1.0";
    otpApplication = "exception";

    src = fetchHex {
      pkg = "exception";
      version = "2.1.0";
      sha256 = "sha256-Mp0mnVwqMU9zZL0nETcrbyxY+m85mBVy5cpoYk0pH4w=";
    };

    beamDeps = with self; [
      gleam_stdlib
    ];
  };

  filepath = buildGleam {
    name = "filepath";
    version = "1.1.2";
    otpApplication = "filepath";

    src = fetchHex {
      pkg = "filepath";
      version = "1.1.2";
      sha256 = "sha256-sGqa8L8Q5RQB1kuY5LYn8dLkjBVJZ9p69NCRR4Cm1Ao=";
    };

    beamDeps = with self; [
      gleam_stdlib
    ];
  };

  gleam_crypto = buildGleam {
    name = "gleam_crypto";
    version = "1.5.1";
    otpApplication = "gleam_crypto";

    src = fetchHex {
      pkg = "gleam_crypto";
      version = "1.5.1";
      sha256 = "sha256-UHdLr/8RROeHKBTFZsXWU9g6Pr8jrMMVa3V6G2gZCG4=";
    };

    beamDeps = with self; [
      gleam_stdlib
    ];
  };

  gleam_erlang = buildGleam {
    name = "gleam_erlang";
    version = "1.3.0";
    otpApplication = "gleam_erlang";

    src = fetchHex {
      pkg = "gleam_erlang";
      version = "1.3.0";
      sha256 = "sha256-ESStOqIRQ+WvD8XPPZUp9tuMoD5DpVcRtgtrezh0N1w=";
    };

    beamDeps = with self; [
      gleam_stdlib
    ];
  };

  gleam_http = buildGleam {
    name = "gleam_http";
    version = "4.3.0";
    otpApplication = "gleam_http";

    src = fetchHex {
      pkg = "gleam_http";
      version = "4.3.0";
      sha256 = "sha256-gupqcXyEJFYYjBkK+zcmZepWzhPYVZvzsd2eQPYZ7gw=";
    };

    beamDeps = with self; [
      gleam_stdlib
    ];
  };

  gleam_json = buildGleam {
    name = "gleam_json";
    version = "3.1.0";
    otpApplication = "gleam_json";

    src = fetchHex {
      pkg = "gleam_json";
      version = "3.1.0";
      sha256 = "sha256-RP2qiEe+j8SMp6HAiXBr1UutzExFsjepku3fnyzbKDY=";
    };

    beamDeps = with self; [
      gleam_stdlib
    ];
  };

  gleam_otp = buildGleam {
    name = "gleam_otp";
    version = "1.2.0";
    otpApplication = "gleam_otp";

    src = fetchHex {
      pkg = "gleam_otp";
      version = "1.2.0";
      sha256 = "sha256-umopTileQo7BVi3BwR6nUw3LmB6DWRNL6ryEk7eyJY4=";
    };

    beamDeps = with self; [
      gleam_erlang
      gleam_stdlib
    ];
  };

  gleam_stdlib = buildGleam {
    name = "gleam_stdlib";
    version = "0.68.1";
    otpApplication = "gleam_stdlib";

    src = fetchHex {
      pkg = "gleam_stdlib";
      version = "0.68.1";
      sha256 = "sha256-9/rr2O8mBmToakbI26I1CNHRG7O8xu4bibO8PlyD/x4=";
    };
  };

  gleam_yielder = buildGleam {
    name = "gleam_yielder";
    version = "1.1.0";
    otpApplication = "gleam_yielder";

    src = fetchHex {
      pkg = "gleam_yielder";
      version = "1.1.0";
      sha256 = "sha256-jk5Oz6eYKFn0MMV/VJIAx3SYI8EGdZ9KGaeK6maHcXo=";
    };

    beamDeps = with self; [
      gleam_stdlib
    ];
  };

  gleeunit = buildGleam {
    name = "gleeunit";
    version = "1.9.0";
    otpApplication = "gleeunit";

    src = fetchHex {
      pkg = "gleeunit";
      version = "1.9.0";
      sha256 = "sha256-2pVTzli2eSSzxjH5b+M3DEnrbW3Gs4TsSGLMSqpxjzw=";
    };

    beamDeps = with self; [
      gleam_stdlib
    ];
  };

  glisten = buildGleam {
    name = "glisten";
    version = "8.0.3";
    otpApplication = "glisten";

    src = fetchHex {
      pkg = "glisten";
      version = "8.0.3";
      sha256 = "sha256-hrg4GWWS2eveeh0jaa46UeVo990tFocGxGPELRe5UxI=";
    };

    beamDeps = with self; [
      gleam_erlang
      gleam_otp
      gleam_stdlib
      logging
      telemetry
    ];
  };

  gramps = buildGleam {
    name = "gramps";
    version = "6.0.0";
    otpApplication = "gramps";

    src = fetchHex {
      pkg = "gramps";
      version = "6.0.0";
      sha256 = "sha256-i3GVl4+/0wtD33kaiicgQbgeRdJFMU16QfxXI3qogqA=";
    };

    beamDeps = with self; [
      gleam_crypto
      gleam_erlang
      gleam_http
      gleam_stdlib
    ];
  };

  houdini = buildGleam {
    name = "houdini";
    version = "1.2.0";
    otpApplication = "houdini";

    src = fetchHex {
      pkg = "houdini";
      version = "1.2.0";
      sha256 = "sha256-XbEFPxr4KAScKyBtRAPBiXCr71wYZxyjwtLtDdZPY4U=";
    };
  };

  hpack_erl = buildRebar3 {
    name = "hpack_erl";
    version = "0.3.0";
    otpApplication = "hpack";

    src = fetchHex {
      pkg = "hpack_erl";
      version = "0.3.0";
      sha256 = "sha256-1hN9cHkWnYxIXGli3+Jhr1ue9g+8VXNEURweZePZX7A=";
    };
  };

  logging = buildGleam {
    name = "logging";
    version = "1.3.0";
    otpApplication = "logging";

    src = fetchHex {
      pkg = "logging";
      version = "1.3.0";
      sha256 = "sha256-EJj78QtUtEwsf98LAcElPK+s2sq++0sNAngDJGdT4G0=";
    };

    beamDeps = with self; [
      gleam_stdlib
    ];
  };

  lustre = buildGleam {
    name = "lustre";
    version = "5.5.2";
    otpApplication = "lustre";

    src = fetchHex {
      pkg = "lustre";
      version = "5.5.2";
      sha256 = "sha256-LcKXPYHBLmMlG2NncyF7jgnFyEWQpyl1D2vPAJQgs44=";
    };

    beamDeps = with self; [
      gleam_erlang
      gleam_json
      gleam_otp
      gleam_stdlib
      houdini
    ];
  };

  marceau = buildGleam {
    name = "marceau";
    version = "1.3.0";
    otpApplication = "marceau";

    src = fetchHex {
      pkg = "marceau";
      version = "1.3.0";
      sha256 = "sha256-LRwnUEvvRQBfXfsYWR+GEPtL+pF0SHghC9xGRBLsROk=";
    };
  };

  mist = buildGleam {
    name = "mist";
    version = "5.0.4";
    otpApplication = "mist";

    src = fetchHex {
      pkg = "mist";
      version = "5.0.4";
      sha256 = "sha256-fO1LLYH9VHrbCT2XuZKLlBmn9YuFYqMKbMF6JSsxrQU=";
    };

    beamDeps = with self; [
      exception
      gleam_erlang
      gleam_http
      gleam_otp
      gleam_stdlib
      gleam_yielder
      glisten
      gramps
      hpack_erl
      logging
    ];
  };

  platform = buildGleam {
    name = "platform";
    version = "1.0.0";
    otpApplication = "platform";

    src = fetchHex {
      pkg = "platform";
      version = "1.0.0";
      sha256 = "sha256-gzlCCpWtiarA+C9MPbjdQBBBdC1sP0YTKoc59q63U5E=";
    };
  };

  simplifile = buildGleam {
    name = "simplifile";
    version = "2.3.2";
    otpApplication = "simplifile";

    src = fetchHex {
      pkg = "simplifile";
      version = "2.3.2";
      sha256 = "sha256-4Em02s1NIG2HhDvPTHdaUK4PUKUgMaL/tAye0H1uxwo=";
    };

    beamDeps = with self; [
      filepath
      gleam_stdlib
    ];
  };

  telemetry = buildRebar3 {
    name = "telemetry";
    version = "1.3.0";
    otpApplication = "telemetry";

    src = fetchHex {
      pkg = "telemetry";
      version = "1.3.0";
      sha256 = "sha256-cBX8iRnb5jdk9LS4epW3wJlr1Tng1Jm+bsnX84dbeeY=";
    };
  };

  wisp = buildGleam {
    name = "wisp";
    version = "2.2.0";
    otpApplication = "wisp";

    src = fetchHex {
      pkg = "wisp";
      version = "2.2.0";
      sha256 = "sha256-ZVFj1N4Z491Kx1gTqZG/1VI8tP8vxfn1j9b7OdXRgG0=";
    };

    beamDeps = with self; [
      directories
      exception
      filepath
      gleam_crypto
      gleam_erlang
      gleam_http
      gleam_json
      gleam_stdlib
      houdini
      logging
      marceau
      mist
      simplifile
    ];
  };
})
