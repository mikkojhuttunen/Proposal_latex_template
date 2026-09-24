% Author Name: José António Portela Areia 
% Author Contact: jose.apareia@gmail.com
% Version: 1.0.1 - 2024/04/29

% Class Information
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{NobArticle}[2024/04/27 NobArticle Class]

% Toogle Classes/Options
\usepackage{etoolbox} % Required for conditional logic
\newtoggle{unnumberedsections} % Create toggle for a class option
\settoggle{unnumberedsections}{false} % Default value for the class option
\DeclareOption{unnumberedsections}{\settoggle{unnumberedsections}{true}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% Load Master Class
\LoadClass[letterpaper,10pt,twoside]{article}

% Required Packages
\usepackage{graphicx} % Required for including images
\usepackage{amsmath} % Mathematical expressions
\usepackage{amssymb} % Mathematical symbols
\usepackage[dvipsnames]{xcolor} % Using colors within the document
\usepackage{subcaption} % Two figures side-by-side
\usepackage{blindtext}

% Margins
\usepackage[
	top=2.5cm, % Top margin
	bottom=2.5cm, % Bottom margin
	left=2cm, % Left margin
	right=2cm, % Right margin
	footskip=1cm, % Space from the bottom margin to the baseline of the footer
	headsep=0.75cm, % Space from the top margin to the baseline of the header
	columnsep=20pt, % Space between text columns (in twocolumn mode)
	%showframe % Uncomment to show frames around the margins for debugging
]{geometry}

% Header & Footer
\usepackage{fancyhdr} % Required for customizing headers and footers
\usepackage[bottom, hang]{footmisc} % Force footnotes to the bottom
\pagestyle{fancy} \fancyhf{} % Clear default style
\renewcommand{\headrulewidth}{0pt}
\setlength{\footnotemargin}{6pt} % Footnote space
\fancyhead[RO]{\small\textit{\runninghead}}
\fancyhead[LE]{\small\textit{\runninghead}}
\fancyfoot[RO]{\small\textbf{\thepage}}
\fancyfoot[LO]{\footnotesize\footertext}
\fancyfoot[LE]{\small\textbf{\thepage}}
\fancyfoot[RE]{\footnotesize\footertext}

% Fonts
\usepackage[T1]{fontenc} 
\usepackage[tt=false, type1=true]{libertine}
\usepackage[varqu]{zi4}
\usepackage[libertine]{newtxmath}


% Tables
\usepackage{tabularx} % Table length
\usepackage{booktabs} % Table style
\usepackage{multirow} % Multirow
\newcommand{\customtableformatting}{
    \renewcommand{\arraystretch}{1.1}\footnotesize
} % Increase space between rows and smaller font
\AtBeginEnvironment{tabular}{\customtableformatting} % Apply to tabular
\AtBeginEnvironment{tabularx}{\customtableformatting} % Apply to tabularx

\usepackage{xcolor,colortbl}

% Captions
\usepackage{caption} % Required for customizing captions
\captionsetup{skip=6pt} % Whitespace between figures/tables and the caption
\captionsetup{labelfont={bf,footnotesize}, textfont={footnotesize}}
\captionsetup[table]{skip=2pt,singlelinecheck=off,labelsep=period}%newline
\captionsetup[figure]{skip=7pt,singlelinecheck=off,labelsep=period}

% Lists
\usepackage{enumitem} % Required for list customization
\setlist{noitemsep} % Customize spacing around and inside lists

% Links
\usepackage[bookmarks]{hyperref} % Required for links

% Custom color for citations and references
\newcommand\shade{85}\colorlet{nobcitecolor}{Aquamarine}

\hypersetup{
	colorlinks=true, % Whether to color the text of links
	urlcolor=black, % Color for \url and \href links
	linkcolor=nobcitecolor!\shade!black, % Color for \nameref links
	citecolor=nobcitecolor!\shade!black, % Color of reference citations
}

% Abstract
\usepackage{abstract} % Allows abstract customization
\renewcommand*\abstractname{\vspace{5pt}\normalsize{Abstract}\hfill\vspace{2pt}}
\renewcommand{\abstractnamefont}{\bfseries\vspace{0.5\baselineskip}}
\renewcommand{\abstracttextfont}{\vspace{-0.5\baselineskip}}

\renewenvironment{abstract}
{\par\rule{\linewidth}{.5pt}\par%
{\bfseries \abstractname}\par}%{\bfseries \abstractname:}\par}
{\par\rule{\linewidth}{.5pt}}

