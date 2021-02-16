#include <iostream>
#include <string>

#include "Pass2Visitor.h"
#include "wci/intermediate/SymTabStack.h"
#include "wci/intermediate/SymTabEntry.h"
#include "wci/intermediate/TypeSpec.h"
#include "wci/intermediate/symtabimpl/Predefined.h"

using namespace wci;
using namespace wci::intermediate;
using namespace wci::intermediate::symtabimpl;

int label = 0;
int labelNum = 0;

Pass2Visitor::Pass2Visitor(ostream& j_file)
    : program_name(""), j_file(j_file)
{
}

Pass2Visitor::~Pass2Visitor() {}

antlrcpp::Any Pass2Visitor::visitProgram(caffeinatedParser::ProgramContext *ctx)
{
    auto value = visitChildren(ctx);
    //j_file.close();
    return value;
}

antlrcpp::Any Pass2Visitor::visitHeader(caffeinatedParser::HeaderContext *ctx)
{
    program_name = ctx->IDENTIFIER()->toString();
    return visitChildren(ctx);
}

antlrcpp::Any Pass2Visitor::visitMainBlock(caffeinatedParser::MainBlockContext *ctx)
{
    // Emit the main program header.
    j_file << endl;
    j_file << ".method public static main([Ljava/lang/String;)V" << endl;
    j_file << endl;
    j_file << "\tnew RunTimer" << endl;
    j_file << "\tdup" << endl;
    j_file << "\tinvokenonvirtual RunTimer/<init>()V" << endl;
    j_file << "\tputstatic        " << program_name
           << "/_runTimer LRunTimer;" << endl;
    j_file << "\tnew PascalTextIn" << endl;
    j_file << "\tdup" << endl;
    j_file << "\tinvokenonvirtual PascalTextIn/<init>()V" << endl;
    j_file << "\tputstatic        " + program_name
           << "/_standardIn LPascalTextIn;" << endl;

    auto value = visitChildren(ctx);

    // Emit the main program epilogue.
    j_file << endl;
    j_file << "\tgetstatic     " << program_name
               << "/_runTimer LRunTimer;" << endl;
    j_file << "\tinvokevirtual RunTimer.printElapsedTime()V" << endl;
    j_file << endl;
    j_file << "\treturn" << endl;
    j_file << endl;
    j_file << ".limit locals 16" << endl;
    j_file << ".limit stack 16" << endl;
    j_file << ".end method" << endl;

    return value;
}

antlrcpp::Any Pass2Visitor::visitStmt(caffeinatedParser::StmtContext *ctx)
{
    j_file << endl << "; " + ctx->getText() << endl << endl;

    return visitChildren(ctx);
}

antlrcpp::Any Pass2Visitor::visitAssignmentStmt(caffeinatedParser::AssignmentStmtContext *ctx)
{
    auto value = visit(ctx->expr());

    string type_indicator =
                  (ctx->expr()->type == Predefined::integer_type) ? "I"
                : (ctx->expr()->type == Predefined::real_type)    ? "F"
				: (ctx->expr()->type == Predefined::char_type)    ? "C"
                :                                                   "?";

    // Emit a field put instruction.
    j_file << "\tputstatic\t" << program_name
           << "/" << ctx->variable()->IDENTIFIER()->toString()
           << " " << type_indicator << endl;

    return value;
}

antlrcpp::Any Pass2Visitor::visitAddSubExpr(caffeinatedParser::AddSubExprContext *ctx)
{
    auto value = visitChildren(ctx);

    TypeSpec *type1 = ctx->expr(0)->type;
    TypeSpec *type2 = ctx->expr(1)->type;

    bool integer_mode =    (type1 == Predefined::integer_type)
                        && (type2 == Predefined::integer_type);
    bool real_mode    =    (type1 == Predefined::real_type)
                        && (type2 == Predefined::real_type);

    string op = ctx->addSubOp()->getText();
    string opcode;

    if (op == "+")
    {
        opcode = integer_mode ? "iadd"
               : real_mode    ? "fadd"
               :                "????";
    }
    else
    {
        opcode = integer_mode ? "isub"
               : real_mode    ? "fsub"
               :                "????";
    }

    // Emit an add or subtract instruction.
    j_file << "\t" << opcode << endl;

    return value;
}

