
#' use_analysis
#'
#' Creates a project skeleton for data analysis.
#'
#' @param project_name character; default is to current directory
#' @author Reinhard Simon
use_analysis <- function(project_name = ".") {

  # Create a project directory if it not already exists
  # or use the current directory
  if(project_name != "."){
    if(!dir.exists(project_name)) dir.create(project_name)
    setwd(project_name)
    p_name = project_name
  } else {
    p_name = basename(getwd())
  }

  # Helper function to safely create directories
  use_dir <- function(adir){
    tryCatch({
      if (!dir.exists(adir)) {
        dir.create(adir)
        message(paste0("Created directory: ", adir))
      } else {
        message(paste0("Directory: ", adir, " already exists."))
      }

    }, error = function(e) {
      warning(paste0("Could not create directory: ", adir))
      }
    )
  }


  # Helper function to safely create files
  use_file <- function(afile = "README.md",
                       line = "What is where in this project."){
    # Write the README.md file

    tryCatch({
      if (!file.exists(afile)) {
        write(paste0("# ", line ," *", p_name, "*"), file = afile)
        message(paste0("Created file: ",  afile))
      } else {
        message(paste0("File exists: ", afile))
      }
    }, error = function(e) {
      warning(paste0("Could not create file: ", afile))
    })
  }

  use_file(afile = "README.md",
           line = "What is where in this project.")
  use_dir("src")
  use_dir("data")
  use_file("data/NOTEBOOK.md",
           "Describe your transformation and analytical steps in this lab notebook.")
  use_dir(file.path("data", "code"))
  use_dir("analyses")
  use_dir("docs")
  use_dir(file.path("docs", "paper"))
  use_dir(file.path("docs", "presentation"))

  setwd("../")

  TRUE
}
