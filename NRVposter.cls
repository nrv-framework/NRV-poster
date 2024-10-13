% poster class for NRV with LaTeX.
% dev by florian.kolbl@nrv-framework.org
% inspired by poster class for sintef with LaTeX.
% by Federico Zenith, federico.zenith@sintef.no.

\ProvidesClass{NRVposter}[2021/03/12 Poster class for NRV]

% Language options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{tikzposter}}
\ProcessOptions\relax

% Posters will be printed, so they should always be in CMYK.
\PassOptionsToPackage{cmyk}{xcolor}

\LoadClass[25pt,a0paper,innermargin=5cm]{tikzposter}

% Load NRV-specific graphic elements
\RequirePackage{NRVcolor}

\definecolorpalette{NRV} {
  \definecolor{colorOne}{named}{NRVgrey}
  \definecolor{colorTwo}{named}{black}
  \definecolor{colorThree}{named}{NRVblue}
}


\definecolorstyle{NRV} {}{
  % Background Colors
  \colorlet{backgroundcolor}{colorOne!50}
  \colorlet{framecolor}{colorOne!50}
  % Title Colors
  \colorlet{titlefgcolor}{colorThree}
  \colorlet{titlebgcolor}{colorOne!50}
  % Block Colors
  \colorlet{blocktitlebgcolor}{white}
  \colorlet{blocktitlefgcolor}{colorThree}
  \colorlet{blockbodybgcolor}{white}
  \colorlet{blockbodyfgcolor}{colorThree}
  % Innerblock Colors
  \colorlet{innerblocktitlebgcolor}{white}
  \colorlet{innerblocktitlefgcolor}{colorThree}
  \colorlet{innerblockbodybgcolor}{white}
  \colorlet{innerblockbodyfgcolor}{colorThree}
  % Note colors TODO check what makes sense here
  \colorlet{notefgcolor}{colorThree}
  \colorlet{notebgcolor}{NRVyellow}
  \colorlet{noteframecolor}{colorTwo}
}

\definebackgroundstyle{NRV}{
  \draw[inner sep=0pt, line width=0pt, fill=backgroundcolor] 
  (bottomleft) rectangle (topright);
  \node[inner sep=0pt] (NRV) at   
  (0.45\paperwidth-9cm,0.5\paperheight-7.5cm)
      {\includegraphics[width=12.7cm]{images/logo.png}};
  \node[inner sep=4pt, anchor=south east] at (0.5\paperwidth-7cm, 
  -0.5\textheight+2cm){\Large \color{colorThree} nrv-framework.org
};
}

\definetitlestyle{NRV}{
width=0.9\paperwidth, roundedcorners=0, linewidth=0pt, innersep=0cm,
titletotopverticalspace=5cm, titletoblockverticalspace=5cm
}{}

\renewcommand\TP@maketitle{%
    \begin{minipage}{0.8\titlewidth}
        \color{titlefgcolor}
        {\Huge \@title \par}
        \vspace*{2em}
        {\textcolor{NRVcyan}{\rule{4cm}{2mm}}\par}
        \vspace*{2em}
        {\LARGE \@author \par}
        \vspace*{1em}
        {\@institute}
    \end{minipage}
}

\defineblockstyle{NRV}{ 
  titlewidthscale=1, bodywidthscale=1, titleleft,
  titleoffsetx=0pt, titleoffsety=0pt, bodyoffsetx=0mm, bodyoffsety=15mm,
  bodyverticalshift=10mm, roundedcorners=0, linewidth=0pt,
  titleinnersep=1cm, bodyinnersep=1cm
}{
  \draw[color=framecolor, fill=blockbodybgcolor,
  rounded corners=\blockroundedcorners] (blockbody.south west)
  rectangle (blockbody.north east);
  \ifBlockHasTitle
    \draw[color=framecolor, fill=blocktitlebgcolor,
    rounded corners=\blockroundedcorners] (blocktitle.south west) -- 
    (blocktitle.north west) -- (blocktitle.north east) -- (blocktitle.south 
    east);
  \fi
}

\definelayouttheme{NRV}{
  \usecolorstyle[colorPalette=NRV]{NRV}
  \usebackgroundstyle{NRV}
  \usetitlestyle{NRV}
  \useblockstyle{NRV}
}
\usetheme{NRV}

\tikzposterlatexaffectionproofoff

% Set font to Calibri, or Times clone for serif
\RequirePackage{carlito,tgtermes}
\renewcommand{\familydefault}{\sfdefault}