% Front Cover
\usepackage{titling} % Required for customizing the title
\setlength{\droptitle}{-4.5\baselineskip} % Move the title up
\pretitle{\begin{flushleft}\Large\bfseries} % Article title pre-formatting
\posttitle{\end{flushleft}} % Article title post-formatting
\preauthor{\begin{flushleft}\small}
\postauthor{\end{flushleft}}
\predate{\vspace{-4mm}\begin{flushleft}\footnotesize}
\postdate{\end{flushleft}}
\setlength{\thanksmarkwidth}{3pt}
\setlength{\thanksmargin}{-3pt}
\patchcmd{\maketitle}{plain}{empty}{}{} % Set the headers and footers empty

% \renewcommand{\maketitle}{%
% %\vspace*{\droptitle}
% \maketitlehooka{\pretitle \title \posttitle}
% \maketitlehookb{\preauthor \author \postauthor}
% \maketitlehookc{\predate \date{} \postdate}
% }%
% Sections
\usepackage{titlesec} % Required for modifying sections

\usepackage{threeparttable}
\usepackage{fancyhdr}
\pagestyle{fancy}

\usepackage{wrapfig}


\iftoggle{unnumberedsections} { % Conditional logic for the unnumbered sections
    \setcounter{secnumdepth}{0} } % Don't number sections at any level
{   \setcounter{secnumdepth}{3} } % Number sections down to subsubsections

\titleformat
	{\section} % Section type being modified
	[block] % Section layout type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
	{\normalsize\raggedright\bfseries} % Text formatting of the whole section, i.e. label and title
	{\thesection} % Section label (e.g. number) and its formatting
	{0.5em} % Horizontal space between the section label and title
	{} % Code before the section title
	[] % Code after the section title

\titleformat
    {\subsection} % Section type being modified
    [block] % Section layout type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
    {\raggedright\bfseries\itshape} % Text formatting of the whole section, i.e. label and title
    {\thesubsection} % Section label (e.g. number) and its formatting
    {0.5em} % Horizontal space between the section label and title
    {} % Code before the section title
    [] % Code after the section title

\titleformat
	{\subsubsection} % Section type being modified
	[runin] % Section layout type, can be: hang, block, display, runin, leftmargin, rightmargin, drop, wrap, frame
	{\bfseries} % Text formatting of the whole section, i.e. label and title
	{\thesubsubsection} % Section label (e.g. number) and its formatting
	{5pt} % Horizontal space between the section label and title
	{} % Code before the section title
	[] % Code after the section title

\titlespacing*{\section}{0pt}{1\baselineskip}{1pt}
\titlespacing*{\subsection}{2pt}{0.25\baselineskip}{0pt}
\titlespacing*{\subsubsection}{0pt}{1\baselineskip}{8pt}

