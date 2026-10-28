# CA-2 Night-Before Practice Paper `PCC-CS-503`

**Object Oriented Programming (Java) · CSE 3rd Year, 5th Semester**

The night-before notes, written as a question paper. Try each question first, then open the answer. Every answer is written the way you should write it in the answer script, using the college slide examples.

!!! note "About this paper"
    This is a **practice set** with more questions than a real CA paper: 20 one-markers, 10 short and 10 long questions. The real paper will ask only some of these. Answers are collapsed: click **Answer** to open.

---

<div align="center" markdown>

**CA-2 Examination (Practice Set)**
**Paper: PCC-CS-503 · Object Oriented Programming**

| Group | Type | Questions | Marks |
|---|---|:---:|:---:|
| A | Very short answer | 20 | 1 each |
| B | Short answer | 10 | 5 each |
| C | Long answer | 10 | 10 each |

</div>

*Write programs with correct syntax and show the output.*

---

## Group A: Very Short Answer Questions

**1 × 20 = 20**

**1.** Which keyword prevents a class from being inherited?

??? success "Answer"
    `final`

**2.** Can an object of an abstract class be created?

??? success "Answer"
    No. `Shape s = new Shape();` is illegal; only a reference (`Shape s = new Circle();`) is allowed.

**3.** What is the default capacity of `StringBuffer`? What is the capacity of `new StringBuffer("Hello")`?

??? success "Answer"
    16; and 16 + 5 = **21**.

**4.** What does `read()` of `InputStream` return at the end of a file?

??? success "Answer"
    `-1`

**5.** Which method converts the String `"25"` into a primitive `int`?

??? success "Answer"
    `Integer.parseInt("25")`

**6.** Output: `new String(new char[]{'a','b','c','d','e','f'}, 2, 3)`

??? success "Answer"
    `cde`

**7.** Name the superclass of all exception classes.

??? success "Answer"
    `Throwable`

**8.** Which access modifier makes a member visible only in the same package?

??? success "Answer"
    friendly (default), i.e. no keyword.

**9.** Output: `String s1 = "Hello"; String s2 = new String(s1); System.out.println(s1 == s2);`

??? success "Answer"
    `false` (`==` compares references; `s2` is a different object).

**10.** In `Vector v = new Vector(3, 2);` what do 3 and 2 mean?

??? success "Answer"
    3 = initial capacity, 2 = increment (capacity grows by 2 each time it is full).

**11.** Which package contains the `Vector` and `Scanner` classes?

??? success "Answer"
    `java.util`

**12.** Which keyword is used by a class to use an interface?

??? success "Answer"
    `implements`

**13.** Output: `System.out.println("Java".substring(1, 3));`

??? success "Answer"
    `av` (index 1 and 2; the end index is excluded).

**14.** Which exception is thrown by `Integer.parseInt("abc")`?

??? success "Answer"
    `NumberFormatException`

**15.** Variables declared in an interface are implicitly ______.

??? success "Answer"
    `public static final` (constants).

**16.** Which block is executed whether or not an exception occurs?

??? success "Answer"
    `finally`

**17.** Name the wrapper class of `char`.

??? success "Answer"
    `Character`

**18.** What is a variable size array?

??? success "Answer"
    A 2-D array whose rows have different lengths, e.g. `int a[][] = new int[3][]; a[0] = new int[3]; a[1] = new int[2];`

**19.** Is `ArithmeticException` checked or unchecked?

??? success "Answer"
    Unchecked (it is a subclass of `RuntimeException`).

**20.** What is persistent data?

??? success "Answer"
    Data stored in files on secondary storage, so it is not lost when the program ends.

---

## Group B: Short Answer Questions

**5 × 10 = 50**

### Q1. What is dynamic method dispatch? Explain with a program. (5)

??? success "Answer"
    **Dynamic method dispatch** is the mechanism by which a call to an **overridden method is resolved at run time** rather than compile time. A super class reference can refer to a subclass object, and the version of the method executed depends on the **type of the object**, not the type of the reference. This is how Java implements **run-time polymorphism**.

    ```java
    class A {
        void callme() { System.out.println("Inside A's callme method"); }
    }
    class B extends A {
        void callme() { System.out.println("Inside B's callme method"); }
    }
    class C extends A {
        void callme() { System.out.println("Inside C's callme method"); }
    }
    class DynamicDemo {
        public static void main(String args[]) {
            A a = new A();  B b = new B();  C c = new C();
            A r;                       // reference of type A
            r = a;  r.callme();
            r = b;  r.callme();
            r = c;  r.callme();
        }
    }
    ```

    **Output**
    ```text
    Inside A's callme method
    Inside B's callme method
    Inside C's callme method
    ```

