require('neogen').setup {
  enabled = true,
  snippet_engine = "luasnip",
  languages = {
    lua = {
      template = {
        annotation_convention = "emmylua",
      }
    },
    cpp = {
      template = {
        annotation_convention = "doxygen",
      }
    },
    python = {
      template = {
        annotation_convention = "google_docstrings",
      }
    },
    rust = {
      template = {
        annotation_convention = "rustdoc",
      }
    },
  }
}
