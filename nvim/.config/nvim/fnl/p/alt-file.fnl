(local {: nmap} (require :p.utils))

(local file-mapping {
  "/test/" "/src/"
  ".spec.ts" ".ts" })

(fn substitute-many [str subs]
  (accumulate [s str k v (pairs subs)]
    (s:gsub k v)))

(local flip-tbl #(collect [k v (pairs $1)] v k))

(fn to-alt-file [file-name]
  (match (substitute-many file-name file-mapping)
    file-name (substitute-many file-name (flip-tbl file-mapping))
    _ _))

(nmap "ga" #(vim.cmd (.. "edit " (to-alt-file (vim.fn.expand "%")))))