### Q2. Differentiate between abstract class and interface. (5)

??? success "Answer"
    | Abstract class | Interface |
    |---|---|
    | Declared with `abstract class` | Declared with `interface` |
    | Can have abstract **and** concrete methods | Only abstract methods (and constants) |
    | Can have any instance variables | Only `public static final` constants |
    | Can have constructors | No constructors |
    | Inherited with `extends`; a class extends only **one** | Used with `implements`; a class can implement **many** |
    | Partial abstraction | Full abstraction |
    | Used when subclasses share common code | Used to give a common behaviour to unrelated classes, and to achieve multiple inheritance |

### Q3. Explain the access modifiers of Java with the visibility table. (5)

??? success "Answer"
    Access modifiers implement **encapsulation**; they control visibility at the class level and the member level.

    | Location ↓ / Modifier → | public | protected | friendly | private protected | private |
    |---|:---:|:---:|:---:|:---:|:---:|
    | Same class | Yes | Yes | Yes | Yes | Yes |
    | Subclass in same package | Yes | Yes | Yes | Yes | No |
    | Other classes in same package | Yes | Yes | Yes | No | No |
    | Subclass in other package | Yes | Yes | No | Yes | No |
    | Non-subclass in other package | Yes | No | No | No | No |

    - **public:** widest visibility, accessible everywhere.
    - **friendly (default):** no keyword; visible only within the same package.
    - **protected:** same package + subclasses in other packages.
    - **private protected:** all subclasses (any package), but not non-subclasses.
    - **private:** own class only; a private method behaves like a `final` method (cannot be overridden).

### Q4. What is a wrapper class? Explain the conversions between primitive numbers, objects and strings. (5)

??? success "Answer"
    A **wrapper class** converts a primitive (simple) type into an object, e.g. `int → Integer`, `char → Character`, `double → Double`. They are needed because classes like `Vector` store only objects, and they provide conversion methods.

    | Conversion | Method |
    |---|---|
    | Primitive → object | `Integer IntVal = new Integer(i);` |
    | Object → primitive | `int i = IntVal.intValue();` |
    | Number → String | `str = Integer.toString(i);` |
    | String → object | `IntVal = Integer.valueOf(str);` |
    | String → primitive | `int i = Integer.parseInt(str);` |

    ```java
    int k = Integer.parseInt("60");
    Integer obj = Integer.valueOf("40");
    System.out.println(k * 2);              // 120
    System.out.println(obj.intValue() + 1); // 41
    ```

    Java 5+ does this automatically: **autoboxing** (`Integer x = 5;`) and **unboxing** (`int y = x;`).

### Q5. Differentiate `String` and `StringBuffer`. Write the output of the following. (2 + 3)

```java
StringBuffer sb = new StringBuffer("This is a test.");
sb.delete(4, 7);
System.out.println(sb);
sb.deleteCharAt(0);
System.out.println(sb);
StringBuffer s2 = new StringBuffer("I Java!");
s2.insert(2, "like ");
System.out.println(s2);
```

??? success "Answer"
    | String | StringBuffer |
    |---|---|
    | Fixed length, immutable (read-only) | Flexible length, mutable |
    | Cannot use `append()`/`insert()` | Uses `append()`, `insert()` |
    | Every change creates a new object | Changes are made in the same object |

    **Output**
    ```text
    This a test.
    his a test.
    I like Java!
    ```
    (`delete(4,7)` removes indices 4–6, i.e. `" is"`.)

### Q6. Differentiate `throw` and `throws` with examples. (5)

