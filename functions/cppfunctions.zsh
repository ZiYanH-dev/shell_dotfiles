# Auto-generate C++ template for .cpp files
touch() {
  command touch "$@"
  for file do
    if [[ "$file" == *.cpp && ! -s "$file" ]]; then
      cat > "$file" << 'EOF'
#include <iostream>
using namespace std;

int main() {
    return 0;
}
EOF
    fi
  done
}
