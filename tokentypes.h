#ifndef TOKENTYPES_H_VWNB1OSS
#define TOKENTYPES_H_VWNB1OSS

/*! \enum Type
 *
 *  Define the types of tokens that can be found in the C file
 */
enum Type { 
    NONE,
    DIRECTIVE,
    COMMENT,
    STRING,
    CHAR,
    IDENTIFIER,
    PARAM,
    BLOCK_LIM,
};

#endif /* end of include guard: TOKENTYPES_H_VWNB1OSS */
