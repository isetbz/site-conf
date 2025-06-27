% site-conf.cls -- SITE conference paper document class

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{site-conf}[2025/06/25 v0.1 SITE Conference Class]
% Maintainer: a-mhamdi
% URL: https://github.com/isetbz/site-conf
% License: MIT

\LoadClass[10pt,twocolumn,letterpaper]{article}

\RequirePackage{tgpagella}
\RequirePackage{mathpazo}
\RequirePackage{fontspec}
\setmainfont{TeX Gyre Pagella}

\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{graphicx}
\RequirePackage{cite}
\RequirePackage{url}
\RequirePackage{parskip}
\RequirePackage[hidelinks]{hyperref}

% Page layout
\setlength{\textheight}{9.0in}
\setlength{\textwidth}{6.5in}
\setlength{\columnsep}{0.25in}
\setlength{\topmargin}{-0.5in}
\setlength{\headheight}{0in}
\setlength{\headsep}{0in}
\setlength{\oddsidemargin}{0in}
\setlength{\evensidemargin}{0in}

% Font sizes
\renewcommand{\normalsize}{\fontsize{10}{12}\selectfont}
\renewcommand{\small}{\fontsize{9}{11}\selectfont}
\renewcommand{\footnotesize}{\fontsize{8}{9}\selectfont}
\renewcommand{\scriptsize}{\fontsize{7}{8}\selectfont}
\renewcommand{\tiny}{\fontsize{6}{7}\selectfont}
\renewcommand{\large}{\fontsize{12}{14}\selectfont}
\renewcommand{\Large}{\fontsize{14}{17}\selectfont}
\renewcommand{\LARGE}{\fontsize{17}{22}\selectfont}
\renewcommand{\huge}{\fontsize{20}{25}\selectfont}
\renewcommand{\Huge}{\fontsize{25}{30}\selectfont}

% Author formatting helper
\newcommand{\name}[1]{#1}
\newcommand{\departement}[1]{\small\textit{#1}}
\newcommand{\university}[1]{\small\textit{#1}}
\newcommand{\email}[1]{\small\tt\href{#1}{#1}}

% Title formatting
\def\@maketitle{%
  % \thispagestyle{firstpage}
  {\scriptsize $3$\textsuperscript{rd} International Conference on
    Smart Industry, Technology \& Environment (SITE -- $2025$) Tunisia,
  Hammamet -- October $24-26$, $2025$ \hfill}
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
    \let \footnote \thanks
    {\LARGE \@title \par}%
    \vskip 1.5em%
    {%
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
    \end{tabular}\par}%
    \vskip 1em%
  \end{center}%
  \par
\vskip 1.5em}

% Section formatting
\renewcommand
\section{\@startsection{section}{1}{\z@}%
  {-3.5ex \@plus -1ex \@minus -.2ex}%
  {2.3ex \@plus.2ex}%
{\normalfont\large\bfseries\centering}}

\renewcommand
\subsection{\@startsection{subsection}{2}{\z@}%
  {-3.25ex\@plus -1ex \@minus -.2ex}%
  {1.5ex \@plus .2ex}%
{\normalfont\normalsize\bfseries}}

\renewcommand
\subsubsection{\@startsection{subsubsection}{3}{\z@}%
  {-3.25ex\@plus -1ex \@minus -.2ex}%
  {1.5ex \@plus .2ex}%
{\normalfont\normalsize\bfseries}}

% Page style with header on first page
\newcommand{\firstpageheader}[1]{\gdef\@firstpageheader{#1}}
\newcommand{\@firstpageheader}{}

\def\ps@firstpage{%
  \def\@oddhead{\footnotesize\firstpageheader\hfill}
  \def\@evenhead{\footnotesize\firstpageheader\hfill}%
  \def\@oddfoot{}
  \def\@evenfoot{}%
}

\def\ps@followingpages{%
  \def\@oddhead{}%
  \def\@evenhead{}%
  \def\@oddfoot{\footnotesize\copyright~$2025$ \sc SITE Conference\hfill}%
  \def\@evenfoot{\footnotesize\copyright~$2025$ \sc SITE Conference\hfill}%
}

% Set page style
\pagestyle{followingpages}
\thispagestyle{firstpage}

% Figure and table captions
\renewcommand{\figurename}{Fig.}
\renewcommand{\tablename}{Tab.}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{\small\textbf{#1:} #2}%
  \ifdim \wd\@tempboxa >\hsize
  \small\textbf{#1:} #2\par
  \else
  \global \@minipagefalse
  \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
\vskip\belowcaptionskip}

% Bibliography style
\renewcommand\@biblabel[1]{[#1]}
\renewenvironment{thebibliography}[1]
{
  \section*{\refname}%
  \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}%
  \list{\@biblabel{\@arabic\c@enumiv}}%
  {\settowidth\labelwidth{\@biblabel{#1}}%
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \@openbib@code
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
  \renewcommand\theenumiv{\@arabic\c@enumiv}}%
  \sloppy
  \clubpenalty4000
  \@clubpenalty \clubpenalty
  \widowpenalty4000%
\sfcode`\.\@m}
{\def\@noitemerr
  {\@latex@warning{Empty `thebibliography' environment}}%
\endlist}

% Abstract environment
\renewenvironment{abstract}{%
  %\small
  \begin{center}%
    \textbf{\abstractname\vspace{-.5em}\vspace{\z@}}%
  \end{center}%
  \quotation
}{%
  \endquotation
}

% Keywords environment
\newenvironment{keywords}{%
  %\small
  \textbf{\textit{Index Terms---}}%
}{%
  \par
}

\endinput
