open Angstrom

let parse p str =
  match parse_string ~consume:All p str with
  | Ok v -> v
  | Error _ -> failwith "parsing error"

let word =
  take_while (fun c ->
    let code = Char.code c in
    Char.code 'A' <= code && code <= Char.code 'z'
  )

let digits =
  take_while (fun c ->
    let code = Char.code c in
    Char.code '0' <= code && code <= Char.code '9'
  )

