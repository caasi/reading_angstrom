open Example.Product
open Example.Print
open Example.Parser

let product_object = Alcotest.testable pp equal

let test_word () =
  Alcotest.(check string) "same node" (parse word "foobar") ("foobar")

let test_digits () =
  Alcotest.(check string) "same string" (parse digits "14292") ("14292")

let test_fullname () =
  Alcotest.(check string) "same string" (parse fullname "John Doe") ("John Doe")

let test_fullname2 () =
  Alcotest.(check string) "same string" (parse fullname2 "Jane Doe") ("Jane Doe")

let test_fullname3 () =
  Alcotest.(check string) "same string" (parse fullname2 "John Snow") ("John Snow")

let test_product () =
  Alcotest.(check product_object)
    "same product"
    (parse product "Death Stranding,1790,Kojima Productions")
    { product = "Death Stranding";
      price = 1790;
      developer = "Kojima Productions";
    }

let product_string = "Death Stranding,1790,Kojima Productions
Grand Theft Auto V,1299,Rockstar North
Valheim,318,Iron Gate AB"

let test_product_list () =
  Alcotest.(check (list product_object))
    "same product list"
    (parse product_list product_string)
    [
      { product = "Death Stranding";
        price = 1790;
        developer = "Kojima Productions";
      };
      { product = "Grand Theft Auto V";
        price = 1299;
        developer = "Rockstar North";
      };
      { product = "Valheim";
        price = 318;
        developer = "Iron Gate AB";
      };
    ]

let () =
  let open Alcotest in
  run "Example" [
    "Parser", [
      test_case "Word" `Quick test_word;
      test_case "Digits" `Quick test_digits;
      test_case "Fullname" `Quick test_fullname;
      test_case "Fullname2" `Quick test_fullname2;
      test_case "Fullname3" `Quick test_fullname3;
      test_case "Product" `Quick test_product;
      test_case "Product List" `Quick test_product_list;
    ];
  ]
