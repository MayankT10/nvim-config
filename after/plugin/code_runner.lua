require("code_runner").setup({
	filetype = {
		java = {
			"cd $dir &&",
			"javac $fileName &&",
			"java $fileNameWithoutExt",
		},
		python = "python3 -u",
		typescript = "deno run",
		rust = {
			"cd $dir &&",
			"rustc $fileName &&",
			"$dir/$fileNameWithoutExt",
		},
		c = "cd $dir && gcc $fileName -o /tmp/$fileNameWithoutExt && /tmp/$fileNameWithoutExt",
		cpp = "cd $dir && g++ $fileName -o /tmp/$fileNameWithoutExt && /tmp/$fileNameWithoutExt",
	},
})
