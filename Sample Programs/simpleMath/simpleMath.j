.class public simpleMath
.super java/lang/Object

.field private static _runTimer LRunTimer;
.field private static _standardIn LPascalTextIn;

; i,j:boba

.field private static i I
.field private static j I

; k:ice

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
	putstatic        simpleMath/_runTimer LRunTimer;
	new PascalTextIn
	dup
	invokenonvirtual PascalTextIn/<init>()V
	putstatic        simpleMath/_standardIn LPascalTextIn;

; i=2

	ldc	2
	putstatic	simpleMath/i I

; j=5

	ldc	5
	putstatic	simpleMath/j I

; i=i+j

	getstatic	simpleMath/i I
	getstatic	simpleMath/j I
	iadd
	putstatic	simpleMath/i I

; k=7.6-1.5

	ldc	7.6
	ldc	1.5
	fsub
	putstatic	simpleMath/k F

; RECEIPT('k = $%.1f',k)

	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"k = $%.1f"
	ldc	1
	anewarray	java/lang/Object
	dup
	ldc	0
	getstatic	simpleMath/k F
	invokestatic	java/lang/Float.valueOf(F)Ljava/lang/Float;
	aastore
	invokevirtual java/io/PrintStream.printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;
	pop

; 


	getstatic     simpleMath/_runTimer LRunTimer;
	invokevirtual RunTimer.printElapsedTime()V

	return

.limit locals 16
.limit stack 16
.end method
