#ifndef BEAUTIFY_H
#define BEAUTIFY_H

#include <iostream>
#include <string>
#include <iomanip>
#include "tokentypes.h"


class Beautify
{
protected:
    int         line;
    int         line_number     ();

    /* The implementing class should redefine this function */
    virtual std::string format  (std::string token, Type type);

public:
    Beautify                    ();

    void        init            ();
    void        write           (std::string token, Type type, bool isEnd = 0);
    void        end             ();
};

Beautify::Beautify ()
{
    line = 1;
    return;
}

void Beautify::write (std::string token, Type type, bool isEnd)
{
    std::cout
        //<< "<div style=\"width:30px;float:left;text-align:right;padding:0px 10px\">"
        //<< line_number () << "</div>"

        << this -> format (token, type);

    if (isEnd) {
        std::cout << "<br />" << std::endl;
    }
}

void Beautify::end ()
{
    return;
}

int Beautify::line_number ()
{
    return this -> line++;
}

std::string Beautify::format (std::string token, Type type)
{
    return token;
}

#endif /* BEAUTIFY_H */
