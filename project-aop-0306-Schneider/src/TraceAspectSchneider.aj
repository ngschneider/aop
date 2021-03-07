
public aspect TraceAspectSchneider {
	
	pointcut classToTrace(): within(ComponentApp) || within(DataApp) || within(ServiceApp);
	
	pointcut methodToTrace(): classToTrace() && execution(String getName());
	
	before(): methodToTrace() {
		
		String info = "[BGN]\t" + thisJoinPointStaticPart.getSignature() + ", "
		+ thisJoinPointStaticPart.getSourceLocation().getLine();

		System.out.println("\t" + info);
	}
	
	after(): methodToTrace() {
		System.out.println("\t[END]\t" + thisJoinPointStaticPart.getSourceLocation().getFileName() );
	}

	
}
