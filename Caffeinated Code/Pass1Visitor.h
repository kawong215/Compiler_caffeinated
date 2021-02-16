#ifndef PASS1VISITOR_H_
#define PASS1VISITOR_H_

#include <iostream>

#include "wci/intermediate/SymTabStack.h"
#include "wci/intermediate/SymTabEntry.h"
#include "wci/intermediate/TypeSpec.h"

#include "caffeinatedBaseVisitor.h"
#include "antlr4-runtime.h"
#include "caffeinatedVisitor.h"

using namespace wci;
using namespace wci::intermediate;

class Pass1Visitor : public caffeinatedBaseVisitor
{
private:
    SymTabStack *symtab_stack;
    SymTabEntry *program_id;
    vector<SymTabEntry *> variable_id_list;
    ofstream j_file;

public:
    Pass1Visitor();
    virtual ~Pass1Visitor();

    ostream& get_assembly_file();

    antlrcpp::Any visitProgram(caffeinatedParser::ProgramContext *ctx) override;
    antlrcpp::Any visitHeader(caffeinatedParser::HeaderContext *ctx) override;
    antlrcpp::Any visitDeclarations(caffeinatedParser::DeclarationsContext *ctx) override;
    antlrcpp::Any visitDecl(caffeinatedParser::DeclContext *ctx) override;
    antlrcpp::Any visitVarList(caffeinatedParser::VarListContext *ctx) override;
    antlrcpp::Any visitVarId(caffeinatedParser::VarIdContext *ctx) override;
    antlrcpp::Any visitTypeId(caffeinatedParser::TypeIdContext *ctx) override;
    antlrcpp::Any visitAddSubExpr(caffeinatedParser::AddSubExprContext *ctx) override;
    antlrcpp::Any visitMulDivExpr(caffeinatedParser::MulDivExprContext *ctx) override;
    antlrcpp::Any visitVariableExpr(caffeinatedParser::VariableExprContext *ctx) override;
    //antlrcpp::Any visitSignedNumberExpr(caffeinatedParser::SignedNumberExprContext *ctx) override;
    //antlrcpp::Any visitSignedNumber(caffeinatedParser::SignedNumberContext *ctx) override;
   // antlrcpp::Any visitUnsignedNumberExpr(caffeinatedParser::UnsignedNumberExprContext *ctx) override;
    antlrcpp::Any visitDataExpr(caffeinatedParser::DataExprContext *ctx) override;
    antlrcpp::Any visitIntegerConst(caffeinatedParser::IntegerConstContext *ctx) override;
    antlrcpp::Any visitFloatConst(caffeinatedParser::FloatConstContext *ctx) override;
    antlrcpp::Any visitCharConst(caffeinatedParser::CharConstContext *ctx) override;
    antlrcpp::Any visitParenExpr(caffeinatedParser::ParenExprContext *ctx) override;
};

#endif /* PASS1VISITOR_H_ */
