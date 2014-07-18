context("user_cache_dir")
test_that("user_cache_dir works as expected", {
  os=get_os()
  if(os=='unix'){
    if (Sys.getenv("XDG_CACHE_HOME", path.expand("~/.cache")) == path.expand("~/.cache")) {
      expect_equal(user_cache_dir("R"), path.expand("~/.cache/R"))
    }
  } else if(os=='mac'){
    expect_equal(user_cache_dir("R"), path.expand("~/Library/Caches/R"))
  }
  expect_warning(user_cache_dir(version = "1.1"), regexp = "appname")
})
