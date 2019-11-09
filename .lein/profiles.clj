{
  :user {
    :plugins [
      [lein-pprint "1.1.1"]
    ],
    :dependencies [
      [com.bhauman/rebel-readline "0.1.4"]
    ],
    :aliases {
      "rebl" ["trampoline" "run" "-m" "rebel-readline.main"]
    }
  }
}
