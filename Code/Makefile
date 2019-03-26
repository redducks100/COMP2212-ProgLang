# Files that need to be generated from other files
DEPEND += YAIPLTokens.hs YAIPLGrammar.hs YAIPLEval.hs

all: $(DEPEND) myinterpreter

# Build an executable for Toy interpreter
myinterpreter: $(DEPEND) myinterpreter.hs
	ghc myinterpreter.hs

# Generate ML files from a parser definition file
YAIPLGrammar.hs : YAIPLGrammar.y
	@rm -f YAIPLGrammar.hs
	happy YAIPLGrammar.y
	@chmod -w YAIPLGrammar.hs

# Generate ML files from a lexer definition file
YAIPLTokens.hs : YAIPLTokens.x
	@rm -f YAIPLTokens.hs
	alex YAIPLTokens.x
	@chmod -w YAIPLTokens.hs

# Clean up the directory
clean::
	rm -rf YAIPLTokens.hs YAIPLGrammar.hs *.hi *.o *.info *.exe


