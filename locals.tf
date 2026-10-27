locals {
  # Wartości labu wymagane przez naming.tf
  lab            = "003"
  workload       = "files" # => local.names.st = stfiles26<student_id>
  workload_short = null    # skrót, gdy workload nie mieści się w limicie nazwy (naming.tf)

  # TODO: Dodaj local st_www dla statycznej strony (krok 4, opcjonalne)

  project_tags = merge(local.tags, {
    project = var.project
  })

  shared_files = {
    "document1.pdf"     = "./files/document1.pdf"
    "presentation.pptx" = "./files/presentation.pptx"
    "data.csv"          = "./files/data.csv"
  }

  # Typy MIME wg rozszerzenia pliku (pliki SAS i strona WWW)
  content_types = {
    "pdf"  = "application/pdf"
    "pptx" = "application/vnd.openxmlformats-officedocument.presentationml.presentation"
    "csv"  = "text/csv"
    "html" = "text/html"
    "css"  = "text/css"
    "js"   = "application/javascript"
    "json" = "application/json"
    "txt"  = "text/plain"
    "png"  = "image/png"
    "jpg"  = "image/jpeg"
    "svg"  = "image/svg+xml"
    "ico"  = "image/x-icon"
  }
}