??? success "Answer"
    | `throw` | `throws` |
    |---|---|
    | Throws an exception explicitly | Declares exceptions a method might throw |
    | Used inside the method body | Used in the method declaration |
    | Followed by an object: `throw new X()` | Followed by class names |
    | One exception at a time | Can list several, comma-separated |

    ```java
    class ThrowsDemo {
        static void fun() throws IllegalAccessException {
            System.out.println("Inside fun().");
            throw new IllegalAccessException("demo");
        }
        public static void main(String args[]) {
            try { fun(); }
            catch (IllegalAccessException e) {
                System.out.println("Caught in main=" + e);
            }
        }
    }
    ```

    **Output**
    ```text
    Inside fun().
    Caught in main=java.lang.IllegalAccessException: demo
    ```
    `IllegalAccessException` is **checked**, so `throws` is compulsory here.

### Q7. Explain the uses of the `final` keyword with examples. (5)

??? success "Answer"
    By default, methods and variables can be overridden in subclasses and classes can be extended. `final` restricts this.

    | Applied to | Effect | Example |
    |---|---|---|
    | Variable | Becomes a constant; value cannot be altered | `final int marks = 100;` |
    | Method | Cannot be overridden in a subclass | `final void display() { }` |
    | Class | Cannot be extended | `final class Person { }` |

    ```java
    final class Person { }
    class Student extends Person { }   // ERROR: cannot inherit from final Person

    class A { final void show() { } }
    class B extends A {
        // void show() { }              // ERROR: cannot override final method
    }
    ```
    `final` and `abstract` cannot be used together, since `abstract` needs extending/overriding and `final` forbids it.

### Q8. What are multiple catch statements? Explain with a program and its output. (5)

??? success "Answer"
    If a `try` block can raise more than one type of exception, several `catch` blocks can follow it. The **first catch whose type matches** is executed; they must be ordered from **specific to general**.

    ```java
    class MultiCatch {
        public static void main(String[] args) {
            try {
                int a = args.length;
                System.out.println("a=" + a);
                int b = 42 / a;
                int c[] = {1};
                c[42] = 99;
            } catch (ArithmeticException e) {
                System.out.println("Divide by 0: " + e);
            } catch (ArrayIndexOutOfBoundsException e) {
                System.out.println("Array Index Out Of Bounds: " + e);
            }
            System.out.println("Program reaches here");
        }
    }
    ```
    ```text
    > java MultiCatch
    a=0
    Divide by 0: java.lang.ArithmeticException: / by zero
    Program reaches here

    > java MultiCatch Test
    a=1
    Array Index Out Of Bounds: java.lang.ArrayIndexOutOfBoundsException: 42
    Program reaches here
    ```

### Q9. Differentiate checked and unchecked exceptions with examples. (5)

??? success "Answer"
    | Checked | Unchecked |
    |---|---|
    | Checked by the compiler | Not checked by the compiler |
    | Must be caught or listed in the method's `throws` clause | Need not be listed in `throws` |
    | Subclasses of `Exception` except `RuntimeException` | Subclasses of `RuntimeException` (and `Error`) |
    | `ClassNotFoundException`, `IllegalAccessException`, `InterruptedException`, `IOException`, `FileNotFoundException` | `ArithmeticException`, `NullPointerException`, `ArrayIndexOutOfBoundsException`, `NumberFormatException`, `ClassCastException` |

    Since `java.lang` is imported automatically, the `RuntimeException` subclasses are always available; the compiler does not check whether a method handles or throws them, hence "unchecked".

### Q10. Differentiate `equals()` and `==` for strings with a program. (5)

??? success "Answer"
    - `equals()` compares the **characters inside** two String objects.
    - `==` compares two **object references** to see whether they refer to the **same instance**.

    ```java
    class A {
        public static void main(String args[]) {
            String s1 = "Hello";
            String s2 = new String(s1);
            String s3 = "Hello";
            System.out.println(s1 + " equals " + s2 + " -> " + s1.equals(s2));
            System.out.println(s1 + " == " + s2 + " -> " + (s1 == s2));
            System.out.println(s1 + " == " + s3 + " -> " + (s1 == s3));
        }
    }
    ```
    ```text
    Hello equals Hello -> true
    Hello == Hello -> false
    Hello == Hello -> true
    ```
    `s1` and `s3` are the same literal, so they share one object in the string pool; `s2` was created with `new`, so it is a different object.

---

## Group C: Long Answer Questions

**10 × 10 = 100**

### Q1. (10)

**(a)** What is exception handling? Explain `try`, `catch` and `finally` with a program. **(5)**
**(b)** What are user-defined exceptions? Write a program that throws a user-defined exception when a value is greater than 1000. **(5)**

