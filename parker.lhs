\documentclass{article}

\usepackage{listings}
\usepackage{mathtools}
\usepackage{url}

% mathtools: \floor{}
\DeclarePairedDelimiter\ceil{\lceil}{\rceil}
\DeclarePairedDelimiter\floor{\lfloor}{\rfloor}

% Haskell code environment
\lstnewenvironment{code}{\lstset{language=Haskell,basicstyle=\small}}{}

\newcommand{\logten}{\ensuremath{\log_{10}}}

\title{Defining Parker's Concatenation}
\author{Eddie Antonio Santos}

\begin{document}
\maketitle

\section{Implementation}

We'll need \texttt{integerLogBase}, which is a special GHC thing.

\begin{code}
{-# LANGUAGE MagicHash #-}
import GHC.Prim ( coerce, Int#, tagToEnum#, dataToTag# )
import GHC.Integer.Logarithms ( integerLogBase# )
\end{code}

First, we wish to determine how many digits there are in a number. This will
indicate how many times we should multiply \(a\) by ten.

Digits is defines as:\[
    digits(x) = 1 + \floor{\log_{10} x}
\]

\begin{code}
digits :: (Integral a) => a -> a
digits i = 1 + (floor . log10 $ i)
\end{code}

Temporary:

\begin{code}
pconcat :: Integral a => a -> a -> a
pconcat a b = undefined
\end{code}


\section*{Appendix: Main function}

\begin{code}
main = putStrLn $ show (6 `pconcat` 1)
\end{code}


\section*{Appendix: \(\log_{10}\)}

This one gets weird. In order to get decent accuracy for \(\log_{10}\),  we
need to define double precision of \(\ln 10\) elsewhere, then use it. See
\url{http://stackoverflow.com/a/11293064/6626414}.

\begin{code}
ln10 :: Double
ln10 = log 10
\end{code}

Now we have to \textbf{explicitly} define \(\logten\) as being defined on
\texttt{Double}.

\begin{code}
log10 :: Int -> Int
log10 i = let
            im
            I# $ integerLogBase# 10# im
        in (coerce answer) :: Int


\end{code}

\end{document}
