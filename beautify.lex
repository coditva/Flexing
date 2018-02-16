/*
 * A lexical scanner for C source files to beautify them
 * Author: Utkarsh Maheshwari
 * Date:   15 Feb, 18
 */

%option noyywrap
%x mlc


%{

/* for types of tokens */
#include "tokentypes.h"

/* for beautifying */
#include "cbeautify.h"

/* Instantiate the beautifier */
CBeautify beautifier;

%}




%{
/* I guess we do have to put labels on everything */
%}

quote           (\')
d_quote         (\")
hash            (\#)
escape          (\\)
slash           (\/)
star            (\*)
digit           [0-9]
expo            [eE][+-]{digit}+
alphabet        [a-zA-Z]
blank           [ ]
keyword         (if|else|while|for|public|private|protected|return|typedef|extern|do|switch|case|default)
datatype        (class|int|char|void|signed|long|unsigned|short)




%%

%{
/* You might not like them, but you need to have rules */
%}

{quote}.{quote}                                 beautifier.write (yytext, CHAR);
{d_quote}.*{d_quote}                            beautifier.write (yytext, STRING);

^{hash}.*$                                      beautifier.write (yytext, DIRECTIVE);

{slash}{slash}.*$                               beautifier.write (yytext, COMMENT);

{keyword}                                       beautifier.write (yytext, KEYWORD);
{datatype}                                      beautifier.write (yytext, DATATYPE);

(\ )                                            beautifier.write (" ", SPACE);
(\n)                                            beautifier.write ("", NEWLINE);


%{
    /* Multi-line comment mode */
%}
{slash}{star}                   BEGIN(mlc);     beautifier.write (yytext, COMMENT);
<mlc>{star}{slash}              BEGIN(INITIAL); beautifier.write (yytext, COMMENT);
<mlc>(\n)                                       beautifier.write ("", NEWLINE);
<mlc>(\ )                                       beautifier.write ("", SPACE);
<mlc>.                                          beautifier.write (yytext, COMMENT);
%%



int main (int argc, char *argv[])
{

    yylex ();

    beautifier.end ();
    return 0;
}