antlrcpp::Any Pass2Visitor::visitMulDivExpr(caffeinatedParser::MulDivExprContext *ctx)
{
    auto value = visitChildren(ctx);

    TypeSpec *type1 = ctx->expr(0)->type;
    TypeSpec *type2 = ctx->expr(1)->type;

    bool integer_mode =    (type1 == Predefined::integer_type)
                        && (type2 == Predefined::integer_type);
    bool real_mode    =    (type1 == Predefined::real_type)
                        && (type2 == Predefined::real_type);

    string op = ctx->mulDivOp()->getText();
    string opcode;

    if (op == "*")
    {
        opcode = integer_mode ? "imul"
               : real_mode    ? "fmul"
               :                "????";
    }
    else
    {
        opcode = integer_mode ? "idpv"
               : real_mode    ? "fdiv"
               :                "????";
    }

    // Emit a multiply or divide instruction.
    j_file << "\t" << opcode << endl;

    return value;
}

antlrcpp::Any Pass2Visitor::visitRel_expr(caffeinatedParser::Rel_exprContext *ctx)
{
	auto value = visitChildren(ctx);

	TypeSpec *type1 = ctx->expr(0)->type;
	TypeSpec *type2 = ctx->expr(1)->type;

	string op = ctx->rel_op()->getText();
	string opcode;

	bool integer_mode = ((type1 == Predefined::integer_type) && (type2 == Predefined::integer_type))
						|| ((type1 == Predefined::char_type) && (type2 == Predefined::char_type));


	if (op == "<")	//LESS_THAN
	{
		opcode = "if_icmplt";
	}
	if (op == ">")	//GREATER_THAN
	{
		opcode = "if_icmpgt";
	}
	if (op == "==")	//EQUALS
	{
		opcode = "if_icmpeq";
	}
	if (op == ">=")	//GT_EQ
	{
		opcode = "if_icmpge";
	}
	if (op == "<=")	//LT_EQ
	{
		opcode = "if_icmple";
	}
	if (op == "!=")	//NOT_EQ
	{
		opcode = "if_icmpne";
	}

	j_file << "\t" << opcode << " Label_" << label << endl;


	return value;
}

antlrcpp::Any Pass2Visitor::visitVariableExpr(caffeinatedParser::VariableExprContext *ctx)
{
    string variable_name = ctx->variable()->IDENTIFIER()->toString();
    TypeSpec *type = ctx->type;

    string type_indicator = (type == Predefined::integer_type) ? "I"
                          : (type == Predefined::real_type)    ? "F"
						  : (type == Predefined::char_type)    ? "C"
                          :                                      "?";

    // Emit a field get instruction.
    j_file << "\tgetstatic\t" << program_name
           << "/" << variable_name << " " << type_indicator << endl;

    return visitChildren(ctx);
}

/*
antlrcpp::Any Pass2Visitor::visitSignedNumber(caffeinatedParser::SignedNumberContext *ctx)
{
    auto value = visitChildren(ctx);
    TypeSpec *type = ctx->number()->type;

    if (ctx->sign()->children[0] == ctx->sign()->SUB_OP())
    {
        string opcode = (type == Predefined::integer_type) ? "ineg"
                      : (type == Predefined::real_type)    ? "fneg"
                      :                                      "?neg";

        // Emit a negate instruction.
        j_file << "\t" << opcode << endl;
    }

    return value;
}
*/

antlrcpp::Any Pass2Visitor::visitIntegerConst(caffeinatedParser::IntegerConstContext *ctx)
{
    // Emit a load constant instruction.
    j_file << "\tldc\t" << ctx->getText() << endl;

    return visitChildren(ctx);
}

