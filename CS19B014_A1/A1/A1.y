%{

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include <stdbool.h>
#include <assert.h>

extern int yylex();
extern void yyerror(char *);

struct macro{
	char id[1000];
	char val[1000];
	char par[1000];
	bool type;
};

struct macro macros[1000];
int cur = 0;
char err[5] = "error";

void storeid(char* , char*, char*,bool);
char* getvalue(char*, bool);
char* getparameters(char*, bool);

%}

%union { char* text;}

%token <text> CLASS PUBLIC STATIC VOID MAIN NEW IF ELSE WHILE TRUE FALSE THIS TYPEINT EXTDS RETURN BOOL DEF SYSTEM LEN STRING
%token <text> SEMICOL LBRC RBRC LFBRC RFBRC LSBRC RSBRC LEQ NEQ EQUAL ADD SUB MUL DIV AND OR NOT DOT COMA
%token <text> INT ID UNKNOWN

%type <text> Goal
%type <text> MainClass
%type <text> TypeDeclaration
%type <text> MethodDeclaration
%type <text> Type
%type <text> Statement
%type <text> Expression
%type <text> PrimaryExpression
%type <text> MacroDefinition
%type <text> MacroDefStatement
%type <text> MacroDefExpression
%type <text> Identifier
%type <text> Integer
%type <text> MacroDefinitionStar
%type <text> TypeDeclarationStar
%type <text> TypeIdentifierColStar
%type <text> MethodDeclarationStar
%type <text> ComaTypeIdentifierStar
%type <text> StatementStar
%type <text> ComaIdentifierStar
%type <text> ComaExpressionStar

%start Goal

%%

Goal: MainClass {sprintf($$,"%s \n",$1); printf("%s\n",$$);}
		| MacroDefinitionStar MainClass {sprintf($$,"%s \n",$2); printf("%s\n",$$);}
		| MainClass TypeDeclarationStar {sprintf($$,"%s %s \n",$1,$2); printf("%s\n",$$);}
		| MacroDefinitionStar MainClass TypeDeclarationStar {sprintf($$,"%s %s\n",$2,$3); printf("%s\n",$$);};


MainClass: CLASS ID LFBRC PUBLIC STATIC VOID MAIN LBRC STRING LSBRC RSBRC ID RBRC LFBRC SYSTEM LBRC Expression RBRC SEMICOL RFBRC RFBRC		{sprintf($$,"%s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s\n",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21);};


TypeDeclaration: CLASS Identifier LFBRC RFBRC {sprintf($$,"%s %s %s %s ",$1,$2,$3,$4);}
		| CLASS Identifier LFBRC TypeIdentifierColStar RFBRC {sprintf($$,"%s %s %s %s %s ",$1,$2,$3,$4,$5);}
		| CLASS Identifier LFBRC MethodDeclarationStar RFBRC {sprintf($$,"%s %s %s %s %s ",$1,$2,$3,$4,$5);}
		| CLASS Identifier LFBRC TypeIdentifierColStar MethodDeclarationStar RFBRC {sprintf($$,"%s %s %s %s %s %s",$1,$2,$3,$4,$5,$6);}
        | CLASS Identifier EXTDS Identifier LFBRC RFBRC {sprintf($$,"%s %s %s %s %s %s ",$1,$2,$3,$4,$5,$6);}
		| CLASS Identifier EXTDS Identifier LFBRC TypeIdentifierColStar RFBRC {sprintf($$,"%s %s %s %s %s %s %s ",$1,$2,$3,$4,$5,$6,$7);}
		| CLASS Identifier EXTDS Identifier LFBRC MethodDeclarationStar RFBRC {sprintf($$,"%s %s %s %s %s %s %s ",$1,$2,$3,$4,$5,$6,$7);}
		| CLASS Identifier EXTDS Identifier LFBRC TypeIdentifierColStar MethodDeclarationStar RFBRC {sprintf($$,"%s %s %s %s %s %s %s %s ",$1,$2,$3,$4,$5,$6,$7,$8);};

MethodDeclaration: PUBLIC Type Identifier LBRC RBRC LFBRC RETURN Expression SEMICOL RFBRC {sprintf($$,"%s %s %s %s %s %s %s %s %s %s ",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10);}
		| PUBLIC Type Identifier LBRC RBRC LFBRC StatementStar RETURN Expression SEMICOL RFBRC {sprintf($$,"%s %s %s %s %s %s %s %s %s %s %s ",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11);}
		| PUBLIC Type Identifier LBRC RBRC LFBRC TypeIdentifierColStar RETURN Expression SEMICOL RFBRC {sprintf($$,"%s %s %s %s %s %s %s %s %s %s %s ",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11);}
		| PUBLIC Type Identifier LBRC RBRC LFBRC TypeIdentifierColStar StatementStar RETURN Expression SEMICOL RFBRC {sprintf($$,"%s %s %s %s %s %s %s %s %s %s %s %s ",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12);}
		| PUBLIC Type Identifier LBRC ComaTypeIdentifierStar RBRC LFBRC RETURN Expression SEMICOL RFBRC {sprintf($$,"%s %s %s %s %s %s %s %s %s %s %s ",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11);}
		| PUBLIC Type Identifier LBRC ComaTypeIdentifierStar RBRC LFBRC StatementStar RETURN Expression SEMICOL RFBRC {sprintf($$,"%s %s %s %s %s %s %s %s %s %s %s %s ",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12);}
		| PUBLIC Type Identifier LBRC ComaTypeIdentifierStar RBRC LFBRC TypeIdentifierColStar RETURN Expression SEMICOL RFBRC {sprintf($$,"%s %s %s %s %s %s %s %s %s %s %s %s ",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12);}
		| PUBLIC Type Identifier LBRC ComaTypeIdentifierStar RBRC LFBRC TypeIdentifierColStar StatementStar RETURN Expression SEMICOL RFBRC {sprintf($$,"%s %s %s %s %s %s %s %s %s %s %s %s %s ",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13);}

