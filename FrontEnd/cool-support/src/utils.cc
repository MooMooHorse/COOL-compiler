#include "utils.h"
#include "cool_parse.h" // defines tokens
#include <cassert>
#include <cctype> // for isprint
#include <iomanip>
#include <iostream>
#include <vector>

std::string pad(int n) {
  if (n <= 0) {
    return "";
  }
  return std::string(std::min(n, 80), ' ');
}

void print_escaped_string(std::ostream &str, const std::string &s) {
  for (char c : s) {
    switch (c) {
    case '\\':
      str << "\\\\";
      break;
    case '\"':
      str << "\\\"";
      break;
    case '\n':
      str << "\\n";
      break;
    case '\t':
      str << "\\t";
      break;
    case '\b':
      str << "\\b";
      break;
    case '\f':
      str << "\\f";
      break;

    default:
      if (isprint(c))
        str << c;
      else
        //
        // Unprintable characters are printed using octal equivalents.
        // To get the sign of the octal number correct, the character
        // must be cast to an unsigned char before coverting it to an
        // integer.
        //
        str << '\\' << std::oct << std::setfill('0') << std::setw(3)
            << (int)((unsigned char)(c)) << std::dec << std::setfill(' ');
      break;
    }
  }
}

void dump_Boolean(std::ostream &stream, int padding, bool b) {
  stream << pad(padding) << (int)b << "\n";
}
void dump_Symbol(std::ostream &s, int n, Symbol sym) {
  s << pad(n) << sym->get_string() << std::endl;
}

//
// The following two functions are used for debugging the parser.
//
const char *cool_token_to_string(int tok) {
  switch (tok) {
  case 0:
    return ("EOF");
    break;
  case (CLASS):
    return ("CLASS");
    break;
  case (ELSE):
    return ("ELSE");
    break;
  case (FI):
    return ("FI");
    break;
  case (IF):
    return ("IF");
    break;
  case (IN):
    return ("IN");
    break;
  case (INHERITS):
    return ("INHERITS");
    break;
  case (LET):
    return ("LET");
    break;
  case (LOOP):
    return ("LOOP");
    break;
  case (POOL):
    return ("POOL");
    break;
  case (THEN):
    return ("THEN");
    break;
  case (WHILE):
    return ("WHILE");
    break;
  case (ASSIGN):
    return ("ASSIGN");
    break;
  case (CASE):
    return ("CASE");
    break;
  case (ESAC):
    return ("ESAC");
    break;
  case (OF):
    return ("OF");
    break;
  case (FOR):
    return ("FOR");
    break;
  case (DARROW):
    return ("DARROW");
    break;
  case (NEW):
    return ("NEW");
    break;
  case (STR_CONST):
    return ("STR_CONST");
    break;
  case (INT_CONST):
    return ("INT_CONST");
    break;
  case (BOOL_CONST):
    return ("BOOL_CONST");
    break;
  case (TYPEID):
    return ("TYPEID");
    break;
  case (OBJECTID):
    return ("OBJECTID");
    break;
  case (ERROR):
    return ("ERROR");
    break;
  case (LE):
    return ("LE");
    break;
  case (NOT):
    return ("NOT");
    break;
  case (ISVOID):
    return ("ISVOID");
    break;
  case '+':
    return ("'+'");
    break;
  case '/':
    return ("'/'");
    break;
  case '-':
    return ("'-'");
    break;
  case '*':
    return ("'*'");
    break;
  case '=':
    return ("'='");
    break;
  case '<':
    return ("'<'");
    break;
  case '.':
    return ("'.'");
    break;
  case '~':
    return ("'~'");
    break;
  case ',':
    return ("','");
    break;
  case ';':
    return ("';'");
    break;
  case ':':
    return ("':'");
    break;
  case '(':
    return ("'('");
    break;
  case ')':
    return ("')'");
    break;
  case '@':
    return ("'@'");
    break;
  case '{':
    return ("'{'");
    break;
  case '}':
    return ("'}'");
    break;
  default:
    return ("<Invalid Token>");
  }
}

void print_cool_token(std::ostream &out, int tok, bool eq_sign) {
  out << cool_token_to_string(tok);
  std::string splitter = eq_sign ? " = " : " ";
  switch (tok) {
  case (STR_CONST):
    out << splitter << "\"";
    print_escaped_string(out, cool_yylval.symbol->get_string());
    out << "\"";
    break;
  case (INT_CONST):
    out << splitter << cool_yylval.symbol->get_string();
    break;
  case (BOOL_CONST):
    out << splitter << (cool_yylval.boolean ? "true" : "false");
    break;
  case (TYPEID):
  case (OBJECTID):
    out << splitter << cool_yylval.symbol->get_string();
    break;
  case (ERROR):
    // sm: I've changed assignment 2 so students are supposed to
    // *not* coalesce error characters into one string; therefore,
    // if we see an "empty" string here, we can safely assume the
    // lexer is reporting an occurrance of an illegal NUL in the
    // input stream
    out << splitter;
    if (cool_yylval.error_msg[0] == 0) {
      out << "\"\\000\"";
    } else {
      out << "\"";
      print_escaped_string(out, cool_yylval.error_msg);
      out << "\"";
    }
    break;
  }
}

std::string hex2dec(const std::string &hex) {
  if (hex.size() < 2 || hex[0] != '0' || hex[1] != 'x') {
    std::cerr << "String " << hex << " is not a hex number.\n";
    return "";
  }
  std::string hex_ = hex.substr(2);
  std::vector<uint32_t> dec_digits = {0};
  for (char c : hex_) {
    // initially holds decimal value of current hex digit;
    // subsequently holds carry-over for multiplication
    uint32_t carry;
    if (!std::isxdigit(c)) {
      std::cerr << "String " << hex << " is not a hex number.\n";
      return "";
    } else if (std::isdigit(c)) {
      carry = c - '0';
    } else {
      carry = c - 'a' + 10;
    }
    for (uint32_t &digit : dec_digits) {
      uint32_t val = digit * 16 + carry;
      digit = val % 10;
      carry = val / 10;
    }
    while (carry > 0) {
      dec_digits.push_back(carry % 10);
      carry /= 10;
    }
  }
  // Reverse `dec_digits` and concat into a string.
  std::string dec_str;
  for (int i = dec_digits.size() - 1; i >= 0; i--) {
    assert(dec_digits[i] < 10);
    dec_str.push_back('0' + dec_digits[i]);
  }
  return dec_str;
}
