\documentclass{article}

\usepackage[no-math]{fontspec}  % Allow arbitrary Unicode

\usepackage{listings}
\usepackage{mathtools}
\usepackage{MnSymbol}
\usepackage{newunicodechar}
\usepackage{url}

% newunicodechar: define the parker square ■
\newunicodechar{■}{\ensuremath\filledmedsquare}
% mathtools: \floor{}
\DeclarePairedDelimiter\ceil{\lceil}{\rceil}
\DeclarePairedDelimiter\floor{\lfloor}{\rfloor}

% Haskell code environment
\lstnewenvironment{code}{\lstset{language=Haskell,basicstyle=\small, literate={+}{{$+$}}1 {/}{{$/$}}1 {*}{{$*$}}1 {->}{{$\rightarrow$}}2 {=>}{{$\Rightarrow$}}2}}{}
\lstloadlanguages{Haskell}

\newcommand{\logten}{\ensuremath{\log_{10}}}

\title{Defining Parker's Concatenation}
\author{Eddie Antonio Santos}

\begin{document}
\maketitle

The goal is to define an operator, \(a ■ b\) such that the result is the
concatenation of (base-10) digits of each of its operands.

\section{Implementation}

The implementation shifts the left-hand operand \(a\) by the number of
digits in the right-hand operand \(b\). To do this, we must determine,
mathematically, how many digits are in the right-hand operand.

\subsection{Digits}

First, we wish to determine how many digits there are in a number. This will
indicate how many times we should multiply \(a\) by ten.
\[
    digits(x) = \floor{\logten x} + 1
\]

\begin{code}
digits :: Integral a => a -> a
digits i = floor(log10 x) + 1
    where x = fromIntegral i
\end{code}

\subsection{Concatenation}

Now that we can get the number of digits of an arbitrary number, we can
implement the operator.

To shift a base-10 number by some number of digits \(d\) to
the left, multiply the number by ten to the number of digits:\[
    a \times 10^{d}
\]

Since this operation effectively fills the right-hand side with zeros, a
simple addition with the right-hand operand will effectively replace the zeros
with the digits of the right-side operator:\[
    a \times 10^{digits(b)} + b
\]

Because \verb@||@ is already a default Haskell operator, we mustn't override
it! Instead, we shall invent a new infix operator: ■. In true
\verb|#ParkerSquare| spirit, I could not get it to typeset quite perfectly in
\LaTeX, however, the following code compiles fine in GHC.  I gave it a go.

\begin{code}
(■) :: Integral a => a -> a -> a
a ■ b = a * 10 ^ (digits b) + b
\end{code}


\section{Main}

This computes the solution to the 10,958 problem~\cite{parker}.

\begin{code}
main = putStrLn $ show solution
    where solution = 1 * 2 ■ 3 + ((4 * 5 * 6) ■ 7 + 8) * 9
\end{code}


\section*{Appendix: Generalization for any base}

The generalized concatenation operator, defined for any base is as follows:

\begin{code}
cat :: Integral a => a -> a -> a -> a
cat base a b = a * base ^ (places b) + b
    where places d = floor(log b' / log base') + 1
          base' = fromIntegral base
          b' = fromIntegral b
\end{code}


\section*{Appendix: Defining \logten}

For strange floating point reasons, \verb|log10 1000| is less than 3, but
we'll ignore that for now. The alternative solution is to use primitive
values, but that's a pain.

\begin{code}
log10 = logBase 10
\end{code}


\begin{thebibliography}{9}

\bibitem{parker}
    Matt Parker,
    \textit{A 10,958 Solution}.
    Numberphile,
    Ed:\ Brady Haran,
    2017.
    Available:\ \url{https://www.youtube.com/watch?v=pasyRUj7UwM}.

\end{thebibliography}

\end{document}
