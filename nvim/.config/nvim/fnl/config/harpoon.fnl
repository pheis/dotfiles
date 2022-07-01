(local ui (require :harpoon.ui))
(local mark (require :harpoon.mark))
(local {: nmap} (require :p.utils))

(nmap ",," ui.toggle_quick_menu)
(nmap ",m" ui.toggle_quick_menu)

(each [i c (ipairs {:a :s :d :f})]
  (nmap c #(ui.nav_file i)))
