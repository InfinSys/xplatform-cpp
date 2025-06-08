
#ifndef _DEV_EXECUTABLE_UTILITIES_H_
#define _DEV_EXECUTABLE_UTILITIES_H_

#include <iostream>
#include "metadata/info.h"
#include "metadata/version.h"

inline void ProjectInfoOut() noexcept
{
	std::cout << '\n'
		<< "\n\tCopyright (C) " << XPTEMP_PUBLISHER << "\n"
		<< "\n\t[ " << XPTEMP_FULL_NAME << " ]"
		<< "\n\t-> (Dev CLI executable)\n"
		<< "\n\tRelease: " << (int)XPTEMP_VERSION_MAJOR
		<< ", Version: " << (int)XPTEMP_VERSION_MINOR
		<< ", Patch: " << (int)XPTEMP_VERSION_PATCH
		<< ", Tweak: " << (int)XPTEMP_VERSION_TWEAK
		<< "\n\t > CLI Debug Executable"
		<< "\n\t > C++ 20"
		<< "\n\n" << std::endl;
}

#endif // _DEV_EXECUTABLE_UTILITIES_H_
