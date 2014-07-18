context("site_config_dir")
test_that("site_config_dir works as expected", {
  os=get_os()
  if(os=='unix'){
    if (all("/etc/xdg" %in% parse_path_string(Sys.getenv("XDG_CONFIG_DIRS", "/etc/xdg")))) {
      expect_equal(all("/etc/xdg/R" %in% site_config_dir("R", multipath=TRUE)), TRUE)
    }
  } else if(os=='mac'){
    expect_equal(site_config_dir("R"), site_data_dir("R"))
  }
})