Type: TYPEINT LSBRC RSBRC {sprintf($$,"%s %s %s",$1,$2,$3);}
		| BOOL {sprintf($$,"%s",$1);}
		| TYPEINT {sprintf($$,"%s",$1);}
		| Identifier {sprintf($$,"%s",$1);};


Statement: LFBRC StatementStar RFBRC {sprintf($$,"%s %s %s",$1,$2,$3);}
		| SYSTEM LBRC Expression RBRC SEMICOL {sprintf($$,"%s %s %s %s %s",$1,$2,$3,$4,$5);}
		| Identifier EQUAL Expression SEMICOL {sprintf($$,"%s %s %s %s",$1,$2,$3,$4);}
		| Identifier LSBRC Expression RSBRC EQUAL Expression SEMICOL {sprintf($$,"%s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7);}
		| IF LBRC Expression RBRC Statement {sprintf($$,"%s %s %s %s %s",$1,$2,$3,$4,$5);}
		| IF LBRC Expression RBRC Statement ELSE Statement {sprintf($$,"%s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7);}
		| WHILE LBRC Expression RBRC Statement {sprintf($$,"%s %s %s %s %s",$1,$2,$3,$4,$5);}
		| Identifier LBRC RBRC SEMICOL {
			if(strcmp(getvalue($1,false), "error") != 0){
				sprintf($$,"%s",getvalue($1,false));
			}
			else{
				sprintf($$,"%s %s %s %s",$1,$2,$3,$4);
			}
		}
		| Identifier LBRC ComaExpressionStar RBRC SEMICOL {
			if(strcmp(getvalue($1,false), "error") != 0){
				char temp[1000];
				strcpy(temp,getvalue($1,false));
				sprintf($$,"%s", temp);
			}
			else sprintf($$,"%s %s %s %s %s ",$1,$2,$3,$4,$5);
		};


Expression: PrimaryExpression AND PrimaryExpression {sprintf($$,"%s %s %s",$1,$2,$3);}
		| PrimaryExpression OR PrimaryExpression {sprintf($$,"%s %s %s",$1,$2,$3);}
		| PrimaryExpression NEQ PrimaryExpression {sprintf($$,"%s %s %s",$1,$2,$3);}
		| PrimaryExpression LEQ PrimaryExpression {sprintf($$,"%s %s %s",$1,$2,$3);}
		| PrimaryExpression ADD PrimaryExpression {sprintf($$,"%s %s %s",$1,$2,$3);}
		| PrimaryExpression SUB PrimaryExpression {sprintf($$,"%s %s %s",$1,$2,$3);}
		| PrimaryExpression MUL PrimaryExpression {sprintf($$,"%s %s %s",$1,$2,$3);}
		| PrimaryExpression DIV PrimaryExpression {sprintf($$,"%s %s %s",$1,$2,$3);}
		| PrimaryExpression LSBRC PrimaryExpression RSBRC {sprintf($$,"%s %s %s %s",$1,$2,$3,$4);}
		| PrimaryExpression DOT LEN {sprintf($$,"%s %s %s",$1,$2,$3);}
		| PrimaryExpression {sprintf($$,"%s",$1);}
		| PrimaryExpression DOT Identifier LBRC RBRC {sprintf($$,"%s %s %s %s %s",$1,$2,$3,$4,$5);}
		| PrimaryExpression DOT Identifier LBRC ComaExpressionStar RBRC{sprintf($$,"%s %s %s %s %s %s ",$1,$2,$3,$4,$5,$6);}
		| Identifier LBRC RBRC {   //  macro exp call
			if(strcmp(getvalue($1,true), "error") != 0){
				sprintf($$,"(%s)",getvalue($1,true));
			}
			else{
				sprintf($$,"%s %s %s",$1,$2,$3);
				// callerror
			}
		}
		| Identifier LBRC Expression ComaExpressionStar RBRC {
			if(strcmp(getvalue($1,true), "error") != 0){
				sprintf($$,"%s %s %s",$2,getvalue($1,true),$5);
			}
			else sprintf($$,"%s %s %s %s %s",$1,$2,$3,$4,$5);
		};


PrimaryExpression: Integer {sprintf($$,"%s",$1);}
		| TRUE {sprintf($$,"%s",$1);}
		| FALSE {sprintf($$,"%s",$1);}
		| Identifier {sprintf($$,"%s",$1);}
		| THIS {sprintf($$,"%s",$1);}
		| NEW TYPEINT LSBRC Expression RSBRC {sprintf($$,"%s %s %s %s %s",$1,$2,$3,$4,$5);}
		| NEW Identifier LBRC RBRC {sprintf($$,"%s %s %s %s",$1,$2,$3,$4);}
		| NOT Expression {sprintf($$,"%s %s",$1,$2);}
		| LBRC Expression RBRC {sprintf($$,"%s %s %s",$1,$2,$3);};


MacroDefinition: MacroDefExpression {sprintf($$,"%s",$1);}
		| MacroDefStatement {sprintf($$,"%s",$1);};


MacroDefStatement: DEF Identifier LBRC RBRC LFBRC StatementStar RFBRC {
			storeid($2,$6,"",false); 
			//sprintf($$,"%s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7);
		}
		| DEF Identifier LBRC ComaIdentifierStar RBRC LFBRC StatementStar RFBRC {
			char* temp=(char*)malloc(strlen($4)+1);
			strcpy(temp,$4);
			storeid($2,$7,temp,false);
			printf("%s\n",$7);
			//sprintf($$,"%s %s %s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7,$8,$9);
		};

MacroDefExpression: DEF Identifier LBRC RBRC LBRC Expression RBRC {
			storeid($2,$6,"",true); 
			//sprintf($$,"%s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7);
		}
		| DEF Identifier LBRC ComaIdentifierStar RBRC LBRC Expression RBRC {
			char* temp=(char*)malloc(strlen($4)+1);
			strcpy(temp,$4);
			storeid($2,$7,temp,true);
			//sprintf($$,"%s %s %s %s %s %s %s %s %s",$1,$2,$3,$4,$5,$6,$7,$8,$9);
		};


Identifier: ID {sprintf($$,"%s",$1);};

Integer: INT {sprintf($$,"%s",$1);};


MacroDefinitionStar: MacroDefinitionStar MacroDefinition {sprintf($$,"%s %s ",$1,$2);}
		| MacroDefinition {sprintf($$,"%s ",$1);};

TypeDeclarationStar: TypeDeclaration TypeDeclarationStar {sprintf($$,"%s %s ",$1,$2);}
		| TypeDeclaration {sprintf($$,"%s ",$1);};

TypeIdentifierColStar: TypeIdentifierColStar Type Identifier SEMICOL {sprintf($$,"%s %s %s %s ",$1,$2,$3,$4);}
		| Type Identifier SEMICOL {sprintf($$,"%s %s %s ",$1,$2,$3);};

MethodDeclarationStar: MethodDeclarationStar MethodDeclaration {sprintf($$,"%s %s ",$1,$2);}
		| MethodDeclaration{sprintf($$,"%s ",$1);};

ComaTypeIdentifierStar: ComaTypeIdentifierStar COMA Type Identifier {sprintf($$,"%s %s %s %s ",$1,$2,$3,$4);}
		| Type Identifier {sprintf($$,"%s %s ",$1,$2);};

StatementStar: StatementStar Statement {sprintf($$,"%s %s ",$1,$2);}
		| Statement {sprintf($$,"%s ",$1);};

ComaExpressionStar: ComaExpressionStar COMA Expression {sprintf($$,"%s %s %s ",$1,$2,$3);}
		| Expression {sprintf($$,"%s ",$1);};

ComaIdentifierStar: ComaIdentifierStar COMA Identifier {sprintf($$,"%s %s %s ",$1,$2,$3);}
		| Identifier {sprintf($$,"%s ",$1);};


%%

void storeid(char* id,char* value,char* param,bool typ){

	// macros[cur] = (struct macro)malloc(sizeof(struct macro));
	// printf("%s\n",value);
	strcpy(macros[cur].id, id);
	strcpy(macros[cur].val, value);
	strcpy(macros[cur].par, param);
	macros[cur].type = typ;
	cur++;
	return;
}

char* getvalue(char* id,bool type){
	if(type){
		for(int i = 0; i < cur; i++){
			// printf("%s = %s , %d\n", macros[i].id,id,macros[i].type);
			if(macros[i].type && strcmp(macros[i].id,id) == 0){
				return macros[i].val;
			}
		}
		return err;
	}
	else{
		for(int i = 0; i < cur; i++){
			if(!macros[i].type && strcmp(macros[i].id,id) == 0){
				return macros[i].val;
			}
		}
		return err;
	}
}

char* getparameters(char* id,bool type){
	if(type){
		for(int i = 0; i < cur; i++){
			if(macros[i].type && strcmp(macros[i].id,id) == 0){
				return macros[i].par;
			}
		}
		return err;
	}
	else{
		for(int i = 0; i < cur; i++){
			if(!macros[i].type && strcmp(macros[i].id,id) == 0){
				return macros[i].par;
			}
		}
		return err;
	}
}