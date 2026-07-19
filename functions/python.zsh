# 快速创建Python虚拟环境并激活
create_venv() {
  if [ -z "$1" ]; then
    venv_name="venv"
  else
    venv_name="$1"
  fi
  
  python3 -m venv $venv_name
  source $venv_name/bin/activate
  echo "Virtual environment '$venv_name' created and activated"
}

# 快速查找并替换文件内容
find_replace() {
  find . -type f -name "$1" -exec sed -i '' "s/$2/$3/g" {} +
}

# 快速查看Python包信息
pipinfo() {
  pip3 show "$1"
}

# 快速导出Python依赖
pipexport() {
  if [ -f "requirements.txt" ]; then
    mv requirements.txt requirements.txt.backup
  fi
  pip3 freeze > requirements.txt
  echo "Dependencies exported to requirements.txt"
}

# 快速创建Python项目模板
pyproject() {
  mkdir -p "$1"/{src,tests,docs}
  touch "$1"/{README.md,.gitignore,requirements.txt,setup.py}
  echo "Python project structure created for '$1'"
}

# 快速运行Python文件
pyrun() {
  python3 "$1"
}

# 快速创建Python脚本模板
pyscript() {
  touch "$1"
  cat > "$1" << 'EOF'
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Description of the script
"""

import sys
import argparse


def main():
    parser = argparse.ArgumentParser(description="Script description")
    parser.add_argument('--option', help="Optional argument")
    args = parser.parse_args()
    
    # Your code here
    print("Hello, World!")


if __name__ == "__main__":
    main()
EOF
  chmod +x "$1"
  echo "Python script template created: $1"
}