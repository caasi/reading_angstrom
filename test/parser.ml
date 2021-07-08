open Example.Parser

let test_word () =
  Alcotest.(check string) "same node" (parse word "foobar") ("foobar")

let () =
  let open Alcotest in
  run "Example" [
    "Parser", [
      test_case "Word" `Quick test_word;
    ];
  ]
