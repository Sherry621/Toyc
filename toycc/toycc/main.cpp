#include "lexer.h"
#include "parser.h"
#include "semantic.h"
#include <fstream>
#include <sstream>
#include <iostream>

int main(int argc, char* argv[]) {
    std::string filePath;

    if (argc < 2) {
        filePath = "test1.tc";
        std::cout << "[INFO] No input file specified. Using default: " << filePath << std::endl;
    }
    else {
        filePath = argv[1];
        std::cout << "[INFO] Using input file: " << filePath << std::endl;
    }

    std::ifstream fin(filePath);
    if (!fin) {
        std::cerr << "[ERROR] Cannot open file: " << filePath << std::endl;
        return 1;
    }

    std::stringstream buffer;
    buffer << fin.rdbuf();
    std::string sourceCode = buffer.str();

    try {
        Lexer lexer(sourceCode);
        Parser parser(lexer);
        auto ast = parser.parseCompUnit();

        SemanticAnalyzer semanticAnalyzer;
        semanticAnalyzer.analyze(ast);

        std::cout << "[SUCCESS] Syntax and semantic analysis passed." << std::endl;
        return 0;
    }
    catch (const std::exception& ex) {
        std::cerr << "[FAILURE] Compilation failed: " << ex.what() << std::endl;
        return 1;
    }
}