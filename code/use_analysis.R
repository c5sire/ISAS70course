
#' use_analysis
#'
#' Creates a project skeleton for data analysis.
#'
#' @param project_name
#' @author Reinhard Simon
use_analysis <- function(project_name = ".") {
  fp = "README.md"
  if(project_name != "."){
    if(!dir.exists(project_name)) dir.create(project_name)
    setwd(project_name)
    p_name = project_name
  } else {
    p_name = basename(getwd())
  }

  tryCatch({
    if (!file.exists(fp)) {
      write(paste0("# Analysis steps for project *", p_name, "*"), file = fp)
      message("Created file: README.md")
    } else {
      message("File exists: README.md")
    }
  }, error = function(e) {
    warning("Could not create file: README.md")
  })


  use_dir <- function(adir){
    tryCatch({
      fp = file.path(adir)
      if (!dir.exists(fp)) {
        dir.create(fp)
        message(paste0("Created directory: ", adir))
      } else {
        message(paste0("Directory: ", adir, " already exists."))
      }

    }, error = function(e) {
      warning(paste0("Could not create directory: ", adir))
      }
    )
  }

  use_dir("src")
  use_dir("data")
  use_dir(file.path("data", "code"))
  use_dir("analyses")
  use_dir("docs")
  use_dir(file.path("docs", "paper"))
  use_dir(file.path("docs", "presentation"))

}
