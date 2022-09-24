%{

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<stdbool.h>
#include <assert.h>
#include "A1.tab.h"

void yyerror(char *);
int yyparse();

%}


%%

"//".*		;

"class"		{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return CLASS;}
"public"	{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return PUBLIC;}
"static"	{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return STATIC;}
"void"		{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return VOID;}
"main" 		{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return MAIN;}
"new"		{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return NEW;}
"if"		{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return IF;}
"else"		{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return ELSE;}
"while"		{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return WHILE;}
"true"		{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return TRUE;}
"false"		{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return FALSE;}
"this"		{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return THIS;}
"int"		{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return TYPEINT;}
"extends"	{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return EXTDS;}
"return" 	{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return RETURN;}
"boolean"	{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return BOOL;}
"#defineExpr2"	{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return DEF;}
"#defineExpr1"	{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return DEF;}
"#defineExpr0"	{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return DEF;}
"#defineExpr"	{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return DEF;}
"#defineStmt2"	{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return DEF;}
"#defineStmt1"	{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return DEF;}
"#defineStmt0"	{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return DEF;}
"#defineStmt"	{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return DEF;}
"System.out.println" {yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return SYSTEM;}
"length"	{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return LEN;}
"String"	{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return STRING;}

";" 		{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return SEMICOL;}
"("			{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return LBRC;}
")"			{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return RBRC;}
"{"			{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return LFBRC;}
"}"			{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return RFBRC;}
"["			{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return LSBRC;}
"]"			{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return RSBRC;}
"<="		{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return LEQ;}
"!="		{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return NEQ;}
"="			{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return EQUAL;}
"+"			{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return ADD;}
"-"			{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return SUB;}
"*"			{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return MUL;}
"/"			{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return DIV;}
"&&"		{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return AND;}
"||"		{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return OR;}
"!"         {yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return NOT;}
"."			{yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return DOT;}
","         {yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return COMA;}

[ \t\n\r\f]+	{}

<<EOF>>		{return 0;}

[0-9]* {yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return INT; }


[a-z|A-Z][a-z|A-Z|0-9|_]* {yylval.text = (char*)malloc(strlen(yytext)+1); strcpy(yylval.text,yytext); return ID; }

. 			{return UNKNOWN;}

%%

void yyerror(char* str) {
	printf("//Failed to parse input code\n");
}

int yywrap(void) {return 1;}

int main(void) {
	yyparse();
}

