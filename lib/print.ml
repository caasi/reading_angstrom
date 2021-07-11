open Format
open Product

let pp ppf product =
  fprintf ppf "%s,%u,%s" product.product product.price product.developer