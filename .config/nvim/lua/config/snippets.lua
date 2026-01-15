local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

local function gen_mathbf_snippets()
	local characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	for i = 1, #characters do
		local character = characters:sub(i, i)
		ls.add_snippets("tex", {
			-- math symbols
			s("rm" .. character, { t("\\mathrm{" .. character .. "}") }),
			s("bf" .. character, { t("\\mathbf{" .. character .. "}") }), -- mathbf
			s("bb" .. character, { t("\\mathbb{" .. character .. "}") }), -- mathbb
			s("mc" .. character, { t("\\mathcal{" .. character .. "}") }), -- mathcal
			s("ms" .. character, { t("\\mathsrc{" .. character .. "}") }), -- mathsrc
			s("mf" .. character, { t("\\mathfrak{" .. character .. "}") }), -- mathfrak
			-- text
			s("tt" .. character, { t({ "\\text{" .. character .. "}" }) }),
		})
	end
end

gen_mathbf_snippets()

ls.add_snippets("tex", {
	-- EXAMPLE
	-- s("fn", {
	--     -- Simple static text.
	--     t("//Parameters: "),
	--     -- function, first parameter is the function, second the Placeholders
	--     -- whose text it gets as input.
	--     -- f(copy, 2),
	--     t({ "", "function " }),
	--     -- Placeholder/Insert.
	--     i(1),
	--     t("("),
	--     -- Placeholder with initial text.
	--     i(2, "int foo"),
	--     -- Linebreak
	--     t({ ") {", "\t" }),
	--     -- Last Placeholder, exit Point of the snippet.
	--     i(0),
	--     t({ "", "}" }),
	-- }),
	-- TEX FILE INIT
	s("texinit", {
		t({ "%!TEX program = lualatex", "", "\\documentclass{" }),
		i(1, "report"),
		t({ "}", "", "\\usepackage{geometry}", "\\usepackage[indent, tocskip]{parskip}", "", "\\title{" }),
		i(2, "Document Title"),
		t({ "}", "\\author{" }),
		i(3, "Raefer Anderson"),
		t({ "}", "\\date{" }),
		i(4),
		t({ "}", "", "" }),
		t({
			"\\usepackage[main=english]{babel}",
			"",
			"\\babelfont[english]{rm}{FreeSerif}",
			"\\babelfont[english]{sf}{FreeSans}",
			"\\babelfont[english]{tt}{FreeMono}",
			"",
			"",
		}),
		t({ "\\geometry{" }),
		i(5, "a4paper"),
		t({ "}", "", "\\begin{document}", "", "\\maketitle", "\\tableofcontents", "", "" }),
		i(0),
		t({ "", "", "\\end{document}", "" }),
	}),
	s("jinit", {
		t({ "\\SetTitle{" }),
		i(1),
		t({ "}", "\\SetTopic{" }),
		i(2, "\\NoTopic"),
		t({ "}", "\\SetType{" }),
		i(3, "Journal"),
		t({ "}", "", "" }),
	}),
	-- TEX COMMENT SECTION TITLE
	s("comment", {
		t({ "% ------------------------------------------------------------------------------", "% " }),
		i(1),
		t({ "", "% ------------------------------------------------------------------------------", "", "" }),
	}),
	-- TEX LANGUAGE INIT
	s("texlang", {}),
	-- TEXT
	s("tt", {
		t({ "\\text{" }),
		i(1),
		t({ "}" }),
	}),
	-- DISPLAY MATH MODE
	s("dm", {
		t({ "\\[", "\t" }),
		i(1),
		t({ "", "\\]" }),
	}),
	-- INLINE MATH MODE
	s("im", {
		t({ "$" }),
		i(1),
		t({ "$" }),
	}),
	-- ALIGN ENV
	s("ali", {
		t({ "\\begin{align*}", "\t" }),
		i(0),
		t({ "", "\\end{align*}" }),
	}),
	-- ITEMIZE ENV
	s("itemize", {
		t({ "\\begin{itemize}", "\t\\item " }),
		i(0),
		t({ "", "\\end{itemize}" }),
	}),
	-- MULTICOL ENV
	s("mtc", {
		t({ "\\begin{multicols}{2}", "\t" }),
		i(0),
		t({ "", "\\end{multicols}" }),
	}),
	-- THEOREM ENV
	s("theo", {
		t({ "\\begin{theorem}[" }),
		i(1),
		t({ "]", "" }),
		i(0),
		t({ "", "\\end{theorem}" }),
	}),
	-- REMARK ENV
	s("rmk", {
		t({ "\\begin{remark}[" }),
		i(1),
		t({ "]", "" }),
		i(0),
		t({ "", "\\end{remark}" }),
	}),

	-- INPUT
	s("input", {
		t({ "\\input{" }),
		i(1),
		t({ "}" }),
	}),

	-- DOT
	s("dot", {
		t({ "\\cdot " }),
	}),
	-- CROSS
	s("cross", {
		t({ "\\times " }),
	}),
	-- FRACTION
	s("'", {
		t({ "\\frac{" }),
		i(1),
		t({ "}{" }),
		i(2),
		t({ "}" }),
	}),
	-- SQUARE ROOT
	s("r", {
		t({ "\\sqrt[" }),
		i(1),
		t({ "]{" }),
		i(2),
		t({ "}" }),
	}),

	-- FIGURE
	s("fig", {
		t({ "\\begin{figure}", "\t\\centering", "\t\\includegraphics{" }),
		i(1),
		t({ "}", "\\end{figure}", "" }),
	}),
	-- TABLE (TABULAR)
	s("tab", {
		t({ "\\begin{table}[H]", "\t\\centering", "\t\\renewcommand{\\arraystretch}{1.2}", "\t\\begin{tabular}{" }),
		i(1),
		t({ "}", "\t\t" }),
		i(2),
		t({ "", "\t\\end{tabular}", "\\end{table}" }),
	}),
	-- TABLE (TABULARX)
	s("tabx", {
		t({ "\\begin{table}[H]", "\t\\centering", "\t\\renewcommand{\\arraystretch}{1.2}", "\t\\begin{tabularx}{" }),
		i(1),
		t({ "} {" }),
		i(2),
		t({ "}", "\t\t" }),
		i(3),
		t({ "", "\t\\end{tabularx}", "\\end{table}" }),
	}),
})
