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

let fullname =
  lift3 (fun first space last -> first ^ space ^ last) word (string " ") word

let fullname2 =
  word >>= (fun first ->
    (string " ") >>= (fun space ->
      word >>= (fun last ->
        return (first ^ space ^ last))))

let fullname3 =
  let+ first = word
  and+ space = string " "
  and+ last = word in
  first ^ space ^ last

let spaces =
  take_while (fun c -> c == ' ')

let comma = string ","

let product_name =
  sep_by spaces word >>| String.concat " "

let price = digits >>| int_of_string

let developer_name = product_name

let product =
  let open Product in
  let+ p = product_name
  and+ _ = comma
  and+ n = price
  and+ _ = comma
  and+ d = developer_name in
  { product=p; price=n; developer=d }

let product_list =
  sep_by end_of_line product