??? success "Answer"
    **(a)** An **exception** is a condition caused by a runtime error. When the JVM meets an error (e.g. divide by zero) it creates an exception object and throws it. If it is not caught, the program terminates. Catching the object and taking corrective action is **exception handling**.

    - `try`: contains the statements to be checked for exceptions.
    - `catch`: handles the exception thrown by the try block.
    - `finally`: always executes, whether or not an exception occurs; used for cleanup such as closing files.

    ```java
    class FinallyDemo {
        public static void main(String args[]) {
            try {
                int num = 121 / 0;
                System.out.println(num);
            }
            catch (ArithmeticException e) {
                System.out.println("Number should not be divided by zero");
            }
            finally {
                System.out.println("This is finally block");
            }
            System.out.println("Out of try-catch-finally");
        }
    }
    ```
    ```text
    Number should not be divided by zero
    This is finally block
    Out of try-catch-finally
    ```

    **(b)** A user-defined exception is created by **extending `Exception`**, for errors specific to our application.

    ```java
    class MyException extends Exception {
        private int detail;
        MyException(int a) { detail = a; }
        public String toString() { return "MyException[" + detail + "]"; }
    }
    class MyExceptionDemo {
        static void compute(int a) throws MyException {
            System.out.println("Called compute(" + a + ")");
            if (a > 1000)
                throw new MyException(a);
            System.out.println("Normal exit");
        }
        public static void main(String args[]) {
            try {
                compute(1);
                compute(2000);
            } catch (MyException e) {
                System.out.println("Caught " + e);
            }
        }
    }
    ```
    ```text
    Called compute(1)
    Normal exit
    Called compute(2000)
    Caught MyException[2000]
    ```

### Q2. (10)

**(a)** What is an interface? How does Java achieve multiple inheritance using it? **(4)**
**(b)** Write a program with an interface `Area` implemented by `Rectangle` and `Circle`. **(6)**

??? success "Answer"
    **(a)** An **interface** is a kind of class that contains only **constants (final variables)** and **abstract methods**. A class uses `implements` and must supply the body of every method (declared `public`). A class can **extend only one class but implement any number of interfaces**, so interfaces are Java's way of realising **multiple inheritance**:

    ```java
    class Results extends Exam implements Sports { ... }
    ```
    An interface can also extend another interface: `interface B extends A { }`.

    **(b)**
    ```java
    interface Area {
        final static float pi = 3.14F;
        float compute(float x, float y);
    }
    class Rectangle implements Area {
        public float compute(float x, float y) { return (x * y); }
    }
    class Circle implements Area {
        public float compute(float x, float y) { return (pi * x * x); }
    }
    class InterfaceTest {
        public static void main(String args[]) {
            Rectangle rect = new Rectangle();
            Circle cir = new Circle();
            Area area;
            area = rect;
            System.out.println("Area of Rectangle=" + area.compute(10, 20));
            area = cir;
            System.out.println("Area of Circle=" + area.compute(10, 0));
        }
    }
    ```
    ```text
    Area of Rectangle=200.0
    Area of Circle=314.0
    ```

### Q3. (10)

**(a)** What is a stream? Differentiate byte streams and character streams. **(4)**
**(b)** Write a program to count the number of bytes in a file. What happens if the file does not exist? **(6)**

??? success "Answer"
    **(a)** Data in variables and arrays is lost when the program ends, so data is stored in **files** (persistent data). Java does file I/O with **streams**: a **stream is an ordered sequence of data, a path along which data flows** from a source to a destination, like water in a pipe. Classes are in `java.io`.

    | Byte streams | Character streams |
    |---|---|
    | Operate on 8-bit (1 byte) data | Operate on 16-bit Unicode characters |
    | `InputStream` / `OutputStream` | `Reader` / `Writer` |
    | e.g. `FileInputStream`, `DataInputStream` | e.g. `FileReader`, `BufferedReader` |
    | Binary data (images, audio) | Text data |

    **(b)**
    ```java
    import java.io.*;
    class CountBytes {
        public static void main(String[] args)
                throws FileNotFoundException, IOException {
            FileInputStream in = new FileInputStream("InFile.txt");
            int total = 0;
            while (in.read() != -1)      // -1 = end of file
                total++;
            in.close();
            System.out.println(total + " bytes");
        }
    }
    ```
    If `InFile.txt` does not exist, the constructor throws **`FileNotFoundException`**. There is no handler, so the JVM prints the stack trace and **terminates** the program:
    ```text
    Exception in thread "main" java.io.FileNotFoundException: InFile.txt (No such file or directory)
    ```
    It can be handled with `try { ... } catch (FileNotFoundException e) { System.out.println("File not found"); }`.