% Custom Commands
\newcommand{\runninghead}[1]{\renewcommand{\runninghead}{\footnotesize #1}}
\newcommand{\footertext}[1]{\renewcommand{\footertext}{\footnotesize #1}}

%% TAble formatting
\definecolor{Gray}{gray}{0.65}
\definecolor{LightCyan}{rgb}{0.88,1,1}
\newcolumntype{a}{>{\columncolor{Gray}}c}

% Todo notes
\newcommand{\todo}[1]{\textcolor{red}{TODO: #1.}}


%%%%% customized bibliography format, MJH

% Bibliography
% \usepackage[
% 	backend=biber, % Use the biber backend for compiling the bibliography
% 	citestyle=authoryear, % In-text citation style
% 	bibstyle=authoryear, % Bibliography style
% 	sorting=nyt, % Order references
%     natbib=true, % Use natbib compatibility mode
%     uniquelist=false % Only show one author, e.g. (Author et al., 2023)
% ]{biblatex}

\usepackage[sorting=none,%ydnt,%
            backend=biber,%biber,%
            style=numeric-comp,%numeric-comp,%verbose ,phys style=numeric-comp. ,verbose
            %citestyle=authoryear, % In-text citation style
            %hyperref=false,
            url=false,
            isbn=false,
            doi=true,
            eprint=false,
            date=year,%remove months
            %arxivid=false,
            backref=false,%p. and pp.
            uniquename=true,%sortname=given-family,
            %uniquelist=false % Only show one author, e.g. (Author et al., 2023)
            %maxcitenames=15,%
            %mincitenames=5,%
            %maxnames=4,minnames=3,maxbibnames=99,
            giveninits=true%,maxcitenames=15
            ]{biblatex}
% 'maxcitenames' must be greater than or equal to 'mincitenames'


\setlength\bibitemsep{0.15\itemsep} % Adjust the space between references
\setlength\bibhang{0pt} % Remove indentation
\renewcommand*{\bibfont}{\footnotesize} % Change references font size
%\addbibresource{Bibliography/Bibliography.bib} % Reference document
\addbibresource{Bibliography/Integrated_photonics_refs.bib} % Reference document
\addbibresource{Bibliography/New_refs.bib} % Reference 

% Highlight both Author and Year in the citations
\ExecuteBibliographyOptions{maxcitenames=1}
\DeclareFieldFormat{citehyperref}{%
  \DeclareFieldAlias{bibhyperref}{noformat}% Avoid nested links
  \bibhyperref{#1}}
\DeclareFieldFormat{textcitehyperref}{%
  \DeclareFieldAlias{bibhyperref}{noformat}% Avoid nested links
  \bibhyperref{%
    #1%
    \ifbool{cbx:parens}
      {\bibcloseparen\global\boolfalse{cbx:parens}}
      {}}}
\savebibmacro{cite}
\savebibmacro{textcite}
\renewbibmacro*{cite}{%
  \printtext[citehyperref]{%
    \restorebibmacro{cite}%
    \usebibmacro{cite}}}
\renewbibmacro*{textcite}{%
  \ifboolexpr{
    ( not test {\iffieldundef{prenote}} and
      test {\ifnumequal{\value{citecount}}{1}} )
    or
    ( not test {\iffieldundef{postnote}} and
      test {\ifnumequal{\value{citecount}}{\value{citetotal}}} )
  }
    {\DeclareFieldAlias{textcitehyperref}{noformat}}
    {}%
  \printtext[textcitehyperref]{%
    \restorebibmacro{textcite}%
    \usebibmacro{textcite}}}
\renewbibmacro{in:}{}

% \DeclareFieldFormat[article,inbook,incollection,inproceedings,patent,thesis,unpublished]{titlecase}{\titlecap{#1}}%\TitleCase{#1}
\DeclareFieldFormat[article,inbook,incollection,inproceedings,patent,thesis,unpublished]{titlecase}{#1}%\TitleCase{#1}

\DeclareNameAlias{sortname}{first-last} % these overridden with the bolded \makeauthorbold!!!
% \renewrobustcmd*{\bibinitperiod}{}

% https://tex.stackexchange.com/questions/248740/how-to-modify-numeric-comp-style-in-biblatex
\renewcommand\newunitpunct{\addcomma\space}
% \usepackage{xpatch}
% \xpatchbibmacro{journal+issuetitle}{%
% \usebibmacro{journal}%
% \setunit*{\addspace}%
% }{%
% \usebibmacro{journal}%
% \setunit*{\addcomma\space}%
% }{}{}

\newcommand{\bfemph}[1]{\textbf{\textit{#1}}}
\renewcommand{\emph}[1]{\bfemph{#1}}

\usepackage{csquotes}
% \usepackage[backend=bibtex,style=alphabetic,refsection=section]{biblatex}
% \renewcommand{\labelnamepunct}{\addperiod\space}
% \DeclareFieldFormat*{title}{\textsl{#1}}
% \DeclareFieldFormat*{title}{\SentenceCase{#1}}
% \DeclareFieldFormat{titlecase}{\SentenceCase{#1}}
% \SentenceCase{#1}
% \DeclareFieldFormat{titlecase}{#1}
\DeclareFieldFormat{titlecase}{\MakeSentenceCase*{#1}}

\DeclareFieldFormat[book,thesis]{title}{\mkbibemph{#1}} % italic title , removed \addcomma
%\DeclareFieldFormat[article]{title}{``\textit{#1}''} %``#1,''
\DeclareFieldFormat[article,inproceedings,misc]{title}{} %``#1,'' MJH: removed the article names, to save space
\DeclareFieldFormat{journaltitle}{\textbf{#1}} 
%% makes volume of journal bold and adds colon
\DeclareFieldFormat[article]{volume}{\textbf{#1}\addcomma\space}
% removes pagination (p./pp.) before page numbers:
\DeclareFieldFormat{pages}{#1}

%% \addthinspace{}

%% remove issue numbers:
\renewbibmacro*{volume+number+eid}{%
  \printfield{volume}%
  %\setunit*{\addcomma\addspace}%
%   \iffieldundef{number}{}{%
%   \printtext{no\adddot\addspace}%
%   }%
%   \printfield{number}%
  \setunit{\addcomma\space}%
  \printfield{eid}}
  
%% Issue/date macros removed after journal number
% https://tex.stackexchange.com/questions/6743/biblatex-changing-the-order-of-entries 
\renewbibmacro*{journal+issuetitle}{%
  \usebibmacro{journal}%
  \setunit*{\addspace}%
  \iffieldundef{series}
    {}
    {\newunit
     \printfield{series}%
     \setunit{\addspace}}%
  \usebibmacro{volume+number+eid}%
  \usebibmacro{date}
%  \setunit{\addspace}% DELETED
%  \usebibmacro{issue+date}% DELETED
%  \setunit{\addcolon\space}% DELETED
  %\usebibmacro{issue}% DELETED
  %\usebibmacro{issue+date}
  \newunit}