antlrcpp::Any Pass2Visitor::visitFloatConst(caffeinatedParser::FloatConstContext *ctx)
{
    // Emit a load constant instruction.
    j_file << "\tldc\t" << ctx->getText() << endl;

    return visitChildren(ctx);
}

antlrcpp::Any Pass2Visitor::visitCharConst(caffeinatedParser::CharConstContext *ctx)
{
    // Emit a load constant instruction.
	string input = ctx->getText();
	char letter = input[1]; // uses input 1 because input 0 is single quote encapsulating char
	int letter_num = int(letter);

	j_file << "\tldc\t" << letter_num << endl;
    // j_file << "\tldc\t" << ctx->getText() << endl;

    return visitChildren(ctx);
}

antlrcpp::Any Pass2Visitor::visitPrintStmt(caffeinatedParser::PrintStmtContext *ctx)
{
    // Get the format string without the surrounding the single quotes.
    string str = ctx->formatString()->getText();
    string format_string = str.substr(1, str.length() - 2);

    // Emit code to push the java.lang.System.out object.
    j_file << "\tgetstatic\tjava/lang/System/out Ljava/io/PrintStream;" << endl;

    // Emit code to push the format string.
    j_file << "\tldc\t\"" << format_string << "\"" << endl;

    // Array size is the number of expressions to evaluate and print.
    int array_size = ctx->printArg().size();

    // Emit code to create the array of the correct size.
    j_file << "\tldc\t" << array_size << endl;
    j_file << "\tanewarray\tjava/lang/Object" << endl;

    // Loop to generate code for each expression.
    for (int i = 0; i < array_size; i++)
    {
        j_file << "\tdup" << endl;        // duplicate the array address
        j_file << "\tldc\t" << i << endl;  // array element index

        // Emit code to evaluate the expression.
        visit(ctx->printArg(i)->expr());
        TypeSpec *type = ctx->printArg(i)->expr()->type;

        // Emit code to convert a scalar integer or float value
        // to an Integer or Float object, respectively.
        if (type == Predefined::integer_type)
        {
            j_file << "\tinvokestatic\tjava/lang/Integer.valueOf(I)"
                   << "Ljava/lang/Integer;"
                   << endl;
        }
        else if (type == Predefined::char_type)
		{
			j_file << "\tinvokestatic\tjava/lang/Character.valueOf(C)"
				   << "Ljava/lang/Character;"
				   << endl;
		}

        else
        {
            j_file << "\tinvokestatic\tjava/lang/Float.valueOf(F)"
                   << "Ljava/lang/Float;"
                   << endl;
        }

        j_file << "\taastore" << endl;  // store the value into the array
    }

    // Emit code to call java.io.PrintStream.printf.
    j_file << "\tinvokevirtual java/io/PrintStream.printf"
           << "(Ljava/lang/String;[Ljava/lang/Object;)"
           << "Ljava/io/PrintStream;"
           << endl;
    j_file << "\tpop" << endl;

    return nullptr;
}

antlrcpp::Any Pass2Visitor::visitWhileStmt(caffeinatedParser::WhileStmtContext *ctx)
{
	int loopNum = labelNum + 1;
	labelNum++;
	j_file << "Label_" << loopNum << ":" << endl;
	visit(ctx->stmtList());
	label = loopNum;
	visit(ctx->expr());
	return NULL;
}

antlrcpp::Any Pass2Visitor::visitIfStmt(caffeinatedParser::IfStmtContext *ctx)
{
	int lab = labelNum + 1;
	labelNum++;
	label = lab;
	visit(ctx->expr());
	labelNum = labelNum + 1;
	j_file << "\tgoto Label_" << labelNum << endl;


	j_file << "Label_" << lab<< ":" << endl;
	visitChildren(ctx->stmtList());

	j_file << "Label_" << labelNum << ": "<< endl;
	return NULL;
}


