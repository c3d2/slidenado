\NeedsTeXFormat{LaTeX2e}[1994/12/01]
\ProvidesClass{cms}[2018/08/07 v1.00 Documentclass for CmS Presentations]

\RequirePackage{etoolbox}

\newbool{notes}
\boolfalse{notes}
\DeclareOption{notes}{\booltrue{notes}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}

\ProcessOptions\relax

\LoadClass[12pt,xcolor={svgnames,table}]{beamer}

\RequirePackage{graphicx}
\RequirePackage[ngerman]{babel}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{tikz}
\RequirePackage{pgfpages}
\RequirePackage{csquotes}
\RequirePackage{comment}
\RequirePackage{ifthen}
\RequirePackage{textcomp}
\RequirePackage{hyperref}
\RequirePackage{media9}

\usetheme{Darmstadt}
\setbeamertemplate{footline}[frame number]

\pgfdeclareimage[height=.6cm]{c3d2logo}{./img/c3d2.pdf}

\pgfdeclarelayer{foreground}
\pgfsetlayers{main,foreground}
\logo{\pgfputat{\pgfxy(-1,0)}{\pgfbox[center,base]{\pgfuseimage{c3d2logo}}}}

\ifbool{notes}{
  \setbeameroption{show notes on second screen = right}}{}

\newcommand{\license}[2][]{\\#2\ifthenelse{\equal{#1}{}}{}{\\\scriptsize\url{#1}}}
\newcommand{\cc}[1]{\includegraphics[height=4mm]{img/#1.png}\hspace{1mm}}

\newcommand{\includedeck}[1]{\include{content/#1}}

\AfterBeginDocument{\maketitle}