### Q4. (10)

**(a)** What is an abstract class? State its properties. **(5)**
**(b)** Write a program with an abstract class `Shape` and subclasses `Circle` and `Rectangle` that compute area. **(5)**

??? success "Answer"
    **(a)** An **abstract class** is a conceptual class declared with `abstract`; it **cannot be instantiated** and is meant to be extended. It provides a common root for a group of classes. Abstract methods have no body and must be defined in the subclass.

    Properties:
    1. A class with one or more abstract methods is automatically abstract and cannot be instantiated.
    2. A class declared abstract, even with no abstract methods, cannot be instantiated.
    3. A subclass can be instantiated only if it implements all the abstract methods.
    4. A subclass that does not implement all of them is itself abstract.
    5. Abstract constructors and abstract static methods are not allowed.

    **(b)**
    ```java
    abstract class Shape {
        abstract double area();                       // abstract method
        void show() { System.out.println("Area = " + area()); }   // concrete method
    }
    class Circle extends Shape {
        double r;
        Circle(double r) { this.r = r; }
        double area() { return 3.14 * r * r; }
    }
    class Rectangle extends Shape {
        double w, h;
        Rectangle(double w, double h) { this.w = w; this.h = h; }
        double area() { return w * h; }
    }
    class AbsDemo {
        public static void main(String args[]) {
            // Shape s = new Shape();   // ERROR: Shape is abstract
            Shape s;
            s = new Circle(10);        s.show();
            s = new Rectangle(4, 5);   s.show();
        }
    }
    ```
    ```text
    Area = 314.0
    Area = 20.0
    ```

### Q5. (10)

**(a)** Explain the `append()`, `insert()`, `reverse()`, `delete()` and `replace()` methods of `StringBuffer` with examples. **(6)**
**(b)** Write a program to check whether a string is a palindrome using `StringBuffer`. **(4)**

??? success "Answer"
    **(a)** `StringBuffer` creates strings of flexible length that can be modified in the same object.

    | Method | Purpose | Example | Result |
    |---|---|---|---|
    | `append(x)` | Adds the string form of any data at the end | `new StringBuffer(40).append("a=").append(42).append("!")` | `a=42!` |
    | `insert(i, str)` | Inserts `str` at index `i` | `new StringBuffer("I Java!").insert(2, "like ")` | `I like Java!` |
    | `reverse()` | Reverses the characters | `new StringBuffer("abcdef").reverse()` | `fedcba` |
    | `delete(s, e)` | Removes characters from `s` to `e−1` | `new StringBuffer("This is a test.").delete(4, 7)` | `This a test.` |
    | `replace(s, e, str)` | Replaces `s` to `e−1` with `str` | `new StringBuffer("This is a test.").replace(5, 7, "was")` | `This was a test.` |

    **(b)**
    ```java
    class Palindrome {
        public static void main(String args[]) {
            String s = "madam";
            String rev = new StringBuffer(s).reverse().toString();
            if (s.equals(rev))
                System.out.println(s + " is a palindrome");
            else
                System.out.println(s + " is not a palindrome");
        }
    }
    ```
    ```text
    madam is a palindrome
    ```

### Q6. (10)

**(a)** What is an array? Explain the declaration, creation and initialisation of a one-dimensional array. **(5)**
**(b)** Write a program to add two 2 × 3 matrices. **(5)**

