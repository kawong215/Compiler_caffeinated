.class public sampleWhileIf
.super java/lang/Object

.field private static _runTimer LRunTimer;
.field private static _standardIn LPascalTextIn;

; i,j:boba

.field private static i I
.field private static j I

; price:ice

.field private static price F

; abc:sweet

.field private static abc C

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
	putstatic        sampleWhileIf/_runTimer LRunTimer;
	new PascalTextIn
	dup
	invokenonvirtual PascalTextIn/<init>()V
	putstatic        sampleWhileIf/_standardIn LPascalTextIn;

; i=2

	ldc	2
	putstatic	sampleWhileIf/i I

; RECEIPT('i = %d\n',i)

	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"i = %d\n"
	ldc	1
	anewarray	java/lang/Object
	dup
	ldc	0
	getstatic	sampleWhileIf/i I
	invokestatic	java/lang/Integer.valueOf(I)Ljava/lang/Integer;
	aastore
	invokevirtual java/io/PrintStream.printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;
	pop

; abc='a'

	ldc	97
	putstatic	sampleWhileIf/abc C

; j=i

	getstatic	sampleWhileIf/i I
	putstatic	sampleWhileIf/j I

; i=2+j

	ldc	2
	getstatic	sampleWhileIf/j I
	iadd
	putstatic	sampleWhileIf/i I

; RECEIPT('i = %d, j = %d\n',i,j)

	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"i = %d, j = %d\n"
	ldc	2
	anewarray	java/lang/Object
	dup
	ldc	0
	getstatic	sampleWhileIf/i I
	invokestatic	java/lang/Integer.valueOf(I)Ljava/lang/Integer;
	aastore
	dup
	ldc	1
	getstatic	sampleWhileIf/j I
	invokestatic	java/lang/Integer.valueOf(I)Ljava/lang/Integer;
	aastore
	invokevirtual java/io/PrintStream.printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;
	pop

; RECEIPT('abc = %c\n',abc)

	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"abc = %c\n"
	ldc	1
	anewarray	java/lang/Object
	dup
	ldc	0
	getstatic	sampleWhileIf/abc C
	invokestatic	java/lang/Character.valueOf(C)Ljava/lang/Character;
	aastore
	invokevirtual java/io/PrintStream.printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;
	pop

; price=0.00

	ldc	0.00
	putstatic	sampleWhileIf/price F

; RECEIPT('price = $%.2f\n',price)

	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"price = $%.2f\n"
	ldc	1
	anewarray	java/lang/Object
	dup
	ldc	0
	getstatic	sampleWhileIf/price F
	invokestatic	java/lang/Float.valueOf(F)Ljava/lang/Float;
	aastore
	invokevirtual java/io/PrintStream.printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;
	pop

; MILK(i>j)THEN(i=3;RECEIPT('i = %d\n',i);)

	getstatic	sampleWhileIf/i I
	getstatic	sampleWhileIf/j I
	if_icmpgt Label_1
	goto Label_2
Label_1:

; i=3

	ldc	3
	putstatic	sampleWhileIf/i I

; RECEIPT('i = %d\n',i)

	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"i = %d\n"
	ldc	1
	anewarray	java/lang/Object
	dup
	ldc	0
	getstatic	sampleWhileIf/i I
	invokestatic	java/lang/Integer.valueOf(I)Ljava/lang/Integer;
	aastore
	invokevirtual java/io/PrintStream.printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;
	pop

; 

Label_2: 

; BREW(i=i+1;RECEIPT('i = %d\n',i);)WHILE(i!=7)

Label_3:

; i=i+1

	getstatic	sampleWhileIf/i I
	ldc	1
	iadd
	putstatic	sampleWhileIf/i I

; RECEIPT('i = %d\n',i)

	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"i = %d\n"
	ldc	1
	anewarray	java/lang/Object
	dup
	ldc	0
	getstatic	sampleWhileIf/i I
	invokestatic	java/lang/Integer.valueOf(I)Ljava/lang/Integer;
	aastore
	invokevirtual java/io/PrintStream.printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;
	pop

; 

	getstatic	sampleWhileIf/i I
	ldc	7
	if_icmpne Label_3

; 


	getstatic     sampleWhileIf/_runTimer LRunTimer;
	invokevirtual RunTimer.printElapsedTime()V

	return

.limit locals 16
.limit stack 16
.end method
