#include <cstdlib>
#include <filesystem>
#include <fstream>
#include <iostream>

#define VERSION 0.2f

int main()
{
  // Create an executable shell file
  const char* batch_file_name = "/home/theolaos/clearll.sh";
  {
    std::ofstream batch_file( batch_file_name );
    batch_file <<"#/bin/bash\n"
	    "clear && ls -l";
  }
  
  std::filesystem::permissions( batch_file_name, std::filesystem::perms::owner_exec, std::filesystem::perm_options::add );
  
  // Execute the file
  std::cout << "Running clear and ll\n";
  std::system( batch_file_name );
  
  // Delete the file
  remove( batch_file_name );
}
