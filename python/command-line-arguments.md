Arguments must match position, the number of arguments must match the number of non-default values.

```python
import sys

def do_something(x, y, z='ZAZAZAZA'):
    print 'x:', x
    print 'y:', y
    print 'z:', z

if __name__ == '__main__':
    # Map command line arguments to function arguments.
    do_something(*sys.argv[1:])
```
