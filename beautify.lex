/*
 * A lexical scanner for C source files to beautify them
 * Author: Utkarsh Maheshwari
 * Date:   15 Feb, 18
 */

%option noyywrap


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




%%

%{
/* You might not like them, but you need to have rules */
%}

{quote}[{alphabet}{digit}]{quote}               beautifier.write (yytext, CHAR);
{d_quote}.*{d_quote}                            beautifier.write (yytext, STRING);

{slash}{slash}.*$                               beautifier.write (yytext, COMMENT, 1);
{slash}{star}.*{star}{slash}                    beautifier.write (yytext, COMMENT);

{hash}.*$                                       beautifier.write (yytext, DIRECTIVE, 1);

^.+$                                            beautifier.write (yytext, NONE, 1);


%%



int main (int argc, char *argv[])
{

    yylex ();

    beautifier.end ();
    return 0;
}
