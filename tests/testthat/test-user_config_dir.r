context("user_config_dir")
test_that("user_config_dir works as expected", {
  os=get_os()
  if(os=='unix'){
    if (Sys.getenv("XDG_CONFIG_HOME", path.expand("~/.config")) == path.expand("~/.config")) {
      expect_equal(user_config_dir("R"), path.expand("~/.config/R"))
    }
  } else if(os=='mac'){
    expect_equal(user_config_dir("R"), path.expand("~/Library/Application Support/R"))
    expect_equal(user_config_dir("R", version="%V", expand=TRUE),
                 file.path(path.expand("~/Library/Application Support/R"), as.character(getRversion())))
    expect_equal(user_config_dir("R", version="%V", expand=FALSE),
                 path.expand("~/Library/Application Support/R/%V"))
  } else if(os=='win'){
    if (!is.na(Sys.getenv("APPDATA", unset=NA))) {
      expect_equal(user_config_dir("R", roaming=TRUE),
                   file_path(Sys.getenv("APPDATA"), "R", "R"))
    }
    if (is.na(Sys.getenv("LOCALAPPDATA", unset=NA))) {
      if (!is.na(Sys.getenv("USERPROFILE", unset=NA))) {
        expect_equal(user_config_dir("R", roaming=FALSE),
                     file_path(Sys.getenv("USERPROFILE"), "Local Settings", "Application Data", "R", "R"))
      }
    } else {
      expect_equal(user_config_dir("R", roaming=FALSE),
                   file_path(Sys.getenv("LOCALAPPDATA"), "R", "R"))
    }
  }
})
