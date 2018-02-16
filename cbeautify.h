#ifndef CBEAUTIFY_H
#define CBEAUTIFY_H

#include <string>
#include "beautify.h"

class CBeautify : public Beautify
{
protected:
    std::string format          (std::string token, Type type);
    int         line_number     ();

public:
    CBeautify                   () : Beautify () {};
};

std::string CBeautify::format (std::string token, Type type)
{
    std::string color;
    switch (type) {

        case SPACE:
            return "&nbsp;";

        case COMMENT:
            color = "#0000dd";
            break;

        case CHAR:
            color = "pink";
            break;

        case STRING:
            color = "purple";
            break;

        case DIRECTIVE:
            color = "#ff9900";
            break;

        case KEYWORD:
            color = "green";
            break;

        case DATATYPE:
            color = "red";
            break;

        default:
            color = "black";
    }

    return "<span style=\"color:" + color + "\">" + token + "</span>";
}

#endif /* CBEAUTIFY_H */
