context("user_log_dir")
test_that("user_cache_dir works as expected", {
   if (Sys.getenv("XDG_CACHE_HOME", path.expand("~/.cache")) == path.expand("~/.cache")) {
        expect_equal(user_log_dir("R", os="unix"), path.expand("~/.cache/R/log"))
        expect_equal(user_log_dir("R", os="unix", opinion=FALSE), path.expand("~/.cache/R"))
    }
    expect_equal(user_cache_dir("R", os="mac"), path.expand("~/Library/Caches/R"))
})
