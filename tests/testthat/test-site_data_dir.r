context("site_data_dir")
test_that("site_data_dir works as expected", {
  os=get_os()
  if(os=='unix'){
    if (all(c("/usr/local/share", "/usr/share") %in% parse_path_string(Sys.getenv("XDG_DATA_DIRS", "/usr/local/share:/usr/share")))) {
      expect_equal(all(c("/usr/local/share/R", "/usr/share/R") %in% site_data_dir("R",  multipath=TRUE)),
                   TRUE)
      expect_equal(all(c("/usr/local/share/R", "/usr/share/R") %in% site_data_dir("R")),
                   FALSE)
    }
  } else if(os=='mac'){
    expect_equal(site_data_dir("R"), "/Library/Application Support/R")
    expect_equal(site_data_dir("R", version="%V", expand=TRUE),
                 file.path(path.expand("/Library/Application Support/R"), as.character(getRversion())))
    expect_equal(site_data_dir("R", version="%V", expand=FALSE),
                 path.expand("/Library/Application Support/R/%V"))
  }
})