??? success "Answer"
    **(a)** An **array** is a group of contiguous or related data items that share a common name. Each item is stored at a position called the **index** (starting from 0).

    1. **Declaration:** `int students[];` or `int[] students;` (no size given).
    2. **Creation:** `students = new int[7];` allocates memory. Combined: `int students[] = new int[7];`
    3. **Initialisation:** `students[0] = 50; students[1] = 40;` or at declaration: `int students[] = {55, 69, 70, 30, 80};`

    Every array stores its size in `length` (`students.length`). Unlike C, Java checks bounds; accessing outside 0..length−1 throws `ArrayIndexOutOfBoundsException`.

    **(b)**
    ```java
    class MatrixAdd {
        public static void main(String args[]) {
            int a[][] = {{1, 2, 3}, {4, 5, 6}};
            int b[][] = {{6, 5, 4}, {3, 2, 1}};
            int c[][] = new int[2][3];
            for (int i = 0; i < 2; i++)
                for (int j = 0; j < 3; j++)
                    c[i][j] = a[i][j] + b[i][j];
            for (int i = 0; i < 2; i++) {
                for (int j = 0; j < 3; j++)
                    System.out.print(c[i][j] + " ");
                System.out.println();
            }
        }
    }
    ```
    ```text
    7 7 7
    7 7 7
    ```

### Q7. (10)

**(a)** What are nested try statements? Explain with a program. **(5)**
**(b)** Write a program to add integers passed as command-line arguments, skipping invalid ones. **(5)**

??? success "Answer"
    **(a)** A `try` block can be placed inside another `try`. Each time a try is entered, its context is pushed on the stack. If the inner try has no handler for an exception, the stack is unwound and the **outer try's catch handlers** are checked, until one matches or all are exhausted.

    ```java
    class NestTry {
        public static void main(String[] args) {
            try {
                int a = args.length;
                System.out.println("a=" + a);
                int b = 42 / a;
                try {
                    if (a == 1)
                        a = a / (a - a);
                    if (a == 2) {
                        int c[] = {1};
                        c[42] = 99;
                    }
                } catch (ArrayIndexOutOfBoundsException e) {
                    System.out.println("Array Index Out Of Bounds: " + e);
                }
            } catch (ArithmeticException e) {
                System.out.println("Divide by 0: " + e);
            }
        }
    }
    ```
    ```text
    > java NestTry           → a=0, Divide by 0: java.lang.ArithmeticException: / by zero
    > java NestTry One       → a=1, Divide by 0: ... (inner try has no handler, outer catches)
    > java NestTry One Two   → a=2, Array Index Out Of Bounds: ... (inner catch)
    ```

    **(b)**
    ```java
    class ComLineSum {
        public static void main(String args[]) {
            int InvalidCount = 0, number, sum = 0;
            for (int i = 0; i < args.length; i++) {
                try {
                    number = Integer.parseInt(args[i]);
                } catch (NumberFormatException e) {
                    InvalidCount++;
                    System.out.println("Invalid Number: " + args[i]);
                    continue;
                }
                sum += number;
            }
            System.out.println("Number of Invalid Arguments = " + InvalidCount);
            System.out.println("Number of Valid Arguments = " + (args.length - InvalidCount));
            System.out.println("Sum of Valid Arguments = " + sum);
        }
    }
    ```
    ```text
    > java ComLineSum 1 2 abc
    Invalid Number: abc
    Number of Invalid Arguments = 1
    Number of Valid Arguments = 2
    Sum of Valid Arguments = 3
    ```

### Q8. (10)

**(a)** What is inheritance? Explain its forms with diagrams. **(4)**
**(b)** State the rules for using `super`. Write a program to show single inheritance using `super`. **(6)**

??? success "Answer"
    **(a)** **Inheritance** is deriving a new class (sub/derived/child class) from an existing class (super/base/parent class) using `extends`. It gives **reusability**.

    ```text
    Single        Multiple       Hierarchical     Multi-level     Hybrid
      A           A     B             A               A              A
      |            \   /            / | \             |            /   \
      B              C             B  C  D            B           B     C
                                                      |            \   /
                                                      C              D
    ```
    Java classes support single, hierarchical and multi-level; multiple (and hybrid) only through interfaces.

    **(b)** Rules for `super(...)`:
    1. It can be used only inside a subclass constructor.
    2. It must be the **first statement** of the subclass constructor.
    3. Its parameters must match the order and type of a super class constructor.

    (`super.member` is also used to access a super class member hidden by the subclass.)

    ```java
    class Room {
        int length, breadth;
        Room(int x, int y) { length = x; breadth = y; }
        int Area() { return (length * breadth); }
    }
    class Room1 extends Room {
        int height;
        Room1(int x, int y, int z) {
            super(x, y);
            height = z;
        }
        int Volume() { return (length * breadth * height); }
    }
    class SingleInheritance {
        public static void main(String args[]) {
            Room1 r1 = new Room1(10, 12, 14);
            System.out.println("Area=" + r1.Area());
            System.out.println("Volume=" + r1.Volume());
        }
    }
    ```
    ```text
    Area=120
    Volume=1680
    ```

