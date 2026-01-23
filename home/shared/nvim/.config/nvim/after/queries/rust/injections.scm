; extends

((const_item
  name: (identifier) @var_name
  value: [
    (string_literal (string_content) @injection.content)
    (raw_string_literal (string_content) @injection.content)
  ])
  (#match? @var_name "HTML$")
  (#set! injection.language "html"))
