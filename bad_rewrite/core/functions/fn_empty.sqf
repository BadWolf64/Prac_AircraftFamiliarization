#include "script_component.hpp"

FUNC(emptyHint) = {
	hint "This is a successful Test";
};

FUNC(anotherHint) = {
	hint "This is another Test";
};

//[] call FUNC(emptyHint);