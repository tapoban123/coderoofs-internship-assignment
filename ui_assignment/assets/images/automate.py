import os
import pyperclip

files = os.listdir(os.getcwd())

data = []

for file in files:
    # if file.endswith((".png", ".jpg", "jpeg")):
    if file.endswith(".svg"):
        print(
            f"""
static SvgPicture {os.path.splitext(os.path.basename(file))[0]}({{required Color color, double? height, double? width}}) {{
    return SvgPicture.asset(
      "assets/images/{file}",
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      height: height,
      width: width,
    );
  }}
"""
        )
        # print(f"static const String {os.path.splitext(os.path.basename(file))[0]} = \"assets/images/{file}\";")
