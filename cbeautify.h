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

        case COMMENT:
            color = "#0000dd";
            break;

        case CHAR:
            color = "#ff9900";
            break;

        case STRING:
            color = "#ff9900";
            break;

        case DIRECTIVE:
            color = "#ff9900";
            break;

        default:
            color = "#000000";
    }

    return "<span style=\"color:" + color + "\">" + token + "</span>";
}

#endif /* CBEAUTIFY_H */
