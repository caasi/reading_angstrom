open Example.Parser

let test_word () =
  Alcotest.(check string) "same node" (parse word "foobar") ("foobar")

let test_digits () =
  Alcotest.(check string) "same string" (parse digits "14292") ("14292")

let test_fullname () =
  Alcotest.(check string) "same string" (parse fullname "John Doe") ("John Doe")

let () =
  let open Alcotest in
  run "Example" [
    "Parser", [
      test_case "Word" `Quick test_word;
      test_case "Digits" `Quick test_digits;
      test_case "Fullname" `Quick test_fullname;
    ];
  ]
