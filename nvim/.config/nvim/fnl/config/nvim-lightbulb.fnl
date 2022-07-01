(local {: setup} (require :nvim-lightbulb))

(setup {:autocmd {:enabled true}})

;; 
;; 📎
(vim.fn.sign_define :LightBulbSign {:text " " :texthl "" :linehl "" :numhl "" })
