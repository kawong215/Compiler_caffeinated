.class public samplePrint
.super java/lang/Object

.field private static _runTimer LRunTimer;
.field private static _standardIn LPascalTextIn;

; number:boba

.field private static number I

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
	putstatic        samplePrint/_runTimer LRunTimer;
	new PascalTextIn
	dup
	invokenonvirtual PascalTextIn/<init>()V
	putstatic        samplePrint/_standardIn LPascalTextIn;

; number=10

	ldc	10
	putstatic	samplePrint/number I

; RECEIPT('number = %d\n',number)

	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"number = %d\n"
	ldc	1
	anewarray	java/lang/Object
	dup
	ldc	0
	getstatic	samplePrint/number I
	invokestatic	java/lang/Integer.valueOf(I)Ljava/lang/Integer;
	aastore
	invokevirtual java/io/PrintStream.printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;
	pop

; letter='x'

	ldc	120
	putstatic	samplePrint/letter C

; BREW(number=number+1;RECEIPT('number = %d\n',number);)WHILE(number<12)

Label_1:

; number=number+1

	getstatic	samplePrint/number I
	ldc	1
	iadd
	putstatic	samplePrint/number I

; RECEIPT('number = %d\n',number)

	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"number = %d\n"
	ldc	1
	anewarray	java/lang/Object
	dup
	ldc	0
	getstatic	samplePrint/number I
	invokestatic	java/lang/Integer.valueOf(I)Ljava/lang/Integer;
	aastore
	invokevirtual java/io/PrintStream.printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;
	pop

; 

	getstatic	samplePrint/number I
	ldc	12
	if_icmplt Label_1

; MILK(number==12)THEN(letter='h';RECEIPT('letters = %c',letter);letter='i';RECEIPT('%c\n',letter);)

	getstatic	samplePrint/number I
	ldc	12
	if_icmpeq Label_2
	goto Label_3
Label_2:

; letter='h'

	ldc	104
	putstatic	samplePrint/letter C

; RECEIPT('letters = %c',letter)

	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"letters = %c"
	ldc	1
	anewarray	java/lang/Object
	dup
	ldc	0
	getstatic	samplePrint/letter C
	invokestatic	java/lang/Character.valueOf(C)Ljava/lang/Character;
	aastore
	invokevirtual java/io/PrintStream.printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;
	pop

; letter='i'

	ldc	105
	putstatic	samplePrint/letter C

; RECEIPT('%c\n',letter)

	getstatic	java/lang/System/out Ljava/io/PrintStream;
	ldc	"%c\n"
	ldc	1
	anewarray	java/lang/Object
	dup
	ldc	0
	getstatic	samplePrint/letter C
	invokestatic	java/lang/Character.valueOf(C)Ljava/lang/Character;
	aastore
	invokevirtual java/io/PrintStream.printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;
	pop

; 

Label_3: 

; 


	getstatic     samplePrint/_runTimer LRunTimer;
	invokevirtual RunTimer.printElapsedTime()V

	return

.limit locals 16
.limit stack 16
.end method
