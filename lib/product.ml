type t = { product: string; price: int; developer: string }

let equal a b =
  a.product == b.product &&
  a.price == b.price &&
  a.developer == b.developer