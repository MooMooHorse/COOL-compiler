// -*-Mode: C++;-*-
//
// See copyright.h for copyright notice and limitation of liability
// and disclaimer of warranty provisions.
//
#include "copyright.h"

#ifndef _UTILS_H_
#define _UTILS_H_

#include "stringtab.h"
#include <ostream>

std::string pad(int n);
void print_escaped_string(std::ostream &str, const std::string &s);
void dump_Boolean(std::ostream &stream, int padding, bool b);
void dump_Symbol(std::ostream &s, int n, Symbol sym);

const char *cool_token_to_string(int tok);
void print_cool_token(std::ostream &out, int tok, bool eq_sign);
std::string hex2dec(const std::string &hex);

#endif
