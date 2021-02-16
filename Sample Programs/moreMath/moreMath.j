.class public moreMath
.super java/lang/Object

.field private static _runTimer LRunTimer;
.field private static _standardIn LPascalTextIn;

; i,j,k:ice

.field private static i F
.field private static j F
.field private static k F

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
	putstatic        moreMath/_runTimer LRunTimer;
	new PascalTextIn
	dup
	invokenonvirtual PascalTextIn/<init>()V
	putstatic        moreMath/_standardIn LPascalTextIn;

; i=2.0

	ldc	2.0
	putstatic	moreMath/i F

; j=5.0

	ldc	5.0
	putstatic	moreMath/j F

; k=i+j*10.0/2.5

	getstatic	moreMath/i F
	getstatic	moreMath/j F
	ldc	10.0
	fmul
	ldc	2.5
	fdiv
	fadd
	putstatic	moreMath/k F

; RECEIPT('k = %.2f',k)

	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"k = %.2f"
	ldc	1
	anewarray	java/lang/Object
	dup
	ldc	0
	getstatic	moreMath/k F
	invokestatic	java/lang/Float.valueOf(F)Ljava/lang/Float;
	aastore
	invokevirtual java/io/PrintStream.printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;
	pop

; 


	getstatic     moreMath/_runTimer LRunTimer;
	invokevirtual RunTimer.printElapsedTime()V

	return

.limit locals 16
.limit stack 16
.end method
