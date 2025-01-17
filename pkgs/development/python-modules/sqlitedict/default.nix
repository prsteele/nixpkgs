{ lib
, buildPythonPackage
, fetchFromGitHub
, py
, pytest-benchmark
, pytestCheckHook
}:

buildPythonPackage rec {
  pname = "sqlitedict";
  version = "2.1.0";

  src = fetchFromGitHub {
    owner = "RaRe-Technologies";
    repo = "sqlitedict";
    rev = "refs/tags/v${version}";
    sha256 = "sha256-GfvvkQ6a75UBPn70IFOvjvL1MedSc4siiIjA3IsQnic=";
  };

  preCheck = ''
    mkdir tests/db
  '';

  checkInputs = [
    py
    pytest-benchmark
    pytestCheckHook
  ];

  pytestFlagsArray = [
    "--benchmark-disable"
  ];

  meta = with lib; {
    description = "Persistent, thread-safe dict";
    homepage = "https://github.com/RaRe-Technologies/sqlitedict";
    license = licenses.asl20;
    maintainers = [ maintainers.arnoldfarkas ];
  };
}
