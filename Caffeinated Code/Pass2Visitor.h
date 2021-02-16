#ifndef PASS2VISITOR_H_
#define PASS2VISITOR_H_

#include <iostream>
#include <string>

#include "wci/intermediate/SymTabStack.h"
#include "wci/intermediate/SymTabEntry.h"
#include "wci/intermediate/TypeSpec.h"

#include "caffeinatedBaseVisitor.h"
#include "antlr4-runtime.h"
#include "caffeinatedVisitor.h"

using namespace wci;
using namespace wci::intermediate;

class Pass2Visitor : public caffeinatedBaseVisitor
{
private:
	string program_name;
	ostream& j_file;

public:
	Pass2Visitor(ostream& j_file);
    virtual ~Pass2Visitor();

    antlrcpp::Any visitProgram(caffeinatedParser::ProgramContext *ctx) override;
    antlrcpp::Any visitHeader(caffeinatedParser::HeaderContext *ctx) override;
    antlrcpp::Any visitMainBlock(caffeinatedParser::MainBlockContext *ctx) override;
    antlrcpp::Any visitStmt(caffeinatedParser::StmtContext *ctx) override;
    antlrcpp::Any visitAssignmentStmt(caffeinatedParser::AssignmentStmtContext *ctx) override;
    antlrcpp::Any visitPrintStmt(caffeinatedParser::PrintStmtContext *ctx) override;
    antlrcpp::Any visitAddSubExpr(caffeinatedParser::AddSubExprContext *ctx) override;
    antlrcpp::Any visitMulDivExpr(caffeinatedParser::MulDivExprContext *ctx) override;
    antlrcpp::Any visitRel_expr(caffeinatedParser::Rel_exprContext *ctx) override;
    antlrcpp::Any visitVariableExpr(caffeinatedParser::VariableExprContext *ctx) override;
    // antlrcpp::Any visitSignedNumber(caffeinatedParser::SignedNumberContext *ctx) override;
    antlrcpp::Any visitIntegerConst(caffeinatedParser::IntegerConstContext *ctx) override;
    antlrcpp::Any visitCharConst(caffeinatedParser::CharConstContext *ctx) override;
    antlrcpp::Any visitFloatConst(caffeinatedParser::FloatConstContext *ctx) override;
    antlrcpp::Any visitWhileStmt(caffeinatedParser::WhileStmtContext *ctx) override;
    antlrcpp::Any visitIfStmt(caffeinatedParser::IfStmtContext *ctx) override;
};

#endif /* PASS2VISITOR_H_ */
