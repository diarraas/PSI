/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    tINT = 258,
    tVOID = 259,
    tMAIN = 260,
    tPO = 261,
    tPF = 262,
    tAO = 263,
    tAF = 264,
    tIF = 265,
    tELSE = 266,
    tWHILE = 267,
    tCONST = 268,
    tINF = 269,
    tSUP = 270,
    tAND = 271,
    tOR = 272,
    tXOR = 273,
    tEGAEGA = 274,
    tMUL = 275,
    tDIV = 276,
    tADD = 277,
    tSUB = 278,
    tEGA = 279,
    tCO = 280,
    tCF = 281,
    tVIR = 282,
    tFIN = 283,
    tPRINTF = 284,
    tNUM = 285,
    tFLOAT = 286,
    tEXP = 287,
    tVAR = 288
  };
#endif
/* Tokens.  */
#define tINT 258
#define tVOID 259
#define tMAIN 260
#define tPO 261
#define tPF 262
#define tAO 263
#define tAF 264
#define tIF 265
#define tELSE 266
#define tWHILE 267
#define tCONST 268
#define tINF 269
#define tSUP 270
#define tAND 271
#define tOR 272
#define tXOR 273
#define tEGAEGA 274
#define tMUL 275
#define tDIV 276
#define tADD 277
#define tSUB 278
#define tEGA 279
#define tCO 280
#define tCF 281
#define tVIR 282
#define tFIN 283
#define tPRINTF 284
#define tNUM 285
#define tFLOAT 286
#define tEXP 287
#define tVAR 288

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 12 "analyse_yacc" /* yacc.c:1909  */

    int integer;
    char* var;

#line 125 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
