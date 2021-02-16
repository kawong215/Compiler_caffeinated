.class public HelloWorld
.super java/lang/Object

.field private static _runTimer LRunTimer;
.field private static _standardIn LPascalTextIn;

; letter:sweet

.field private static letter C

.method public <init>()V

	aload_0
	invokenonvirtual    java/lang/Object/<init>()V
	return

.limit locals 1
.limit stack 1
.end method

.method public static main([Ljava/lang/String;)V

	new RunTimer
	dup
	invokenonvirtual RunTimer/<init>()V
	putstatic        HelloWorld/_runTimer LRunTimer;
	new PascalTextIn
	dup
	invokenonvirtual PascalTextIn/<init>()V
	putstatic        HelloWorld/_standardIn LPascalTextIn;

; RECEIPT('This program prints: Hello World\n')

	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"This program prints: Hello World\n"
	ldc	0
	anewarray	java/lang/Object
	invokevirtual java/io/PrintStream.printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;
	pop

; letter='H'

	ldc	72
	putstatic	HelloWorld/letter C

; RECEIPT('%c',letter)

	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"%c"
	ldc	1
	anewarray	java/lang/Object
	dup
	ldc	0
	getstatic	HelloWorld/letter C
	invokestatic	java/lang/Character.valueOf(C)Ljava/lang/Character;
	aastore
	invokevirtual java/io/PrintStream.printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;
	pop

; letter='e'

	ldc	101
	putstatic	HelloWorld/letter C

; RECEIPT('%c',letter)

	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"%c"
	ldc	1
	anewarray	java/lang/Object
	dup
	ldc	0
	getstatic	HelloWorld/letter C
	invokestatic	java/lang/Character.valueOf(C)Ljava/lang/Character;
	aastore
	invokevirtual java/io/PrintStream.printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;
	pop

; letter='l'

	ldc	108
	putstatic	HelloWorld/letter C

; RECEIPT('%c',letter)

	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"%c"
	ldc	1
	anewarray	java/lang/Object
	dup
	ldc	0
	getstatic	HelloWorld/letter C
	invokestatic	java/lang/Character.valueOf(C)Ljava/lang/Character;
	aastore
	invokevirtual java/io/PrintStream.printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;
	pop

; letter='l'

	ldc	108
	putstatic	HelloWorld/letter C

; RECEIPT('%c',letter)

	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"%c"
	ldc	1
	anewarray	java/lang/Object
	dup
	ldc	0
	getstatic	HelloWorld/letter C
	invokestatic	java/lang/Character.valueOf(C)Ljava/lang/Character;
	aastore
	invokevirtual java/io/PrintStream.printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;
	pop

; letter='o'

	ldc	111
	putstatic	HelloWorld/letter C

; RECEIPT('%c',letter)

	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"%c"
	ldc	1
	anewarray	java/lang/Object
	dup
	ldc	0
	getstatic	HelloWorld/letter C
	invokestatic	java/lang/Character.valueOf(C)Ljava/lang/Character;
	aastore
	invokevirtual java/io/PrintStream.printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;
	pop

; RECEIPT(' ')

	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	" "
	ldc	0
	anewarray	java/lang/Object
	invokevirtual java/io/PrintStream.printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;
	pop

; letter='W'

	ldc	87
	putstatic	HelloWorld/letter C

; RECEIPT('%c',letter)

	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"%c"
	ldc	1
	anewarray	java/lang/Object
	dup
	ldc	0
	getstatic	HelloWorld/letter C
	invokestatic	java/lang/Character.valueOf(C)Ljava/lang/Character;
	aastore
	invokevirtual java/io/PrintStream.printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;
	pop

; letter='o'

	ldc	111
	putstatic	HelloWorld/letter C

; RECEIPT('%c',letter)

	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"%c"
	ldc	1
	anewarray	java/lang/Object
	dup
	ldc	0
	getstatic	HelloWorld/letter C
	invokestatic	java/lang/Character.valueOf(C)Ljava/lang/Character;
	aastore
	invokevirtual java/io/PrintStream.printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;
	pop

; letter='r'

	ldc	114
	putstatic	HelloWorld/letter C

; RECEIPT('%c',letter)

	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"%c"
	ldc	1
	anewarray	java/lang/Object
	dup
	ldc	0
	getstatic	HelloWorld/letter C
	invokestatic	java/lang/Character.valueOf(C)Ljava/lang/Character;
	aastore
	invokevirtual java/io/PrintStream.printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;
	pop

; letter='l'

	ldc	108
	putstatic	HelloWorld/letter C

; RECEIPT('%c',letter)

	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"%c"
	ldc	1
	anewarray	java/lang/Object
	dup
	ldc	0
	getstatic	HelloWorld/letter C
	invokestatic	java/lang/Character.valueOf(C)Ljava/lang/Character;
	aastore
	invokevirtual java/io/PrintStream.printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;
	pop

; letter='d'

	ldc	100
	putstatic	HelloWorld/letter C

; RECEIPT('%c\n',letter)

	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"%c\n"
	ldc	1
	anewarray	java/lang/Object
	dup
	ldc	0
	getstatic	HelloWorld/letter C
	invokestatic	java/lang/Character.valueOf(C)Ljava/lang/Character;
	aastore
	invokevirtual java/io/PrintStream.printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;
	pop

; 


	getstatic     HelloWorld/_runTimer LRunTimer;
	invokevirtual RunTimer.printElapsedTime()V

	return

.limit locals 16
.limit stack 16
.end method
