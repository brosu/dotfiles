local setup, code_runner = pcall(require, "code_runner")
if not setup then
  print("Warn: could not load code_runner")
  return
end

code_runner.setup({
  mode = "toggleterm",
  filetype = {
    java = {
      "cd $dir &&",
      "javac $fileName &&",
      "java $fileNameWithoutExt",
    },
    python = {
      "if [ -f .env ]; then export $(cat ./.env | xargs); fi &&",
      "cd $dir &&",
      ". ./venv/bin/activate &&",
      "python3 -u $fileName &&",
      "cd -",
    },
    typescript = "deno run",
    rust = {
      "cd $dir &&",
      "rustc $fileName &&",
      "$dir/$fileNameWithoutExt",
    },
  },
})
