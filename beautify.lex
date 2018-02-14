/*
 * A simple example of how lexical scannars work
 */

%option noyywrap


%{
/* I guess we do have to put labels on everything */
%}
oreo        (cat)
adjective   (good|bad)


%%
%{
/* You might not like them, but you need to have rules */
%}
{oreo}          { printf ("Oreo, the cat"); }
{adjective}     { printf ("lazy"); }
%%


int main (int argc, char *argv[])
{
    yylex ();
    return 0;
}
