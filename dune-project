(lang dune 2.8)

(name reading-angstrom)

(generate_opam_files true)

(license ISC)

(authors "caasih <caasi.igd@gmail.com>")

(maintainers "caasih <caasi.igd@gmail.com>")

(source
  (github caasi/reading_angstrom))

(bug_reports "https://github.com/caasi/reading_angstrom/issues")

(homepage "https://github.com/caasi/reading_angstrom/")

(package
  (name reading-angstrom)
  (synopsis "An Angstorm example.")
  (description "Reading Angstrom source codes and create some parsers.")
  (depends
    (alcotest :with-test)
    (angstrom (< 0.15.0))
    (ocaml
      (>= 4.08.1))
    dune))