### Q9. (10)

**(a)** Explain the constructors of the `String` class with examples. **(5)**
**(b)** Write a program to show the use of `length()`, `replace()`, `toUpperCase()` and `toLowerCase()`. **(5)**

??? success "Answer"
    **(a)**

    | Constructor | Example | Result |
    |---|---|---|
    | `String()` | `new String()` | empty string |
    | `String(char chars[])` | `char c[] = {'a','b','c'}; new String(c)` | `abc` |
    | `String(char chars[], int start, int num)` | `new String(c6, 2, 3)` with `{'a'..'f'}` | `cde` |
    | `String(String obj)` | `new String(s1)` with `s1 = "Java"` | `Java` |
    | `String(byte ascii[])` / `(byte[], start, num)` | see below | |

    ```java
    class SubStringCons {
        public static void main(String args[]) {
            byte ascii[] = {65, 66, 67, 68, 69, 70};
            String s1 = new String(ascii);
            System.out.println("s1=" + s1);
            String s2 = new String(ascii, 2, 3);
            System.out.println("s2=" + s2);
        }
    }
    ```
    ```text
    s1=ABCDEF
    s2=CDE
    ```
    The byte constructors convert 8-bit ASCII bytes to 16-bit Unicode characters.

    **(b)**
    ```java
    class StringDemo {
        public static void main(String[] args) {
            String s = new String("Have a nice Day");
            System.out.println("String Length = " + s.length());
            System.out.println("Modified String = " + s.replace('n', 'N'));
            System.out.println("Converted to Uppercase = " + s.toUpperCase());
            System.out.println("Converted to Lowercase = " + s.toLowerCase());
        }
    }
    ```
    ```text
    String Length = 15
    Modified String = Have a Nice Day
    Converted to Uppercase = HAVE A NICE DAY
    Converted to Lowercase = have a nice day
    ```
    `s` itself is unchanged because strings are immutable.

### Q10. (10)

**(a)** What is a Vector? How is it different from an array? Write any four Vector methods. **(5)**
**(b)** How is an array of objects created? Explain with a program. What happens if the objects are not created? **(5)**

??? success "Answer"
    **(a)** **Vector** (`java.util`) implements a **dynamic array** that can hold objects of any type and any number. It is **synchronized**.

    | Array | Vector |
    |---|---|
    | Size must be specified, fixed | Size optional, grows automatically |
    | Holds primitives and objects | Holds only objects |
    | Not synchronized | Synchronized |
    | `length` field | `size()`, `capacity()` methods |

    Constructors: `new Vector()` (capacity 10), `new Vector(size)`, `new Vector(size, incr)`.
    Methods: `addElement(obj)`, `elementAt(i)`, `insertElementAt(obj, i)`, `removeElementAt(i)`, `firstElement()`, `lastElement()`, `contains(obj)`, `size()`.

    **(b)** `Account obj[] = new Account[2];` creates an array of **2 references (null)**, not 2 objects. Each object must be created with `new`.

    ```java
    class Account {
        int a, b;
        public void setData(int c, int d) { a = c; b = d; }
        public void showData() {
            System.out.println("Value of a =" + a);
            System.out.println("Value of b =" + b);
        }
    }
    class ObjectArray {
        public static void main(String args[]) {
            Account obj[] = new Account[2];
            obj[0] = new Account();
            obj[1] = new Account();
            obj[0].setData(1, 2);
            obj[1].setData(3, 4);
            System.out.println("For Array Element 0");
            obj[0].showData();
            System.out.println("For Array Element 1");
            obj[1].showData();
        }
    }
    ```
    ```text
    For Array Element 0
    Value of a =1
    Value of b =2
    For Array Element 1
    Value of a =3
    Value of b =4
    ```
    If the two `new Account()` lines are removed, `obj[0]` is `null` and `obj[0].setData(1, 2)` throws **`NullPointerException`**.

*Good luck tomorrow!*