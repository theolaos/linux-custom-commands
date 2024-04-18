#include <filesystem>
#include <iostream>
#include <string>
#include <vector>


void help(){
  std::cout << "Not implemented yet" << std::endl;
}


int main(int argc, char *argv[])
{
  // std::string current_exec_name = argv[0];
  std::vector <std::string> all_args;

  if (argc > 1){
    all_args.assign(argv + 1, argv + argc);
    //std::cout << all_args[0] << std::endl;


    std::string commands_start = "cd ";
    std::string commands_end = " && ls -l && cd ..";

    std::string c;
    c.append(commands_start);
    c.append(all_args[0]);
    c.append(commands_end);

    const char *commands = c.c_str();

    std::string arg1 = argv[1];
    if (arg1 == "-help"){
      help();
    } else {
      // std::system( "ls -l" );
      std::system( commands );
    }
  } else {
    std::cout << "Please type the directory that you want to peak into. Example:" << std::endl;
    std::cout << "peak path/to/dir" << std::endl;
    std::cout << "Type -help for more info" << std::endl;
  }

  return 0;
}