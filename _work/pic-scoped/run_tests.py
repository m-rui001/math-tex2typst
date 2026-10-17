import sys, io
sys.path.insert(0, r"E:\math\_work\pic-scoped")
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
import tests
for name in dir(tests):
    if name.startswith("test_"):
        getattr(tests, name)()
        print("PASS", name)
