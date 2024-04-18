#include <iostream>
#include <string>

int main(int argc, char *argv[]){
  const char* test = "hello world";    
  std::string test2 = "hello world";


  std::cout << "argc " << argc << ", argv " << argv[1] << std::endl;

  if(argc > 1){
    test2.append(argv[1]);
  } else {

  }

  std::cout << test2 << std::endl;
  
  return 0;
}
