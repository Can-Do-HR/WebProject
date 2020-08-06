package com.hee.heechart.VO;

public class TestVO {
	private int testInput;
    private int testOutput;
    
//    private int testInput=1;
//    private int testOutput=10;
    
    public TestVO() {
    	this.testInput=1;
    	this.testOutput=11;
	}
	public TestVO(int testInput, int testOutput) {
		super();
		this.testInput = testInput;
		this.testOutput = testOutput;
	}
	public int getTestInput() {
          return testInput;
    }
    public void setTestInput(int testInput) {
          this.testInput = testInput;
    }
    public int getTestOutput() {
          return testOutput;
    }
    public void setTestOutput(int testOutput) {
          this.testOutput = testOutput;
    }


}
